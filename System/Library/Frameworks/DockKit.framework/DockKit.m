char *sub_24331A00C(void *a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  void *v14;
  char *v15;
  objc_super v17;

  v7 = (uint64_t *)&v3[OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_callback];
  *v7 = 0;
  v7[1] = 0;
  swift_unknownObjectWeakInit();
  v8 = v3;
  sub_24334A5A0();
  v9 = OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_weakPublishedAccessoriesLock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D93448);
  v10 = swift_allocObject();
  *(_DWORD *)(v10 + 16) = 0;
  *(void *)&v8[v9] = v10;
  *(void *)&v8[OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_weakPublishedAccessories] = MEMORY[0x263F8EE78];
  v8[OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_systemTrackingEnabled] = 1;
  *(void *)&v8[OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_dkAccessory] = 0;
  v11 = *v7;
  *v7 = a2;
  v7[1] = a3;
  swift_retain();
  sub_243322990(v11);
  swift_unknownObjectWeakAssign();

  v17.receiver = v8;
  v17.super_class = (Class)type metadata accessor for DockAccessoryManagerHelper(0);
  v12 = (char *)objc_msgSendSuper2(&v17, sel_init);
  v13 = MEMORY[0x24567AC40](&v12[OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_manager]);
  if (v13)
  {
    v14 = (void *)v13;
    v15 = v12;
    sub_243349FB0();
  }
  swift_release();
  return v12;
}

uint64_t sub_24331A1B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_268D933E8 + dword_268D933E8);
  v12 = (void *)swift_task_alloc();
  *(void *)(v8 + 16) = v12;
  void *v12 = v8;
  v12[1] = sub_2433232E8;
  return v14(a5, a6, a8);
}

uint64_t sub_24331A3D0(char a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24334A5B0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = ((uint64_t (*)(void))MEMORY[0x270FA5388])();
  v29 = (char *)&v28 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v6);
  v9 = (char *)&v28 - v8;
  uint64_t v10 = v2 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_logger;
  v11 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v11((char *)&v28 - v8, v2 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_logger, v4);
  v12 = sub_24334A590();
  os_log_type_t v13 = sub_24334A7D0();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = (uint8_t *)swift_slowAlloc();
    uint64_t v28 = v2;
    uint64_t v15 = v14;
    *(_DWORD *)v14 = 67109120;
    int v30 = a1 & 1;
    sub_24334A820();
    _os_log_impl(&dword_243318000, v12, v13, "Helper: setting system tracking enabled %{BOOL}d", v15, 8u);
    v16 = v15;
    uint64_t v2 = v28;
    MEMORY[0x24567AB80](v16, -1, -1);
  }

  v17 = *(uint64_t (**)(char *, uint64_t))(v5 + 8);
  uint64_t result = v17(v9, v4);
  *(unsigned char *)(v2 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_systemTrackingEnabled) = a1 & 1;
  if (a1)
  {
    v19 = v29;
    v11(v29, v10, v4);
    v20 = sub_24334A590();
    os_log_type_t v21 = sub_24334A7D0();
    if (os_log_type_enabled(v20, v21))
    {
      v22 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v22 = 0;
      _os_log_impl(&dword_243318000, v20, v21, "System tracking enabled, stopping tracking loop for previously-vended accessories", v22, 2u);
      MEMORY[0x24567AB80](v22, -1, -1);
    }

    uint64_t v23 = v17(v19, v4);
    v24 = *(os_unfair_lock_s **)(v2 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_weakPublishedAccessoriesLock);
    uint64_t v25 = MEMORY[0x270FA5388](v23);
    *(&v28 - 2) = v2;
    MEMORY[0x270FA5388](v25);
    *(&v28 - 2) = (uint64_t)sub_243322D6C;
    *(&v28 - 1) = v26;
    swift_retain();
    os_unfair_lock_lock(v24 + 4);
    sub_2433232EC();
    os_unfair_lock_unlock(v24 + 4);
    return swift_release();
  }
  else
  {
    uint64_t v27 = *(void *)(v2 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_dkAccessory);
    if (v27) {
      *(unsigned char *)(v27 + OBJC_IVAR____TtC7DockKit13DockAccessory__tracking) = 0;
    }
  }
  return result;
}

uint64_t sub_24331A70C(uint64_t a1)
{
  uint64_t v2 = a1 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_weakPublishedAccessories;
  swift_beginAccess();
  uint64_t v3 = *(void *)v2;
  uint64_t v4 = *(void *)(*(void *)v2 + 16);
  if (!v4) {
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  uint64_t v5 = 0;
  do
  {
    uint64_t v6 = v3 + 16 * v5++;
    long long v18 = *(_OWORD *)(v6 + 32);
    swift_retain();
    sub_24331A8E0((uint64_t)&v18, a1);
    swift_release();
  }
  while (v4 != v5);
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)v2;
  uint64_t v8 = *(void *)(*(void *)v2 + 16);
  if (v8)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = 0;
    uint64_t v10 = MEMORY[0x263F8EE78];
    do
    {
      long long v17 = *(_OWORD *)(v7 + 16 * v9 + 32);
      uint64_t v11 = swift_retain();
      ((void (*)(id *__return_ptr, uint64_t))v17)(&v19, v11);
      id v12 = v19;

      if (v12)
      {
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        *(void *)&long long v18 = v10;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_243340928(0, *(void *)(v10 + 16) + 1, 1);
          uint64_t v10 = v18;
        }
        unint64_t v15 = *(void *)(v10 + 16);
        unint64_t v14 = *(void *)(v10 + 24);
        if (v15 >= v14 >> 1)
        {
          sub_243340928(v14 > 1, v15 + 1, 1);
          uint64_t v10 = v18;
        }
        *(void *)(v10 + 16) = v15 + 1;
        *(_OWORD *)(v10 + 16 * v15 + 32) = v17;
      }
      else
      {
        swift_release();
      }
      ++v9;
    }
    while (v8 != v9);
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_14:
    uint64_t v10 = MEMORY[0x263F8EE78];
  }
  *(void *)uint64_t v2 = v10;
  return swift_bridgeObjectRelease();
}

void sub_24331A8E0(uint64_t a1, uint64_t a2)
{
  void (*v11)(void **__return_ptr, uint64_t);
  void *v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  uint8_t *v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(void **__return_ptr, uint64_t);
  uint64_t v33;
  void *v34;

  uint64_t v5 = sub_24334A5B0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = *(void (**)(void **__return_ptr, uint64_t))a1;
  uint64_t v10 = *(void *)(a1 + 8);
  v11(&v34, v7);
  id v12 = v34;
  if (v34)
  {
    v31 = v10;
    v32 = v11;
    (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v9, a2 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_logger, v5);
    os_log_type_t v13 = v12;
    unint64_t v14 = sub_24334A590();
    unint64_t v15 = sub_24334A7D0();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      v34 = (void *)v28;
      v29 = v5;
      *(_DWORD *)v16 = 136315138;
      uint64_t v26 = v16 + 4;
      uint64_t v27 = v16;
      long long v17 = (void *)sub_24334A000();
      long long v18 = sub_243349F00();
      int v30 = v2;
      v20 = v19;

      v33 = sub_2433402D0(v18, v20, (uint64_t *)&v34);
      sub_24334A820();

      swift_bridgeObjectRelease();
      os_log_type_t v21 = v27;
      _os_log_impl(&dword_243318000, v14, v15, "Stopping tracking loop for %s", v27, 0xCu);
      v22 = v28;
      swift_arrayDestroy();
      MEMORY[0x24567AB80](v22, -1, -1);
      MEMORY[0x24567AB80](v21, -1, -1);

      uint64_t v23 = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v29);
    }
    else
    {

      uint64_t v23 = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v9, v5);
    }
    v32(&v34, v23);
    v24 = v34;
    if (v34)
    {
      sub_24334A140();
      if (swift_dynamicCastClass())
      {
        uint64_t v25 = v24;
        sub_24334A0D0();
      }
      else
      {
        uint64_t v25 = v13;
        os_log_type_t v13 = v24;
      }
    }
  }
}

uint64_t sub_24331ABC0(uint64_t a1, void *a2, uint64_t a3)
{
  void (*v14)(uint64_t *__return_ptr, uint64_t);
  uint64_t v15;
  id v16;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v18;
  unint64_t v19;
  long long v21;
  void (*v22[3])(uint64_t *__return_ptr, uint64_t);
  id v23;

  uint64_t v6 = a1 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_weakPublishedAccessories;
  swift_beginAccess();
  uint64_t v7 = *(void *)v6;
  uint64_t v8 = *(void *)(*(void *)v6 + 16);
  if (!v8) {
    goto LABEL_14;
  }
  swift_bridgeObjectRetain();
  uint64_t v9 = 0;
  do
  {
    uint64_t v10 = v7 + 16 * v9++;
    *(_OWORD *)v22 = *(_OWORD *)(v10 + 32);
    swift_retain();
    sub_24331ADA4(v22, a2, a1, a3);
    swift_release();
  }
  while (v8 != v9);
  swift_bridgeObjectRelease();
  uint64_t v11 = *(void *)v6;
  uint64_t v12 = *(void *)(*(void *)v6 + 16);
  if (v12)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = 0;
    unint64_t v14 = (void (*)(uint64_t *__return_ptr, uint64_t))MEMORY[0x263F8EE78];
    do
    {
      os_log_type_t v21 = *(_OWORD *)(v11 + 16 * v13 + 32);
      unint64_t v15 = swift_retain();
      ((void (*)(id *__return_ptr, uint64_t))v21)(&v23, v15);
      v16 = v23;

      if (v16)
      {
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        v22[0] = v14;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_243340928(0, *((void *)v14 + 2) + 1, 1);
          unint64_t v14 = v22[0];
        }
        id v19 = *((void *)v14 + 2);
        long long v18 = *((void *)v14 + 3);
        if (v19 >= v18 >> 1)
        {
          sub_243340928(v18 > 1, v19 + 1, 1);
          unint64_t v14 = v22[0];
        }
        *((void *)v14 + 2) = v19 + 1;
        *((_OWORD *)v14 + v19 + 2) = v21;
      }
      else
      {
        swift_release();
      }
      ++v13;
    }
    while (v12 != v13);
    swift_bridgeObjectRelease();
  }
  else
  {
LABEL_14:
    unint64_t v14 = (void (*)(uint64_t *__return_ptr, uint64_t))MEMORY[0x263F8EE78];
  }
  *(void *)uint64_t v6 = v14;
  return swift_bridgeObjectRelease();
}

void sub_24331ADA4(void (**a1)(uint64_t *__return_ptr, uint64_t), void *a2, uint64_t a3, uint64_t a4)
{
  void (*v13)(uint64_t *__return_ptr, uint64_t);
  void *v14;
  void *v15;
  id v16;
  id v17;
  char v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  os_log_type_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;

  uint64_t v8 = sub_24334A5B0();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = *a1;
  (*a1)((uint64_t *)&v39, v10);
  unint64_t v14 = v39;
  if (v39)
  {
    v37 = a4;
    unint64_t v15 = (void *)sub_24334A000();

    sub_243349F20();
    v16 = v15;
    long long v17 = a2;
    long long v18 = sub_24334A7F0();

    if ((v18 & 1) == 0)
    {

      return;
    }
    id v19 = v9;
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v12, a3 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_logger, v8);
    v20 = v16;
    os_log_type_t v21 = sub_24334A590();
    v22 = sub_24334A7D0();
    uint64_t v23 = v22;
    if (os_log_type_enabled(v21, v22))
    {
      v24 = swift_slowAlloc();
      v36 = v20;
      uint64_t v25 = v24;
      v35 = swift_slowAlloc();
      v39 = (void *)v35;
      *(_DWORD *)uint64_t v25 = 136315394;
      HIDWORD(v34) = v23;
      uint64_t v26 = sub_243349F00();
      v38 = sub_2433402D0(v26, v27, (uint64_t *)&v39);
      sub_24334A820();

      swift_bridgeObjectRelease();
      *(_WORD *)(v25 + 12) = 1024;
      uint64_t v28 = sub_24334A330();
      LODWORD(v38) = v28 == sub_24334A330();
      sub_24334A820();
      _os_log_impl(&dword_243318000, v21, BYTE4(v34), "Updating tracking button state on %s to %{BOOL}d", (uint8_t *)v25, 0x12u);
      v29 = v35;
      swift_arrayDestroy();
      MEMORY[0x24567AB80](v29, -1, -1);
      int v30 = v25;
      v20 = v36;
      MEMORY[0x24567AB80](v30, -1, -1);
    }
    else
    {
    }
    v31 = (*(uint64_t (**)(char *, uint64_t))(v19 + 8))(v12, v8);
    v13((uint64_t *)&v39, v31);
    v32 = v39;
    if (!v39) {
      goto LABEL_10;
    }
    sub_24334A140();
    if (swift_dynamicCastClass())
    {
      v33 = v32;
      sub_24334A330();
      sub_24334A330();
      sub_24334A130();

LABEL_10:
      return;
    }
  }
}

uint64_t sub_24331B12C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D933D0);
  MEMORY[0x270FA5388]();
  uint64_t v2 = (char *)v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_24334A730();
  uint64_t v4 = *(void *)(v3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56))(v2, 1, 1, v3);
  uint64_t v5 = (void *)swift_allocObject();
  v5[2] = 0;
  v5[3] = 0;
  v5[4] = v0;
  int v6 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3);
  id v7 = v0;
  if (v6 == 1)
  {
    sub_243322E58((uint64_t)v2, &qword_268D933D0);
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  else
  {
    sub_24334A720();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v2, v3);
    if (v5[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v8 = sub_24334A710();
      uint64_t v9 = v10;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v8 = 0;
      uint64_t v9 = 0;
    }
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = &unk_268D93410;
  *(void *)(v11 + 24) = v5;
  if (v9 | v8)
  {
    v13[0] = 0;
    v13[1] = 0;
    v13[2] = v8;
    v13[3] = v9;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_24331B36C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[3] = a4;
  uint64_t v5 = sub_24334A5B0();
  v4[4] = v5;
  v4[5] = *(void *)(v5 - 8);
  v4[6] = swift_task_alloc();
  v4[7] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24331B43C, 0, 0);
}

uint64_t sub_24331B43C()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = *(char **)(v0 + 24);
  uint64_t v5 = OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_logger;
  *(void *)(v0 + 64) = OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_logger;
  int v6 = *(void (**)(uint64_t, char *, uint64_t))(v3 + 16);
  *(void *)(v0 + 72) = v6;
  *(void *)(v0 + 80) = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v6(v1, &v4[v5], v2);
  uint64_t v7 = v4;
  uint64_t v8 = sub_24334A590();
  os_log_type_t v9 = sub_24334A7D0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = *(unsigned __int8 **)(v0 + 24);
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 67109120;
    *(_DWORD *)(v0 + 140) = v10[OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_systemTrackingEnabled];
    sub_24334A820();

    _os_log_impl(&dword_243318000, v8, v9, "XPC disconnected, attempting to re-connect and set system tracking enabled: %{BOOL}d", v11, 8u);
    MEMORY[0x24567AB80](v11, -1, -1);
  }
  else
  {
  }
  uint64_t v12 = *(void *)(v0 + 56);
  uint64_t v13 = *(void *)(v0 + 32);
  uint64_t v14 = *(void *)(v0 + 40);
  uint64_t v15 = *(void *)(v0 + 24);
  v16 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
  *(void *)(v0 + 88) = v16;
  *(void *)(v0 + 96) = (v14 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v16(v12, v13);
  uint64_t v17 = MEMORY[0x24567AC40](v15 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_manager);
  *(void *)(v0 + 104) = v17;
  if (v17)
  {
    uint64_t v18 = *(void *)(v0 + 24);
    uint64_t v19 = OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_systemTrackingEnabled;
    *(void *)(v0 + 112) = OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_systemTrackingEnabled;
    uint64_t v20 = *(unsigned __int8 *)(v18 + v19);
    os_log_type_t v21 = (void *)swift_task_alloc();
    *(void *)(v0 + 120) = v21;
    *os_log_type_t v21 = v0;
    v21[1] = sub_24331B66C;
    return MEMORY[0x270F26830](v20);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    v22 = *(uint64_t (**)(void))(v0 + 8);
    return v22();
  }
}

uint64_t sub_24331B66C()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24331B7B8, 0, 0);
  }
  else
  {

    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_24331B7B8()
{
  uint64_t v1 = *(char **)(v0 + 24);
  uint64_t v2 = *(void **)(v0 + 128);
  uint64_t v3 = *(void (**)(uint64_t, char *, uint64_t))(v0 + 72);
  uint64_t v4 = *(void *)(v0 + 64);
  uint64_t v5 = *(void *)(v0 + 48);
  uint64_t v6 = *(void *)(v0 + 32);

  v3(v5, &v1[v4], v6);
  uint64_t v7 = v1;
  id v8 = v2;
  os_log_type_t v9 = v7;
  id v10 = v2;
  uint64_t v11 = sub_24334A590();
  os_log_type_t v12 = sub_24334A7C0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = *(void **)(v0 + 128);
    uint64_t v14 = *(void *)(v0 + 112);
    uint64_t v15 = *(unsigned __int8 **)(v0 + 24);
    uint64_t v16 = swift_slowAlloc();
    uint64_t v17 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 67109378;
    LODWORD(v14) = v15[v14];

    *(_DWORD *)(v0 + 136) = v14;
    sub_24334A820();

    *(_WORD *)(v16 + 8) = 2112;
    id v18 = v13;
    uint64_t v19 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 16) = v19;
    sub_24334A820();
    *uint64_t v17 = v19;

    _os_log_impl(&dword_243318000, v11, v12, "Failed setting system tracking enabled: %{BOOL}d, %@", (uint8_t *)v16, 0x12u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93300);
    swift_arrayDestroy();
    MEMORY[0x24567AB80](v17, -1, -1);
    MEMORY[0x24567AB80](v16, -1, -1);
  }
  else
  {
    uint64_t v20 = *(void **)(v0 + 128);
    os_log_type_t v21 = *(void **)(v0 + 24);
  }
  (*(void (**)(void, void))(v0 + 88))(*(void *)(v0 + 48), *(void *)(v0 + 32));
  swift_task_dealloc();
  swift_task_dealloc();
  v22 = *(uint64_t (**)(void))(v0 + 8);
  return v22();
}

id sub_24331BA78()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DockAccessoryManagerHelper(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

BOOL static DockKitError.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t DockKitError.hash(into:)()
{
  return sub_24334A9A0();
}

uint64_t DockKitError.hashValue.getter()
{
  return sub_24334A9D0();
}

BOOL sub_24331BBFC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t _s7DockKit0A9AccessoryC17CameraOrientationO9hashValueSivg_0()
{
  return sub_24334A9D0();
}

uint64_t sub_24331BC58()
{
  return sub_24334A9A0();
}

uint64_t sub_24331BC84()
{
  return sub_24334A9D0();
}

uint64_t DockKitError.errorDescription.getter()
{
  id v0 = objc_msgSend(self, sel_mainBundle);
  uint64_t v1 = sub_243349DF0();

  return v1;
}

uint64_t sub_24331BFF8()
{
  uint64_t v0 = sub_24334A5B0();
  __swift_allocate_value_buffer(v0, qword_268D932A8);
  __swift_project_value_buffer(v0, (uint64_t)qword_268D932A8);
  return sub_24334A5A0();
}

uint64_t sub_24331C07C@<X0>(NSObject *a1@<X0>, char *a2@<X8>)
{
  v191[2] = *MEMORY[0x263EF8340];
  uint64_t v4 = sub_24334A5B0();
  uint64_t v187 = *(void *)(v4 - 8);
  uint64_t v188 = v4;
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  uint64_t v7 = &v172[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x270FA5388](v5);
  v185 = &v172[-v8];
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93430);
  uint64_t v10 = MEMORY[0x270FA5388](v9 - 8);
  os_log_type_t v12 = &v172[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = MEMORY[0x270FA5388](v10);
  uint64_t v15 = &v172[-v14];
  uint64_t v16 = MEMORY[0x270FA5388](v13);
  v179 = &v172[-v17];
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = &v172[-v19];
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  uint64_t v23 = &v172[-v22];
  uint64_t v24 = MEMORY[0x270FA5388](v21);
  v184 = &v172[-v25];
  uint64_t v26 = MEMORY[0x270FA5388](v24);
  v180 = &v172[-v27];
  uint64_t v28 = MEMORY[0x270FA5388](v26);
  int v30 = (uint64_t *)&v172[-v29];
  MEMORY[0x270FA5388](v28);
  v32 = &v172[-v31];
  v190 = a1;
  v33 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D93438);
  uint64_t result = swift_dynamicCast();
  if (result)
  {
    *a2 = v189;
    return result;
  }
  v177 = v7;
  v174 = v12;
  v178 = a2;
  uint64_t v35 = sub_24334A4C0();
  uint64_t v182 = *(void *)(v35 - 8);
  v36 = *(unsigned char **)(v182 + 56);
  v183 = v32;
  uint64_t v186 = v35;
  v176 = v36;
  v175 = (void *)(v182 + 56);
  ((void (*)(unsigned char *, uint64_t, uint64_t))v36)(v32, 1, 1);
  v181 = sub_243349E00();
  id v37 = [v181 domain];
  uint64_t v38 = sub_24334A600();
  uint64_t v40 = v39;

  if (v38 == 0xD000000000000012 && v40 == 0x800000024334CE40)
  {
    swift_bridgeObjectRelease();
LABEL_7:
    v42 = v181;
    id v43 = [v181 code];
    uint64_t v44 = v182;
    v45 = v185;
    switch((unint64_t)v43)
    {
      case 0uLL:
        id v46 = [v42 localizedDescription];
        uint64_t v47 = sub_24334A600();
        uint64_t v49 = v48;

        *int v30 = v47;
        v50 = (unsigned int *)MEMORY[0x263F3A8F8];
        goto LABEL_39;
      case 1uLL:
        id v78 = [v42 localizedDescription];
        uint64_t v79 = sub_24334A600();
        uint64_t v49 = v80;

        *int v30 = v79;
        v50 = (unsigned int *)MEMORY[0x263F3A910];
        goto LABEL_39;
      case 2uLL:
        id v81 = [v42 localizedDescription];
        uint64_t v82 = sub_24334A600();
        uint64_t v49 = v83;

        *int v30 = v82;
        v50 = (unsigned int *)MEMORY[0x263F3A918];
        goto LABEL_39;
      case 3uLL:
        id v84 = [v42 localizedDescription];
        uint64_t v85 = sub_24334A600();
        uint64_t v49 = v86;

        *int v30 = v85;
        v50 = (unsigned int *)MEMORY[0x263F3A938];
        goto LABEL_39;
      case 4uLL:
        id v66 = [v42 localizedDescription];
        uint64_t v67 = sub_24334A600();
        uint64_t v49 = v68;

        *int v30 = v67;
        v50 = (unsigned int *)MEMORY[0x263F3A958];
        goto LABEL_39;
      case 5uLL:
        id v87 = [v42 localizedDescription];
        uint64_t v88 = sub_24334A600();
        uint64_t v49 = v89;

        *int v30 = v88;
        v50 = (unsigned int *)MEMORY[0x263F3A8E0];
        goto LABEL_39;
      case 6uLL:
        id v90 = [v42 localizedDescription];
        uint64_t v91 = sub_24334A600();
        uint64_t v49 = v92;

        *int v30 = v91;
        v50 = (unsigned int *)MEMORY[0x263F3A9A8];
        goto LABEL_39;
      case 7uLL:
        id v93 = [v42 localizedDescription];
        uint64_t v94 = sub_24334A600();
        uint64_t v49 = v95;

        *int v30 = v94;
        v50 = (unsigned int *)MEMORY[0x263F3A9B8];
        goto LABEL_39;
      case 8uLL:
        id v96 = [v42 localizedDescription];
        uint64_t v97 = sub_24334A600();
        uint64_t v49 = v98;

        *int v30 = v97;
        v50 = (unsigned int *)MEMORY[0x263F3A8E8];
        goto LABEL_39;
      case 9uLL:
        id v69 = [v42 localizedDescription];
        uint64_t v70 = sub_24334A600();
        uint64_t v49 = v71;

        *int v30 = v70;
        v50 = (unsigned int *)MEMORY[0x263F3A9B0];
        goto LABEL_39;
      case 0xAuLL:
        id v99 = [v42 localizedDescription];
        uint64_t v100 = sub_24334A600();
        uint64_t v49 = v101;

        *int v30 = v100;
        v50 = (unsigned int *)MEMORY[0x263F3A960];
        goto LABEL_39;
      case 0xBuLL:
        id v72 = [v42 localizedDescription];
        uint64_t v73 = sub_24334A600();
        uint64_t v49 = v74;

        *int v30 = v73;
        v50 = (unsigned int *)MEMORY[0x263F3A988];
        goto LABEL_39;
      case 0xCuLL:
        id v75 = [v42 localizedDescription];
        uint64_t v76 = sub_24334A600();
        uint64_t v49 = v77;

        *int v30 = v76;
        v50 = (unsigned int *)MEMORY[0x263F3A998];
        goto LABEL_39;
      case 0xDuLL:
        id v102 = [v42 localizedDescription];
        uint64_t v103 = sub_24334A600();
        uint64_t v49 = v104;

        *int v30 = v103;
        v50 = (unsigned int *)MEMORY[0x263F3A990];
        goto LABEL_39;
      case 0xEuLL:
        id v60 = [v42 localizedDescription];
        uint64_t v61 = sub_24334A600();
        uint64_t v49 = v62;

        *int v30 = v61;
        v50 = (unsigned int *)MEMORY[0x263F3A970];
        goto LABEL_39;
      case 0xFuLL:
        id v105 = [v42 localizedDescription];
        uint64_t v106 = sub_24334A600();
        uint64_t v49 = v107;

        *int v30 = v106;
        v50 = (unsigned int *)MEMORY[0x263F3A968];
        goto LABEL_39;
      case 0x10uLL:
        id v63 = [v42 localizedDescription];
        uint64_t v64 = sub_24334A600();
        uint64_t v49 = v65;

        *int v30 = v64;
        v50 = (unsigned int *)MEMORY[0x263F3A930];
        goto LABEL_39;
      case 0x11uLL:
        id v108 = [v42 localizedDescription];
        uint64_t v109 = sub_24334A600();
        uint64_t v49 = v110;

        *int v30 = v109;
        v50 = (unsigned int *)MEMORY[0x263F3A978];
        goto LABEL_39;
      case 0x12uLL:
        id v111 = [v42 localizedDescription];
        uint64_t v112 = sub_24334A600();
        uint64_t v49 = v113;

        *int v30 = v112;
        v50 = (unsigned int *)MEMORY[0x263F3A908];
        goto LABEL_39;
      case 0x13uLL:
        id v126 = [v42 localizedDescription];
        uint64_t v127 = sub_24334A600();
        uint64_t v49 = v128;

        *int v30 = v127;
        v50 = (unsigned int *)MEMORY[0x263F3A8F0];
        goto LABEL_39;
      case 0x14uLL:
        id v114 = [v42 localizedDescription];
        uint64_t v115 = sub_24334A600();
        uint64_t v49 = v116;

        *int v30 = v115;
        v50 = (unsigned int *)MEMORY[0x263F3A8D8];
        goto LABEL_39;
      case 0x15uLL:
        id v117 = [v42 localizedDescription];
        uint64_t v118 = sub_24334A600();
        uint64_t v49 = v119;

        *int v30 = v118;
        v50 = (unsigned int *)MEMORY[0x263F3A950];
        goto LABEL_39;
      case 0x16uLL:
        id v129 = [v42 localizedDescription];
        uint64_t v130 = sub_24334A600();
        uint64_t v49 = v131;

        *int v30 = v130;
        v50 = (unsigned int *)MEMORY[0x263F3A948];
        goto LABEL_39;
      case 0x17uLL:
        id v135 = [v42 localizedDescription];
        uint64_t v136 = sub_24334A600();
        uint64_t v49 = v137;

        *int v30 = v136;
        v50 = (unsigned int *)MEMORY[0x263F3A980];
        goto LABEL_39;
      case 0x18uLL:
        id v120 = [v42 localizedDescription];
        uint64_t v121 = sub_24334A600();
        uint64_t v49 = v122;

        *int v30 = v121;
        v50 = (unsigned int *)MEMORY[0x263F3A928];
        goto LABEL_39;
      case 0x19uLL:
        id v123 = [v42 localizedDescription];
        uint64_t v124 = sub_24334A600();
        uint64_t v49 = v125;

        *int v30 = v124;
        v50 = (unsigned int *)MEMORY[0x263F3A920];
        goto LABEL_39;
      case 0x1AuLL:
        id v138 = [v42 localizedDescription];
        uint64_t v139 = sub_24334A600();
        uint64_t v49 = v140;

        *int v30 = v139;
        v50 = (unsigned int *)MEMORY[0x263F3A940];
        goto LABEL_39;
      case 0x1BuLL:
        id v57 = [v42 localizedDescription];
        uint64_t v58 = sub_24334A600();
        uint64_t v49 = v59;

        *int v30 = v58;
        v50 = (unsigned int *)MEMORY[0x263F3A900];
LABEL_39:
        uint64_t v54 = (uint64_t)v183;
        break;
      default:
        id v132 = [v42 localizedDescription];
        uint64_t v133 = sub_24334A600();
        uint64_t v49 = v134;

        *int v30 = v133;
        v50 = (unsigned int *)MEMORY[0x263F3A930];
        uint64_t v44 = v182;
        uint64_t v54 = (uint64_t)v183;
        v45 = v185;
        break;
    }
    v30[1] = v49;
    uint64_t v141 = v186;
    (*(void (**)(uint64_t *, void, uint64_t))(v44 + 104))(v30, *v50, v186);
    ((void (*)(uint64_t *, void, uint64_t, uint64_t))v176)(v30, 0, 1, v141);
    sub_243322D88((uint64_t)v30, v54);
    if (qword_268D932A0 != -1) {
      swift_once();
    }
    uint64_t v142 = v188;
    uint64_t v143 = __swift_project_value_buffer(v188, (uint64_t)qword_268D932A8);
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v187 + 16))(v45, v143, v142);
    v144 = v42;
    v145 = sub_24334A590();
    int v146 = sub_24334A7D0();
    if (os_log_type_enabled(v145, (os_log_type_t)v146))
    {
      int v173 = v146;
      v176 = v15;
      uint64_t v147 = v44;
      uint64_t v148 = swift_slowAlloc();
      v149 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v148 = 138412546;
      v190 = v144;
      v150 = v144;
      v175 = v191;
      sub_24334A820();
      void *v149 = v144;

      *(_WORD *)(v148 + 12) = 2112;
      swift_beginAccess();
      v151 = v180;
      sub_243322DF0(v54, (uint64_t)v180);
      uint64_t v152 = v186;
      if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v147 + 48))(v151, 1, v186) == 1)
      {
        sub_243322E58((uint64_t)v151, &qword_268D93430);
        v190 = 0;
        sub_24334A820();
        uint64_t v153 = 0;
      }
      else
      {
        sub_243320650(&qword_268D93440, MEMORY[0x263F3A9C0]);
        swift_allocError();
        (*(void (**)(uint64_t, unsigned char *, uint64_t))(v147 + 32))(v155, v151, v152);
        uint64_t v153 = _swift_stdlib_bridgeErrorToNSError();
        v190 = v153;
        sub_24334A820();
      }
      uint64_t v154 = (uint64_t)v184;
      os_log_type_t v156 = v173;
      v149[1] = v153;
      _os_log_impl(&dword_243318000, v145, v156, "nsErr is %@, coreErr = %@", (uint8_t *)v148, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268D93300);
      swift_arrayDestroy();
      MEMORY[0x24567AB80](v149, -1, -1);
      MEMORY[0x24567AB80](v148, -1, -1);
      uint64_t v44 = v182;
      uint64_t v54 = (uint64_t)v183;
      uint64_t v15 = v176;
      v45 = v185;
    }
    else
    {

      v145 = v144;
      uint64_t v154 = (uint64_t)v184;
    }

    (*(void (**)(unsigned char *, uint64_t))(v187 + 8))(v45, v188);
    swift_beginAccess();
    sub_243322DF0(v54, v154);
    v55 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v44 + 48);
    uint64_t v52 = v186;
    if (v55(v154, 1, v186) == 1)
    {

      uint64_t v56 = v154;
      goto LABEL_50;
    }
    uint64_t v20 = (unsigned char *)v154;
    goto LABEL_52;
  }
  char v41 = sub_24334A940();
  swift_bridgeObjectRelease();
  if (v41) {
    goto LABEL_7;
  }
  v190 = a1;
  v51 = a1;
  uint64_t v52 = v186;
  int v53 = swift_dynamicCast();
  ((void (*)(unsigned char *, void, uint64_t, uint64_t))v176)(v23, v53 ^ 1u, 1, v52);
  uint64_t v54 = (uint64_t)v183;
  sub_243322D88((uint64_t)v23, (uint64_t)v183);
  sub_243322DF0(v54, (uint64_t)v20);
  uint64_t v44 = v182;
  v55 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v182 + 48);
  if (v55((uint64_t)v20, 1, v52) == 1)
  {

    uint64_t v56 = (uint64_t)v20;
LABEL_50:
    sub_243322E58(v56, &qword_268D93430);
    uint64_t result = sub_243322E58(v54, &qword_268D93430);
    char *v178 = 3;
    return result;
  }
LABEL_52:
  sub_243322E58((uint64_t)v20, &qword_268D93430);
  if (qword_268D932A0 != -1) {
    swift_once();
  }
  uint64_t v157 = v188;
  uint64_t v158 = __swift_project_value_buffer(v188, (uint64_t)qword_268D932A8);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v187 + 16))(v177, v158, v157);
  v159 = sub_24334A590();
  os_log_type_t v160 = sub_24334A7D0();
  if (os_log_type_enabled(v159, v160))
  {
    v161 = (uint8_t *)swift_slowAlloc();
    v162 = (void *)swift_slowAlloc();
    *(_DWORD *)v161 = 138412290;
    swift_beginAccess();
    v163 = v179;
    sub_243322DF0(v54, (uint64_t)v179);
    if (v55((uint64_t)v163, 1, v52) == 1)
    {
      sub_243322E58((uint64_t)v163, &qword_268D93430);
      v190 = 0;
      sub_24334A820();
      uint64_t v164 = 0;
    }
    else
    {
      sub_243320650(&qword_268D93440, MEMORY[0x263F3A9C0]);
      swift_allocError();
      (*(void (**)(uint64_t, unsigned char *, uint64_t))(v44 + 32))(v166, v163, v52);
      uint64_t v164 = _swift_stdlib_bridgeErrorToNSError();
      v190 = v164;
      sub_24334A820();
    }
    void *v162 = v164;
    _os_log_impl(&dword_243318000, v159, v160, "Converting coreErr = %@ to public", v161, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93300);
    swift_arrayDestroy();
    MEMORY[0x24567AB80](v162, -1, -1);
    MEMORY[0x24567AB80](v161, -1, -1);
    v165 = v181;
    uint64_t v54 = (uint64_t)v183;
  }
  else
  {
    v165 = v159;
    v159 = v181;
  }

  (*(void (**)(unsigned char *, uint64_t))(v187 + 8))(v177, v188);
  swift_beginAccess();
  sub_243322DF0(v54, (uint64_t)v15);
  if (v55((uint64_t)v15, 1, v52) == 1) {
    goto LABEL_63;
  }
  uint64_t v167 = (uint64_t)v174;
  sub_243322DF0((uint64_t)v15, (uint64_t)v174);
  int v168 = (*(uint64_t (**)(uint64_t, uint64_t))(v44 + 88))(v167, v52);
  if (v168 != *MEMORY[0x263F3A8F8])
  {
    if (v168 == *MEMORY[0x263F3A910] || v168 == *MEMORY[0x263F3A918]) {
      goto LABEL_66;
    }
    if (v168 == *MEMORY[0x263F3A938]) {
      goto LABEL_62;
    }
    if (v168 == *MEMORY[0x263F3A958] || v168 == *MEMORY[0x263F3A8E0] || v168 == *MEMORY[0x263F3A9A8]) {
      goto LABEL_66;
    }
    if (v168 == *MEMORY[0x263F3A9B8] || v168 == *MEMORY[0x263F3A8E8]) {
      goto LABEL_62;
    }
    if (v168 == *MEMORY[0x263F3A9B0])
    {
      (*(void (**)(uint64_t, uint64_t))(v44 + 96))(v167, v52);
      swift_bridgeObjectRelease();
      char v169 = 2;
      goto LABEL_67;
    }
    if (v168 == *MEMORY[0x263F3A960])
    {
LABEL_66:
      (*(void (**)(uint64_t, uint64_t))(v44 + 96))(v167, v52);
      swift_bridgeObjectRelease();
      char v169 = 1;
      goto LABEL_67;
    }
    if (v168 == *MEMORY[0x263F3A988] || v168 == *MEMORY[0x263F3A998]) {
      goto LABEL_80;
    }
    if (v168 == *MEMORY[0x263F3A990]
      || v168 == *MEMORY[0x263F3A970]
      || v168 == *MEMORY[0x263F3A968]
      || v168 == *MEMORY[0x263F3A930])
    {
LABEL_85:
      (*(void (**)(unsigned char *, uint64_t))(v182 + 96))(v174, v186);
      swift_bridgeObjectRelease();
      char v171 = 2;
      goto LABEL_86;
    }
    if (v168 != *MEMORY[0x263F3A978])
    {
      if (v168 == *MEMORY[0x263F3A908] || v168 == *MEMORY[0x263F3A8F0] || v168 == *MEMORY[0x263F3A8D8]) {
        goto LABEL_85;
      }
      if (v168 != *MEMORY[0x263F3A950])
      {
        if (v168 == *MEMORY[0x263F3A948] || v168 == *MEMORY[0x263F3A980])
        {
          (*(void (**)(unsigned char *, uint64_t))(v182 + 96))(v174, v186);
          swift_bridgeObjectRelease();
        }
        else
        {
          if (v168 == *MEMORY[0x263F3A928])
          {
            (*(void (**)(unsigned char *, uint64_t))(v182 + 96))(v174, v186);
            swift_bridgeObjectRelease();
            char v171 = 4;
            goto LABEL_86;
          }
          if (v168 == *MEMORY[0x263F3A920])
          {
            (*(void (**)(unsigned char *, uint64_t))(v182 + 96))(v174, v186);
            swift_bridgeObjectRelease();
            char v171 = 5;
            goto LABEL_86;
          }
          if (v168 == *MEMORY[0x263F3A940])
          {
            (*(void (**)(unsigned char *, uint64_t))(v182 + 96))(v174, v186);
            swift_bridgeObjectRelease();
            char v171 = 6;
            goto LABEL_86;
          }
          if (v168 == *MEMORY[0x263F3A900])
          {
            (*(void (**)(unsigned char *, uint64_t))(v182 + 96))(v174, v186);
            swift_bridgeObjectRelease();
            char v171 = 7;
            goto LABEL_86;
          }
          if (v168 == *MEMORY[0x263F3A9A0]) {
            goto LABEL_85;
          }
          (*(void (**)(unsigned char *, uint64_t))(v182 + 8))(v174, v186);
        }
        char v171 = 3;
        goto LABEL_86;
      }
    }
LABEL_80:
    (*(void (**)(unsigned char *, uint64_t))(v182 + 96))(v174, v186);
    swift_bridgeObjectRelease();
    char v171 = 1;
LABEL_86:
    char *v178 = v171;
    sub_243322E58((uint64_t)v15, &qword_268D93430);
    uint64_t v170 = (uint64_t)v183;
    return sub_243322E58(v170, &qword_268D93430);
  }
LABEL_62:
  (*(void (**)(uint64_t, uint64_t))(v44 + 96))(v167, v52);
  swift_bridgeObjectRelease();
LABEL_63:
  char v169 = 3;
LABEL_67:
  char *v178 = v169;
  sub_243322E58((uint64_t)v15, &qword_268D93430);
  uint64_t v170 = v54;
  return sub_243322E58(v170, &qword_268D93430);
}

BOOL sub_24331D804()
{
  uint64_t v1 = OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock;
  objc_super v2 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock);
  swift_retain();
  os_unfair_lock_lock(v2 + 4);
  swift_release();
  char v3 = *(unsigned char *)(v0 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabled);
  uint64_t v4 = *(os_unfair_lock_s **)(v0 + v1);
  swift_retain();
  os_unfair_lock_unlock(v4 + 4);
  swift_release();
  return (v3 & 1) == 0;
}

uint64_t sub_24331D888@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v17 = a1;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D932E0);
  uint64_t v3 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24334A5B0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388]();
  uint64_t v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v2 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager_logger, v6);
  uint64_t v10 = sub_24334A590();
  os_log_type_t v11 = sub_24334A7B0();
  if (os_log_type_enabled(v10, v11))
  {
    os_log_type_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = v2;
    uint64_t v13 = v12;
    *(_WORD *)os_log_type_t v12 = 0;
    _os_log_impl(&dword_243318000, v10, v11, "API: accessoryStateChanges", v12, 2u);
    MEMORY[0x24567AB80](v13, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, *MEMORY[0x263F8F580], v16);
  return sub_24334A790();
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

uint64_t sub_24331DB24()
{
  type metadata accessor for DockAccessoryManager(0);
  swift_allocObject();
  uint64_t result = sub_24331DBC0();
  qword_268D932C8 = result;
  return result;
}

uint64_t static DockAccessoryManager.shared.getter()
{
  if (qword_268D932C0 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t sub_24331DBC0()
{
  *(void *)(v0 + 24) = 0;
  sub_24334A5A0();
  uint64_t v1 = OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D93448);
  uint64_t v2 = swift_allocObject();
  *(_DWORD *)(v2 + 16) = 0;
  *(void *)(v0 + v1) = v2;
  *(unsigned char *)(v0 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabled) = 0;
  *(void *)(v0 + 16) = objc_msgSend(objc_allocWithZone((Class)sub_243349FD0()), sel_init);
  return v0;
}

uint64_t sub_24331DC78(char a1)
{
  *(void *)(v2 + 24) = v1;
  *(unsigned char *)(v2 + 124) = a1;
  uint64_t v3 = sub_24334A5B0();
  *(void *)(v2 + 32) = v3;
  *(void *)(v2 + 40) = *(void *)(v3 - 8);
  *(void *)(v2 + 48) = swift_task_alloc();
  *(void *)(v2 + 56) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24331DD4C, 0, 0);
}

uint64_t sub_24331DD4C()
{
  uint64_t v1 = *(void *)(v0 + 56);
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = *(void *)(v0 + 24);
  uint64_t v5 = OBJC_IVAR____TtC7DockKit20DockAccessoryManager_logger;
  *(void *)(v0 + 64) = OBJC_IVAR____TtC7DockKit20DockAccessoryManager_logger;
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  *(void *)(v0 + 72) = v6;
  *(void *)(v0 + 80) = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v6(v1, v4 + v5, v2);
  uint64_t v7 = sub_24334A590();
  os_log_type_t v8 = sub_24334A7B0();
  if (os_log_type_enabled(v7, v8))
  {
    int v9 = *(unsigned __int8 *)(v0 + 124);
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 67240192;
    *(_DWORD *)(v0 + 120) = v9;
    sub_24334A820();
    _os_log_impl(&dword_243318000, v7, v8, "API: setSystemTrackingEnabled: %{BOOL,public}d", v10, 8u);
    MEMORY[0x24567AB80](v10, -1, -1);
  }

  uint64_t v11 = *(void *)(v0 + 56);
  uint64_t v12 = *(void *)(v0 + 32);
  uint64_t v13 = *(void *)(v0 + 40);
  uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
  *(void *)(v0 + 88) = v14;
  *(void *)(v0 + 96) = (v13 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v14(v11, v12);
  uint64_t v15 = (void *)swift_task_alloc();
  *(void *)(v0 + 104) = v15;
  *uint64_t v15 = v0;
  v15[1] = sub_24331DEF4;
  uint64_t v16 = *(unsigned __int8 *)(v0 + 124);
  return MEMORY[0x270F26830](v16);
}

uint64_t sub_24331DEF4()
{
  *(void *)(*(void *)v1 + 112) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24331E160;
  }
  else {
    uint64_t v2 = sub_24331E008;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24331E008()
{
  uint64_t v1 = *(void *)(v0 + 112);
  uint64_t v2 = *(void *)(v0 + 24);
  char v3 = *(unsigned char *)(v0 + 124);
  uint64_t v4 = *(os_unfair_lock_s **)(v2 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock);
  uint64_t v5 = swift_task_alloc();
  *(void *)(v5 + 16) = v2;
  *(unsigned char *)(v5 + 24) = v3;
  uint64_t v6 = swift_task_alloc();
  *(void *)(v6 + 16) = sub_24331FD0C;
  *(void *)(v6 + 24) = v5;
  swift_retain();
  os_unfair_lock_lock(v4 + 4);
  sub_24331FD2C();
  os_unfair_lock_unlock(v4 + 4);
  if (v1)
  {
    return swift_task_dealloc();
  }
  else
  {
    uint64_t v8 = *(void *)(v0 + 24);
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    int v9 = *(void **)(v8 + 24);
    if (v9)
    {
      char v10 = *(unsigned char *)(v0 + 124);
      id v11 = v9;
      sub_24331A3D0(v10);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v12 = *(uint64_t (**)(void))(v0 + 8);
    return v12();
  }
}

uint64_t sub_24331E160()
{
  uint64_t v20 = v0;
  uint64_t v1 = *(void **)(v0 + 112);
  (*(void (**)(void, void, void))(v0 + 72))(*(void *)(v0 + 48), *(void *)(v0 + 24) + *(void *)(v0 + 64), *(void *)(v0 + 32));
  id v2 = v1;
  id v3 = v1;
  uint64_t v4 = sub_24334A590();
  os_log_type_t v5 = sub_24334A7C0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = *(void **)(v0 + 112);
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    id v9 = v6;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 16) = v10;
    sub_24334A820();
    *uint64_t v8 = v10;

    _os_log_impl(&dword_243318000, v4, v5, "Failed in setSystemTrackingEnabled: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93300);
    swift_arrayDestroy();
    MEMORY[0x24567AB80](v8, -1, -1);
    MEMORY[0x24567AB80](v7, -1, -1);
  }
  else
  {
    id v11 = *(void **)(v0 + 112);
  }
  uint64_t v12 = *(NSObject **)(v0 + 112);
  uint64_t v13 = *(void (**)(uint64_t, uint64_t))(v0 + 88);
  uint64_t v14 = *(void *)(v0 + 48);
  uint64_t v15 = *(void *)(v0 + 32);

  v13(v14, v15);
  sub_24331C07C(v12, v19);
  LOBYTE(v15) = v19[0];
  sub_24331FCB8();
  swift_allocError();
  unsigned char *v16 = v15;
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = *(uint64_t (**)(void))(v0 + 8);
  return v17();
}

uint64_t sub_24331E39C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93450);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  MEMORY[0x270FA5388]();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D933D0);
  MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_24334A740();
  uint64_t v9 = sub_24334A730();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  unint64_t v10 = (*(unsigned __int8 *)(v5 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  id v11 = (char *)swift_allocObject();
  *((void *)v11 + 2) = 0;
  *((void *)v11 + 3) = 0;
  *((void *)v11 + 4) = a2;
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(&v11[v10], (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
  swift_retain();
  sub_243323308((uint64_t)v8, (uint64_t)&unk_268D93460, (uint64_t)v11);
  return swift_release();
}

uint64_t sub_24331E59C(uint64_t a1)
{
  return sub_24331E39C(a1, v1);
}

uint64_t sub_24331E5A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[4] = a4;
  v5[5] = a5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93468);
  v5[6] = v6;
  v5[7] = *(void *)(v6 - 8);
  v5[8] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93450);
  v5[9] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v5[10] = v8;
  v5[11] = *(void *)(v8 + 64);
  v5[12] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24331E6D0, 0, 0);
}

uint64_t sub_24331E6D0()
{
  uint64_t v1 = *(void *)(v0 + 96);
  uint64_t v2 = *(void *)(v0 + 72);
  uint64_t v3 = *(void *)(v0 + 80);
  uint64_t v5 = *(void *)(v0 + 32);
  uint64_t v4 = *(void *)(v0 + 40);
  uint64_t v6 = *(void **)(v5 + 16);
  *(void *)(v0 + 104) = v6;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v4, v2);
  unint64_t v7 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v8 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v8 + v7, v1, v2);
  id v9 = objc_allocWithZone((Class)type metadata accessor for DockAccessoryManagerHelper(0));
  id v10 = v6;
  id v11 = sub_24331A00C(v6, (uint64_t)sub_2433231E0, v8);
  uint64_t v12 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v11;

  uint64_t v13 = *(void **)(v5 + 24);
  if (v13)
  {
    char v14 = *(unsigned char *)(*(void *)(v0 + 32) + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabled);
    id v15 = v13;
    sub_24331A3D0((v14 & 1) == 0);

    uint64_t v16 = (void *)swift_task_alloc();
    *(void *)(v0 + 112) = v16;
    void *v16 = v0;
    v16[1] = sub_24331E928;
    return sub_24331ED1C();
  }
  else
  {
    sub_24331FCB8();
    uint64_t v18 = (void *)swift_allocError();
    unsigned char *v19 = 2;
    swift_willThrow();
    uint64_t v20 = *(void *)(v0 + 64);
    uint64_t v21 = *(void *)(v0 + 48);
    uint64_t v22 = *(void *)(v0 + 56);
    *(void *)(v0 + 16) = 0;
    *(_WORD *)(v0 + 24) = 0;
    sub_24334A750();
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v20, v21);
    sub_24334A760();

    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v23 = *(uint64_t (**)(void))(v0 + 8);
    return v23();
  }
}

uint64_t sub_24331E928()
{
  *(void *)(*(void *)v1 + 120) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24331EB3C;
  }
  else {
    uint64_t v2 = sub_24331EA3C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

void sub_24331EA3C()
{
  uint64_t v1 = *(void **)(*(void *)(v0 + 32) + 24);
  if (v1)
  {
    uint64_t v2 = *(void **)(v0 + 120);
    id v3 = v1;
    sub_243349F60();

    if (v2)
    {
      uint64_t v4 = *(void *)(v0 + 64);
      uint64_t v5 = *(void *)(v0 + 48);
      uint64_t v6 = *(void *)(v0 + 56);
      *(void *)(v0 + 16) = 0;
      *(_WORD *)(v0 + 24) = 0;
      sub_24334A750();
      (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
      sub_24334A760();
    }
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v7 = *(void (**)(void))(v0 + 8);
    v7();
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_24331EB3C()
{
  uint64_t v1 = *(void **)(v0 + 120);
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v3 = *(void *)(v0 + 48);
  uint64_t v4 = *(void *)(v0 + 56);
  *(void *)(v0 + 16) = 0;
  *(_WORD *)(v0 + 24) = 0;
  sub_24334A750();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  sub_24334A760();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v5 = *(uint64_t (**)(void))(v0 + 8);
  return v5();
}

uint64_t sub_24331EC08(uint64_t a1, unsigned char *a2, char a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93468);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  id v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v8) = *a2;
  uint64_t v11 = a1;
  char v12 = v8;
  char v13 = a3;
  swift_retain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D93450);
  sub_24334A750();
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_24331ED1C()
{
  *(void *)(v1 + 16) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D933D0);
  *(void *)(v1 + 24) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24331EDB0, 0, 0);
}

uint64_t sub_24331EDB0()
{
  v0[4] = *(void *)(v0[2] + 16);
  uint64_t v1 = (void *)swift_task_alloc();
  v0[5] = v1;
  *uint64_t v1 = v0;
  v1[1] = sub_24331EE4C;
  return MEMORY[0x270F267F0]();
}

uint64_t sub_24331EE4C(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(*v2 + 48) = a1;
  swift_task_dealloc();
  if (v1)
  {
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v3 + 8);
    return v4();
  }
  else
  {
    return MEMORY[0x270FA2498](sub_24331EF9C, 0, 0);
  }
}

uint64_t sub_24331EF9C()
{
  uint64_t v1 = (void *)v0[6];
  if (v1)
  {
    uint64_t v2 = (void *)sub_24334A000();
    sub_243349F10();

    uint64_t v3 = sub_243349EE0();
    if (v3 == sub_243349EE0())
    {
      uint64_t v4 = (void *)swift_task_alloc();
      v0[7] = v4;
      *uint64_t v4 = v0;
      v4[1] = sub_24331F0B8;
      return MEMORY[0x270F267E8]();
    }
  }
  swift_task_dealloc();
  uint64_t v5 = (uint64_t (*)(void))v0[1];
  return v5();
}

uint64_t sub_24331F0B8(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 64) = a1;
  *(void *)(v3 + 72) = v1;
  swift_task_dealloc();
  if (v1) {
    uint64_t v4 = sub_24331F318;
  }
  else {
    uint64_t v4 = sub_24331F1CC;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_24331F1CC()
{
  uint64_t v1 = *(void **)(v0[2] + 24);
  if (v1)
  {
    uint64_t v2 = v0[8];
    uint64_t v3 = (void *)v0[6];
    uint64_t v4 = v0[3];
    id v5 = v1;
    uint64_t v6 = (void *)sub_24334A000();
    uint64_t v7 = sub_24334A730();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v4, 1, 1, v7);
    uint64_t v8 = (void *)swift_allocObject();
    v8[2] = 0;
    v8[3] = 0;
    v8[4] = v5;
    v8[5] = v6;
    v8[6] = 0;
    v8[7] = 0;
    v8[8] = v2;
    id v9 = v5;
    id v10 = v6;
    sub_243323308(v4, (uint64_t)&unk_268D933E0, (uint64_t)v8);
    swift_release();
  }
  else
  {
    id v9 = (id)v0[6];
  }

  swift_task_dealloc();
  uint64_t v11 = (uint64_t (*)(void))v0[1];
  return v11();
}

uint64_t sub_24331F318()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t DockAccessoryManager.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager_logger;
  uint64_t v2 = sub_24334A5B0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  return v0;
}

uint64_t DockAccessoryManager.__deallocating_deinit()
{
  uint64_t v1 = (char *)v0 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager_logger;
  uint64_t v2 = sub_24334A5B0();
  (*(void (**)(char *, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  swift_release();
  uint64_t v3 = *((unsigned int *)*v0 + 12);
  uint64_t v4 = *((unsigned __int16 *)*v0 + 26);

  return MEMORY[0x270FA0228](v0, v3, v4);
}

void *sub_24331F4C8@<X0>(void *result@<X0>, uint64_t a2@<X8>)
{
  *(void *)a2 = *result;
  *(unsigned char *)(a2 + 8) = 0;
  return result;
}

void sub_24331F4D8(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_24331F4E4(uint64_t a1, uint64_t a2)
{
  return sub_24331F780(a1, a2, MEMORY[0x263F07B58]);
}

uint64_t sub_24331F4FC(uint64_t a1, id *a2)
{
  uint64_t result = sub_24334A5E0();
  *a2 = 0;
  return result;
}

uint64_t sub_24331F574(uint64_t a1, id *a2)
{
  char v3 = sub_24334A5F0();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_24331F5F4@<X0>(uint64_t *a1@<X8>)
{
  sub_24334A600();
  uint64_t v2 = sub_24334A5D0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24331F638@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2 = sub_24334A5D0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_24331F680@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_24334A600();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_24331F6AC(uint64_t a1)
{
  uint64_t v2 = sub_243320650(&qword_268D933C0, type metadata accessor for DeviceType);
  uint64_t v3 = sub_243320650(&qword_268D933C8, type metadata accessor for DeviceType);
  uint64_t v4 = MEMORY[0x263F8D320];

  return MEMORY[0x270F9F1A8](a1, v2, v3, v4);
}

uint64_t sub_24331F768(uint64_t a1, uint64_t a2)
{
  return sub_24331F780(a1, a2, MEMORY[0x263F8D308]);
}

uint64_t sub_24331F780(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_24334A600();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_24331F7C4()
{
  sub_24334A600();
  sub_24334A640();

  return swift_bridgeObjectRelease();
}

uint64_t sub_24331F818()
{
  sub_24334A600();
  sub_24334A990();
  sub_24334A640();
  uint64_t v0 = sub_24334A9D0();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_24331F88C()
{
  uint64_t v0 = sub_24334A600();
  uint64_t v2 = v1;
  if (v0 == sub_24334A600() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_24334A940();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_24331F918(uint64_t a1, uint64_t (*a2)(void))
{
  return a2();
}

void *sub_24331F940(void *result, int64_t a2, char a3, void *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_268D933F8);
      id v10 = (void *)swift_allocObject();
      int64_t v11 = _swift_stdlib_malloc_size(v10);
      uint64_t v12 = v11 - 32;
      if (v11 < 32) {
        uint64_t v12 = v11 - 17;
      }
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      uint64_t v13 = v10 + 4;
      if (v5) {
        goto LABEL_15;
      }
    }
    else
    {
      id v10 = (void *)MEMORY[0x263F8EE78];
      uint64_t v13 = (void *)(MEMORY[0x263F8EE78] + 32);
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
    sub_2433207F4(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_24331FA50(char a1, int64_t a2, char a3, unint64_t a4)
{
  if (a3)
  {
    unint64_t v6 = *(void *)(a4 + 24);
    uint64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        uint64_t v7 = a2;
      }
    }
  }
  else
  {
    uint64_t v7 = a2;
  }
  uint64_t v8 = *(void *)(a4 + 16);
  if (v7 <= v8) {
    uint64_t v9 = *(void *)(a4 + 16);
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x263F8EE78];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D93428);
  uint64_t v10 = *(void *)(type metadata accessor for DockAccessory.TrackedSubjectType(0) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (BOOL v15 = v11 == -1) : (BOOL v15 = 0), v15))
  {
LABEL_29:
    uint64_t result = sub_24334A8A0();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  uint64_t v16 = *(void *)(type metadata accessor for DockAccessory.TrackedSubjectType(0) - 8);
  unint64_t v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  unint64_t v18 = (unint64_t)v13 + v17;
  if (a1)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(void *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (void *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(void *)(a4 + 16) = 0;
  }
  else
  {
    sub_243322C14(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

unint64_t sub_24331FCB8()
{
  unint64_t result = qword_268D932F8;
  if (!qword_268D932F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D932F8);
  }
  return result;
}

void sub_24331FD0C()
{
  *(unsigned char *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabled) = (*(unsigned char *)(v0 + 24) & 1) == 0;
}

uint64_t sub_24331FD2C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

unint64_t sub_24331FD58()
{
  unint64_t result = qword_268D93308;
  if (!qword_268D93308)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D93308);
  }
  return result;
}

uint64_t sub_24331FDB0()
{
  return type metadata accessor for DockAccessoryManagerHelper(0);
}

uint64_t type metadata accessor for DockAccessoryManagerHelper(uint64_t a1)
{
  return sub_24332008C(a1, (uint64_t *)&unk_268D93348);
}

uint64_t sub_24331FDD8()
{
  uint64_t result = sub_24334A5B0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unsigned char *__swift_memcpy1_1(unsigned char *result, unsigned char *a2)
{
  *uint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for DockKitError(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xF9) {
    goto LABEL_17;
  }
  if (a2 + 7 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 7) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 7;
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
      return (*a1 | (v4 << 8)) - 7;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 7;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 8;
  int v8 = v6 - 8;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for DockKitError(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *uint64_t result = a2 + 7;
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
        JUMPOUT(0x243320018);
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
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

uint64_t sub_243320040(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_24332004C(unsigned char *result, char a2)
{
  *uint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for DockKitError()
{
  return &type metadata for DockKitError;
}

uint64_t sub_243320064()
{
  return type metadata accessor for DockAccessoryManager(0);
}

uint64_t type metadata accessor for DockAccessoryManager(uint64_t a1)
{
  return sub_24332008C(a1, (uint64_t *)&unk_268D93358);
}

uint64_t sub_24332008C(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_2433200C4()
{
  uint64_t result = sub_24334A5B0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t method lookup function for DockAccessoryManager(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DockAccessoryManager);
}

uint64_t dispatch thunk of DockAccessoryManager.isSystemTrackingEnabled.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 216))();
}

uint64_t dispatch thunk of DockAccessoryManager.accessoryStateChanges.getter()
{
  return (*(uint64_t (**)(void))(*(void *)v0 + 224))();
}

uint64_t dispatch thunk of DockAccessoryManager.setSystemTrackingEnabled(_:)(uint64_t a1)
{
  unsigned int v6 = (uint64_t (*)(uint64_t))(*(void *)(*(void *)v1 + 240) + **(int **)(*(void *)v1 + 240));
  unsigned int v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *unsigned int v4 = v2;
  v4[1] = sub_2433202FC;
  return v6(a1);
}

uint64_t sub_2433202FC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t initializeBufferWithCopyOfBuffer for DockAccessory.MotionState(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

__n128 __swift_memcpy32_16(_OWORD *a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

uint64_t sub_243320430(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 32)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_243320450(uint64_t result, int a2, int a3)
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

void type metadata accessor for Vector3D(uint64_t a1)
{
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_24332049C(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_2433204BC(uint64_t result, int a2, int a3)
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

void type metadata accessor for Position(uint64_t a1)
{
}

void type metadata accessor for DeviceType(uint64_t a1)
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

__n128 __swift_memcpy48_16(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t sub_243320554(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 48)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_243320574(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
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
  *(unsigned char *)(result + 48) = v3;
  return result;
}

void type metadata accessor for simd_float3x3(uint64_t a1)
{
}

uint64_t sub_2433205C0()
{
  return sub_243320650(&qword_268D933A8, type metadata accessor for DeviceType);
}

uint64_t sub_243320608()
{
  return sub_243320650(&qword_268D933B0, type metadata accessor for DeviceType);
}

uint64_t sub_243320650(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_243320698()
{
  return sub_243320650(&qword_268D933B8, type metadata accessor for DeviceType);
}

uint64_t sub_2433206E4()
{
  uint64_t v2 = v0[5];
  uint64_t v3 = v0[6];
  uint64_t v4 = v0[8];
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v5;
  *uint64_t v5 = v1;
  v5[1] = sub_2433232E8;
  int v8 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_268D933E8 + dword_268D933E8);
  unsigned int v6 = (void *)swift_task_alloc();
  v5[2] = v6;
  *unsigned int v6 = v5;
  v6[1] = sub_2433232E8;
  return v8(v2, v3, v4);
}

uint64_t sub_2433207F4(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_268D93400);
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  uint64_t result = sub_24334A8D0();
  __break(1u);
  return result;
}

uint64_t sub_243320900(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v4[8] = a3;
  v4[9] = v3;
  v4[6] = a1;
  v4[7] = a2;
  uint64_t v5 = sub_24334A5B0();
  v4[10] = v5;
  v4[11] = *(void *)(v5 - 8);
  v4[12] = swift_task_alloc();
  v4[13] = swift_task_alloc();
  v4[14] = type metadata accessor for DockAccessory.Identifier(0);
  v4[15] = swift_task_alloc();
  v4[16] = swift_task_alloc();
  v4[17] = swift_task_alloc();
  v4[18] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_243320A2C, 0, 0);
}

uint64_t sub_243320A2C()
{
  uint64_t v54 = v0;
  sub_243349F10();
  uint64_t v1 = sub_243349EE0();
  if (v1 != sub_243349EE0()) {
    goto LABEL_22;
  }
  uint64_t v2 = (uint64_t *)(v0[9] + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_callback);
  uint64_t v3 = *v2;
  v0[19] = *v2;
  v0[20] = v2[1];
  if (!v3) {
    goto LABEL_22;
  }
  uint64_t v4 = (uint64_t *)v0[18];
  swift_retain();
  uint64_t v5 = sub_243349F00();
  uint64_t v7 = v6;
  sub_243349EF0();
  *uint64_t v4 = v5;
  v4[1] = v7;
  uint64_t v8 = sub_24334A150();
  if (v8 == sub_24334A150())
  {
    uint64_t v9 = v0[9];
    uint64_t v10 = OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_manager;
    v0[21] = OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_manager;
    uint64_t v11 = MEMORY[0x24567AC40](v9 + v10);
    v0[22] = v11;
    if (v11)
    {
      unint64_t v12 = (void *)swift_task_alloc();
      v0[23] = v12;
      void *v12 = v0;
      v12[1] = sub_243320FA4;
      return MEMORY[0x270F267F0]();
    }
  }
  (*(void (**)(void, uint64_t, void))(v0[11] + 16))(v0[13], v0[9] + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_logger, v0[10]);
  uint64_t v13 = sub_24334A590();
  os_log_type_t v14 = sub_24334A7D0();
  if (os_log_type_enabled(v13, v14))
  {
    BOOL v15 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)BOOL v15 = 0;
    _os_log_impl(&dword_243318000, v13, v14, "updating previously-emitted accessories tracking button state", v15, 2u);
    MEMORY[0x24567AB80](v15, -1, -1);
  }
  uint64_t v16 = v0[13];
  uint64_t v17 = v0[10];
  uint64_t v18 = v0[11];
  uint64_t v20 = v0[8];
  uint64_t v19 = v0[9];
  uint64_t v21 = v0[6];

  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v16, v17);
  uint64_t v22 = *(os_unfair_lock_s **)(v19 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_weakPublishedAccessoriesLock);
  uint64_t v23 = (void *)swift_task_alloc();
  v23[2] = v19;
  v23[3] = v21;
  v23[4] = v20;
  uint64_t v24 = swift_task_alloc();
  *(void *)(v24 + 16) = sub_24332282C;
  *(void *)(v24 + 24) = v23;
  swift_retain();
  os_unfair_lock_lock(v22 + 4);
  sub_2433232EC();
  os_unfair_lock_unlock(v22 + 4);
  uint64_t v25 = v0[9];
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v26 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v27 = (void **)(v25 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_weakPublishedAccessories);
  swift_beginAccess();
  uint64_t v28 = *v27;
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v27 = v28;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v28 = sub_24331F940(0, v28[2] + 1, 1, v28);
    *uint64_t v27 = v28;
  }
  unint64_t v30 = v28[2];
  unint64_t v31 = v28[3];
  unint64_t v32 = v30 + 1;
  if (v30 >= v31 >> 1)
  {
    uint64_t v49 = v28;
    unint64_t v50 = v28[2];
    v51 = sub_24331F940((void *)(v31 > 1), v30 + 1, 1, v49);
    unint64_t v30 = v50;
    uint64_t v28 = v51;
    *uint64_t v27 = v51;
  }
  uint64_t v34 = v0[17];
  uint64_t v33 = v0[18];
  uint64_t v35 = v0[9];
  v28[2] = v32;
  v36 = &v28[2 * v30];
  v36[4] = sub_243322884;
  v36[5] = v26;
  swift_endAccess();
  swift_release();
  uint64_t v37 = OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_dkAccessory;
  uint64_t v38 = *(void *)(v35 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_dkAccessory);
  sub_2433228D0(v33, v34);
  uint64_t v39 = v0[17];
  if (!v38)
  {
    sub_243322934(v0[17]);
    goto LABEL_18;
  }
  uint64_t v40 = v0[16];
  sub_2433228D0(v38 + OBJC_IVAR____TtC7DockKit13DockAccessory_identifier, v40);
  char v41 = sub_243349EA0();
  sub_243322934(v40);
  sub_243322934(v39);
  if ((v41 & 1) == 0)
  {
LABEL_18:
    uint64_t v42 = v0[15];
    sub_2433228D0(v0[18], v42);
    type metadata accessor for DockAccessory(0);
    swift_allocObject();
    *(void *)(v35 + v37) = sub_24332AE2C(v42, 0);
    swift_release();
  }
  uint64_t v43 = *(void *)(v35 + v37);
  uint64_t v44 = (void (*)(uint64_t, char *, BOOL))v0[19];
  uint64_t v45 = v0[18];
  if (v43)
  {
    v53[0] = 0;
    swift_retain();
    uint64_t v46 = sub_24334A330();
    BOOL v47 = v46 == sub_24334A330();
    v44(v43, v53, v47);
    sub_243322990((uint64_t)v44);
    swift_release();
    sub_243322934(v45);
  }
  else
  {
    sub_243322934(v0[18]);
    sub_243322990((uint64_t)v44);
  }
LABEL_22:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v48 = (uint64_t (*)(void))v0[1];
  return v48();
}

uint64_t sub_243320FA4(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 192) = a1;
  *(void *)(v3 + 200) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_243321C44;
  }
  else
  {

    uint64_t v4 = sub_2433210C0;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_2433210C0()
{
  uint64_t v52 = v0;
  uint64_t v1 = (void *)v0[24];
  if (!v1) {
    goto LABEL_10;
  }
  sub_24334A140();
  uint64_t v2 = swift_dynamicCastClass();
  v0[26] = v2;
  if (!v2)
  {

LABEL_10:
    char v50 = 0;
    uint64_t v9 = 0;
    uint64_t v10 = v0[25];
    goto LABEL_11;
  }
  sub_2433229A0();
  id v3 = v1;
  uint64_t v4 = (void *)sub_24334A000();

  char v5 = sub_24334A7F0();
  if ((v5 & 1) == 0)
  {

    goto LABEL_10;
  }
  uint64_t v6 = MEMORY[0x24567AC40](v0[9] + v0[21]);
  v0[27] = v6;
  if (v6)
  {
    id v7 = v3;
    uint64_t v8 = (void *)swift_task_alloc();
    v0[28] = v8;
    *uint64_t v8 = v0;
    v8[1] = sub_243321670;
    return MEMORY[0x270F267E8]();
  }
  uint64_t v10 = v0[25];
  BOOL v47 = (void *)v0[24];
  id v48 = v3;
  sub_24334A130();

  uint64_t v9 = (void *)v0[26];
  char v50 = 1;
LABEL_11:
  (*(void (**)(void, uint64_t, void))(v0[11] + 16))(v0[13], v0[9] + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_logger, v0[10]);
  uint64_t v11 = sub_24334A590();
  os_log_type_t v12 = sub_24334A7D0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_243318000, v11, v12, "updating previously-emitted accessories tracking button state", v13, 2u);
    MEMORY[0x24567AB80](v13, -1, -1);
  }
  uint64_t v14 = v0[13];
  uint64_t v15 = v0[10];
  uint64_t v16 = v0[11];
  uint64_t v18 = v0[8];
  uint64_t v17 = v0[9];
  uint64_t v19 = v0[6];

  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);
  uint64_t v20 = *(os_unfair_lock_s **)(v17 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_weakPublishedAccessoriesLock);
  uint64_t v21 = (void *)swift_task_alloc();
  v21[2] = v17;
  v21[3] = v19;
  v21[4] = v18;
  uint64_t v22 = swift_task_alloc();
  *(void *)(v22 + 16) = sub_24332282C;
  *(void *)(v22 + 24) = v21;
  swift_retain();
  os_unfair_lock_lock(v20 + 4);
  sub_2433232EC();
  os_unfair_lock_unlock(v20 + 4);
  if (v10)
  {
    return swift_task_dealloc();
  }
  uint64_t v23 = v0[9];
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v24 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v25 = (void **)(v23 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_weakPublishedAccessories);
  swift_beginAccess();
  uint64_t v26 = *v25;
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *uint64_t v25 = v26;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v26 = sub_24331F940(0, v26[2] + 1, 1, v26);
    *uint64_t v25 = v26;
  }
  unint64_t v29 = v26[2];
  unint64_t v28 = v26[3];
  if (v29 >= v28 >> 1)
  {
    uint64_t v26 = sub_24331F940((void *)(v28 > 1), v29 + 1, 1, v26);
    *uint64_t v25 = v26;
  }
  uint64_t v31 = v0[17];
  uint64_t v30 = v0[18];
  uint64_t v32 = v0[9];
  v26[2] = v29 + 1;
  uint64_t v33 = &v26[2 * v29];
  v33[4] = sub_243322884;
  v33[5] = v24;
  swift_endAccess();
  swift_release();
  uint64_t v34 = OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_dkAccessory;
  uint64_t v35 = *(void *)(v32 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_dkAccessory);
  sub_2433228D0(v30, v31);
  uint64_t v36 = v0[17];
  if (v35)
  {
    uint64_t v37 = v0[16];
    sub_2433228D0(v35 + OBJC_IVAR____TtC7DockKit13DockAccessory_identifier, v37);
    char v38 = sub_243349EA0();
    sub_243322934(v37);
    sub_243322934(v36);
    if (v38) {
      goto LABEL_26;
    }
  }
  else
  {
    sub_243322934(v0[17]);
  }
  uint64_t v39 = v0[15];
  sub_2433228D0(v0[18], v39);
  type metadata accessor for DockAccessory(0);
  swift_allocObject();
  id v40 = v9;
  *(void *)(v32 + v34) = sub_24332AE2C(v39, (uint64_t)v9);
  swift_release();
LABEL_26:
  uint64_t v41 = *(void *)(v32 + v34);
  uint64_t v42 = (void (*)(uint64_t, char *, BOOL))v0[19];
  uint64_t v43 = v0[18];
  if (v41)
  {
    v51[0] = v50;
    swift_retain();
    uint64_t v44 = sub_24334A330();
    BOOL v45 = v44 == sub_24334A330();
    v42(v41, v51, v45);
    sub_243322990((uint64_t)v42);
    swift_release();
    sub_243322934(v43);
  }
  else
  {
    sub_243322934(v0[18]);
    sub_243322990((uint64_t)v42);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v46 = (uint64_t (*)(void))v0[1];
  return v46();
}

uint64_t sub_243321670(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(*v2 + 232) = v1;
  swift_task_dealloc();
  if (v1)
  {
    char v5 = sub_243322228;
  }
  else
  {

    *(void *)(v4 + 240) = a1;
    char v5 = sub_2433217A0;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_2433217A0()
{
  uint64_t v43 = v0;
  id v1 = *(id *)(v0 + 192);
  sub_24334A330();
  sub_24334A330();
  uint64_t v2 = *(void *)(v0 + 232);
  id v3 = *(void **)(v0 + 192);
  sub_24334A130();

  uint64_t v4 = *(void **)(v0 + 208);
  (*(void (**)(void, uint64_t, void))(*(void *)(v0 + 88) + 16))(*(void *)(v0 + 104), *(void *)(v0 + 72) + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_logger, *(void *)(v0 + 80));
  char v5 = sub_24334A590();
  os_log_type_t v6 = sub_24334A7D0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_243318000, v5, v6, "updating previously-emitted accessories tracking button state", v7, 2u);
    MEMORY[0x24567AB80](v7, -1, -1);
  }
  uint64_t v8 = *(void *)(v0 + 104);
  uint64_t v9 = *(void *)(v0 + 80);
  uint64_t v10 = *(void *)(v0 + 88);
  uint64_t v12 = *(void *)(v0 + 64);
  uint64_t v11 = *(void *)(v0 + 72);
  uint64_t v13 = *(void *)(v0 + 48);

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v8, v9);
  uint64_t v14 = *(os_unfair_lock_s **)(v11 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_weakPublishedAccessoriesLock);
  uint64_t v15 = (void *)swift_task_alloc();
  v15[2] = v11;
  v15[3] = v13;
  v15[4] = v12;
  uint64_t v16 = swift_task_alloc();
  *(void *)(v16 + 16) = sub_24332282C;
  *(void *)(v16 + 24) = v15;
  swift_retain();
  os_unfair_lock_lock(v14 + 4);
  sub_2433232EC();
  os_unfair_lock_unlock(v14 + 4);
  if (v2)
  {
    return swift_task_dealloc();
  }
  uint64_t v18 = *(void *)(v0 + 72);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v19 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v20 = (void **)(v18 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_weakPublishedAccessories);
  swift_beginAccess();
  uint64_t v21 = *v20;
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  os_unfair_lock_s *v20 = v21;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v21 = sub_24331F940(0, v21[2] + 1, 1, v21);
    os_unfair_lock_s *v20 = v21;
  }
  unint64_t v24 = v21[2];
  unint64_t v23 = v21[3];
  if (v24 >= v23 >> 1)
  {
    uint64_t v21 = sub_24331F940((void *)(v23 > 1), v24 + 1, 1, v21);
    os_unfair_lock_s *v20 = v21;
  }
  uint64_t v26 = *(void *)(v0 + 136);
  uint64_t v25 = *(void *)(v0 + 144);
  uint64_t v27 = *(void *)(v0 + 72);
  v21[2] = v24 + 1;
  unint64_t v28 = &v21[2 * v24];
  v28[4] = sub_243322884;
  v28[5] = v19;
  swift_endAccess();
  swift_release();
  uint64_t v29 = OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_dkAccessory;
  uint64_t v30 = *(void *)(v27 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_dkAccessory);
  sub_2433228D0(v25, v26);
  uint64_t v31 = *(void *)(v0 + 136);
  if (v30)
  {
    uint64_t v32 = *(void *)(v0 + 128);
    sub_2433228D0(v30 + OBJC_IVAR____TtC7DockKit13DockAccessory_identifier, v32);
    char v33 = sub_243349EA0();
    sub_243322934(v32);
    sub_243322934(v31);
    if (v33) {
      goto LABEL_16;
    }
  }
  else
  {
    sub_243322934(*(void *)(v0 + 136));
  }
  uint64_t v34 = *(void *)(v0 + 120);
  sub_2433228D0(*(void *)(v0 + 144), v34);
  type metadata accessor for DockAccessory(0);
  swift_allocObject();
  id v35 = v4;
  *(void *)(v27 + v29) = sub_24332AE2C(v34, (uint64_t)v4);
  swift_release();
LABEL_16:
  uint64_t v36 = *(void *)(v27 + v29);
  uint64_t v37 = *(void (**)(uint64_t, char *, BOOL))(v0 + 152);
  uint64_t v38 = *(void *)(v0 + 144);
  if (v36)
  {
    v42[0] = 1;
    swift_retain();
    uint64_t v39 = sub_24334A330();
    BOOL v40 = v39 == sub_24334A330();
    v37(v36, v42, v40);
    sub_243322990((uint64_t)v37);
    swift_release();
    sub_243322934(v38);
  }
  else
  {
    sub_243322934(*(void *)(v0 + 144));
    sub_243322990((uint64_t)v37);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v41 = *(uint64_t (**)(void))(v0 + 8);
  return v41();
}

uint64_t sub_243321C44()
{
  uint64_t v52 = v0;
  id v1 = *(void **)(v0 + 200);
  uint64_t v3 = *(void *)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 96);
  uint64_t v5 = *(void *)(v0 + 72);
  uint64_t v4 = *(void *)(v0 + 80);

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_logger, v4);
  id v6 = v1;
  id v7 = v1;
  uint64_t v8 = sub_24334A590();
  os_log_type_t v9 = sub_24334A7C0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138412290;
    id v12 = v1;
    uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 40) = v13;
    sub_24334A820();
    *uint64_t v11 = v13;

    _os_log_impl(&dword_243318000, v8, v9, "failed fetching connected accessory %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93300);
    swift_arrayDestroy();
    MEMORY[0x24567AB80](v11, -1, -1);
    MEMORY[0x24567AB80](v10, -1, -1);
  }
  else
  {
  }
  (*(void (**)(void, void))(*(void *)(v0 + 88) + 8))(*(void *)(v0 + 96), *(void *)(v0 + 80));
  uint64_t v14 = *(void *)(v0 + 200);
  (*(void (**)(void, uint64_t, void))(*(void *)(v0 + 88) + 16))(*(void *)(v0 + 104), *(void *)(v0 + 72) + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_logger, *(void *)(v0 + 80));
  uint64_t v15 = sub_24334A590();
  os_log_type_t v16 = sub_24334A7D0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_243318000, v15, v16, "updating previously-emitted accessories tracking button state", v17, 2u);
    MEMORY[0x24567AB80](v17, -1, -1);
  }
  uint64_t v18 = *(void *)(v0 + 104);
  uint64_t v19 = *(void *)(v0 + 80);
  uint64_t v20 = *(void *)(v0 + 88);
  uint64_t v22 = *(void *)(v0 + 64);
  uint64_t v21 = *(void *)(v0 + 72);
  uint64_t v23 = *(void *)(v0 + 48);

  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v18, v19);
  unint64_t v24 = *(os_unfair_lock_s **)(v21 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_weakPublishedAccessoriesLock);
  uint64_t v25 = (void *)swift_task_alloc();
  v25[2] = v21;
  v25[3] = v23;
  v25[4] = v22;
  uint64_t v26 = swift_task_alloc();
  *(void *)(v26 + 16) = sub_24332282C;
  *(void *)(v26 + 24) = v25;
  swift_retain();
  os_unfair_lock_lock(v24 + 4);
  sub_2433232EC();
  os_unfair_lock_unlock(v24 + 4);
  uint64_t v27 = *(void *)(v0 + 72);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v28 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v29 = (void **)(v27 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_weakPublishedAccessories);
  swift_beginAccess();
  uint64_t v30 = *v29;
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  char *v29 = v30;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v30 = sub_24331F940(0, v30[2] + 1, 1, v30);
    char *v29 = v30;
  }
  unint64_t v33 = v30[2];
  unint64_t v32 = v30[3];
  if (v33 >= v32 >> 1)
  {
    uint64_t v30 = sub_24331F940((void *)(v32 > 1), v33 + 1, 1, v30);
    char *v29 = v30;
  }
  uint64_t v35 = *(void *)(v0 + 136);
  uint64_t v34 = *(void *)(v0 + 144);
  uint64_t v36 = *(void *)(v0 + 72);
  v30[2] = v33 + 1;
  uint64_t v37 = &v30[2 * v33];
  v37[4] = sub_243322884;
  v37[5] = v28;
  swift_endAccess();
  swift_release();
  uint64_t v38 = OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_dkAccessory;
  uint64_t v39 = *(void *)(v36 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_dkAccessory);
  sub_2433228D0(v34, v35);
  uint64_t v40 = *(void *)(v0 + 136);
  if (!v39)
  {
    sub_243322934(*(void *)(v0 + 136));
    goto LABEL_14;
  }
  uint64_t v41 = *(void *)(v0 + 128);
  sub_2433228D0(v39 + OBJC_IVAR____TtC7DockKit13DockAccessory_identifier, v41);
  char v42 = sub_243349EA0();
  sub_243322934(v41);
  sub_243322934(v40);
  if ((v42 & 1) == 0)
  {
LABEL_14:
    uint64_t v43 = *(void *)(v0 + 120);
    sub_2433228D0(*(void *)(v0 + 144), v43);
    type metadata accessor for DockAccessory(0);
    swift_allocObject();
    *(void *)(v36 + v38) = sub_24332AE2C(v43, 0);
    swift_release();
  }
  uint64_t v44 = *(void *)(v36 + v38);
  BOOL v45 = *(void (**)(uint64_t, BOOL *, BOOL))(v0 + 152);
  uint64_t v46 = *(void *)(v0 + 144);
  if (v44)
  {
    v51[0] = v14 == 0;
    swift_retain();
    uint64_t v47 = sub_24334A330();
    BOOL v48 = v47 == sub_24334A330();
    v45(v44, v51, v48);
    sub_243322990((uint64_t)v45);
    swift_release();
    sub_243322934(v46);
  }
  else
  {
    sub_243322934(*(void *)(v0 + 144));
    sub_243322990((uint64_t)v45);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v49 = *(uint64_t (**)(void))(v0 + 8);
  return v49();
}

uint64_t sub_243322228()
{
  uint64_t v54 = v0;

  id v1 = *(void **)(v0 + 232);
  uint64_t v52 = *(void **)(v0 + 208);
  uint64_t v3 = *(void *)(v0 + 88);
  uint64_t v2 = *(void *)(v0 + 96);
  uint64_t v5 = *(void *)(v0 + 72);
  uint64_t v4 = *(void *)(v0 + 80);

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_logger, v4);
  id v6 = v1;
  id v7 = v1;
  uint64_t v8 = sub_24334A590();
  os_log_type_t v9 = sub_24334A7C0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 138412290;
    id v12 = v1;
    uint64_t v13 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 40) = v13;
    sub_24334A820();
    *uint64_t v11 = v13;

    _os_log_impl(&dword_243318000, v8, v9, "failed fetching connected accessory %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93300);
    swift_arrayDestroy();
    MEMORY[0x24567AB80](v11, -1, -1);
    MEMORY[0x24567AB80](v10, -1, -1);
  }
  else
  {
  }
  (*(void (**)(void, void))(*(void *)(v0 + 88) + 8))(*(void *)(v0 + 96), *(void *)(v0 + 80));
  uint64_t v14 = *(void *)(v0 + 200);
  (*(void (**)(void, uint64_t, void))(*(void *)(v0 + 88) + 16))(*(void *)(v0 + 104), *(void *)(v0 + 72) + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_logger, *(void *)(v0 + 80));
  uint64_t v15 = sub_24334A590();
  os_log_type_t v16 = sub_24334A7D0();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_243318000, v15, v16, "updating previously-emitted accessories tracking button state", v17, 2u);
    MEMORY[0x24567AB80](v17, -1, -1);
  }
  uint64_t v18 = *(void *)(v0 + 104);
  uint64_t v20 = *(void *)(v0 + 80);
  uint64_t v19 = *(void *)(v0 + 88);
  uint64_t v22 = *(void *)(v0 + 64);
  uint64_t v21 = *(void *)(v0 + 72);
  uint64_t v23 = *(void *)(v0 + 48);

  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
  unint64_t v24 = *(os_unfair_lock_s **)(v21 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_weakPublishedAccessoriesLock);
  uint64_t v25 = (void *)swift_task_alloc();
  v25[2] = v21;
  v25[3] = v23;
  v25[4] = v22;
  uint64_t v26 = swift_task_alloc();
  *(void *)(v26 + 16) = sub_24332282C;
  *(void *)(v26 + 24) = v25;
  swift_retain();
  os_unfair_lock_lock(v24 + 4);
  sub_2433232EC();
  os_unfair_lock_unlock(v24 + 4);
  uint64_t v27 = *(void *)(v0 + 72);
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v28 = swift_allocObject();
  swift_unknownObjectWeakInit();
  uint64_t v29 = (void **)(v27 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_weakPublishedAccessories);
  swift_beginAccess();
  uint64_t v30 = *v29;
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  char *v29 = v30;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v30 = sub_24331F940(0, v30[2] + 1, 1, v30);
    char *v29 = v30;
  }
  unint64_t v33 = v30[2];
  unint64_t v32 = v30[3];
  if (v33 >= v32 >> 1)
  {
    uint64_t v30 = sub_24331F940((void *)(v32 > 1), v33 + 1, 1, v30);
    char *v29 = v30;
  }
  uint64_t v35 = *(void *)(v0 + 136);
  uint64_t v34 = *(void *)(v0 + 144);
  uint64_t v36 = *(void *)(v0 + 72);
  v30[2] = v33 + 1;
  uint64_t v37 = &v30[2 * v33];
  v37[4] = sub_243322884;
  v37[5] = v28;
  swift_endAccess();
  swift_release();
  uint64_t v38 = OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_dkAccessory;
  uint64_t v39 = *(void *)(v36 + OBJC_IVAR____TtC7DockKit26DockAccessoryManagerHelper_dkAccessory);
  sub_2433228D0(v34, v35);
  uint64_t v40 = *(void *)(v0 + 136);
  if (!v39)
  {
    sub_243322934(*(void *)(v0 + 136));
    goto LABEL_14;
  }
  uint64_t v41 = *(void *)(v0 + 128);
  sub_2433228D0(v39 + OBJC_IVAR____TtC7DockKit13DockAccessory_identifier, v41);
  char v42 = sub_243349EA0();
  sub_243322934(v41);
  sub_243322934(v40);
  if ((v42 & 1) == 0)
  {
LABEL_14:
    uint64_t v43 = *(void *)(v0 + 120);
    sub_2433228D0(*(void *)(v0 + 144), v43);
    type metadata accessor for DockAccessory(0);
    swift_allocObject();
    id v44 = v52;
    *(void *)(v36 + v38) = sub_24332AE2C(v43, (uint64_t)v52);
    swift_release();
  }
  uint64_t v45 = *(void *)(v36 + v38);
  uint64_t v46 = *(void (**)(uint64_t, BOOL *, BOOL))(v0 + 152);
  uint64_t v47 = *(void *)(v0 + 144);
  if (v45)
  {
    v53[0] = v14 == 0;
    swift_retain();
    uint64_t v48 = sub_24334A330();
    BOOL v49 = v48 == sub_24334A330();
    v46(v45, v53, v49);
    sub_243322990((uint64_t)v46);
    swift_release();
    sub_243322934(v47);
  }
  else
  {
    sub_243322934(*(void *)(v0 + 144));
    sub_243322990((uint64_t)v46);
  }

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  char v50 = *(uint64_t (**)(void))(v0 + 8);
  return v50();
}

uint64_t sub_24332282C()
{
  return sub_24331ABC0(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_24332284C()
{
  swift_unknownObjectWeakDestroy();

  return MEMORY[0x270FA0238](v0, 24, 7);
}

uint64_t sub_243322884@<X0>(uint64_t *a1@<X8>)
{
  swift_beginAccess();
  uint64_t result = MEMORY[0x24567AC40](v1 + 16);
  *a1 = result;
  return result;
}

uint64_t sub_2433228D0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DockAccessory.Identifier(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_243322934(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for DockAccessory.Identifier(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_243322990(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

unint64_t sub_2433229A0()
{
  unint64_t result = qword_268D933F0;
  if (!qword_268D933F0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268D933F0);
  }
  return result;
}

uint64_t sub_2433229E4()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_243322A24(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  id v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *id v7 = v2;
  v7[1] = sub_2433232E8;
  return sub_24331B36C(a1, v4, v5, v6);
}

uint64_t sub_243322AD8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_243322B10(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2433232E8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268D93A50 + dword_268D93A50);
  return v6(a1, v4);
}

uint64_t objectdestroyTm()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_243322C14(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = *(void *)(type metadata accessor for DockAccessory.TrackedSubjectType(0) - 8);
    uint64_t v9 = a4 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
    uint64_t v10 = *(void *)(v8 + 72);
    unint64_t v11 = v9 + v10 * a1;
    unint64_t v12 = a3 + v10 * v4;
    if (v11 >= v12 || v11 + v10 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v12;
    }
  }
  uint64_t result = sub_24334A8D0();
  __break(1u);
  return result;
}

uint64_t sub_243322D6C()
{
  return sub_24331A70C(*(void *)(v0 + 16));
}

uint64_t sub_243322D88(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93430);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_243322DF0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93430);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_243322E58(uint64_t a1, uint64_t *a2)
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

uint64_t sub_243322F50()
{
  return sub_243349F90();
}

uint64_t sub_243322F74()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93450);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_24332304C(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268D93450) - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_2433202FC;
  return sub_24331E5A4(a1, v5, v6, v7, v8);
}

uint64_t sub_24332314C()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93450);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return MEMORY[0x270FA0238](v0, v5, v6);
}

uint64_t sub_2433231E0(uint64_t a1, unsigned char *a2, char a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D93450);

  return sub_24331EC08(a1, a2, a3);
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
}

void type metadata accessor for CGPoint(uint64_t a1)
{
}

void sub_243323294(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_2433232EC()
{
  return sub_24331FD2C();
}

uint64_t sub_243323308(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24334A730();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24334A720();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_243322E58(a1, &qword_268D933D0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24334A710();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_2433234B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_24334A730();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_24334A720();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_243322E58(a1, &qword_268D933D0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_24334A710();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D93A10);
  return swift_task_create();
}

id sub_243323668()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_feedbackCallback];
  *(void *)uint64_t v1 = 0;
  *((void *)v1 + 1) = 0;
  uint64_t v2 = &v0[OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_eventCallback];
  *(void *)uint64_t v2 = 0;
  *((void *)v2 + 1) = 0;
  uint64_t v3 = &v0[OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_batteryCallback];
  *(void *)uint64_t v3 = 0;
  *((void *)v3 + 1) = 0;
  uint64_t v4 = &v0[OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_trackingSummaryCallback];
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0;
  swift_unknownObjectWeakInit();
  sub_24334A5A0();
  v6.receiver = v0;
  v6.super_class = (Class)type metadata accessor for DockAccessoryHelper(0);
  return objc_msgSendSuper2(&v6, sel_init);
}

uint64_t sub_243323758(uint64_t a1, double a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  *(double *)(v8 + 56) = a2;
  *(void *)(v8 + 40) = a7;
  *(void *)(v8 + 48) = a8;
  *(void *)(v8 + 24) = a5;
  *(void *)(v8 + 32) = a6;
  *(void *)(v8 + 16) = a1;
  return MEMORY[0x270FA2498](sub_243323784, 0, 0);
}

uint64_t sub_243323784()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t, uint64_t, void, void, double))(*(void *)(v0 + 24)
                                                                                + OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_feedbackCallback);
  if (v1)
  {
    double v2 = *(double *)(v0 + 56);
    uint64_t v4 = *(void *)(v0 + 40);
    uint64_t v3 = *(void *)(v0 + 48);
    uint64_t v5 = *(void *)(v0 + 32);
    swift_retain();
    v1(v5, v4, v3, 0, 0, v2);
    sub_243322990((uint64_t)v1);
  }
  **(unsigned char **)(v0 + 16) = v1 == 0;
  objc_super v6 = *(uint64_t (**)(void))(v0 + 8);
  return v6();
}

void sub_24332393C(uint64_t a1, void *a2)
{
}

uint64_t sub_24332395C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[3] = a4;
  v5[4] = a5;
  v5[2] = a1;
  return MEMORY[0x270FA2498](sub_243323980, 0, 0);
}

uint64_t sub_243323980()
{
  uint64_t v1 = *(void (**)(uint64_t, void, void))(*(void *)(v0 + 24)
                                                      + OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_eventCallback);
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 32);
    swift_retain();
    v1(v2, 0, 0);
    sub_243322990((uint64_t)v1);
  }
  **(unsigned char **)(v0 + 16) = v1 == 0;
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

void sub_243323AB8(uint64_t a1, void *a2)
{
}

void sub_243323AD8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  objc_super v6 = v4;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D933D0);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v20 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = &v4[OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_trackingStand];
  unint64_t v12 = (void *)MEMORY[0x24567AC40](v11);

  if (v12)
  {
    uint64_t v13 = MEMORY[0x24567AC40](v11);
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      uint64_t v15 = (void *)sub_24334A000();

      sub_243349F20();
      LOBYTE(v14) = sub_24334A7F0();

      if (v14)
      {
        uint64_t v16 = sub_24334A730();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v10, 1, 1, v16);
        uint64_t v17 = (void *)swift_allocObject();
        v17[2] = 0;
        v17[3] = 0;
        v17[4] = v6;
        v17[5] = a2;
        id v18 = v6;
        id v19 = a2;
        sub_2433234B4((uint64_t)v10, a4, (uint64_t)v17);
        swift_release();
      }
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_243323C48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[3] = a4;
  v5[4] = a5;
  v5[2] = a1;
  return MEMORY[0x270FA2498](sub_243323C6C, 0, 0);
}

uint64_t sub_243323C6C()
{
  uint64_t v1 = *(void (**)(uint64_t, void, void))(*(void *)(v0 + 24)
                                                      + OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_batteryCallback);
  if (v1)
  {
    uint64_t v2 = *(void *)(v0 + 32);
    swift_retain();
    v1(v2, 0, 0);
    sub_243322990((uint64_t)v1);
  }
  **(unsigned char **)(v0 + 16) = v1 == 0;
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

void sub_243323DA4()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D933D0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = &v0[OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_trackingStand];
  objc_super v6 = (void *)MEMORY[0x24567AC40](v5);

  if (v6)
  {
    uint64_t v7 = MEMORY[0x24567AC40](v5);
    if (v7)
    {
      uint64_t v8 = (void *)v7;
      uint64_t v9 = (void *)sub_24334A000();

      sub_243349F20();
      LOBYTE(v8) = sub_24334A7F0();

      if (v8)
      {
        uint64_t v10 = sub_243349E20();
        uint64_t v12 = v11;
        uint64_t v13 = sub_24334A730();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v4, 1, 1, v13);
        uint64_t v14 = (void *)swift_allocObject();
        v14[2] = 0;
        v14[3] = 0;
        v14[4] = v1;
        v14[5] = v10;
        v14[6] = v12;
        id v15 = v1;
        sub_2433234B4((uint64_t)v4, (uint64_t)&unk_268D939F8, (uint64_t)v14);
        swift_release();
      }
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_243323F28(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[4] = a5;
  v6[5] = a6;
  v6[2] = a1;
  v6[3] = a4;
  return MEMORY[0x270FA2498](sub_243323F4C, 0, 0);
}

uint64_t sub_243323F4C()
{
  uint64_t v1 = *(void (**)(uint64_t, uint64_t, void, void))(*(void *)(v0 + 24)
                                                               + OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_trackingSummaryCallback);
  if (v1)
  {
    uint64_t v3 = *(void *)(v0 + 32);
    uint64_t v2 = *(void *)(v0 + 40);
    swift_retain();
    v1(v3, v2, 0, 0);
    sub_243322990((uint64_t)v1);
  }
  **(unsigned char **)(v0 + 16) = v1 == 0;
  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_24332411C(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_24334A5B0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2 + OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_logger, v4);
  uint64_t v8 = sub_24334A590();
  os_log_type_t v9 = sub_24334A7D0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_243318000, v8, v9, "accessory disconnected, sending error to delegate", v10, 2u);
    MEMORY[0x24567AB80](v10, -1, -1);
  }

  uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v12 = *(void (**)(void, void, void, uint64_t, uint64_t, double))(v2
                                                                                + OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_feedbackCallback);
  if (v12)
  {
    swift_retain();
    v12(MEMORY[0x263F8EE78], MEMORY[0x263F8EE78], MEMORY[0x263F8EE78], a1, 1, 0.0);
    uint64_t result = sub_243322990((uint64_t)v12);
  }
  uint64_t v13 = *(void (**)(void, uint64_t, uint64_t))(v2
                                                        + OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_eventCallback);
  if (v13)
  {
    swift_retain();
    v13(0, a1, 1);
    return sub_243322990((uint64_t)v13);
  }
  return result;
}

id sub_243324368()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DockAccessoryHelper(0);
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t DockAccessory.identifier.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2433417A4(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory_identifier, a1, type metadata accessor for DockAccessory.Identifier);
}

uint64_t type metadata accessor for DockAccessory.Identifier(uint64_t a1)
{
  return sub_24332008C(a1, (uint64_t *)&unk_268D93810);
}

unint64_t DockAccessory.debugDescription.getter()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for DockAccessory.Identifier(0);
  MEMORY[0x270FA5388](v2);
  sub_2433417A4(v0 + OBJC_IVAR____TtC7DockKit13DockAccessory_identifier, (uint64_t)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), type metadata accessor for DockAccessory.Identifier);
  sub_24334A610();
  unint64_t v17 = 0xD000000000000011;
  unint64_t v18 = 0x800000024334CF50;
  sub_24334A660();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24334A660();
  swift_bridgeObjectRelease();
  unint64_t v5 = v17;
  unint64_t v4 = v18;
  uint64_t v6 = (unint64_t *)(v0 + OBJC_IVAR____TtC7DockKit13DockAccessory_firmwareVersion);
  swift_beginAccess();
  unint64_t v7 = v6[1];
  unint64_t v15 = *v6;
  unint64_t v16 = v7;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D93480);
  sub_24334A610();
  unint64_t v15 = v5;
  unint64_t v16 = v4;
  swift_bridgeObjectRetain();
  sub_24334A660();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24334A660();
  swift_bridgeObjectRelease();
  unint64_t v8 = v15;
  unint64_t v9 = v16;
  uint64_t v10 = (uint64_t *)(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory_hardwareModel);
  swift_beginAccess();
  unint64_t v11 = v10[1];
  unint64_t v13 = *v10;
  unint64_t v14 = v11;
  swift_bridgeObjectRetain();
  sub_24334A610();
  unint64_t v13 = v8;
  unint64_t v14 = v9;
  swift_bridgeObjectRetain();
  sub_24334A660();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24334A660();
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t DockAccessory.firmwareVersion.getter()
{
  return sub_243324750(&OBJC_IVAR____TtC7DockKit13DockAccessory_firmwareVersion);
}

uint64_t DockAccessory.hardwareModel.getter()
{
  return sub_243324750(&OBJC_IVAR____TtC7DockKit13DockAccessory_hardwareModel);
}

uint64_t sub_243324750(void *a1)
{
  uint64_t v2 = (uint64_t *)(v1 + *a1);
  swift_beginAccess();
  uint64_t v3 = *v2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t DockAccessory.Identifier.name.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t DockAccessory.Identifier.uuid.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for DockAccessory.Identifier(0) + 24);
  uint64_t v4 = sub_243349EB0();
  unint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

uint64_t DockAccessory.Identifier.debugDescription.getter()
{
  uint64_t v1 = sub_24334A620();
  swift_bridgeObjectRetain();
  sub_24334A660();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24334A660();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  sub_24334A660();
  swift_bridgeObjectRelease();
  type metadata accessor for DockAccessory.Identifier(0);
  sub_243349E90();
  swift_bridgeObjectRetain();
  sub_24334A660();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1;
}

uint64_t static DockAccessory.Identifier.== infix(_:_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for DockAccessory.Identifier(0);
  uint64_t v5 = MEMORY[0x270FA5388](v4);
  unint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v5);
  unint64_t v9 = (char *)&v11 - v8;
  sub_2433417A4(a1, (uint64_t)&v11 - v8, type metadata accessor for DockAccessory.Identifier);
  sub_2433417A4(a2, (uint64_t)v7, type metadata accessor for DockAccessory.Identifier);
  LOBYTE(a2) = sub_243349EA0();
  sub_243342124((uint64_t)v7, type metadata accessor for DockAccessory.Identifier);
  sub_243342124((uint64_t)v9, type metadata accessor for DockAccessory.Identifier);
  return a2 & 1;
}

uint64_t static DockAccessory.Category.== infix(_:_:)()
{
  return 1;
}

uint64_t DockAccessory.Identifier.hash(into:)()
{
  return sub_24334A5C0();
}

uint64_t DockAccessory.Identifier.hashValue.getter()
{
  return sub_24334A9D0();
}

uint64_t sub_243324BC4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = MEMORY[0x270FA5388](a1);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = MEMORY[0x270FA5388](v3);
  uint64_t v8 = (char *)&v11 - v7;
  sub_2433417A4(v6, (uint64_t)&v11 - v7, type metadata accessor for DockAccessory.Identifier);
  sub_2433417A4(a2, (uint64_t)v5, type metadata accessor for DockAccessory.Identifier);
  char v9 = sub_243349EA0();
  sub_243342124((uint64_t)v5, type metadata accessor for DockAccessory.Identifier);
  sub_243342124((uint64_t)v8, type metadata accessor for DockAccessory.Identifier);
  return v9 & 1;
}

uint64_t sub_243324CCC()
{
  return sub_24334A9D0();
}

uint64_t sub_243324D78()
{
  return sub_24334A5C0();
}

uint64_t sub_243324E0C()
{
  return sub_24334A9D0();
}

id DockAccessory.CameraInformation.captureDevice.getter()
{
  return *v0;
}

uint64_t DockAccessory.CameraInformation.cameraPosition.getter()
{
  return *(void *)(v0 + 8);
}

void DockAccessory.CameraInformation.orientation.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 16);
}

__n128 DockAccessory.CameraInformation.cameraIntrinsics.getter@<Q0>(uint64_t a1@<X8>)
{
  char v2 = *(unsigned char *)(v1 + 80);
  long long v3 = *(_OWORD *)(v1 + 48);
  *(_OWORD *)a1 = *(_OWORD *)(v1 + 32);
  *(_OWORD *)(a1 + 16) = v3;
  __n128 result = *(__n128 *)(v1 + 64);
  *(__n128 *)(a1 + 32) = result;
  *(unsigned char *)(a1 + 48) = v2;
  return result;
}

uint64_t DockAccessory.CameraInformation.referenceDimensions.getter()
{
  return *(void *)(v0 + 88);
}

double DockAccessory.CameraInformation.init(captureDevice:cameraPosition:orientation:cameraIntrinsics:referenceDimensions:)@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char a7@<W6>, uint64_t a8@<X8>)
{
  sub_243342540(a4, (uint64_t)v19, &qword_268D93490);
  char v15 = v21;
  char v16 = *a3;
  *(void *)a8 = a1;
  *(void *)(a8 + 8) = a2;
  *(unsigned char *)(a8 + 16) = v16;
  long long v17 = v19[1];
  *(_OWORD *)(a8 + 32) = v19[0];
  *(_OWORD *)(a8 + 48) = v17;
  double result = *(double *)&v20;
  *(_OWORD *)(a8 + 64) = v20;
  *(unsigned char *)(a8 + 80) = v15;
  *(void *)(a8 + 88) = a5;
  *(void *)(a8 + 96) = a6;
  *(unsigned char *)(a8 + 104) = a7 & 1;
  return result;
}

uint64_t DockAccessory.State.debugDescription.getter()
{
  if (*v0) {
    return 0x64656B636F44;
  }
  else {
    return 0x64656B636F646E55;
  }
}

BOOL static DockAccessory.State.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t DockAccessory.State.hash(into:)()
{
  return sub_24334A9A0();
}

uint64_t DockAccessory.State.hashValue.getter()
{
  return sub_24334A9D0();
}

BOOL sub_243325064(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t DockAccessory.Category.debugDescription.getter()
{
  return 0x676E696B63617254;
}

uint64_t DockAccessory.Category.hash(into:)()
{
  return sub_24334A9A0();
}

uint64_t sub_2433250CC()
{
  return 1;
}

uint64_t sub_2433250D8()
{
  return sub_24334A9A0();
}

uint64_t sub_243325108@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_243341FC4(a1, a2);
  *a3 = result & 1;
  return result;
}

uint64_t sub_243325134()
{
  return 0;
}

void sub_243325140(unsigned char *a1@<X8>)
{
  *a1 = 1;
}

uint64_t sub_24332514C(uint64_t a1)
{
  unint64_t v2 = sub_2433259B4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_243325188(uint64_t a1)
{
  unint64_t v2 = sub_2433259B4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_2433251C4()
{
  return 0;
}

uint64_t sub_2433251D0(uint64_t a1)
{
  unint64_t v2 = sub_243325A08();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_24332520C(uint64_t a1)
{
  unint64_t v2 = sub_243325A08();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DockAccessory.Category.encode(to:)(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93498);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D934A0);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  char v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2433259B4();
  sub_24334A9F0();
  sub_243325A08();
  sub_24334A920();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t DockAccessory.Category.hashValue.getter()
{
  return sub_24334A9D0();
}

uint64_t DockAccessory.Category.init(from:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D934B8);
  uint64_t v16 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D934C0);
  uint64_t v6 = *(void *)(v17 - 8);
  MEMORY[0x270FA5388](v17);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2433259B4();
  sub_24334A9E0();
  if (!v1)
  {
    uint64_t v9 = v16;
    uint64_t v15 = v6;
    if (*(void *)(sub_24334A910() + 16) == 1)
    {
      sub_243325A08();
      sub_24334A8F0();
      uint64_t v10 = v15;
      (*(void (**)(char *, uint64_t))(v9 + 8))(v5, v3);
    }
    else
    {
      uint64_t v11 = sub_24334A870();
      swift_allocError();
      unint64_t v13 = v12;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268D934C8);
      *unint64_t v13 = &type metadata for DockAccessory.Category;
      sub_24334A900();
      sub_24334A860();
      (*(void (**)(void *, void, uint64_t))(*(void *)(v11 - 8) + 104))(v13, *MEMORY[0x263F8DCB0], v11);
      swift_willThrow();
      uint64_t v10 = v15;
    }
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v8, v17);
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t sub_243325744(void *a1)
{
  return DockAccessory.Category.init(from:)(a1);
}

uint64_t sub_24332575C(void *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93498);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D934A0);
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_2433259B4();
  sub_24334A9F0();
  sub_243325A08();
  sub_24334A920();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

uint64_t sub_24332592C()
{
  return sub_24334A9D0();
}

void *__swift_project_boxed_opaque_existential_1(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_2433259B4()
{
  unint64_t result = qword_268D934A8;
  if (!qword_268D934A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D934A8);
  }
  return result;
}

unint64_t sub_243325A08()
{
  unint64_t result = qword_268D934B0;
  if (!qword_268D934B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D934B0);
  }
  return result;
}

uint64_t sub_243325A5C()
{
  return sub_24334A9D0();
}

uint64_t sub_243325A9C()
{
  return DockAccessory.Category.debugDescription.getter();
}

void DockAccessory.Observation.type.getter(unsigned char *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t DockAccessory.Observation.identifier.getter()
{
  return *(void *)(v0 + 8);
}

double DockAccessory.Observation.rect.getter()
{
  return *(double *)(v0 + 16);
}

uint64_t DockAccessory.Observation.faceYawAngle.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + *(int *)(type metadata accessor for DockAccessory.Observation(0) + 28);

  return sub_243325B3C(v3, a1);
}

uint64_t type metadata accessor for DockAccessory.Observation(uint64_t a1)
{
  return sub_24332008C(a1, (uint64_t *)&unk_268D93828);
}

uint64_t sub_243325B3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D934D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t DockAccessory.Observation.init(identifier:type:rect:faceYawAngle:)@<X0>(uint64_t a1@<X0>, char *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>, double a8@<D3>)
{
  char v10 = *a2;
  *(void *)(a4 + 8) = a1;
  *(unsigned char *)a4 = v10;
  *(double *)(a4 + 16) = a5;
  *(double *)(a4 + 24) = a6;
  *(double *)(a4 + 32) = a7;
  *(double *)(a4 + 40) = a8;
  uint64_t v11 = type metadata accessor for DockAccessory.Observation(0);
  return sub_243342540(a3, a4 + *(int *)(v11 + 28), &qword_268D934D0);
}

uint64_t DockAccessory.StateChange.accessory.getter()
{
  return swift_retain();
}

void DockAccessory.StateChange.state.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 8);
}

uint64_t DockAccessory.StateChange.trackingButtonEnabled.getter()
{
  return *(unsigned __int8 *)(v0 + 9);
}

uint64_t DockAccessory.StateChanges.Iterator.next()(uint64_t a1)
{
  type metadata accessor for DockAccessory.StateChanges.Iterator(0);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D934E0);
  *uint64_t v3 = v1;
  v3[1] = sub_2433232E8;
  return MEMORY[0x270FA1F70](a1, v4);
}

uint64_t type metadata accessor for DockAccessory.StateChanges.Iterator(uint64_t a1)
{
  return sub_24332008C(a1, (uint64_t *)&unk_268D93858);
}

uint64_t sub_243325CFC(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D934E0);
  *uint64_t v3 = v1;
  v3[1] = sub_243349D9C;
  return MEMORY[0x270FA1F70](a1, v4);
}

uint64_t sub_243325DB8(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D934E0);
  *uint64_t v3 = v1;
  v3[1] = sub_243349D9C;
  return MEMORY[0x270FA1F70](a1, v4);
}

uint64_t DockAccessory.StateChanges.makeAsyncIterator()@<X0>(char *a1@<X8>)
{
  return sub_2433263B0(&qword_268D934E0, &qword_268D934E8, type metadata accessor for DockAccessory.StateChanges.Iterator, a1);
}

uint64_t sub_243325E9C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v17 = a1;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D934E0);
  uint64_t v3 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DockAccessory.StateChanges.Iterator(0);
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D934E8);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  unint64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v14(v13, v2, v10);
  v14(v9, (uint64_t)v13, v10);
  sub_24334A770();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(&v9[*(int *)(v7 + 28)], v5, v16);
  sub_243342184((uint64_t)v9, v17, type metadata accessor for DockAccessory.StateChanges.Iterator);
  return sub_243342124(v2, type metadata accessor for DockAccessory.StateChanges);
}

double DockAccessory.MotionState.angularVelocities.getter()
{
  return *(double *)v0;
}

double DockAccessory.MotionState.angularPositions.getter()
{
  return *(double *)(v0 + 32);
}

double DockAccessory.MotionState.timestamp.getter()
{
  return *(double *)(v0 + 64);
}

void *DockAccessory.MotionState.error.getter()
{
  uint64_t v1 = *(void **)(v0 + 72);
  id v2 = v1;
  return v1;
}

uint64_t DockAccessory.MotionStates.Iterator.next()(uint64_t a1)
{
  type metadata accessor for DockAccessory.MotionStates.Iterator(0);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D934F8);
  *uint64_t v3 = v1;
  v3[1] = sub_2433232E8;
  return MEMORY[0x270FA1F70](a1, v4);
}

uint64_t type metadata accessor for DockAccessory.MotionStates.Iterator(uint64_t a1)
{
  return sub_24332008C(a1, (uint64_t *)&unk_268D93888);
}

uint64_t sub_243326210(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D934F8);
  *uint64_t v3 = v1;
  v3[1] = sub_243349D9C;
  return MEMORY[0x270FA1F70](a1, v4);
}

uint64_t sub_2433262CC(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D934F8);
  *uint64_t v3 = v1;
  v3[1] = sub_243349D9C;
  return MEMORY[0x270FA1F70](a1, v4);
}

uint64_t DockAccessory.MotionStates.makeAsyncIterator()@<X0>(char *a1@<X8>)
{
  return sub_2433263B0(&qword_268D934F8, &qword_268D93500, type metadata accessor for DockAccessory.MotionStates.Iterator, a1);
}

uint64_t sub_2433263B0@<X0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, uint64_t (*a3)(void)@<X2>, char *a4@<X8>)
{
  id v19 = a3;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(a2);
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  unint64_t v14 = (char *)&v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v15(v14, v4, v11);
  v15(a4, (uint64_t)v14, v11);
  sub_24334A770();
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  uint64_t v16 = v19(0);
  return (*(uint64_t (**)(char *, char *, uint64_t))(v8 + 32))(&a4[*(int *)(v16 + 20)], v10, v7);
}

uint64_t sub_24332657C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v17 = a1;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D934F8);
  uint64_t v3 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DockAccessory.MotionStates.Iterator(0);
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93500);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v14(v13, v2, v10);
  v14(v9, (uint64_t)v13, v10);
  sub_24334A770();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(&v9[*(int *)(v7 + 28)], v5, v16);
  sub_243342184((uint64_t)v9, v17, type metadata accessor for DockAccessory.MotionStates.Iterator);
  return sub_243342124(v2, type metadata accessor for DockAccessory.MotionStates);
}

uint64_t DockAccessory.TrackedPerson.identifier.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_243326CF0(MEMORY[0x263F07508], a1);
}

uint64_t DockAccessory.TrackedPerson.identifier.setter(uint64_t a1)
{
  return sub_243326D78(a1, MEMORY[0x263F07508]);
}

uint64_t (*DockAccessory.TrackedPerson.identifier.modify())()
{
  return nullsub_1;
}

double DockAccessory.TrackedPerson.rect.getter()
{
  return sub_243326AF4(type metadata accessor for DockAccessory.TrackedPerson);
}

uint64_t DockAccessory.TrackedPerson.rect.setter(double a1, double a2, double a3, double a4)
{
  return sub_243326B40(type metadata accessor for DockAccessory.TrackedPerson, a1, a2, a3, a4);
}

uint64_t (*DockAccessory.TrackedPerson.rect.modify())()
{
  return nullsub_1;
}

uint64_t DockAccessory.TrackedPerson.saliencyRank.getter()
{
  return sub_243326BF4(type metadata accessor for DockAccessory.TrackedPerson);
}

uint64_t DockAccessory.TrackedPerson.saliencyRank.setter(uint64_t a1, char a2)
{
  return sub_243326C40(a1, a2, type metadata accessor for DockAccessory.TrackedPerson);
}

uint64_t (*DockAccessory.TrackedPerson.saliencyRank.modify())()
{
  return nullsub_1;
}

uint64_t DockAccessory.TrackedPerson.speakingConfidence.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for DockAccessory.TrackedPerson(0) + 28));
}

uint64_t DockAccessory.TrackedPerson.speakingConfidence.setter(uint64_t a1, char a2)
{
  uint64_t result = type metadata accessor for DockAccessory.TrackedPerson(0);
  uint64_t v6 = v2 + *(int *)(result + 28);
  *(void *)uint64_t v6 = a1;
  *(unsigned char *)(v6 + 8) = a2 & 1;
  return result;
}

uint64_t (*DockAccessory.TrackedPerson.speakingConfidence.modify())()
{
  return nullsub_1;
}

uint64_t DockAccessory.TrackedPerson.lookingAtCameraConfidence.getter()
{
  return *(void *)(v0 + *(int *)(type metadata accessor for DockAccessory.TrackedPerson(0) + 32));
}

uint64_t DockAccessory.TrackedPerson.lookingAtCameraConfidence.setter(uint64_t a1, char a2)
{
  uint64_t result = type metadata accessor for DockAccessory.TrackedPerson(0);
  uint64_t v6 = v2 + *(int *)(result + 32);
  *(void *)uint64_t v6 = a1;
  *(unsigned char *)(v6 + 8) = a2 & 1;
  return result;
}

uint64_t (*DockAccessory.TrackedPerson.lookingAtCameraConfidence.modify())()
{
  return nullsub_1;
}

uint64_t DockAccessory.TrackedObject.identifier.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_243326CF0(MEMORY[0x263F07508], a1);
}

uint64_t DockAccessory.TrackedObject.identifier.setter(uint64_t a1)
{
  return sub_243326D78(a1, MEMORY[0x263F07508]);
}

uint64_t (*DockAccessory.TrackedObject.identifier.modify())()
{
  return nullsub_1;
}

double DockAccessory.TrackedObject.rect.getter()
{
  return sub_243326AF4(type metadata accessor for DockAccessory.TrackedObject);
}

double sub_243326AF4(uint64_t (*a1)(void))
{
  return *(double *)(v1 + *(int *)(a1(0) + 20));
}

uint64_t DockAccessory.TrackedObject.rect.setter(double a1, double a2, double a3, double a4)
{
  return sub_243326B40(type metadata accessor for DockAccessory.TrackedObject, a1, a2, a3, a4);
}

uint64_t sub_243326B40(uint64_t (*a1)(void), double a2, double a3, double a4, double a5)
{
  uint64_t result = a1(0);
  uint64_t v11 = (double *)(v5 + *(int *)(result + 20));
  *uint64_t v11 = a2;
  v11[1] = a3;
  v11[2] = a4;
  v11[3] = a5;
  return result;
}

uint64_t (*DockAccessory.TrackedObject.rect.modify())()
{
  return nullsub_1;
}

uint64_t DockAccessory.TrackedObject.saliencyRank.getter()
{
  return sub_243326BF4(type metadata accessor for DockAccessory.TrackedObject);
}

uint64_t sub_243326BF4(uint64_t (*a1)(void))
{
  return *(void *)(v1 + *(int *)(a1(0) + 24));
}

uint64_t DockAccessory.TrackedObject.saliencyRank.setter(uint64_t a1, char a2)
{
  return sub_243326C40(a1, a2, type metadata accessor for DockAccessory.TrackedObject);
}

uint64_t sub_243326C40(uint64_t a1, char a2, uint64_t (*a3)(void))
{
  uint64_t result = a3(0);
  uint64_t v7 = v3 + *(int *)(result + 24);
  *(void *)uint64_t v7 = a1;
  *(unsigned char *)(v7 + 8) = a2 & 1;
  return result;
}

uint64_t (*DockAccessory.TrackedObject.saliencyRank.modify())()
{
  return nullsub_1;
}

uint64_t DockAccessory.TrackingState.time.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_243326CF0(MEMORY[0x263F07490], a1);
}

uint64_t sub_243326CF0@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = a1(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a2, v2, v4);
}

uint64_t DockAccessory.TrackingState.time.setter(uint64_t a1)
{
  return sub_243326D78(a1, MEMORY[0x263F07490]);
}

uint64_t sub_243326D78(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v4 = a2(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40);

  return v5(v2, a1, v4);
}

uint64_t (*DockAccessory.TrackingState.time.modify())()
{
  return nullsub_1;
}

uint64_t DockAccessory.TrackingState.trackedSubjects.getter()
{
  type metadata accessor for DockAccessory.TrackingState(0);

  return swift_bridgeObjectRetain();
}

uint64_t DockAccessory.TrackingState.trackedSubjects.setter(uint64_t a1)
{
  uint64_t v3 = *(int *)(type metadata accessor for DockAccessory.TrackingState(0) + 20);
  uint64_t result = swift_bridgeObjectRelease();
  *(void *)(v1 + v3) = a1;
  return result;
}

uint64_t (*DockAccessory.TrackingState.trackedSubjects.modify())()
{
  return nullsub_1;
}

uint64_t DockAccessory.TrackingState.description.getter()
{
  uint64_t v1 = v0;
  uint64_t v50 = type metadata accessor for DockAccessory.TrackedObject(0);
  MEMORY[0x270FA5388](v50);
  uint64_t v49 = (uint64_t)&v47 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v48 = type metadata accessor for DockAccessory.TrackedPerson(0);
  MEMORY[0x270FA5388](v48);
  uint64_t v4 = (char *)&v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v52 = type metadata accessor for DockAccessory.TrackedSubjectType(0);
  uint64_t v5 = *(void *)(v52 - 8);
  MEMORY[0x270FA5388](v52);
  uint64_t v7 = (char *)&v47 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&long long v53 = 0x3D656D6974;
  *((void *)&v53 + 1) = 0xE500000000000000;
  sub_243349E80();
  sub_24334175C(&qword_268D93508, MEMORY[0x263F07490]);
  sub_24334A930();
  sub_24334A660();
  swift_bridgeObjectRelease();
  sub_24334A660();
  uint64_t v8 = v53;
  long long v57 = v53;
  uint64_t v9 = *(void *)(v1 + *(int *)(type metadata accessor for DockAccessory.TrackingState(0) + 20));
  uint64_t v10 = *(void *)(v9 + 16);
  if (v10)
  {
    uint64_t v11 = v9 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    uint64_t v51 = *(void *)(v5 + 72);
    uint64_t v47 = v9;
    swift_bridgeObjectRetain();
    do
    {
      sub_2433417A4(v11, (uint64_t)v7, type metadata accessor for DockAccessory.TrackedSubjectType);
      if (swift_getEnumCaseMultiPayload() == 1)
      {
        uint64_t v12 = v49;
        sub_243342184((uint64_t)v7, v49, type metadata accessor for DockAccessory.TrackedObject);
        *(void *)&long long v53 = 0x207463656A626FLL;
        *((void *)&v53 + 1) = 0xE700000000000000;
        uint64_t v13 = sub_243349E90();
        uint64_t v16 = sub_243342088(5, v13, v14, v15);
        uint64_t v18 = v17;
        uint64_t v20 = v19;
        uint64_t v22 = v21;
        swift_bridgeObjectRelease();
        MEMORY[0x24567A220](v16, v18, v20, v22);
        sub_24334A660();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_24334A660();
        sub_24334A660();
        swift_bridgeObjectRelease();
        uint64_t v55 = 0;
        unint64_t v56 = 0xE000000000000000;
        sub_24334A660();
        uint64_t v23 = (long long *)(v12 + *(int *)(v50 + 20));
        long long v24 = v23[1];
        long long v53 = *v23;
        long long v54 = v24;
        type metadata accessor for CGRect(0);
        sub_24334A890();
        sub_24334A660();
        sub_24334A660();
        swift_bridgeObjectRelease();
        uint64_t v25 = type metadata accessor for DockAccessory.TrackedObject;
        uint64_t v26 = v12;
      }
      else
      {
        sub_243342184((uint64_t)v7, (uint64_t)v4, type metadata accessor for DockAccessory.TrackedPerson);
        *(void *)&long long v53 = 0x206E6F73726570;
        *((void *)&v53 + 1) = 0xE700000000000000;
        uint64_t v27 = sub_243349E90();
        uint64_t v30 = sub_243342088(5, v27, v28, v29);
        uint64_t v32 = v31;
        uint64_t v34 = v33;
        uint64_t v36 = v35;
        swift_bridgeObjectRelease();
        MEMORY[0x24567A220](v30, v32, v34, v36);
        sub_24334A660();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_24334A660();
        sub_24334A660();
        swift_bridgeObjectRelease();
        uint64_t v55 = 0;
        unint64_t v56 = 0xE000000000000000;
        sub_24334A660();
        uint64_t v37 = (int *)v48;
        uint64_t v38 = &v4[*(int *)(v48 + 20)];
        long long v39 = *((_OWORD *)v38 + 1);
        long long v53 = *(_OWORD *)v38;
        long long v54 = v39;
        type metadata accessor for CGRect(0);
        sub_24334A890();
        sub_24334A660();
        sub_24334A660();
        swift_bridgeObjectRelease();
        *(void *)&long long v53 = 0x79636E65696C6173;
        *((void *)&v53 + 1) = 0xE90000000000003DLL;
        uint64_t v40 = &v4[v37[6]];
        uint64_t v41 = *(void *)v40;
        LOBYTE(v40) = v40[8];
        uint64_t v55 = v41;
        LOBYTE(v56) = (_BYTE)v40;
        __swift_instantiateConcreteTypeFromMangledName(&qword_268D93510);
        sub_24334A610();
        sub_24334A660();
        swift_bridgeObjectRelease();
        sub_24334A660();
        sub_24334A660();
        swift_bridgeObjectRelease();
        *(void *)&long long v53 = 0x676E696B61657073;
        *((void *)&v53 + 1) = 0xE90000000000003DLL;
        char v42 = &v4[v37[7]];
        uint64_t v43 = *(void *)v42;
        LOBYTE(v42) = v42[8];
        uint64_t v55 = v43;
        LOBYTE(v56) = (_BYTE)v42;
        __swift_instantiateConcreteTypeFromMangledName(&qword_268D93518);
        sub_24334A610();
        sub_24334A660();
        swift_bridgeObjectRelease();
        sub_24334A660();
        sub_24334A660();
        swift_bridgeObjectRelease();
        *(void *)&long long v53 = 0x3D676E696B6F6F6CLL;
        *((void *)&v53 + 1) = 0xE800000000000000;
        id v44 = &v4[v37[8]];
        uint64_t v45 = *(void *)v44;
        LOBYTE(v44) = v44[8];
        uint64_t v55 = v45;
        LOBYTE(v56) = (_BYTE)v44;
        sub_24334A610();
        sub_24334A660();
        swift_bridgeObjectRelease();
        sub_24334A660();
        sub_24334A660();
        swift_bridgeObjectRelease();
        uint64_t v25 = type metadata accessor for DockAccessory.TrackedPerson;
        uint64_t v26 = (uint64_t)v4;
      }
      sub_243342124(v26, v25);
      sub_24334A660();
      v11 += v51;
      --v10;
    }
    while (v10);
    swift_bridgeObjectRelease();
    return v57;
  }
  return v8;
}

uint64_t DockAccessory.TrackingStates.Iterator.next()(uint64_t a1)
{
  type metadata accessor for DockAccessory.TrackingStates.Iterator(0);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93528);
  *uint64_t v3 = v1;
  v3[1] = sub_2433232E8;
  return MEMORY[0x270FA1F70](a1, v4);
}

uint64_t sub_243327650(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93528);
  *uint64_t v3 = v1;
  v3[1] = sub_243349D9C;
  return MEMORY[0x270FA1F70](a1, v4);
}

uint64_t sub_24332770C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93528);
  *uint64_t v3 = v1;
  v3[1] = sub_243349D9C;
  return MEMORY[0x270FA1F70](a1, v4);
}

uint64_t DockAccessory.TrackingStates.makeAsyncIterator()@<X0>(char *a1@<X8>)
{
  return sub_2433263B0(&qword_268D93528, &qword_268D93530, type metadata accessor for DockAccessory.TrackingStates.Iterator, a1);
}

uint64_t sub_2433277F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v17 = a1;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93528);
  uint64_t v3 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DockAccessory.TrackingStates.Iterator(0);
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93530);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v14(v13, v2, v10);
  v14(v9, (uint64_t)v13, v10);
  sub_24334A770();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(&v9[*(int *)(v7 + 28)], v5, v16);
  sub_243342184((uint64_t)v9, v17, type metadata accessor for DockAccessory.TrackingStates.Iterator);
  return sub_243342124(v2, type metadata accessor for DockAccessory.TrackingStates);
}

uint64_t DockAccessory.AccessoryEvent.hash(into:)()
{
  int v1 = *(unsigned __int8 *)(v0 + 8) >> 6;
  if (v1)
  {
    if (v1 == 1)
    {
      sub_24334A9A0();
      return sub_24334A9C0();
    }
    else
    {
      return sub_24334A9A0();
    }
  }
  else
  {
    sub_24334A9A0();
    sub_24334A9A0();
    return sub_24334A9B0();
  }
}

uint64_t DockAccessory.AccessoryEvent.hashValue.getter()
{
  return sub_24334A9D0();
}

uint64_t sub_243327B28()
{
  return sub_24334A9D0();
}

uint64_t sub_243327B80()
{
  return sub_24334A9D0();
}

uint64_t DockAccessory.AccessoryEvents.Iterator.next()(uint64_t a1)
{
  type metadata accessor for DockAccessory.AccessoryEvents.Iterator(0);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93540);
  *uint64_t v3 = v1;
  v3[1] = sub_2433232E8;
  return MEMORY[0x270FA1F70](a1, v4);
}

uint64_t sub_243327C94(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93540);
  *uint64_t v3 = v1;
  v3[1] = sub_243327D50;
  return MEMORY[0x270FA1F70](a1, v4);
}

uint64_t sub_243327D50()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_243327E48(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93540);
  *uint64_t v3 = v1;
  v3[1] = sub_243349D9C;
  return MEMORY[0x270FA1F70](a1, v4);
}

uint64_t DockAccessory.AccessoryEvents.makeAsyncIterator()@<X0>(char *a1@<X8>)
{
  return sub_2433263B0(&qword_268D93540, &qword_268D93548, type metadata accessor for DockAccessory.AccessoryEvents.Iterator, a1);
}

uint64_t sub_243327F2C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v17 = a1;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93540);
  uint64_t v3 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DockAccessory.AccessoryEvents.Iterator(0);
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93548);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v14(v13, v2, v10);
  v14(v9, (uint64_t)v13, v10);
  sub_24334A770();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(&v9[*(int *)(v7 + 28)], v5, v16);
  sub_243342184((uint64_t)v9, v17, type metadata accessor for DockAccessory.AccessoryEvents.Iterator);
  return sub_243342124(v2, type metadata accessor for DockAccessory.AccessoryEvents);
}

uint64_t DockAccessory.accessoryEvents.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2433288C4(&qword_268D93BA8, "API: getAccessoryEvents", a1);
}

uint64_t DockAccessory.BatteryState.name.getter()
{
  uint64_t v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

double DockAccessory.BatteryState.batteryLevel.getter()
{
  return *(double *)(v0 + 16);
}

uint64_t DockAccessory.BatteryState.lowBattery.getter()
{
  return *(unsigned __int8 *)(v0 + 24);
}

void DockAccessory.BatteryState.chargeState.getter(unsigned char *a1@<X8>)
{
  *a1 = *(unsigned char *)(v1 + 25);
}

uint64_t DockAccessory.BatteryState.hash(into:)()
{
  return sub_24334A9A0();
}

uint64_t DockAccessory.BatteryState.hashValue.getter()
{
  return sub_24334A9D0();
}

uint64_t sub_24332833C()
{
  return sub_24334A9D0();
}

uint64_t DockAccessory.BatteryStates.Iterator.next()(uint64_t a1)
{
  type metadata accessor for DockAccessory.BatteryStates.Iterator(0);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93558);
  *uint64_t v3 = v1;
  v3[1] = sub_2433232E8;
  return MEMORY[0x270FA1F70](a1, v4);
}

uint64_t sub_24332849C(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93558);
  *uint64_t v3 = v1;
  v3[1] = sub_243349D9C;
  return MEMORY[0x270FA1F70](a1, v4);
}

uint64_t sub_243328558(uint64_t a1)
{
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v3;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93558);
  *uint64_t v3 = v1;
  v3[1] = sub_243349D9C;
  return MEMORY[0x270FA1F70](a1, v4);
}

uint64_t DockAccessory.BatteryStates.makeAsyncIterator()@<X0>(char *a1@<X8>)
{
  return sub_2433263B0(&qword_268D93558, &qword_268D93560, type metadata accessor for DockAccessory.BatteryStates.Iterator, a1);
}

uint64_t sub_24332863C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v17 = a1;
  uint64_t v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93558);
  uint64_t v3 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DockAccessory.BatteryStates.Iterator(0);
  uint64_t v7 = v6 - 8;
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93560);
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v16 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v14 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v14(v13, v2, v10);
  v14(v9, (uint64_t)v13, v10);
  sub_24334A770();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  (*(void (**)(char *, char *, uint64_t))(v3 + 32))(&v9[*(int *)(v7 + 28)], v5, v16);
  sub_243342184((uint64_t)v9, v17, type metadata accessor for DockAccessory.BatteryStates.Iterator);
  return sub_243342124(v2, type metadata accessor for DockAccessory.BatteryStates);
}

uint64_t DockAccessory.batteryStates.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_2433288C4(&qword_268D93B50, "API: getAccessoryBatteryStates", a1);
}

uint64_t sub_2433288C4@<X0>(uint64_t *a1@<X0>, const char *a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v19 = a2;
  uint64_t v4 = v3;
  uint64_t v23 = a3;
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v21 = *(void *)(v5 - 8);
  uint64_t v22 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v20 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24334A5B0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v4 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v7);
  uint64_t v11 = sub_24334A590();
  os_log_type_t v12 = sub_24334A7B0();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = v4;
    unint64_t v14 = v13;
    *(_WORD *)uint64_t v13 = 0;
    _os_log_impl(&dword_243318000, v11, v12, v19, v13, 2u);
    uint64_t v4 = v18;
    MEMORY[0x24567AB80](v14, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  unint64_t v15 = (void *)(v4 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (*v15)
  {
    (*(void (**)(char *, void, uint64_t))(v21 + 104))(v20, *MEMORY[0x263F8F580], v22);
    return sub_24334A790();
  }
  else
  {
    sub_24331FCB8();
    swift_allocError();
    *uint64_t v17 = 1;
    return swift_willThrow();
  }
}

uint64_t DockAccessory.FramingMode.hash(into:)()
{
  return sub_24334A9A0();
}

BOOL static DockAccessory.FramingMode.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_243328BB8(char a1)
{
  return *(void *)&aAutomaticenter[8 * a1];
}

uint64_t sub_243328BD8(uint64_t a1)
{
  unint64_t v2 = sub_24334239C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_243328C14(uint64_t a1)
{
  unint64_t v2 = sub_24334239C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_243328C50(uint64_t a1)
{
  unint64_t v2 = sub_243342348();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_243328C8C(uint64_t a1)
{
  unint64_t v2 = sub_243342348();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_243328CC8()
{
  return sub_243328BB8(*v0);
}

uint64_t sub_243328CD0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, unsigned char *a3@<X8>)
{
  uint64_t result = sub_243348338(a1, a2);
  *a3 = result;
  return result;
}

void sub_243328CF8(unsigned char *a1@<X8>)
{
  *a1 = 4;
}

uint64_t sub_243328D04(uint64_t a1)
{
  unint64_t v2 = sub_24334224C();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_243328D40(uint64_t a1)
{
  unint64_t v2 = sub_24334224C();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_243328D7C@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = 1;
  return result;
}

uint64_t sub_243328DAC(uint64_t a1)
{
  unint64_t v2 = sub_2433422F4();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_243328DE8(uint64_t a1)
{
  unint64_t v2 = sub_2433422F4();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t sub_243328E24(uint64_t a1)
{
  unint64_t v2 = sub_2433422A0();

  return MEMORY[0x270FA00B0](a1, v2);
}

uint64_t sub_243328E60(uint64_t a1)
{
  unint64_t v2 = sub_2433422A0();

  return MEMORY[0x270FA00B8](a1, v2);
}

uint64_t DockAccessory.FramingMode.encode(to:)(void *a1)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93568);
  uint64_t v30 = *(void *)(v3 - 8);
  uint64_t v31 = v3;
  MEMORY[0x270FA5388](v3);
  unint64_t v29 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93570);
  uint64_t v27 = *(void *)(v5 - 8);
  uint64_t v28 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v26 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93578);
  uint64_t v24 = *(void *)(v7 - 8);
  uint64_t v25 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v23 = (char *)&v21 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93580);
  uint64_t v21 = *(void *)(v9 - 8);
  uint64_t v22 = v9;
  MEMORY[0x270FA5388](v9);
  uint64_t v11 = (char *)&v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93588);
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  unint64_t v15 = (char *)&v21 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = *v1;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_24334224C();
  sub_24334A9F0();
  switch(v16)
  {
    case 1:
      char v33 = 1;
      sub_243342348();
      uint64_t v17 = v23;
      sub_24334A920();
      uint64_t v19 = v24;
      uint64_t v18 = v25;
      goto LABEL_6;
    case 2:
      char v34 = 2;
      sub_2433422F4();
      uint64_t v17 = v26;
      sub_24334A920();
      uint64_t v19 = v27;
      uint64_t v18 = v28;
      goto LABEL_6;
    case 3:
      char v35 = 3;
      sub_2433422A0();
      uint64_t v17 = v29;
      sub_24334A920();
      uint64_t v19 = v30;
      uint64_t v18 = v31;
LABEL_6:
      (*(void (**)(char *, uint64_t))(v19 + 8))(v17, v18);
      break;
    default:
      char v32 = 0;
      sub_24334239C();
      sub_24334A920();
      (*(void (**)(char *, uint64_t))(v21 + 8))(v11, v22);
      break;
  }
  return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
}

uint64_t DockAccessory.FramingMode.init(from:)@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  uint64_t v47 = a2;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D935B8);
  uint64_t v49 = *(void *)(v3 - 8);
  uint64_t v50 = v3;
  MEMORY[0x270FA5388](v3);
  uint64_t v48 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D935C0);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v44 = v5;
  uint64_t v45 = v6;
  MEMORY[0x270FA5388](v5);
  uint64_t v46 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D935C8);
  uint64_t v42 = *(void *)(v8 - 8);
  uint64_t v43 = v8;
  MEMORY[0x270FA5388](v8);
  uint64_t v10 = (char *)&v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D935D0);
  uint64_t v41 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D935D8);
  uint64_t v15 = *(void *)(v14 - 8);
  MEMORY[0x270FA5388](v14);
  uint64_t v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = a1[3];
  uint64_t v51 = a1;
  __swift_project_boxed_opaque_existential_1(a1, v18);
  sub_24334224C();
  uint64_t v19 = v52;
  sub_24334A9E0();
  if (v19) {
    goto LABEL_7;
  }
  uint64_t v39 = v11;
  uint64_t v40 = v10;
  uint64_t v52 = 0;
  uint64_t v21 = v48;
  uint64_t v20 = v49;
  uint64_t v22 = v50;
  uint64_t v23 = v17;
  uint64_t v24 = sub_24334A910();
  if (*(void *)(v24 + 16) != 1)
  {
    uint64_t v27 = sub_24334A870();
    swift_allocError();
    unint64_t v29 = v28;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D934C8);
    void *v29 = &type metadata for DockAccessory.FramingMode;
    sub_24334A900();
    sub_24334A860();
    (*(void (**)(void *, void, uint64_t))(*(void *)(v27 - 8) + 104))(v29, *MEMORY[0x263F8DCB0], v27);
    swift_willThrow();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
LABEL_7:
    uint64_t v30 = (uint64_t)v51;
    return __swift_destroy_boxed_opaque_existential_1Tm(v30);
  }
  char v25 = *(unsigned char *)(v24 + 32);
  switch(v25)
  {
    case 1:
      char v54 = 1;
      sub_243342348();
      char v32 = v40;
      uint64_t v33 = v52;
      sub_24334A8F0();
      if (v33) {
        goto LABEL_12;
      }
      uint64_t v35 = v42;
      uint64_t v34 = v43;
      goto LABEL_16;
    case 2:
      char v55 = 2;
      sub_2433422F4();
      char v32 = v46;
      uint64_t v36 = v52;
      sub_24334A8F0();
      if (v36) {
        goto LABEL_12;
      }
      uint64_t v34 = v44;
      uint64_t v35 = v45;
LABEL_16:
      (*(void (**)(char *, uint64_t))(v35 + 8))(v32, v34);
      goto LABEL_17;
    case 3:
      char v56 = 3;
      sub_2433422A0();
      uint64_t v37 = v52;
      sub_24334A8F0();
      if (v37)
      {
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v15 + 8))(v23, v14);
        uint64_t v30 = (uint64_t)v51;
        return __swift_destroy_boxed_opaque_existential_1Tm(v30);
      }
      (*(void (**)(char *, uint64_t))(v20 + 8))(v21, v22);
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v23, v14);
      uint64_t v30 = (uint64_t)v51;
      uint64_t v38 = v47;
      goto LABEL_19;
    default:
      char v53 = 0;
      sub_24334239C();
      uint64_t v26 = v52;
      sub_24334A8F0();
      if (v26)
      {
LABEL_12:
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v15 + 8))(v23, v14);
        goto LABEL_7;
      }
      (*(void (**)(char *, uint64_t))(v41 + 8))(v13, v39);
LABEL_17:
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v23, v14);
      uint64_t v30 = (uint64_t)v51;
      uint64_t v38 = v47;
LABEL_19:
      *uint64_t v38 = v25;
      break;
  }
  return __swift_destroy_boxed_opaque_existential_1Tm(v30);
}

uint64_t sub_243329914@<X0>(void *a1@<X0>, unsigned char *a2@<X8>)
{
  return DockAccessory.FramingMode.init(from:)(a1, a2);
}

uint64_t sub_24332992C(void *a1)
{
  return DockAccessory.FramingMode.encode(to:)(a1);
}

double DockAccessory.Limits.Limit.positionRange.getter()
{
  return *(double *)v0;
}

double DockAccessory.Limits.Limit.maximumSpeed.getter()
{
  return *(double *)(v0 + 16);
}

void DockAccessory.Limits.Limit.init(positionRange:maximumSpeed:)(double *a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>)
{
  if (a4 >= 0.0 && a3 > a2)
  {
    *a1 = a2;
    a1[1] = a3;
    a1[2] = a4;
  }
  else
  {
    sub_24331FCB8();
    swift_allocError();
    *uint64_t v5 = 3;
    swift_willThrow();
  }
}

__n128 DockAccessory.Limits.yaw.getter@<Q0>(__n128 *a1@<X8>)
{
  unint64_t v2 = v1[1].n128_u64[0];
  unsigned __int8 v3 = v1[1].n128_u8[8];
  __n128 result = *v1;
  *a1 = *v1;
  a1[1].n128_u64[0] = v2;
  a1[1].n128_u8[8] = v3;
  return result;
}

__n128 DockAccessory.Limits.pitch.getter@<Q0>(__n128 *a1@<X8>)
{
  unint64_t v2 = v1[3].n128_u64[0];
  unsigned __int8 v3 = v1[3].n128_u8[8];
  __n128 result = v1[2];
  *a1 = result;
  a1[1].n128_u64[0] = v2;
  a1[1].n128_u8[8] = v3;
  return result;
}

__n128 DockAccessory.Limits.roll.getter@<Q0>(__n128 *a1@<X8>)
{
  unint64_t v2 = v1[5].n128_u64[0];
  unsigned __int8 v3 = v1[5].n128_u8[8];
  __n128 result = v1[4];
  *a1 = result;
  a1[1].n128_u64[0] = v2;
  a1[1].n128_u8[8] = v3;
  return result;
}

__n128 DockAccessory.Limits.init(yaw:pitch:roll:)@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, __n128 *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v4 = *(void *)(a1 + 16);
  char v5 = *(unsigned char *)(a1 + 24);
  uint64_t v6 = *(void *)(a2 + 16);
  char v7 = *(unsigned char *)(a2 + 24);
  unint64_t v8 = a3[1].n128_u64[0];
  unsigned __int8 v9 = a3[1].n128_u8[8];
  *(_OWORD *)a4 = *(_OWORD *)a1;
  *(void *)(a4 + 16) = v4;
  *(unsigned char *)(a4 + 24) = v5;
  *(_OWORD *)(a4 + 32) = *(_OWORD *)a2;
  *(void *)(a4 + 48) = v6;
  *(unsigned char *)(a4 + 56) = v7;
  __n128 result = *a3;
  *(__n128 *)(a4 + 64) = *a3;
  *(void *)(a4 + 80) = v8;
  *(unsigned char *)(a4 + 88) = v9;
  return result;
}

uint64_t DockAccessory.framingMode.getter@<X0>(unsigned char *a1@<X8>)
{
  uint64_t v3 = OBJC_IVAR____TtC7DockKit13DockAccessory__framingModeLock;
  uint64_t v4 = *(os_unfair_lock_s **)(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory__framingModeLock);
  swift_retain();
  os_unfair_lock_lock(v4 + 4);
  swift_release();
  char v5 = *(unsigned char *)(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory__framingMode);
  uint64_t v6 = *(os_unfair_lock_s **)(v1 + v3);
  swift_retain();
  os_unfair_lock_unlock(v6 + 4);
  uint64_t result = swift_release();
  *a1 = v5;
  return result;
}

double DockAccessory.regionOfInterest.getter()
{
  uint64_t v1 = OBJC_IVAR____TtC7DockKit13DockAccessory__roiLock;
  unint64_t v2 = *(os_unfair_lock_s **)(v0 + OBJC_IVAR____TtC7DockKit13DockAccessory__roiLock);
  swift_retain();
  os_unfair_lock_lock(v2 + 4);
  swift_release();
  double v3 = *(double *)(v0 + OBJC_IVAR____TtC7DockKit13DockAccessory__roi);
  uint64_t v4 = *(os_unfair_lock_s **)(v0 + v1);
  swift_retain();
  os_unfair_lock_unlock(v4 + 4);
  swift_release();
  return v3;
}

uint64_t DockAccessory.motionStates.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_243329BA4(a1);
}

uint64_t sub_243329BA4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v76 = a1;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93B18);
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  char v5 = (char *)&v68 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24334A5B0();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = MEMORY[0x270FA5388](v6);
  uint64_t v10 = (id *)((char *)&v68 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x270FA5388](v8);
  uint64_t v12 = (char *)&v68 - v11;
  uint64_t v13 = (id *)(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  uint64_t v77 = v13;
  if (*v13)
  {
    uint64_t v75 = v3;
    id v72 = v5;
    uint64_t v73 = v2;
    uint64_t v71 = v1;
    uint64_t v14 = v7;
    uint64_t v15 = *(void (**)(char *))(v7 + 16);
    uint64_t v74 = (uint8_t *)(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger);
    v15(v12);
    uint64_t v16 = sub_24334A590();
    os_log_type_t v17 = sub_24334A7B0();
    if (os_log_type_enabled(v16, v17))
    {
      uint64_t v18 = v6;
      uint64_t v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v19 = 0;
      _os_log_impl(&dword_243318000, v16, v17, "API: getMotionStates", v19, 2u);
      uint64_t v20 = v19;
      uint64_t v6 = v18;
      MEMORY[0x24567AB80](v20, -1, -1);
    }

    id v69 = *(void (**)(char *, uint64_t))(v14 + 8);
    uint64_t v70 = v14 + 8;
    v69(v12, v6);
    uint64_t v81 = MEMORY[0x263F8EE78];
    uint64_t v21 = v10;
    if (*v77)
    {
      id v22 = *v77;
      uint64_t v23 = (void *)sub_24334A110();

      if (v23)
      {
        uint64_t v24 = sub_24334A4D0();

        sub_24334A510();
        uint64_t v25 = sub_24334A4E0();
        if (*(void *)(v24 + 16) && (unint64_t v27 = sub_243340C60(v25, v26), (v28 & 1) != 0))
        {
          id v29 = *(id *)(*(void *)(v24 + 56) + 8 * v27);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (swift_dynamicCastClass())
          {
            id v30 = v29;
            MEMORY[0x24567A290]();
            if (*(void *)((v81 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v81 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
              sub_24334A6F0();
            }
            sub_24334A700();
            sub_24334A6E0();
          }
          else
          {
          }
        }
        else
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
      }
      if (*v77)
      {
        id v34 = *v77;
        uint64_t v35 = (void *)sub_24334A110();

        if (v35)
        {
          uint64_t v36 = sub_24334A4D0();

          sub_24334A510();
          uint64_t v37 = sub_24334A500();
          if (*(void *)(v36 + 16) && (unint64_t v39 = sub_243340C60(v37, v38), (v40 & 1) != 0))
          {
            id v41 = *(id *)(*(void *)(v36 + 56) + 8 * v39);
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if (swift_dynamicCastClass())
            {
              id v42 = v41;
              MEMORY[0x24567A290]();
              if (*(void *)((v81 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v81 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                sub_24334A6F0();
              }
              sub_24334A700();
              sub_24334A6E0();
            }
            else
            {
            }
          }
          else
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
        }
        if (*v77)
        {
          id v43 = *v77;
          uint64_t v44 = (void *)sub_24334A110();

          if (v44)
          {
            uint64_t v45 = sub_24334A4D0();

            sub_24334A510();
            uint64_t v46 = sub_24334A4F0();
            if (*(void *)(v45 + 16) && (unint64_t v48 = sub_243340C60(v46, v47), (v49 & 1) != 0))
            {
              id v50 = *(id *)(*(void *)(v45 + 56) + 8 * v48);
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              if (swift_dynamicCastClass())
              {
                id v51 = v50;
                MEMORY[0x24567A290]();
                if (*(void *)((v81 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v81 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
                  sub_24334A6F0();
                }
                sub_24334A700();
                sub_24334A6E0();
              }
              else
              {
              }
            }
            else
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
            }
          }
        }
      }
    }
    ((void (*)(id *, uint8_t *, uint64_t))v15)(v21, v74, v6);
    uint64_t v52 = sub_24334A590();
    uint64_t v53 = v6;
    os_log_type_t v54 = sub_24334A7D0();
    if (os_log_type_enabled(v52, v54))
    {
      char v55 = (uint8_t *)swift_slowAlloc();
      uint64_t v56 = swift_slowAlloc();
      v80[0] = v56;
      *(_DWORD *)char v55 = 136315138;
      uint64_t v74 = v55 + 4;
      swift_beginAccess();
      uint64_t v57 = sub_24334A510();
      uint64_t v58 = swift_bridgeObjectRetain();
      uint64_t v59 = MEMORY[0x24567A2C0](v58, v57);
      uint64_t v77 = v21;
      unint64_t v61 = v60;
      swift_bridgeObjectRelease();
      uint64_t v79 = sub_2433402D0(v59, v61, v80);
      sub_24334A820();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_243318000, v52, v54, "Requesting motion states with actuators: %s", v55, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x24567AB80](v56, -1, -1);
      MEMORY[0x24567AB80](v55, -1, -1);

      uint64_t v62 = v77;
    }
    else
    {

      uint64_t v62 = v21;
    }
    v69((char *)v62, v53);
    uint64_t v64 = v72;
    uint64_t v63 = v73;
    uint64_t v65 = v71;
    uint64_t v66 = swift_beginAccess();
    uint64_t v67 = v81;
    MEMORY[0x270FA5388](v66);
    *(&v68 - 2) = v65;
    *(&v68 - 1) = v67;
    (*(void (**)(char *, void, uint64_t))(v75 + 104))(v64, *MEMORY[0x263F8F580], v63);
    swift_bridgeObjectRetain();
    sub_24334A790();
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_24331FCB8();
    uint64_t v31 = swift_allocError();
    unsigned char *v32 = 1;
    uint64_t v78 = v31;
    return swift_willThrow();
  }
}

uint64_t DockAccessory.trackingStates.getter()
{
  return sub_24332A3B8();
}

uint64_t sub_24332A3B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93AC0);
  uint64_t v18 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  os_log_type_t v17 = (char *)&v15 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_24334A5B0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v1 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v4);
  uint64_t v8 = sub_24334A590();
  os_log_type_t v9 = sub_24334A7B0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v16 = v2;
    uint64_t v11 = v10;
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_243318000, v8, v9, "API: getTrackingStates", v10, 2u);
    uint64_t v2 = v16;
    MEMORY[0x24567AB80](v11, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  uint64_t v12 = (void *)(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (*v12)
  {
    type metadata accessor for DockAccessory.TrackingState(0);
    (*(void (**)(char *, void, uint64_t))(v18 + 104))(v17, *MEMORY[0x263F8F580], v2);
    return sub_24334A790();
  }
  else
  {
    sub_24331FCB8();
    swift_allocError();
    unsigned char *v14 = 1;
    return swift_willThrow();
  }
}

void DockAccessory.limits.getter(uint64_t a1@<X8>)
{
}

void sub_24332A6A8(uint64_t a1@<X8>)
{
  uint64_t v3 = sub_24334A5B0();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v68 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_24334A0B0();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v68 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v79 = v1;
  uint64_t v11 = (id *)(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  id v12 = *v11;
  double v13 = 0.0;
  if (*v11)
  {
    uint64_t v71 = v6;
    id v14 = v12;
    uint64_t v15 = (void *)sub_24334A110();

    if (v15)
    {

      if (!*v11) {
        goto LABEL_42;
      }
      id v16 = *v11;
      os_log_type_t v17 = (void *)sub_24334A110();

      if (!v17)
      {
LABEL_43:
        __break(1u);
        return;
      }
      uint64_t v18 = v84;
      uint64_t v19 = sub_24334A2E0();
      uint64_t v70 = v4;
      if (v18)
      {

        uint64_t v20 = v18;
LABEL_7:
        (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v71, v79 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v3);
        uint64_t v21 = v20;
        id v22 = v20;
        uint64_t v23 = sub_24334A590();
        os_log_type_t v24 = sub_24334A7D0();
        if (os_log_type_enabled(v23, v24))
        {
          uint64_t v25 = (uint8_t *)swift_slowAlloc();
          uint64_t v26 = (void *)swift_slowAlloc();
          *(_DWORD *)uint64_t v25 = 138412290;
          unint64_t v27 = v20;
          uint64_t v28 = _swift_stdlib_bridgeErrorToNSError();
          uint64_t v85 = v28;
          sub_24334A820();
          *uint64_t v26 = v28;

          _os_log_impl(&dword_243318000, v23, v24, "Caught err %@ and returning public", v25, 0xCu);
          __swift_instantiateConcreteTypeFromMangledName(&qword_268D93300);
          swift_arrayDestroy();
          MEMORY[0x24567AB80](v26, -1, -1);
          MEMORY[0x24567AB80](v25, -1, -1);
        }
        else
        {
        }
        (*(void (**)(char *, uint64_t))(v70 + 8))(v71, v3);
        sub_24331FCB8();
        swift_allocError();
        sub_24331C07C(v20, v60);
        swift_willThrow();

        return;
      }
      id v84 = 0;
      uint64_t v69 = v19;

      uint64_t v29 = *(void *)(v69 + 16);
      if (v29)
      {
        uint64_t v68 = v3;
        uint64_t v31 = *(void (**)(char *, unint64_t, uint64_t))(v8 + 16);
        uint64_t v30 = v8 + 16;
        unint64_t v32 = v69 + ((*(unsigned __int8 *)(v30 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v30 + 64));
        uint64_t v81 = (void (**)(char *, uint64_t))(v30 - 8);
        uint64_t v82 = v31;
        double v78 = 0.0;
        double v75 = 0.0;
        double v76 = 0.0;
        uint64_t v83 = v30;
        uint64_t v80 = *(void *)(v30 + 56);
        int v77 = 1;
        double v74 = 0.0;
        double v33 = 0.0;
        double v34 = 0.0;
        int v73 = 1;
        double v35 = 0.0;
        double v36 = 0.0;
        double v37 = 0.0;
        int v72 = 1;
        v31(v10, v32, v7);
        while (1)
        {
          sub_24334A070();
          double v39 = v38;
          sub_24334A060();
          if (v39 > v40)
          {
            __break(1u);
LABEL_42:
            __break(1u);
            goto LABEL_43;
          }
          double v41 = v40;
          sub_24334A0A0();
          if (v42 < 0.0 || v41 <= v39)
          {
            sub_24331FCB8();
            uint64_t v20 = swift_allocError();
            *uint64_t v67 = 3;
            swift_willThrow();
            (*v81)(v10, v7);
            swift_bridgeObjectRelease();
            uint64_t v3 = v68;
            uint64_t v4 = v70;
            goto LABEL_7;
          }
          double v44 = v42;
          uint64_t v45 = sub_24334A090();
          uint64_t v47 = v46;
          sub_24334A510();
          if (v45 == sub_24334A4E0() && v47 == v48) {
            break;
          }
          char v49 = sub_24334A940();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v49) {
            goto LABEL_25;
          }
LABEL_26:
          uint64_t v50 = sub_24334A090();
          uint64_t v52 = v51;
          if (v50 == sub_24334A500() && v52 == v53)
          {
            swift_bridgeObjectRelease_n();
LABEL_30:
            int v73 = 0;
            double v74 = -v41;
            double v33 = -v39;
            double v34 = v44;
            goto LABEL_31;
          }
          char v54 = sub_24334A940();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if (v54) {
            goto LABEL_30;
          }
LABEL_31:
          uint64_t v55 = sub_24334A090();
          uint64_t v57 = v56;
          if (v55 == sub_24334A4F0() && v57 == v58)
          {
            swift_bridgeObjectRelease_n();
            (*v81)(v10, v7);
LABEL_12:
            int v77 = 0;
            double v78 = v39;
            double v75 = v44;
            double v76 = v41;
            goto LABEL_13;
          }
          char v59 = sub_24334A940();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          (*v81)(v10, v7);
          if (v59) {
            goto LABEL_12;
          }
LABEL_13:
          v32 += v80;
          if (!--v29)
          {
            swift_bridgeObjectRelease();
            double v13 = v78;
            char v62 = v77;
            double v63 = v75;
            double v61 = v76;
            double v64 = v74;
            char v65 = v73;
            char v66 = v72;
            goto LABEL_39;
          }
          v82(v10, v32, v7);
        }
        swift_bridgeObjectRelease_n();
LABEL_25:
        int v72 = 0;
        double v35 = v39;
        double v36 = v41;
        double v37 = v44;
        goto LABEL_26;
      }
      swift_bridgeObjectRelease();
    }
  }
  double v61 = 0.0;
  char v62 = 1;
  double v63 = 0.0;
  double v64 = 0.0;
  double v33 = 0.0;
  double v34 = 0.0;
  char v65 = 1;
  double v35 = 0.0;
  double v36 = 0.0;
  char v66 = 1;
  double v37 = 0.0;
LABEL_39:
  *(double *)a1 = v35;
  *(double *)(a1 + 8) = v36;
  *(double *)(a1 + 16) = v37;
  *(unsigned char *)(a1 + 24) = v66 & 1;
  *(double *)(a1 + 32) = v64;
  *(double *)(a1 + 40) = v33;
  *(double *)(a1 + 48) = v34;
  *(unsigned char *)(a1 + 56) = v65 & 1;
  *(double *)(a1 + 64) = v13;
  *(double *)(a1 + 72) = v61;
  *(double *)(a1 + 80) = v63;
  *(unsigned char *)(a1 + 88) = v62 & 1;
}

uint64_t sub_24332AE2C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_24334A5B0();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v46 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24334A5A0();
  uint64_t v10 = (void *)(v2 + OBJC_IVAR____TtC7DockKit13DockAccessory_firmwareVersion);
  *uint64_t v10 = 0;
  v10[1] = 0;
  uint64_t v11 = (void *)(v2 + OBJC_IVAR____TtC7DockKit13DockAccessory_hardwareModel);
  *uint64_t v11 = 0;
  v11[1] = 0;
  *(unsigned char *)(v2 + OBJC_IVAR____TtC7DockKit13DockAccessory__framingMode) = 0;
  uint64_t v12 = OBJC_IVAR____TtC7DockKit13DockAccessory__framingModeLock;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D93448);
  uint64_t v13 = swift_allocObject();
  *(_DWORD *)(v13 + 16) = 0;
  *(void *)(v3 + v12) = v13;
  uint64_t v14 = v3 + OBJC_IVAR____TtC7DockKit13DockAccessory__roi;
  *(void *)uint64_t v14 = 0;
  *(void *)(v14 + 8) = 0;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)(v14 + 16) = _Q0;
  uint64_t v20 = OBJC_IVAR____TtC7DockKit13DockAccessory__roiLock;
  uint64_t v21 = swift_allocObject();
  *(_DWORD *)(v21 + 16) = 0;
  *(void *)(v3 + v20) = v21;
  *(unsigned char *)(v3 + OBJC_IVAR____TtC7DockKit13DockAccessory__tracking) = 0;
  uint64_t v22 = OBJC_IVAR____TtC7DockKit13DockAccessory__orientationProgressLock;
  uint64_t v23 = swift_allocObject();
  *(_DWORD *)(v23 + 16) = 0;
  *(void *)(v3 + v22) = v23;
  *(void *)(v3 + OBJC_IVAR____TtC7DockKit13DockAccessory__orientationProgress) = 0;
  sub_243349E30();
  uint64_t v24 = OBJC_IVAR____TtC7DockKit13DockAccessory__animateCommandLock;
  sub_24334A570();
  *(void *)(v3 + v24) = sub_24334A560();
  sub_243349E30();
  *(void *)(v3 + OBJC_IVAR____TtC7DockKit13DockAccessory__maxPositionFrequency) = 0x4000000000000000;
  *(void *)(v3 + OBJC_IVAR____TtC7DockKit13DockAccessory__maxAnimateFrequency) = 0x4000000000000000;
  uint64_t v25 = OBJC_IVAR____TtC7DockKit13DockAccessory_trackingSummaryLock;
  sub_24334A540();
  *(void *)(v3 + v25) = sub_24334A530();
  *(void *)(v3 + OBJC_IVAR____TtC7DockKit13DockAccessory_publishSummaryPeriod) = 0x3FA999999999999ALL;
  sub_243349E30();
  uint64_t v26 = OBJC_IVAR____TtC7DockKit13DockAccessory_allocatedLock;
  uint64_t v27 = swift_allocObject();
  *(void *)(v3 + v26) = v27;
  *(_DWORD *)(v27 + 16) = 0;
  *(void *)(v3 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory) = 0;
  *(void *)(v3 + OBJC_IVAR____TtC7DockKit13DockAccessory_helper) = 0;
  sub_2433417A4(a1, v3 + OBJC_IVAR____TtC7DockKit13DockAccessory_identifier, type metadata accessor for DockAccessory.Identifier);
  if (a2 && (sub_24334A140(), (uint64_t v28 = swift_dynamicCastClass()) != 0))
  {
    uint64_t v29 = (void *)v28;
    uint64_t v30 = (id *)(v3 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
    swift_beginAccess();
    id v31 = *v30;
    *uint64_t v30 = v29;
    swift_unknownObjectRetain();

    if (*v30)
    {
      id v32 = *v30;
      uint64_t v33 = sub_243349FF0();
      uint64_t v35 = v34;
    }
    else
    {
      uint64_t v33 = 0;
      uint64_t v35 = 0;
    }
    double v39 = (uint64_t *)(v3 + OBJC_IVAR____TtC7DockKit13DockAccessory_firmwareVersion);
    swift_beginAccess();
    *double v39 = v33;
    v39[1] = v35;
    swift_bridgeObjectRelease();
    swift_beginAccess();
    double v40 = *v30;
    if (*v30)
    {
      swift_endAccess();
      id v41 = v40;
      double v40 = (void *)sub_24334A010();
      uint64_t v43 = v42;
      swift_unknownObjectRelease();

      sub_243342124(a1, type metadata accessor for DockAccessory.Identifier);
    }
    else
    {
      sub_243342124(a1, type metadata accessor for DockAccessory.Identifier);
      swift_endAccess();
      swift_unknownObjectRelease();
      uint64_t v43 = 0;
    }
    double v44 = (void *)(v3 + OBJC_IVAR____TtC7DockKit13DockAccessory_hardwareModel);
    swift_beginAccess();
    *double v44 = v40;
    v44[1] = v43;
    swift_bridgeObjectRelease();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v3 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v6);
    double v36 = sub_24334A590();
    os_log_type_t v37 = sub_24334A7D0();
    if (os_log_type_enabled(v36, v37))
    {
      double v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)double v38 = 0;
      _os_log_impl(&dword_243318000, v36, v37, "No stand provided, cannot use this object for IPC", v38, 2u);
      MEMORY[0x24567AB80](v38, -1, -1);
    }

    swift_unknownObjectRelease();
    sub_243342124(a1, type metadata accessor for DockAccessory.Identifier);
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return v3;
}

uint64_t DockAccessory.deinit()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_24334A5B0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2);
  uint64_t v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = (char *)(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v2);
  uint64_t v7 = sub_24334A590();
  os_log_type_t v8 = sub_24334A7D0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_243318000, v7, v8, "DockAccessory de-init: cleaning up", v9, 2u);
    MEMORY[0x24567AB80](v9, -1, -1);
  }

  uint64_t v10 = *(void (**)(char *, uint64_t))(v3 + 8);
  v10(v5, v2);
  uint64_t v11 = (id *)(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (*v11)
  {
    id v12 = *v11;
    sub_24334A0D0();

    if (*v11)
    {
      id v13 = *v11;
      sub_243349FE0();
    }
  }
  v10(v6, v2);
  sub_243342124(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory_identifier, type metadata accessor for DockAccessory.Identifier);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();

  uint64_t v14 = v1 + OBJC_IVAR____TtC7DockKit13DockAccessory__lastOrientationCommandTime;
  uint64_t v15 = sub_243349E80();
  id v16 = *(void (**)(uint64_t, uint64_t))(*(void *)(v15 - 8) + 8);
  v16(v14, v15);
  swift_release();
  v16(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory__lastAnimateCommandTime, v15);
  swift_release();
  v16(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory_lastSummaryPublishTime, v15);
  swift_release();

  return v1;
}

uint64_t DockAccessory.__deallocating_deinit()
{
  DockAccessory.deinit();
  uint64_t v1 = *(unsigned int *)(*(void *)v0 + 48);
  uint64_t v2 = *(unsigned __int16 *)(*(void *)v0 + 52);

  return MEMORY[0x270FA0228](v0, v1, v2);
}

uint64_t static DockAccessory.== infix(_:_:)()
{
  type metadata accessor for DockAccessory.Identifier(0);

  return sub_243349EA0();
}

uint64_t DockAccessory.hash(into:)()
{
  return sub_24334A5C0();
}

id DockAccessory.setOrientation(_:duration:relative:)(uint64_t a1, uint64_t a2, int a3, double a4, double a5, double a6)
{
  uint64_t v8 = v6;
  uint64_t v15 = sub_24334A5B0();
  uint64_t v16 = *(void *)(v15 - 8);
  MEMORY[0x270FA5388](v15);
  uint64_t v18 = (char *)&v36 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v16 + 16))(v18, v8 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v15);
  uint64_t v19 = sub_24334A590();
  os_log_type_t v20 = sub_24334A7B0();
  int v40 = v20;
  if (os_log_type_enabled(v19, v20))
  {
    uint64_t v21 = swift_slowAlloc();
    uint64_t v41 = a1;
    uint64_t v22 = v21;
    uint64_t v37 = swift_slowAlloc();
    v43[0] = v37;
    *(_DWORD *)uint64_t v22 = 134350082;
    double v42 = a4;
    uint64_t v39 = v7;
    sub_24334A820();
    int v38 = a3;
    *(_WORD *)(v22 + 12) = 2050;
    double v42 = a5;
    sub_24334A820();
    *(_WORD *)(v22 + 22) = 2050;
    double v42 = a6;
    sub_24334A820();
    *(_WORD *)(v22 + 32) = 2082;
    uint64_t v36 = v15;
    uint64_t v23 = sub_24334AA10();
    double v42 = COERCE_DOUBLE(sub_2433402D0(v23, v24, v43));
    sub_24334A820();
    LOBYTE(a3) = v38;
    swift_bridgeObjectRelease();
    *(_WORD *)(v22 + 42) = 1026;
    LODWORD(v42) = a3 & 1;
    sub_24334A820();
    _os_log_impl(&dword_243318000, v19, (os_log_type_t)v40, "API: setOrientation: %{public}f, %{public}f, %{public}f dur %{public}s, rel: %{BOOL,public}d", (uint8_t *)v22, 0x30u);
    uint64_t v25 = v37;
    swift_arrayDestroy();
    MEMORY[0x24567AB80](v25, -1, -1);
    uint64_t v26 = v22;
    a1 = v41;
    MEMORY[0x24567AB80](v26, -1, -1);

    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v36);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  }
  uint64_t v27 = (void *)(v8 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (*v27)
  {
    char v28 = a3;
    if (qword_268D932C0 != -1) {
      swift_once();
    }
    uint64_t v29 = qword_268D932C8;
    uint64_t v30 = OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock;
    id v31 = *(os_unfair_lock_s **)(qword_268D932C8 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock);
    swift_retain();
    os_unfair_lock_lock(v31 + 4);
    swift_release();
    char v32 = *(unsigned char *)(v29 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabled);
    uint64_t v33 = (os_unfair_lock_s *)(*(void *)(v29 + v30) + 16);
    swift_retain();
    os_unfair_lock_unlock(v33);
    swift_release();
    if (v32)
    {
      return sub_24332BC04(a1, a2, v28 & 1);
    }
    else
    {
      id result = (id)sub_24334A8B0();
      __break(1u);
    }
  }
  else
  {
    sub_24331FCB8();
    swift_allocError();
    *uint64_t v35 = 1;
    return (id)swift_willThrow();
  }
  return result;
}

id sub_24332BC04(uint64_t a1, uint64_t a2, int a3)
{
  int v68 = a3;
  uint64_t v65 = a1;
  uint64_t v66 = a2;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D933D0);
  MEMORY[0x270FA5388](v4 - 8);
  uint64_t v67 = (char *)&v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_243349E80();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v63 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v69 = sub_24334A5B0();
  uint64_t v10 = *(void *)(v69 - 8);
  uint64_t v11 = MEMORY[0x270FA5388](v69);
  double v64 = (char *)&v63 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v15 = (char *)&v63 - v14;
  MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v63 - v16;
  uint64_t v18 = (id *)(v3 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (!*v18
    || (v19 = *v18, v70 = v3, v20 = v19, char v21 = sub_24334A120(), v20, v3 = v70, (v21 & 1) == 0))
  {
    uint64_t v33 = v69;
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v17, v3 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v69);
    uint64_t v34 = sub_24334A590();
    os_log_type_t v35 = sub_24334A7D0();
    if (os_log_type_enabled(v34, v35))
    {
      uint64_t v36 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v36 = 0;
      _os_log_impl(&dword_243318000, v34, v35, "Tracking button off, motors disabled", v36, 2u);
      MEMORY[0x24567AB80](v36, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v10 + 8))(v17, v33);
    char v32 = 2;
    goto LABEL_10;
  }
  uint64_t v63 = OBJC_IVAR____TtC7DockKit13DockAccessory__orientationProgressLock;
  uint64_t v22 = *(os_unfair_lock_s **)(v70 + OBJC_IVAR____TtC7DockKit13DockAccessory__orientationProgressLock);
  swift_retain();
  os_unfair_lock_lock(v22 + 4);
  swift_release();
  uint64_t v23 = v70 + OBJC_IVAR____TtC7DockKit13DockAccessory__lastOrientationCommandTime;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, v23, v6);
  sub_243349E50();
  uint64_t v24 = v70;
  double v26 = v25;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if (fabs(v26) < 1.0 / *(double *)(v24 + OBJC_IVAR____TtC7DockKit13DockAccessory__maxPositionFrequency))
  {
    uint64_t v27 = v69;
    (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v15, v24 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v69);
    char v28 = sub_24334A590();
    os_log_type_t v29 = sub_24334A7B0();
    if (os_log_type_enabled(v28, v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v30 = 0;
      _os_log_impl(&dword_243318000, v28, v29, "rate limiting set orientation API", v30, 2u);
      MEMORY[0x24567AB80](v30, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v27);
    id v31 = *(os_unfair_lock_s **)(v70 + v63);
    swift_retain();
    os_unfair_lock_unlock(v31 + 4);
    swift_release();
    char v32 = 7;
LABEL_10:
    sub_24331FCB8();
    swift_allocError();
    *uint64_t v37 = v32;
    return (id)swift_willThrow();
  }
  sub_243349E70();
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v7 + 40))(v23, v9, v6);
  swift_endAccess();
  uint64_t v39 = OBJC_IVAR____TtC7DockKit13DockAccessory__orientationProgress;
  int v40 = *(void **)(v24 + OBJC_IVAR____TtC7DockKit13DockAccessory__orientationProgress);
  if (v40 && (objc_msgSend(v40, sel_isCancelled) & 1) == 0)
  {
    id result = *(id *)(v24 + v39);
    if (!result)
    {
      __break(1u);
      return result;
    }
    if ((objc_msgSend(result, sel_isFinished) & 1) == 0)
    {
      uint64_t v41 = v64;
      uint64_t v42 = v69;
      (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v64, v24 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v69);
      uint64_t v43 = sub_24334A590();
      os_log_type_t v44 = sub_24334A7D0();
      if (os_log_type_enabled(v43, v44))
      {
        uint64_t v45 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)uint64_t v45 = 0;
        _os_log_impl(&dword_243318000, v43, v44, "Orientation in progress, cancelling", v45, 2u);
        MEMORY[0x24567AB80](v45, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v10 + 8))(v41, v42);
      uint64_t v24 = v70;
      uint64_t v46 = *(void **)(v70 + v39);
      if (v46) {
        objc_msgSend(v46, sel_cancel);
      }
    }
  }
  uint64_t v47 = v63;
  uint64_t v48 = *(os_unfair_lock_s **)(v24 + v63);
  swift_retain();
  os_unfair_lock_unlock(v48 + 4);
  swift_release();
  if (*v18)
  {
    id v49 = *v18;
    sub_24334A0E0();
  }
  id v50 = objc_msgSend(objc_allocWithZone((Class)sub_24334A050()), sel_init);
  sub_24334A020();
  sub_24334A040();
  sub_24334A030();
  id v51 = objc_msgSend(self, sel_progressWithTotalUnitCount_, 1);
  uint64_t v52 = sub_24334A730();
  uint64_t v53 = (uint64_t)v67;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v52 - 8) + 56))(v67, 1, 1, v52);
  uint64_t v54 = swift_allocObject();
  *(void *)(v54 + 16) = 0;
  *(void *)(v54 + 24) = 0;
  uint64_t v55 = v66;
  *(void *)(v54 + 32) = v65;
  *(void *)(v54 + 40) = v55;
  uint64_t v56 = v70;
  *(void *)(v54 + 48) = v70;
  *(void *)(v54 + 56) = v50;
  *(unsigned char *)(v54 + 64) = v68 & 1;
  *(void *)(v54 + 72) = v51;
  swift_retain();
  id v57 = v50;
  id v58 = v51;
  sub_243323308(v53, (uint64_t)&unk_268D93AB8, v54);
  swift_release();
  char v59 = *(os_unfair_lock_s **)(v56 + v47);
  swift_retain();
  os_unfair_lock_lock(v59 + 4);
  swift_release();
  unint64_t v60 = *(void **)(v56 + v39);
  *(void *)(v56 + v39) = v58;
  id v61 = v58;

  char v62 = *(os_unfair_lock_s **)(v56 + v47);
  swift_retain();
  os_unfair_lock_unlock(v62 + 4);

  swift_release();
  return v61;
}

id DockAccessory.setOrientation(_:duration:relative:)(uint64_t a1, uint64_t a2, int a3, __n128 a4, __n128 a5)
{
  uint64_t v46 = a2;
  __n128 v44 = a4;
  __n128 v45 = a5;
  uint64_t v8 = sub_24334A5B0();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (void *)(v5 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (*v12)
  {
    int v43 = a3;
    uint64_t v13 = a1;
    if (qword_268D932C0 != -1) {
      swift_once();
    }
    uint64_t v14 = qword_268D932C8;
    uint64_t v15 = OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock;
    uint64_t v16 = *(os_unfair_lock_s **)(qword_268D932C8 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock);
    swift_retain();
    os_unfair_lock_lock(v16 + 4);
    swift_release();
    char v17 = *(unsigned char *)(v14 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabled);
    uint64_t v18 = *(os_unfair_lock_s **)(v14 + v15);
    swift_retain();
    os_unfair_lock_unlock(v18 + 4);
    swift_release();
    if (v17)
    {
      int v19 = sub_24334A7E0();
      *(__n128 *)&v51.quaternion.vector.f64[2] = v44;
      *(__n128 *)v51.vector.f64 = v45;
      v50[0] = v44;
      v50[1] = v45;
      SPRotation3DGetEulerAngles(v51, (uint64_t)v50, v19, (uint64_t)&v47);
      SPVector3DMake(v47, v48, v49, &v47);
      v45.n128_f64[0] = v48;
      double v20 = v47;
      double v21 = v49;
      v44.n128_u64[0] = v5;
      uint64_t v22 = v9;
      (*(void (**)(char *, unint64_t, uint64_t))(v9 + 16))(v11, v5 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v8);
      uint64_t v23 = sub_24334A590();
      os_log_type_t v24 = sub_24334A7B0();
      int v25 = v24;
      if (os_log_type_enabled(v23, v24))
      {
        uint64_t v26 = swift_slowAlloc();
        int v39 = v25;
        uint64_t v27 = v26;
        *(double *)&uint64_t v40 = COERCE_DOUBLE(swift_slowAlloc());
        double v47 = *(double *)&v40;
        *(_DWORD *)uint64_t v27 = 134350082;
        *(double *)id v50 = v20;
        uint64_t v41 = v22;
        double v42 = v20;
        sub_24334A820();
        *(_WORD *)(v27 + 12) = 2050;
        *(void *)&v50[0] = v45.n128_u64[0];
        sub_24334A820();
        *(_WORD *)(v27 + 22) = 2050;
        *(double *)id v50 = v21;
        sub_24334A820();
        *(_WORD *)(v27 + 32) = 2082;
        uint64_t v38 = v8;
        os_log_t v37 = v23;
        uint64_t v28 = v46;
        uint64_t v29 = sub_24334AA10();
        *(void *)&v50[0] = sub_2433402D0(v29, v30, (uint64_t *)&v47);
        sub_24334A820();
        swift_bridgeObjectRelease();
        *(_WORD *)(v27 + 42) = 1026;
        char v31 = v43;
        LODWORD(v50[0]) = v43 & 1;
        sub_24334A820();
        os_log_t v32 = v37;
        _os_log_impl(&dword_243318000, v37, (os_log_type_t)v39, "API: setOrientationR: %{public}f, %{public}f, %{public}f dur %{public}s, rel: %{BOOL,public}d", (uint8_t *)v27, 0x30u);
        uint64_t v33 = v40;
        swift_arrayDestroy();
        MEMORY[0x24567AB80](v33, -1, -1);
        MEMORY[0x24567AB80](v27, -1, -1);

        (*(void (**)(char *, uint64_t))(v41 + 8))(v11, v38);
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v22 + 8))(v11, v8);
        uint64_t v28 = v46;
        char v31 = v43;
      }
      return sub_24332BC04(v13, v28, v31 & 1);
    }
    else
    {
      id result = (id)sub_24334A8B0();
      __break(1u);
    }
  }
  else
  {
    sub_24331FCB8();
    swift_allocError();
    *uint64_t v34 = 1;
    return (id)swift_willThrow();
  }
  return result;
}

uint64_t sub_24332C89C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, char a8)
{
  *(void *)(v8 + 72) = a7;
  *(void *)(v8 + 80) = v13;
  *(unsigned char *)(v8 + 168) = a8;
  *(void *)(v8 + 56) = a5;
  *(void *)(v8 + 64) = a6;
  *(void *)(v8 + 48) = a4;
  uint64_t v9 = sub_24334A5B0();
  *(void *)(v8 + 88) = v9;
  *(void *)(v8 + 96) = *(void *)(v9 - 8);
  *(void *)(v8 + 104) = swift_task_alloc();
  uint64_t v10 = sub_24334A240();
  *(void *)(v8 + 112) = v10;
  *(void *)(v8 + 120) = *(void *)(v10 - 8);
  *(void *)(v8 + 128) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24332C9CC, 0, 0);
}

uint64_t sub_24332C9CC()
{
  uint64_t v1 = *(void *)(v0 + 64);
  uint64_t v2 = sub_24334AA00();
  sub_24334AA00();
  uint64_t v4 = v3;
  unint64_t v5 = (id *)(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (*v5 && (id v6 = *v5, v7 = sub_24334A110(), *(void *)(v0 + 136) = v7, v6, v7))
  {
    double v8 = (double)v4 / 1.0e18 + (double)v2;
    uint64_t v10 = *(void *)(v0 + 120);
    uint64_t v9 = *(void *)(v0 + 128);
    uint64_t v11 = *(void *)(v0 + 112);
    uint64_t v12 = *(void *)(v0 + 80);
    uint64_t v13 = *(void *)(v0 + 64);
    uint64_t v14 = swift_task_alloc();
    *(void *)(v0 + 144) = v14;
    *(void *)(v14 + 16) = v13;
    *(void *)(v14 + 24) = v12;
    (*(void (**)(uint64_t, void, uint64_t))(v10 + 104))(v9, *MEMORY[0x263F3A898], v11);
    uint64_t v15 = (void *)swift_task_alloc();
    *(void *)(v0 + 152) = v15;
    *uint64_t v15 = v0;
    v15[1] = sub_24332CBC4;
    uint64_t v16 = *(void *)(v0 + 128);
    uint64_t v17 = *(unsigned __int8 *)(v0 + 168);
    uint64_t v18 = *(void *)(v0 + 72);
    v19.n128_f64[0] = v8;
    return MEMORY[0x270F269B8](v18, v17, v16, sub_243348CC0, v14, v19);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    double v20 = *(uint64_t (**)(void))(v0 + 8);
    return v20();
  }
}

uint64_t sub_24332CBC4()
{
  uint64_t v2 = *(void **)(*v1 + 136);
  uint64_t v3 = *(void *)(*v1 + 128);
  uint64_t v4 = *(void *)(*v1 + 120);
  uint64_t v5 = *(void *)(*v1 + 112);
  uint64_t v6 = *v1;
  *(void *)(v6 + 160) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);

  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24332CD98, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v7 = *(uint64_t (**)(void))(v6 + 8);
    return v7();
  }
}

uint64_t sub_24332CD98()
{
  uint64_t v1 = (void *)v0[20];
  uint64_t v3 = v0[12];
  uint64_t v2 = v0[13];
  uint64_t v4 = v0[11];
  uint64_t v5 = v0[8];
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v4);
  id v6 = v1;
  id v7 = v1;
  double v8 = sub_24334A590();
  os_log_type_t v9 = sub_24334A7C0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (void *)v0[20];
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 138412290;
    id v13 = v10;
    uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
    v0[5] = v14;
    sub_24334A820();
    void *v12 = v14;

    _os_log_impl(&dword_243318000, v8, v9, "Caught %@ while setting orientation, canceling progress", v11, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93300);
    swift_arrayDestroy();
    MEMORY[0x24567AB80](v12, -1, -1);
    MEMORY[0x24567AB80](v11, -1, -1);
  }
  else
  {
    uint64_t v15 = (void *)v0[20];
  }
  uint64_t v16 = (void *)v0[20];
  uint64_t v18 = v0[12];
  uint64_t v17 = v0[13];
  double v20 = (void *)v0[10];
  uint64_t v19 = v0[11];

  (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
  objc_msgSend(v20, sel_cancel);

  swift_task_dealloc();
  swift_task_dealloc();
  double v21 = (uint64_t (*)(void))v0[1];
  return v21();
}

uint64_t DockAccessory.setOrientation(_:duration:relative:)(uint64_t a1, uint64_t a2, char a3, double a4, double a5, double a6)
{
  *(void *)(v7 + 104) = a2;
  *(void *)(v7 + 112) = v6;
  *(unsigned char *)(v7 + 156) = a3;
  *(void *)(v7 + 96) = a1;
  *(double *)(v7 + 80) = a5;
  *(double *)(v7 + 88) = a6;
  *(double *)(v7 + 72) = a4;
  uint64_t v8 = sub_24334A5B0();
  *(void *)(v7 + 120) = v8;
  *(void *)(v7 + 128) = *(void *)(v8 - 8);
  *(void *)(v7 + 136) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24332D090, 0, 0);
}

uint64_t sub_24332D090()
{
  uint64_t v34 = v0;
  (*(void (**)(void, uint64_t, void))(*(void *)(v0 + 128) + 16))(*(void *)(v0 + 136), *(void *)(v0 + 112) + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, *(void *)(v0 + 120));
  uint64_t v1 = sub_24334A590();
  os_log_type_t v2 = sub_24334A7B0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v31 = *(void *)(v0 + 120);
    uint64_t v32 = *(void *)(v0 + 136);
    uint64_t v30 = *(void *)(v0 + 128);
    int v29 = *(unsigned __int8 *)(v0 + 156);
    uint64_t v4 = *(void *)(v0 + 80);
    uint64_t v3 = *(void *)(v0 + 88);
    uint64_t v5 = *(void *)(v0 + 72);
    uint64_t v6 = swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v33 = v7;
    *(_DWORD *)uint64_t v6 = 134350082;
    *(void *)(v0 + 40) = v5;
    sub_24334A820();
    *(_WORD *)(v6 + 12) = 2050;
    *(void *)(v0 + 48) = v4;
    sub_24334A820();
    *(_WORD *)(v6 + 22) = 2050;
    *(void *)(v0 + 56) = v3;
    sub_24334A820();
    *(_WORD *)(v6 + 32) = 2082;
    uint64_t v8 = sub_24334AA10();
    *(void *)(v0 + 64) = sub_2433402D0(v8, v9, &v33);
    sub_24334A820();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 42) = 1026;
    *(_DWORD *)(v0 + 152) = v29;
    sub_24334A820();
    _os_log_impl(&dword_243318000, v1, v2, "API: setOrientation: %{public}f, %{public}f, %{public}f dur %{public}s, rel: %{BOOL,public}d", (uint8_t *)v6, 0x30u);
    swift_arrayDestroy();
    MEMORY[0x24567AB80](v7, -1, -1);
    MEMORY[0x24567AB80](v6, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v32, v31);
  }
  else
  {
    uint64_t v11 = *(void *)(v0 + 128);
    uint64_t v10 = *(void *)(v0 + 136);
    uint64_t v12 = *(void *)(v0 + 120);

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
  }
  id v13 = (void *)(*(void *)(v0 + 112) + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (*v13)
  {
    if (qword_268D932C0 != -1) {
      swift_once();
    }
    uint64_t v14 = qword_268D932C8;
    uint64_t v15 = OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock;
    uint64_t v16 = *(os_unfair_lock_s **)(qword_268D932C8 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock);
    swift_retain();
    os_unfair_lock_lock(v16 + 4);
    swift_release();
    char v17 = *(unsigned char *)(v14 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabled);
    uint64_t v18 = *(os_unfair_lock_s **)(v14 + v15);
    swift_retain();
    os_unfair_lock_unlock(v18 + 4);
    swift_release();
    if (v17)
    {
      uint64_t v19 = (void *)swift_task_alloc();
      *(void *)(v0 + 144) = v19;
      void *v19 = v0;
      v19[1] = sub_24332D530;
      uint64_t v20 = *(void *)(v0 + 104);
      char v21 = *(unsigned char *)(v0 + 156);
      uint64_t v22 = *(void *)(v0 + 96);
      double v23 = *(double *)(v0 + 80);
      double v24 = *(double *)(v0 + 88);
      double v25 = *(double *)(v0 + 72);
      return sub_24332D65C(v22, v20, v21, v25, v23, v24);
    }
    else
    {
      return sub_24334A8B0();
    }
  }
  else
  {
    sub_24331FCB8();
    swift_allocError();
    *uint64_t v27 = 1;
    swift_willThrow();
    swift_task_dealloc();
    uint64_t v28 = *(uint64_t (**)(void))(v0 + 8);
    return v28();
  }
}

uint64_t sub_24332D530(uint64_t a1)
{
  uint64_t v4 = *v2;
  swift_task_dealloc();
  uint64_t v5 = swift_task_dealloc();
  uint64_t v6 = *(uint64_t (**)(uint64_t))(v4 + 8);
  if (!v1) {
    uint64_t v5 = a1;
  }
  return v6(v5);
}

uint64_t sub_24332D65C(uint64_t a1, uint64_t a2, char a3, double a4, double a5, double a6)
{
  *(void *)(v7 + 80) = a2;
  *(void *)(v7 + 88) = v6;
  *(unsigned char *)(v7 + 208) = a3;
  *(void *)(v7 + 72) = a1;
  *(double *)(v7 + 56) = a5;
  *(double *)(v7 + 64) = a6;
  *(double *)(v7 + 48) = a4;
  uint64_t v8 = sub_24334A240();
  *(void *)(v7 + 96) = v8;
  *(void *)(v7 + 104) = *(void *)(v8 - 8);
  *(void *)(v7 + 112) = swift_task_alloc();
  uint64_t v9 = sub_24334A5B0();
  *(void *)(v7 + 120) = v9;
  *(void *)(v7 + 128) = *(void *)(v9 - 8);
  *(void *)(v7 + 136) = swift_task_alloc();
  *(void *)(v7 + 144) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24332D798, 0, 0);
}

uint64_t sub_24332D798()
{
  uint64_t v1 = (id *)(*(void *)(v0 + 88) + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (*v1 && (id v2 = *v1, v3 = sub_24334A120(), v2, (v3 & 1) != 0))
  {
    uint64_t v4 = *(void *)(v0 + 88);
    uint64_t v5 = OBJC_IVAR____TtC7DockKit13DockAccessory__orientationProgressLock;
    *(void *)(v0 + 152) = OBJC_IVAR____TtC7DockKit13DockAccessory__orientationProgressLock;
    uint64_t v6 = *(os_unfair_lock_s **)(v4 + v5);
    uint64_t v7 = swift_task_alloc();
    *(void *)(v7 + 16) = sub_243348A78;
    *(void *)(v7 + 24) = v4;
    swift_retain();
    os_unfair_lock_lock(v6 + 4);
    sub_243349D70(v8);
    os_unfair_lock_unlock(v6 + 4);
    swift_release();
    swift_task_dealloc();
    if (*v1)
    {
      id v9 = *v1;
      sub_24334A0E0();
    }
    id v10 = objc_msgSend(objc_allocWithZone((Class)sub_24334A050()), sel_init);
    *(void *)(v0 + 160) = v10;
    sub_24334A020();
    sub_24334A040();
    sub_24334A030();
    id v11 = objc_msgSend(self, sel_progressWithTotalUnitCount_, 1);
    *(void *)(v0 + 168) = v11;
    uint64_t v12 = sub_24334AA00();
    sub_24334AA00();
    if (*v1
      && (v14 = v13, id v15 = *v1, v16 = sub_24334A110(), *(void *)(v0 + 176) = v16, v15, v16))
    {
      double v17 = (double)v14 / 1.0e18 + (double)v12;
      uint64_t v19 = *(void *)(v0 + 104);
      uint64_t v18 = *(void *)(v0 + 112);
      uint64_t v21 = *(void *)(v0 + 88);
      uint64_t v20 = *(void *)(v0 + 96);
      uint64_t v22 = swift_task_alloc();
      *(void *)(v0 + 184) = v22;
      *(void *)(v22 + 16) = v21;
      *(void *)(v22 + 24) = v11;
      (*(void (**)(uint64_t, void, uint64_t))(v19 + 104))(v18, *MEMORY[0x263F3A898], v20);
      double v23 = (void *)swift_task_alloc();
      *(void *)(v0 + 192) = v23;
      *double v23 = v0;
      v23[1] = sub_24332DCD4;
      uint64_t v24 = *(void *)(v0 + 112);
      uint64_t v25 = *(unsigned __int8 *)(v0 + 208);
      v26.n128_f64[0] = v17;
      return MEMORY[0x270F269B8](v10, v25, v24, sub_243349D98, v22, v26);
    }
    else
    {
      uint64_t v35 = *(void *)(v0 + 168);
      uint64_t v36 = *(void *)(v0 + 88);
      os_log_t v37 = *(os_unfair_lock_s **)(v36 + *(void *)(v0 + 152));
      uint64_t v38 = swift_task_alloc();
      *(void *)(v38 + 16) = v36;
      *(void *)(v38 + 24) = v35;
      uint64_t v39 = swift_task_alloc();
      *(void *)(v39 + 16) = sub_243348A94;
      *(void *)(v39 + 24) = v38;
      swift_retain();
      os_unfair_lock_lock(v37 + 4);
      sub_243349D70(v40);
      os_unfair_lock_unlock(v37 + 4);

      swift_release();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v41 = *(uint64_t (**)(uint64_t))(v0 + 8);
      uint64_t v42 = *(void *)(v0 + 168);
      return v41(v42);
    }
  }
  else
  {
    (*(void (**)(void, uint64_t, void))(*(void *)(v0 + 128) + 16))(*(void *)(v0 + 144), *(void *)(v0 + 88) + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, *(void *)(v0 + 120));
    uint64_t v27 = sub_24334A590();
    os_log_type_t v28 = sub_24334A7D0();
    if (os_log_type_enabled(v27, v28))
    {
      int v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)int v29 = 0;
      _os_log_impl(&dword_243318000, v27, v28, "Tracking button off, motors disabled", v29, 2u);
      MEMORY[0x24567AB80](v29, -1, -1);
    }
    uint64_t v30 = *(void *)(v0 + 144);
    uint64_t v31 = *(void *)(v0 + 120);
    uint64_t v32 = *(void *)(v0 + 128);

    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v30, v31);
    sub_24331FCB8();
    swift_allocError();
    unsigned char *v33 = 2;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v34 = *(uint64_t (**)(void))(v0 + 8);
    return v34();
  }
}

uint64_t sub_24332DCD4()
{
  id v2 = *(void **)v1;
  *(void *)(*(void *)v1 + 200) = v0;
  swift_task_dealloc();
  if (v0)
  {
    char v3 = (void *)v2[22];
    (*(void (**)(void, void))(v2[13] + 8))(v2[14], v2[12]);

    uint64_t v4 = sub_24332DF88;
  }
  else
  {
    uint64_t v5 = (void *)v2[22];
    (*(void (**)(void, void))(v2[13] + 8))(v2[14], v2[12]);

    swift_task_dealloc();
    uint64_t v4 = sub_24332DE38;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_24332DE38()
{
  uint64_t v1 = *(void *)(v0 + 200);
  uint64_t v2 = *(void *)(v0 + 168);
  uint64_t v3 = *(void *)(v0 + 88);
  uint64_t v4 = *(os_unfair_lock_s **)(v3 + *(void *)(v0 + 152));
  uint64_t v5 = swift_task_alloc();
  *(void *)(v5 + 16) = v3;
  *(void *)(v5 + 24) = v2;
  uint64_t v6 = swift_task_alloc();
  *(void *)(v6 + 16) = sub_243348A94;
  *(void *)(v6 + 24) = v5;
  swift_retain();
  os_unfair_lock_lock(v4 + 4);
  sub_243349D70(v7);
  os_unfair_lock_unlock(v4 + 4);
  if (v1)
  {
    return swift_task_dealloc();
  }
  else
  {

    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    id v9 = *(uint64_t (**)(uint64_t))(v0 + 8);
    uint64_t v10 = *(void *)(v0 + 168);
    return v9(v10);
  }
}

uint64_t sub_24332DF88()
{
  uint64_t v1 = (void *)v0[25];
  uint64_t v3 = v0[16];
  uint64_t v2 = v0[17];
  uint64_t v4 = v0[15];
  uint64_t v5 = v0[11];
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v4);
  id v6 = v1;
  id v7 = v1;
  uint64_t v8 = sub_24334A590();
  os_log_type_t v9 = sub_24334A7D0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (void *)v0[25];
    uint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 138412290;
    id v13 = v10;
    uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
    v0[5] = v14;
    sub_24334A820();
    void *v12 = v14;

    _os_log_impl(&dword_243318000, v8, v9, "caught err %@, returning public", v11, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93300);
    swift_arrayDestroy();
    MEMORY[0x24567AB80](v12, -1, -1);
    MEMORY[0x24567AB80](v11, -1, -1);
  }
  else
  {
    id v15 = (void *)v0[25];
  }
  uint64_t v16 = v0[25];
  uint64_t v18 = (void *)v0[20];
  double v17 = (void *)v0[21];
  uint64_t v20 = v0[16];
  uint64_t v19 = v0[17];
  uint64_t v21 = v0[15];

  (*(void (**)(uint64_t, uint64_t))(v20 + 8))(v19, v21);
  sub_24331FCB8();
  swift_allocError();
  sub_24331C07C(v16, v22);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  double v23 = (uint64_t (*)(void))v0[1];
  return v23();
}

uint64_t DockAccessory.setOrientation(_:duration:relative:)(unint64_t a1, unint64_t a2, unsigned __int8 a3, __n128 a4, __n128 a5)
{
  v6[7].n128_u64[0] = a2;
  v6[7].n128_u64[1] = v5;
  v6[10].n128_u8[4] = a3;
  v6[6].n128_u64[1] = a1;
  v6[1] = a4;
  v6[2] = a5;
  uint64_t v7 = sub_24334A5B0();
  v6[8].n128_u64[0] = v7;
  v6[8].n128_u64[1] = *(void *)(v7 - 8);
  v6[9].n128_u64[0] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24332E2BC, 0, 0);
}

uint64_t sub_24332E2BC()
{
  uint64_t v41 = v0;
  uint64_t v1 = (void *)(*(void *)(v0 + 120) + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (*v1)
  {
    if (qword_268D932C0 != -1) {
      swift_once();
    }
    uint64_t v2 = qword_268D932C8;
    uint64_t v3 = OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock;
    uint64_t v4 = *(os_unfair_lock_s **)(qword_268D932C8 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock);
    swift_retain();
    os_unfair_lock_lock(v4 + 4);
    swift_release();
    char v5 = *(unsigned char *)(v2 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabled);
    id v6 = *(os_unfair_lock_s **)(v2 + v3);
    swift_retain();
    os_unfair_lock_unlock(v6 + 4);
    swift_release();
    if (v5)
    {
      uint64_t v8 = *(void *)(v0 + 136);
      uint64_t v7 = *(void *)(v0 + 144);
      uint64_t v10 = *(void *)(v0 + 120);
      uint64_t v9 = *(void *)(v0 + 128);
      long long v35 = *(_OWORD *)(v0 + 16);
      *(_OWORD *)v36.vector.f64 = *(_OWORD *)(v0 + 32);
      int v11 = sub_24334A7E0();
      *(_OWORD *)&v43.quaternion.vector.f64[2] = v35;
      *(_OWORD *)v43.vector.f64 = *(_OWORD *)v36.vector.f64;
      *(_OWORD *)&v36.quaternion.vector.f64[2] = v35;
      long long v37 = *(_OWORD *)v36.vector.f64;
      SPRotation3DGetEulerAngles(v43, (uint64_t)&v36.vector.f64[2], v11, (uint64_t)&v38);
      SPVector3DMake(v38, v39, v40, &v38);
      double v12 = v38;
      double v13 = v39;
      double v14 = v40;
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16))(v7, v10 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v9);
      id v15 = sub_24334A590();
      os_log_type_t v16 = sub_24334A7B0();
      BOOL v17 = os_log_type_enabled(v15, v16);
      uint64_t v19 = *(void *)(v0 + 136);
      uint64_t v18 = *(void *)(v0 + 144);
      uint64_t v20 = *(void *)(v0 + 128);
      if (v17)
      {
        uint64_t v34 = *(void *)(v0 + 128);
        int v33 = *(unsigned __int8 *)(v0 + 164);
        v36.vector.f64[0] = v12;
        uint64_t v21 = swift_slowAlloc();
        uint64_t v32 = swift_slowAlloc();
        double v38 = *(double *)&v32;
        *(_DWORD *)uint64_t v21 = 134350082;
        *(double *)(v0 + 72) = v36.vector.f64[0];
        sub_24334A820();
        *(_WORD *)(v21 + 12) = 2050;
        *(double *)(v0 + 80) = v13;
        sub_24334A820();
        *(_WORD *)(v21 + 22) = 2050;
        *(double *)(v0 + 88) = v14;
        sub_24334A820();
        *(_WORD *)(v21 + 32) = 2082;
        uint64_t v22 = sub_24334AA10();
        *(void *)(v0 + 96) = sub_2433402D0(v22, v23, (uint64_t *)&v38);
        sub_24334A820();
        swift_bridgeObjectRelease();
        *(_WORD *)(v21 + 42) = 1026;
        *(_DWORD *)(v0 + 160) = v33;
        sub_24334A820();
        _os_log_impl(&dword_243318000, v15, v16, "API: setOrientationR: %{public}f, %{public}f, %{public}f dur %{public}s, rel: %{BOOL,public}d", (uint8_t *)v21, 0x30u);
        swift_arrayDestroy();
        MEMORY[0x24567AB80](v32, -1, -1);
        uint64_t v24 = v21;
        double v12 = v36.vector.f64[0];
        MEMORY[0x24567AB80](v24, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v34);
      }
      else
      {

        (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v20);
      }
      os_log_type_t v28 = (void *)swift_task_alloc();
      *(void *)(v0 + 152) = v28;
      *os_log_type_t v28 = v0;
      v28[1] = sub_24332E790;
      uint64_t v29 = *(void *)(v0 + 112);
      char v30 = *(unsigned char *)(v0 + 164);
      uint64_t v31 = *(void *)(v0 + 104);
      return sub_24332D65C(v31, v29, v30, v12, v13, v14);
    }
    else
    {
      return sub_24334A8B0();
    }
  }
  else
  {
    sub_24331FCB8();
    swift_allocError();
    *uint64_t v25 = 1;
    swift_willThrow();
    swift_task_dealloc();
    __n128 v26 = *(uint64_t (**)(void))(v0 + 8);
    return v26();
  }
}

uint64_t sub_24332E790(uint64_t a1)
{
  uint64_t v4 = *v2;
  swift_task_dealloc();
  uint64_t v5 = swift_task_dealloc();
  id v6 = *(uint64_t (**)(uint64_t))(v4 + 8);
  if (!v1) {
    uint64_t v5 = a1;
  }
  return v6(v5);
}

uint64_t sub_24332E8BC(uint64_t a1)
{
  uint64_t v2 = sub_24334A5B0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v25 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  uint64_t v7 = (char *)&v24 - v6;
  uint64_t v8 = sub_243349E80();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  int v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = a1 + OBJC_IVAR____TtC7DockKit13DockAccessory__lastOrientationCommandTime;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v12, v8);
  sub_243349E50();
  double v14 = v13;
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  if (fabs(v14) >= 1.0 / *(double *)(a1 + OBJC_IVAR____TtC7DockKit13DockAccessory__maxPositionFrequency))
  {
    sub_243349E70();
    swift_beginAccess();
    (*(void (**)(uint64_t, char *, uint64_t))(v9 + 40))(v12, v11, v8);
    swift_endAccess();
    uint64_t v20 = OBJC_IVAR____TtC7DockKit13DockAccessory__orientationProgress;
    uint64_t result = *(void *)(a1 + OBJC_IVAR____TtC7DockKit13DockAccessory__orientationProgress);
    if (result)
    {
      uint64_t result = (uint64_t)objc_msgSend((id)result, sel_isCancelled);
      if ((result & 1) == 0)
      {
        uint64_t result = *(void *)(a1 + v20);
        if (result)
        {
          uint64_t result = (uint64_t)objc_msgSend((id)result, sel_isFinished);
          if ((result & 1) == 0)
          {
            (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v25, a1 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v2);
            uint64_t v21 = sub_24334A590();
            os_log_type_t v22 = sub_24334A7D0();
            if (os_log_type_enabled(v21, v22))
            {
              unint64_t v23 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)unint64_t v23 = 0;
              _os_log_impl(&dword_243318000, v21, v22, "Orientation in progress, cancelling", v23, 2u);
              MEMORY[0x24567AB80](v23, -1, -1);
            }

            (*(void (**)(char *, uint64_t))(v3 + 8))(v25, v2);
            uint64_t result = *(void *)(a1 + v20);
            if (result) {
              return (uint64_t)objc_msgSend((id)result, sel_cancel);
            }
          }
        }
        else
        {
          __break(1u);
        }
      }
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v7, a1 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v2);
    id v15 = sub_24334A590();
    os_log_type_t v16 = sub_24334A7B0();
    if (os_log_type_enabled(v15, v16))
    {
      BOOL v17 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)BOOL v17 = 0;
      _os_log_impl(&dword_243318000, v15, v16, "rate limiting set orientation API", v17, 2u);
      MEMORY[0x24567AB80](v17, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v7, v2);
    sub_24331FCB8();
    swift_allocError();
    *uint64_t v18 = 7;
    return swift_willThrow();
  }
  return result;
}

char *sub_24332ECD0(uint64_t a1, uint64_t a2, void *a3)
{
  id v41 = a3;
  uint64_t v40 = sub_24334A5B0();
  uint64_t v4 = *(void *)(v40 - 8);
  uint64_t v5 = MEMORY[0x270FA5388](v40);
  uint64_t v7 = (char *)&v40 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = MEMORY[0x270FA5388](v5);
  uint64_t v10 = (char *)&v40 - v9;
  uint64_t v11 = MEMORY[0x270FA5388](v8);
  double v13 = (char *)&v40 - v12;
  MEMORY[0x270FA5388](v11);
  id v15 = (char *)&v40 - v14;
  uint64_t v16 = sub_24334A1F0();
  uint64_t v17 = *(void *)(v16 - 8);
  MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v40 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24334A2C0();
  uint64_t result = (char *)(*(uint64_t (**)(char *, uint64_t))(v17 + 88))(v19, v16);
  if (result == *MEMORY[0x263F3A878]) {
    return result;
  }
  if (result == *MEMORY[0x263F3A890])
  {
    uint64_t v21 = v40;
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v13, a2 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v40);
    os_log_type_t v22 = sub_24334A590();
    os_log_type_t v23 = sub_24334A7D0();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v24 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v24 = 0;
      _os_log_impl(&dword_243318000, v22, v23, "completed: increase completed unit count", v24, 2u);
      MEMORY[0x24567AB80](v24, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v13, v21);
    id v25 = v41;
    uint64_t result = (char *)objc_msgSend(v41, sel_completedUnitCount);
    if (!__OFADD__(result, 1)) {
      return (char *)objc_msgSend(v25, sel_setCompletedUnitCount_, result + 1);
    }
    __break(1u);
    return result;
  }
  if (result == *MEMORY[0x263F3A888])
  {
    uint64_t v26 = v40;
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v15, a2 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v40);
    uint64_t v27 = sub_24334A590();
    os_log_type_t v28 = sub_24334A7D0();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v29 = 0;
      _os_log_impl(&dword_243318000, v27, v28, "canceled: canceling progress", v29, 2u);
      MEMORY[0x24567AB80](v29, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v15, v26);
    return (char *)objc_msgSend(v41, sel_cancel);
  }
  uint64_t v30 = a2 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
  uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  if (result == *MEMORY[0x263F3A880])
  {
    uint64_t v32 = v40;
    v31(v10, v30, v40);
    int v33 = sub_24334A590();
    os_log_type_t v34 = sub_24334A7D0();
    if (os_log_type_enabled(v33, v34))
    {
      long long v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)long long v35 = 0;
      _os_log_impl(&dword_243318000, v33, v34, "failed: canceling progress", v35, 2u);
      MEMORY[0x24567AB80](v35, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v4 + 8))(v10, v32);
    return (char *)objc_msgSend(v41, sel_cancel);
  }
  uint64_t v36 = v40;
  v31(v7, v30, v40);
  long long v37 = sub_24334A590();
  os_log_type_t v38 = sub_24334A7D0();
  if (os_log_type_enabled(v37, v38))
  {
    double v39 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)double v39 = 0;
    _os_log_impl(&dword_243318000, v37, v38, "default: canceling progress", v39, 2u);
    MEMORY[0x24567AB80](v39, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v36);
  objc_msgSend(v41, sel_cancel);
  return (char *)(*(uint64_t (**)(char *, uint64_t))(v17 + 8))(v19, v16);
}

uint64_t DockAccessory.setAngularVelocity(_:)(double a1, double a2, double a3)
{
  *(void *)(v4 + 96) = v3;
  *(double *)(v4 + 80) = a2;
  *(double *)(v4 + 88) = a3;
  *(double *)(v4 + 72) = a1;
  uint64_t v5 = sub_24334A5B0();
  *(void *)(v4 + 104) = v5;
  *(void *)(v4 + 112) = *(void *)(v5 - 8);
  *(void *)(v4 + 120) = swift_task_alloc();
  *(void *)(v4 + 128) = swift_task_alloc();
  *(void *)(v4 + 136) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24332F2E8, 0, 0);
}

uint64_t sub_24332F2E8()
{
  uint64_t v1 = *((void *)v0 + 17);
  uint64_t v2 = *((void *)v0 + 13);
  uint64_t v3 = *((void *)v0 + 14);
  uint64_t v4 = *((void *)v0 + 12);
  uint64_t v5 = OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
  *((void *)v0 + 18) = OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
  uint64_t v6 = v4 + v5;
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  *((void *)v0 + 19) = v7;
  *((void *)v0 + 20) = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v7(v1, v4 + v5, v2);
  uint64_t v8 = sub_24334A590();
  os_log_type_t v9 = sub_24334A7B0();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v11 = *((void *)v0 + 10);
    uint64_t v10 = *((void *)v0 + 11);
    uint64_t v12 = *((void *)v0 + 9);
    uint64_t v13 = swift_slowAlloc();
    *((void *)v0 + 6) = v12;
    *(_DWORD *)uint64_t v13 = 134349568;
    sub_24334A820();
    *(_WORD *)(v13 + 12) = 2050;
    *((void *)v0 + 7) = v11;
    sub_24334A820();
    *(_WORD *)(v13 + 22) = 2050;
    *((void *)v0 + 8) = v10;
    sub_24334A820();
    _os_log_impl(&dword_243318000, v8, v9, "API: setAngularVelocity: %{public}f, %{public}f, %{public}f", (uint8_t *)v13, 0x20u);
    MEMORY[0x24567AB80](v13, -1, -1);
  }

  uint64_t v14 = *((void *)v0 + 17);
  uint64_t v15 = *((void *)v0 + 13);
  uint64_t v16 = *((void *)v0 + 14);
  uint64_t v17 = *((void *)v0 + 12);
  uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
  *((void *)v0 + 21) = v18;
  *((void *)v0 + 22) = (v16 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v18(v14, v15);
  uint64_t v19 = (id *)(v17 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (!*v19)
  {
    char v35 = 1;
LABEL_18:
    sub_24331FCB8();
    swift_allocError();
    *id v41 = v35;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v42 = (uint64_t (*)(void))*((void *)v0 + 1);
    goto LABEL_19;
  }
  id v20 = *v19;
  char v21 = sub_24334A120();

  if ((v21 & 1) == 0)
  {
    v7(*((void *)v0 + 16), v6, *((void *)v0 + 13));
    uint64_t v36 = sub_24334A590();
    os_log_type_t v37 = sub_24334A7D0();
    if (os_log_type_enabled(v36, v37))
    {
      os_log_type_t v38 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v38 = 0;
      _os_log_impl(&dword_243318000, v36, v37, "Tracking button off, motors disabled", v38, 2u);
      MEMORY[0x24567AB80](v38, -1, -1);
    }
    uint64_t v39 = *((void *)v0 + 16);
    uint64_t v40 = *((void *)v0 + 13);

    v18(v39, v40);
    char v35 = 2;
    goto LABEL_18;
  }
  if (qword_268D932C0 != -1) {
    swift_once();
  }
  uint64_t v22 = qword_268D932C8;
  uint64_t v23 = OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock;
  uint64_t v24 = *(os_unfair_lock_s **)(qword_268D932C8 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock);
  swift_retain();
  os_unfair_lock_lock(v24 + 4);
  swift_release();
  char v25 = *(unsigned char *)(v22 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabled);
  uint64_t v26 = *(os_unfair_lock_s **)(v22 + v23);
  swift_retain();
  os_unfair_lock_unlock(v26 + 4);
  swift_release();
  if ((v25 & 1) == 0) {
    return sub_24334A8B0();
  }
  if (*v19)
  {
    id v27 = *v19;
    sub_24334A0E0();

    if (*v19)
    {
      id v28 = *v19;
      uint64_t v29 = sub_24334A110();
      *((void *)v0 + 23) = v29;

      if (v29)
      {
        double v30 = -v0[9];
        uint64_t v31 = (void *)swift_task_alloc();
        *((void *)v0 + 24) = v31;
        *uint64_t v31 = v0;
        v31[1] = sub_24332F7FC;
        v32.n128_f64[0] = v0[10];
        v33.n128_f64[0] = v0[11];
        v34.n128_f64[0] = v30;
        return MEMORY[0x270F269E0](v32, v34, v33);
      }
    }
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v42 = (uint64_t (*)(void))*((void *)v0 + 1);
LABEL_19:
  return v42();
}

uint64_t sub_24332F7FC()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 200) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24332F958, 0, 0);
  }
  else
  {

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_24332F958()
{
  uint64_t v1 = *(void **)(v0 + 200);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 152);
  uint64_t v3 = *(void *)(v0 + 144);
  uint64_t v4 = *(void *)(v0 + 120);
  uint64_t v6 = *(void *)(v0 + 96);
  uint64_t v5 = *(void *)(v0 + 104);

  v2(v4, v6 + v3, v5);
  id v7 = v1;
  id v8 = v1;
  os_log_type_t v9 = sub_24334A590();
  os_log_type_t v10 = sub_24334A7D0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = *(void **)(v0 + 200);
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 138412290;
    id v14 = v11;
    uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 40) = v15;
    sub_24334A820();
    *uint64_t v13 = v15;

    _os_log_impl(&dword_243318000, v9, v10, "caught err %@, returning public", v12, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93300);
    swift_arrayDestroy();
    MEMORY[0x24567AB80](v13, -1, -1);
    MEMORY[0x24567AB80](v12, -1, -1);
  }
  else
  {
    uint64_t v16 = *(void **)(v0 + 200);
  }
  uint64_t v17 = *(NSObject **)(v0 + 200);
  uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v0 + 168);
  uint64_t v19 = *(void *)(v0 + 120);
  uint64_t v20 = *(void *)(v0 + 104);

  v18(v19, v20);
  sub_24331FCB8();
  swift_allocError();
  sub_24331C07C(v17, v21);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v22 = *(uint64_t (**)(void))(v0 + 8);
  return v22();
}

uint64_t DockAccessory.setLimits(_:)(uint64_t a1)
{
  uint64_t v2 = sub_24334A5B0();
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = MEMORY[0x270FA5388](v2);
  uint64_t v103 = (char *)&v74 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v74 - v6;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93670);
  uint64_t v9 = MEMORY[0x270FA5388](v8 - 8);
  int v77 = (char *)&v74 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = MEMORY[0x270FA5388](v9);
  double v78 = (char *)&v74 - v12;
  uint64_t v13 = MEMORY[0x270FA5388](v11);
  uint64_t v82 = (char *)&v74 - v14;
  uint64_t v15 = MEMORY[0x270FA5388](v13);
  uint64_t v17 = (char *)&v74 - v16;
  uint64_t v18 = MEMORY[0x270FA5388](v15);
  uint64_t v20 = (char *)&v74 - v19;
  MEMORY[0x270FA5388](v18);
  uint64_t v22 = (char *)&v74 - v21;
  uint64_t v23 = *(void *)a1;
  uint64_t v95 = *(void *)(a1 + 8);
  uint64_t v96 = v23;
  uint64_t v94 = *(void *)(a1 + 16);
  int v93 = *(unsigned __int8 *)(a1 + 24);
  uint64_t v24 = *(void *)(a1 + 40);
  uint64_t v89 = *(void *)(a1 + 32);
  uint64_t v90 = v24;
  uint64_t v91 = *(void *)(a1 + 48);
  int v98 = *(unsigned __int8 *)(a1 + 56);
  uint64_t v85 = *(void *)(a1 + 64);
  uint64_t v84 = *(void *)(a1 + 72);
  uint64_t v83 = *(void *)(a1 + 80);
  int v92 = *(unsigned __int8 *)(a1 + 88);
  uint64_t v25 = sub_24334A0B0();
  uint64_t v26 = *(void *)(v25 - 8);
  id v27 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v26 + 56);
  uint64_t v28 = v26 + 56;
  uint64_t v101 = v22;
  v27(v22, 1, 1, v25);
  uint64_t v100 = v20;
  v27(v20, 1, 1, v25);
  id v99 = v17;
  uint64_t v81 = v25;
  uint64_t v80 = v27;
  uint64_t v79 = v28;
  v27(v17, 1, 1, v25);
  if (qword_268D932C0 != -1) {
    swift_once();
  }
  uint64_t v29 = qword_268D932C8;
  uint64_t v30 = OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock;
  uint64_t v31 = *(os_unfair_lock_s **)(qword_268D932C8 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock);
  swift_retain();
  os_unfair_lock_lock(v31 + 4);
  swift_release();
  char v32 = *(unsigned char *)(v29 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabled);
  __n128 v33 = *(os_unfair_lock_s **)(v29 + v30);
  swift_retain();
  os_unfair_lock_unlock(v33 + 4);
  swift_release();
  if ((v32 & 1) == 0)
  {
    uint64_t result = sub_24334A8B0();
    __break(1u);
    return result;
  }
  uint64_t v34 = v3 + 16;
  uint64_t v86 = *(void (**)(char *))(v3 + 16);
  id v87 = (char *)v102 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
  v86(v7);
  char v35 = sub_24334A590();
  uint64_t v36 = v3;
  os_log_type_t v37 = sub_24334A7B0();
  BOOL v38 = os_log_type_enabled(v35, v37);
  uint64_t v88 = v36;
  if (v38)
  {
    uint64_t v39 = swift_slowAlloc();
    double v75 = v7;
    uint64_t v40 = v39;
    uint64_t v74 = swift_slowAlloc();
    uint64_t v108 = v74;
    *(_DWORD *)uint64_t v40 = 136446722;
    uint64_t v104 = v96;
    uint64_t v105 = v95;
    uint64_t v106 = v94;
    char v41 = v93;
    char v107 = v93;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93678);
    uint64_t v76 = v34;
    uint64_t v42 = sub_24334A610();
    uint64_t v104 = sub_2433402D0(v42, v43, &v108);
    sub_24334A820();
    swift_bridgeObjectRelease();
    *(_WORD *)(v40 + 12) = 2082;
    uint64_t v104 = v89;
    uint64_t v105 = v90;
    uint64_t v106 = v91;
    char v107 = v98;
    uint64_t v44 = sub_24334A610();
    uint64_t v104 = sub_2433402D0(v44, v45, &v108);
    sub_24334A820();
    swift_bridgeObjectRelease();
    *(_WORD *)(v40 + 22) = 2082;
    uint64_t v104 = v85;
    uint64_t v105 = v84;
    uint64_t v106 = v83;
    char v107 = v92;
    uint64_t v46 = sub_24334A610();
    uint64_t v104 = sub_2433402D0(v46, v47, &v108);
    sub_24334A820();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_243318000, v35, v37, "API: setLimits: %{public}s, %{public}s, %{public}s", (uint8_t *)v40, 0x20u);
    uint64_t v48 = v74;
    swift_arrayDestroy();
    MEMORY[0x24567AB80](v48, -1, -1);
    MEMORY[0x24567AB80](v40, -1, -1);

    double v49 = *(void (**)(char *, uint64_t))(v36 + 8);
    v49(v75, v2);
    uint64_t v50 = v2;
    SPRotation3D v51 = v97;
    if (v41) {
      goto LABEL_6;
    }
LABEL_10:
    sub_24334A510();
    sub_24334A4E0();
    uint64_t v52 = (uint64_t)v82;
    sub_24334A080();
    if (v51) {
      goto LABEL_20;
    }
    uint64_t v53 = (uint64_t)v101;
    sub_243322E58((uint64_t)v101, &qword_268D93670);
    v80((char *)v52, 0, 1, v81);
    sub_243342540(v52, v53, &qword_268D93670);
    if (v98) {
      goto LABEL_7;
    }
    goto LABEL_12;
  }

  double v49 = *(void (**)(char *, uint64_t))(v36 + 8);
  v49(v7, v2);
  uint64_t v50 = v2;
  SPRotation3D v51 = v97;
  if ((v93 & 1) == 0) {
    goto LABEL_10;
  }
LABEL_6:
  if (v98)
  {
LABEL_7:
    if (v92) {
      goto LABEL_16;
    }
LABEL_14:
    sub_24334A510();
    sub_24334A4F0();
    uint64_t v56 = (uint64_t)v77;
    sub_24334A080();
    if (!v51)
    {
      uint64_t v57 = (uint64_t)v99;
      sub_243322E58((uint64_t)v99, &qword_268D93670);
      v80((char *)v56, 0, 1, v81);
      sub_243342540(v56, v57, &qword_268D93670);
      goto LABEL_16;
    }
LABEL_20:
    char v62 = v51;
    ((void (*)(char *, char *, uint64_t))v86)(v103, v87, v50);
    uint64_t v63 = v51;
    double v64 = v51;
    uint64_t v65 = sub_24334A590();
    os_log_type_t v66 = sub_24334A7D0();
    if (os_log_type_enabled(v65, v66))
    {
      uint64_t v67 = (uint8_t *)swift_slowAlloc();
      int v68 = (void *)swift_slowAlloc();
      id v102 = v49;
      *(_DWORD *)uint64_t v67 = 138412290;
      uint64_t v69 = v62;
      uint64_t v70 = v50;
      uint64_t v71 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v104 = v71;
      double v49 = v102;
      sub_24334A820();
      *int v68 = v71;
      uint64_t v50 = v70;

      _os_log_impl(&dword_243318000, v65, v66, "Caught err %@ and returning public", v67, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268D93300);
      swift_arrayDestroy();
      MEMORY[0x24567AB80](v68, -1, -1);
      MEMORY[0x24567AB80](v67, -1, -1);
    }
    else
    {
    }
    v49(v103, v50);
    sub_24331FCB8();
    swift_allocError();
    sub_24331C07C(v62, v72);
    swift_willThrow();

    goto LABEL_24;
  }
LABEL_12:
  sub_24334A510();
  sub_24334A500();
  uint64_t v54 = (uint64_t)v78;
  sub_24334A080();
  if (v51) {
    goto LABEL_20;
  }
  uint64_t v55 = (uint64_t)v100;
  sub_243322E58((uint64_t)v100, &qword_268D93670);
  v80((char *)v54, 0, 1, v81);
  sub_243342540(v54, v55, &qword_268D93670);
  if ((v92 & 1) == 0) {
    goto LABEL_14;
  }
LABEL_16:
  id v58 = (void **)((char *)v102 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  char v59 = *v58;
  if (v59)
  {
    swift_endAccess();
    id v60 = v59;
    id v61 = (void *)sub_24334A110();

    if (v61)
    {
      sub_24334A2F0();
      if (v51)
      {

        goto LABEL_20;
      }
    }
LABEL_24:
    sub_243322E58((uint64_t)v99, &qword_268D93670);
    sub_243322E58((uint64_t)v100, &qword_268D93670);
    return sub_243322E58((uint64_t)v101, &qword_268D93670);
  }
  sub_243322E58((uint64_t)v99, &qword_268D93670);
  sub_243322E58((uint64_t)v100, &qword_268D93670);
  sub_243322E58((uint64_t)v101, &qword_268D93670);
  return swift_endAccess();
}

void sub_243330684(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void (*a5)(uint64_t, uint64_t), void (*a6)(uint64_t, uint64_t))
{
  uint64_t v11 = OBJC_IVAR____TtC7DockKit13DockAccessory_helper;
  if (*(void *)(v6 + OBJC_IVAR____TtC7DockKit13DockAccessory_helper)
    || (id v12 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DockAccessoryHelper(0)), sel_init),
        uint64_t v13 = *(void **)(v6 + v11),
        *(void *)(v6 + v11) = v12,
        v13,
        *(void *)(v6 + v11)))
  {
    swift_unknownObjectWeakAssign();
    uint64_t v14 = *(void *)(v6 + v11);
    if (v14)
    {
      uint64_t v15 = (uint64_t *)(v14 + *a4);
      uint64_t v16 = *v15;
      uint64_t v17 = v15[1];
      *uint64_t v15 = a2;
      v15[1] = a3;
      a5(a2, a3);
      a6(v16, v17);
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_243330790(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[5] = a4;
  uint64_t v5 = sub_24334A5B0();
  v4[6] = v5;
  v4[7] = *(void *)(v5 - 8);
  v4[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_243330850, 0, 0);
}

uint64_t sub_243330850()
{
  (*(void (**)(void, uint64_t, void))(v0[7] + 16))(v0[8], v0[5] + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v0[6]);
  uint64_t v1 = sub_24334A590();
  os_log_type_t v2 = sub_24334A7D0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_243318000, v1, v2, "Stopping event feedback", v3, 2u);
    MEMORY[0x24567AB80](v3, -1, -1);
  }
  uint64_t v5 = v0[7];
  uint64_t v4 = v0[8];
  uint64_t v7 = v0[5];
  uint64_t v6 = v0[6];

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  uint64_t v8 = (void **)(v7 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  uint64_t v9 = *v8;
  v0[9] = *v8;
  if (v9)
  {
    uint64_t v13 = (uint64_t (*)(void))((int)*MEMORY[0x263F3A810] + MEMORY[0x263F3A810]);
    v9;
    uint64_t v10 = (void *)swift_task_alloc();
    v0[10] = v10;
    *uint64_t v10 = v0;
    v10[1] = sub_243330A40;
    return v13();
  }
  else
  {
    swift_task_dealloc();
    id v12 = (uint64_t (*)(void))v0[1];
    return v12();
  }
}

uint64_t sub_243330A40()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 88) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_243330B84, 0, 0);
  }
  else
  {

    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_243330B84()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_243330BF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93BB0);
  v5[7] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v5[8] = v7;
  v5[9] = *(void *)(v7 + 64);
  v5[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_243330CBC, 0, 0);
}

uint64_t sub_243330CBC()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[7];
  uint64_t v3 = v0[8];
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[6];
  uint64_t v6 = (void **)(v4 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  uint64_t v7 = *v6;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v5, v2);
  unint64_t v8 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v9 = swift_allocObject();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v9 + v8, v1, v2);
  id v10 = v7;
  sub_243330684((uint64_t)v7, (uint64_t)sub_243349BA0, v9, &OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_eventCallback, (void (*)(uint64_t, uint64_t))sub_243349D44, (void (*)(uint64_t, uint64_t))sub_243349D40);

  swift_release();
  uint64_t v11 = *(void **)(v4 + OBJC_IVAR____TtC7DockKit13DockAccessory_helper);
  v0[11] = v11;
  if (v11)
  {
    id v12 = *v6;
    v0[12] = *v6;
    if (v12)
    {
      uint64_t v19 = (uint64_t (*)(id))((int)*MEMORY[0x263F3A818] + MEMORY[0x263F3A818]);
      v12;
      id v13 = v11;
      uint64_t v14 = (void *)swift_task_alloc();
      v0[13] = v14;
      void *v14 = v0;
      v14[1] = sub_243330F34;
      return v19(v13);
    }
  }
  else
  {
    sub_24331FCB8();
    uint64_t v16 = (void *)swift_allocError();
    *uint64_t v17 = 2;
    swift_willThrow();
    sub_24334A760();
  }
  swift_task_dealloc();
  uint64_t v18 = (uint64_t (*)(void))v0[1];
  return v18();
}

uint64_t sub_243330F34()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 112) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24333107C, 0, 0);
  }
  else
  {
    uint64_t v3 = *(void **)(v2 + 96);

    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v2 + 8);
    return v4();
  }
}

uint64_t sub_24333107C()
{
  uint64_t v1 = *(void **)(v0 + 96);

  uint64_t v2 = *(void **)(v0 + 112);
  sub_24334A760();

  swift_task_dealloc();
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

void sub_2433310FC(void *a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93BC8);
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  id v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!a1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93BB0);
    sub_24334A760();
    return;
  }
  id v11 = a1;
  int v12 = sub_24334A390();
  uint64_t v13 = sub_24334A380();
  uint64_t v14 = *(void *)(v13 + 16);
  if (v14)
  {
    id v25 = v11;
    int v26 = a3;
    sub_24334A3B0();
    int v27 = v12;
    uint64_t v15 = 0;
    uint64_t v24 = v8;
    uint64_t v16 = (void (**)(char *, uint64_t))(v8 + 8);
    do
    {
      uint64_t v17 = v7;
      uint64_t v18 = a4;
      double v19 = *(double *)(v13 + 8 * v15++ + 32);
      BOOL v20 = v27 == sub_24334A340();
      double v28 = v19;
      a4 = v18;
      uint64_t v7 = v17;
      char v29 = v20;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268D93BB0);
      sub_24334A750();
      (*v16)(v10, v17);
    }
    while (v14 != v15);
    swift_bridgeObjectRelease();
    LOBYTE(a3) = v26;
    LOBYTE(v12) = v27;
    uint64_t v8 = v24;
    id v11 = v25;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  sub_24334A3B0();
  if (sub_24334A370() == v12)
  {
    double v28 = 0.0;
    char v21 = 0x80;
LABEL_15:
    char v29 = v21;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93BB0);
    sub_24334A750();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    goto LABEL_16;
  }
  if (sub_24334A350() == v12)
  {
    *(void *)&double v28 = 1;
    char v21 = 0x80;
    goto LABEL_15;
  }
  if (sub_24334A360() == v12)
  {
    unsigned __int16 v22 = sub_24334A3A0();
    if ((v22 & 0x8000) != 0)
    {
      __break(1u);
      return;
    }
    double v28 = (double)v22 / 100.0;
    char v21 = 64;
    goto LABEL_15;
  }
LABEL_16:
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93BB0);
    sub_24334A760();
  }
}

uint64_t sub_2433313AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[6] = a4;
  uint64_t v5 = sub_24334A5B0();
  v4[7] = v5;
  v4[8] = *(void *)(v5 - 8);
  v4[9] = swift_task_alloc();
  v4[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24333147C, 0, 0);
}

uint64_t sub_24333147C()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[7];
  uint64_t v3 = v0[8];
  uint64_t v4 = v0[6];
  uint64_t v5 = OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
  v0[11] = OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[12] = v6;
  v0[13] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v6(v1, v4 + v5, v2);
  uint64_t v7 = sub_24334A590();
  os_log_type_t v8 = sub_24334A7D0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_243318000, v7, v8, "Stopping battery states", v9, 2u);
    MEMORY[0x24567AB80](v9, -1, -1);
  }
  uint64_t v10 = v0[10];
  uint64_t v11 = v0[7];
  uint64_t v12 = v0[8];
  uint64_t v13 = v0[6];

  uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
  v0[14] = v14;
  v0[15] = (v12 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v14(v10, v11);
  uint64_t v15 = (void **)(v13 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  uint64_t v16 = *v15;
  v0[16] = *v15;
  if (v16)
  {
    BOOL v20 = (uint64_t (*)(void))((int)*MEMORY[0x263F3A808] + MEMORY[0x263F3A808]);
    v16;
    uint64_t v17 = (void *)swift_task_alloc();
    v0[17] = v17;
    *uint64_t v17 = v0;
    v17[1] = sub_243331694;
    return v20();
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    double v19 = (uint64_t (*)(void))v0[1];
    return v19();
  }
}

uint64_t sub_243331694()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 144) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_2433317E0, 0, 0);
  }
  else
  {

    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_2433317E0()
{
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = *(void **)(v0 + 144);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 96);
  uint64_t v4 = *(void *)(v0 + 88);
  uint64_t v5 = *(void *)(v0 + 72);
  uint64_t v6 = *(void *)(v0 + 56);

  v3(v5, v1 + v4, v6);
  id v7 = v2;
  id v8 = v2;
  uint64_t v9 = sub_24334A590();
  os_log_type_t v10 = sub_24334A7C0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = *(void **)(v0 + 144);
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 138412290;
    id v14 = v11;
    uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 40) = v15;
    sub_24334A820();
    *uint64_t v13 = v15;

    _os_log_impl(&dword_243318000, v9, v10, "Failed stopping battery states: %@", v12, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93300);
    swift_arrayDestroy();
    MEMORY[0x24567AB80](v13, -1, -1);
    MEMORY[0x24567AB80](v12, -1, -1);
  }
  else
  {
    uint64_t v16 = *(void **)(v0 + 144);
  }
  (*(void (**)(void, void))(v0 + 112))(*(void *)(v0 + 72), *(void *)(v0 + 56));
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = *(uint64_t (**)(void))(v0 + 8);
  return v17();
}

uint64_t sub_2433319EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93B58);
  v5[7] = v6;
  uint64_t v7 = *(void *)(v6 - 8);
  v5[8] = v7;
  v5[9] = *(void *)(v7 + 64);
  v5[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_243331AB8, 0, 0);
}

uint64_t sub_243331AB8()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[7];
  uint64_t v3 = v0[8];
  uint64_t v4 = v0[5];
  uint64_t v5 = v0[6];
  uint64_t v6 = (void **)(v4 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  uint64_t v7 = *v6;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v1, v5, v2);
  unint64_t v8 = (*(unsigned __int8 *)(v3 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v4;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v3 + 32))(v9 + v8, v1, v2);
  id v10 = v7;
  swift_retain();
  sub_243330684((uint64_t)v7, (uint64_t)sub_24334970C, v9, &OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_batteryCallback, (void (*)(uint64_t, uint64_t))sub_243349D44, (void (*)(uint64_t, uint64_t))sub_243349D40);

  swift_release();
  uint64_t v11 = *(void **)(v4 + OBJC_IVAR____TtC7DockKit13DockAccessory_helper);
  v0[11] = v11;
  if (v11)
  {
    uint64_t v12 = *v6;
    v0[12] = *v6;
    if (v12)
    {
      BOOL v20 = (uint64_t (*)(id))((int)*MEMORY[0x263F3A820] + MEMORY[0x263F3A820]);
      v12;
      id v13 = v11;
      id v14 = (void *)swift_task_alloc();
      v0[13] = v14;
      void *v14 = v0;
      v14[1] = sub_243331DB4;
      return v20(v13);
    }
    else
    {
      uint64_t v19 = (void *)swift_task_alloc();
      v0[15] = v19;
      void *v19 = v0;
      v19[1] = sub_243331F2C;
      return sub_24333246C();
    }
  }
  else
  {
    sub_24331FCB8();
    uint64_t v16 = (void *)swift_allocError();
    *uint64_t v17 = 2;
    swift_willThrow();
    sub_24334A760();

    swift_task_dealloc();
    uint64_t v18 = (uint64_t (*)(void))v0[1];
    return v18();
  }
}

uint64_t sub_243331DB4()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 112) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24333107C, 0, 0);
  }
  else
  {
    uint64_t v3 = *(void **)(v2 + 96);

    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v2 + 120) = v4;
    *uint64_t v4 = v2;
    v4[1] = sub_243331F2C;
    return sub_24333246C();
  }
}

uint64_t sub_243331F2C()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_243332068, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_243332068()
{
  uint64_t v1 = *(void **)(v0 + 128);
  sub_24334A760();

  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

void sub_2433320DC(void *a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  int v36 = a3;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93B88);
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_24334A5B0();
  uint64_t v13 = *(void *)(v12 - 8);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __n128 v18 = MEMORY[0x270FA5388](v16);
  uint64_t v19 = (char *)&v35 - v17;
  if (a1)
  {
    uint64_t v35 = a5;
    id v20 = a1;
    unint64_t v21 = sub_24334A3D0();
    if (v21 >= 3)
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, a4 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v12);
      int v26 = sub_24334A590();
      os_log_type_t v27 = sub_24334A7D0();
      if (os_log_type_enabled(v26, v27))
      {
        double v28 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)double v28 = 0;
        _os_log_impl(&dword_243318000, v26, v27, "Unknown charge state, default to notCharging", v28, 2u);
        MEMORY[0x24567AB80](v28, -1, -1);
      }

      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
      char v22 = 0;
    }
    else
    {
      char v22 = v21;
    }
    uint64_t v29 = sub_24334A3F0();
    uint64_t v31 = v30;
    sub_24334A3E0();
    uint64_t v33 = v32;
    char v34 = sub_24334A3C0();
    uint64_t v37 = v29;
    uint64_t v38 = v31;
    uint64_t v39 = v33;
    char v40 = v34 & 1;
    char v41 = v22;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93B58);
    sub_24334A750();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    if (v36) {
      sub_24334A760();
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, __n128))(v13 + 16))((char *)&v35 - v17, a4 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v12, v18);
    uint64_t v23 = sub_24334A590();
    os_log_type_t v24 = sub_24334A7C0();
    if (os_log_type_enabled(v23, v24))
    {
      id v25 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)id v25 = 0;
      _os_log_impl(&dword_243318000, v23, v24, "Got nil battery state", v25, 2u);
      MEMORY[0x24567AB80](v25, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v13 + 8))(v19, v12);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93B58);
    sub_24334A760();
  }
}

uint64_t sub_24333246C()
{
  *(void *)(v1 + 72) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D933D0);
  *(void *)(v1 + 80) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_243332500, 0, 0);
}

uint64_t sub_243332500()
{
  uint64_t v1 = v0[9];
  uint64_t v2 = OBJC_IVAR____TtC7DockKit13DockAccessory_accessory;
  v0[11] = OBJC_IVAR____TtC7DockKit13DockAccessory_accessory;
  uint64_t v3 = (void **)(v1 + v2);
  swift_beginAccess();
  uint64_t v4 = *v3;
  v0[12] = *v3;
  if (v4)
  {
    uint64_t v8 = (uint64_t (*)(void))((int)*MEMORY[0x263F3A828] + MEMORY[0x263F3A828]);
    v4;
    uint64_t v5 = (void *)swift_task_alloc();
    v0[13] = v5;
    *uint64_t v5 = v0;
    v5[1] = sub_243332628;
    return v8();
  }
  else
  {
    swift_task_dealloc();
    uint64_t v7 = (uint64_t (*)(void))v0[1];
    return v7();
  }
}

uint64_t sub_243332628(uint64_t a1)
{
  uint64_t v3 = *v2;
  *(void *)(v3 + 112) = a1;
  *(void *)(v3 + 120) = v1;
  swift_task_dealloc();
  if (v1)
  {
    uint64_t v4 = sub_243332B8C;
  }
  else
  {

    uint64_t v4 = sub_243332744;
  }
  return MEMORY[0x270FA2498](v4, 0, 0);
}

uint64_t sub_243332744()
{
  uint64_t v35 = *(void **)(v0[9] + v0[11]);
  if (v35)
  {
    unint64_t v1 = v0[14];
    if (v1 >> 62)
    {
LABEL_25:
      id v28 = v35;
      swift_bridgeObjectRetain();
      uint64_t v2 = sub_24334A8C0();
      swift_bridgeObjectRelease();
      if (v2) {
        goto LABEL_4;
      }
    }
    else
    {
      uint64_t v2 = *(void *)((v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
      id v3 = v35;
      if (v2)
      {
LABEL_4:
        uint64_t v4 = 0;
        uint64_t v5 = v0[9];
        uint64_t v34 = v0[14] + 32;
        uint64_t v37 = OBJC_IVAR____TtC7DockKit13DockAccessory_helper;
        unint64_t v38 = v1 & 0xC000000000000001;
        uint64_t v31 = v2;
        uint64_t v30 = v5;
        do
        {
          if (v38) {
            id v6 = (id)MEMORY[0x24567A440](v4, v0[14]);
          }
          else {
            id v6 = *(id *)(v34 + 8 * v4);
          }
          uint64_t v7 = v6;
          uint64_t v8 = v4 + 1;
          if (__OFADD__(v4, 1))
          {
            __break(1u);
            goto LABEL_25;
          }
          uint64_t v9 = *(void **)(v5 + v37);
          if (v9)
          {
            id v10 = v35;
            uint64_t v11 = v9;
            uint64_t v12 = (void *)sub_24334A000();

            unint64_t v1 = (unint64_t)&v11[OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_trackingStand];
            uint64_t v13 = (void *)MEMORY[0x24567AC40](&v11[OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_trackingStand]);

            if (v13)
            {
              int v36 = v12;
              uint64_t result = MEMORY[0x24567AC40](v1);
              if (!result)
              {
                __break(1u);
                return result;
              }
              uint64_t v15 = (void *)result;
              uint64_t v16 = (void *)sub_24334A000();

              sub_243349F20();
              unint64_t v1 = sub_24334A7F0();

              if (v1)
              {
                uint64_t v17 = v0[10];
                uint64_t v18 = sub_24334A730();
                uint64_t v19 = *(void *)(v18 - 8);
                (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 56))(v17, 1, 1, v18);
                id v20 = (void *)swift_allocObject();
                v20[2] = 0;
                unint64_t v21 = v20 + 2;
                v20[3] = 0;
                v20[4] = v11;
                v20[5] = v7;
                uint64_t v32 = v19;
                LODWORD(v19) = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18);
                char v22 = v11;
                id v33 = v7;
                uint64_t v23 = v0[10];
                if (v19 == 1)
                {
                  sub_243322E58(v0[10], &qword_268D933D0);
                  if (*v21) {
                    goto LABEL_17;
                  }
LABEL_20:
                  uint64_t v24 = 0;
                  uint64_t v26 = 0;
                }
                else
                {
                  sub_24334A720();
                  (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v23, v18);
                  if (!*v21) {
                    goto LABEL_20;
                  }
LABEL_17:
                  swift_getObjectType();
                  swift_unknownObjectRetain();
                  uint64_t v24 = sub_24334A710();
                  uint64_t v26 = v25;
                  swift_unknownObjectRelease();
                }
                uint64_t v5 = v30;
                uint64_t v27 = swift_allocObject();
                *(void *)(v27 + 16) = &unk_268D93B78;
                *(void *)(v27 + 24) = v20;
                __swift_instantiateConcreteTypeFromMangledName(&qword_268D93A10);
                if (v26 | v24)
                {
                  v0[2] = 0;
                  v0[3] = 0;
                  v0[4] = v24;
                  v0[5] = v26;
                }
                unint64_t v1 = swift_task_create();

                swift_release();
                uint64_t v2 = v31;
                goto LABEL_6;
              }
            }
          }
          else
          {
          }
LABEL_6:
          ++v4;
        }
        while (v8 != v2);
      }
    }
  }
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  uint64_t v29 = (uint64_t (*)(void))v0[1];
  return v29();
}

uint64_t sub_243332B8C()
{
  swift_task_dealloc();
  unint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_243332BFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93B20);
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D933D0);
  MEMORY[0x270FA5388](v9 - 8);
  uint64_t v11 = (char *)&v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_24334A740();
  uint64_t v12 = sub_24334A730();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 1, 1, v12);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v13 = (*(unsigned __int8 *)(v7 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v14 = (char *)swift_allocObject();
  *((void *)v14 + 2) = 0;
  *((void *)v14 + 3) = 0;
  *((void *)v14 + 4) = a2;
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(&v14[v13], (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  *(void *)&v14[(v8 + v13 + 7) & 0xFFFFFFFFFFFFFFF8] = a3;
  swift_retain();
  swift_bridgeObjectRetain();
  sub_243323308((uint64_t)v11, (uint64_t)&unk_268D93B30, (uint64_t)v14);
  return swift_release();
}

uint64_t sub_243332E20(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D933D0);
  MEMORY[0x270FA5388](v3 - 8);
  uint64_t v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_24334A730();
  uint64_t v7 = *(void *)(v6 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v7 + 56))(v5, 1, 1, v6);
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = a2;
  int v9 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
  swift_retain();
  if (v9 == 1)
  {
    sub_243322E58((uint64_t)v5, &qword_268D933D0);
  }
  else
  {
    sub_24334A720();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
    if (v8[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v10 = sub_24334A710();
      uint64_t v12 = v11;
      swift_unknownObjectRelease();
      if (v12 | v10)
      {
        v14[0] = 0;
        v14[1] = 0;
        v14[2] = v10;
        v14[3] = v12;
      }
    }
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_24333303C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[5] = a4;
  uint64_t v5 = sub_24334A5B0();
  v4[6] = v5;
  v4[7] = *(void *)(v5 - 8);
  v4[8] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2433330FC, 0, 0);
}

uint64_t sub_2433330FC()
{
  (*(void (**)(void, uint64_t, void))(v0[7] + 16))(v0[8], v0[5] + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v0[6]);
  unint64_t v1 = sub_24334A590();
  os_log_type_t v2 = sub_24334A7D0();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl(&dword_243318000, v1, v2, "Stopping actuator feedback", v3, 2u);
    MEMORY[0x24567AB80](v3, -1, -1);
  }
  uint64_t v5 = v0[7];
  uint64_t v4 = v0[8];
  uint64_t v7 = v0[5];
  uint64_t v6 = v0[6];

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  uint64_t v8 = (id *)(v7 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (*v8 && (v9 = *v8, uint64_t v10 = sub_24334A110(), v0[9] = v10, v9, v10))
  {
    uint64_t v11 = (void *)swift_task_alloc();
    v0[10] = v11;
    *uint64_t v11 = v0;
    v11[1] = sub_2433332E0;
    return MEMORY[0x270F269D8]();
  }
  else
  {
    swift_task_dealloc();
    uint64_t v12 = (uint64_t (*)(void))v0[1];
    return v12();
  }
}

uint64_t sub_2433332E0()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 88) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_243349D3C, 0, 0);
  }
  else
  {

    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_243333424(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[17] = a5;
  v6[18] = a6;
  v6[16] = a4;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93B38);
  v6[19] = v7;
  v6[20] = *(void *)(v7 - 8);
  v6[21] = swift_task_alloc();
  uint64_t v8 = sub_24334A5B0();
  v6[22] = v8;
  v6[23] = *(void *)(v8 - 8);
  v6[24] = swift_task_alloc();
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93B20);
  v6[25] = v9;
  uint64_t v10 = *(void *)(v9 - 8);
  v6[26] = v10;
  v6[27] = *(void *)(v10 + 64);
  v6[28] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_2433335B0, 0, 0);
}

uint64_t sub_2433335B0()
{
  os_log_type_t v66 = v0;
  uint64_t v2 = v0 + 16;
  uint64_t v1 = v0[16];
  uint64_t v3 = v0[28];
  uint64_t v4 = v0[25];
  uint64_t v5 = v0[26];
  uint64_t v6 = v0[17];
  uint64_t v7 = (void **)(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  uint64_t v8 = *v7;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v6, v4);
  unint64_t v9 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v10 = swift_allocObject();
  unint64_t v11 = v10 + v9;
  uint64_t v12 = v1;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v5 + 32))(v11, v3, v4);
  id v13 = v8;
  sub_243330684((uint64_t)v8, (uint64_t)sub_243349318, v10, &OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_feedbackCallback, (void (*)(uint64_t, uint64_t))sub_243349D44, (void (*)(uint64_t, uint64_t))sub_243349D40);

  swift_release();
  uint64_t v14 = OBJC_IVAR____TtC7DockKit13DockAccessory_helper;
  if (*(void *)(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory_helper))
  {
    uint64_t v15 = *v7;
    uint64_t v16 = v61;
    if (v15)
    {
      id v17 = v15;
      uint64_t v18 = sub_24334A110();
      v61[29] = v18;

      if (v18)
      {
        char v22 = *(void **)(v12 + v14);
        v61[30] = v22;
        if (v22)
        {
          id v23 = v22;
          uint64_t v24 = (void *)swift_task_alloc();
          v61[31] = v24;
          void *v24 = v61;
          v24[1] = sub_243333B38;
          uint64_t v19 = v61[18];
          id v20 = v23;
          uint64_t v21 = 1;
        }
        else
        {
          __break(1u);
        }
        return MEMORY[0x270F269D0](v19, v20, v21);
      }
    }
  }
  else
  {
    sub_24331FCB8();
    uint64_t v25 = swift_allocError();
    *uint64_t v26 = 2;
    swift_willThrow();
    uint64_t v16 = v61;
    uint64_t v28 = v61[23];
    uint64_t v27 = v61[24];
    uint64_t v29 = v61[22];
    uint64_t v30 = v61[16];
    SPVector3DMake(0.0, 0.0, 0.0, (double *)&v62);
    uint64_t v59 = v64;
    uint64_t v60 = v65;
    uint64_t v57 = v62;
    uint64_t v58 = v63;
    SPVector3DMake(0.0, 0.0, 0.0, (double *)&v62);
    uint64_t v55 = v64;
    uint64_t v56 = v65;
    uint64_t v53 = v62;
    uint64_t v54 = v63;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v27, v30 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v29);
    uint64_t v31 = v25;
    uint64_t v32 = v25;
    id v33 = sub_24334A590();
    os_log_type_t v34 = sub_24334A7D0();
    if (os_log_type_enabled(v33, v34))
    {
      uint64_t v35 = (uint8_t *)swift_slowAlloc();
      SPRotation3D v51 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v35 = 138412290;
      int v36 = v25;
      uint64_t v37 = _swift_stdlib_bridgeErrorToNSError();
      *(v2 - 1) = v37;
      sub_24334A820();
      void *v51 = v37;

      _os_log_impl(&dword_243318000, v33, v34, "Converting private err %@ to public", v35, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268D93300);
      swift_arrayDestroy();
      MEMORY[0x24567AB80](v51, -1, -1);
      MEMORY[0x24567AB80](v35, -1, -1);
    }
    else
    {
    }
    uint64_t v38 = v61[24];
    uint64_t v39 = v61[22];
    uint64_t v40 = v61[23];
    uint64_t v42 = v61[20];
    uint64_t v41 = v61[21];
    uint64_t v52 = v61[19];

    (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v38, v39);
    sub_24331C07C(v25, (char *)&v62);
    LOBYTE(v39) = v62;
    id v43 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF910]), sel_init);
    objc_msgSend(v43, sel_timeIntervalSinceNow);
    uint64_t v45 = v44;

    uint64_t v46 = (void *)swift_allocError();
    *unint64_t v47 = v39;
    v61[4] = v59;
    v61[5] = v60;
    v61[2] = v57;
    v61[3] = v58;
    v61[8] = v55;
    v61[9] = v56;
    v61[6] = v53;
    v61[7] = v54;
    v61[10] = v45;
    v61[11] = v46;
    id v48 = v46;
    sub_24334A750();
    (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v41, v52);
    sub_24334A760();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  double v49 = (uint64_t (*)(void))v16[1];
  return v49();
}

uint64_t sub_243333B38()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 256) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_243333C98, 0, 0);
  }
  else
  {
    uint64_t v3 = *(void **)(v2 + 232);

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = *(uint64_t (**)(void))(v2 + 8);
    return v4();
  }
}

uint64_t sub_243333C98()
{
  uint64_t v41 = v0;
  uint64_t v1 = *(void **)(v0 + 232);

  uint64_t v2 = *(void *)(v0 + 128);
  uint64_t v3 = *(NSObject **)(v0 + 256);
  uint64_t v5 = *(void *)(v0 + 184);
  uint64_t v4 = *(void *)(v0 + 192);
  uint64_t v6 = *(void *)(v0 + 176);
  SPVector3DMake(0.0, 0.0, 0.0, (double *)&v37);
  uint64_t v33 = v38;
  uint64_t v34 = v39;
  uint64_t v35 = v37;
  uint64_t v36 = v40;
  SPVector3DMake(0.0, 0.0, 0.0, (double *)&v37);
  uint64_t v31 = v39;
  uint64_t v32 = v40;
  uint64_t v29 = v37;
  uint64_t v30 = v38;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v4, v2 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v6);
  uint64_t v7 = v3;
  uint64_t v8 = v3;
  unint64_t v9 = sub_24334A590();
  os_log_type_t v10 = sub_24334A7D0();
  if (os_log_type_enabled(v9, v10))
  {
    unint64_t v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = (void *)swift_slowAlloc();
    *(_DWORD *)unint64_t v11 = 138412290;
    id v13 = v3;
    uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 120) = v14;
    sub_24334A820();
    void *v12 = v14;

    _os_log_impl(&dword_243318000, v9, v10, "Converting private err %@ to public", v11, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93300);
    swift_arrayDestroy();
    MEMORY[0x24567AB80](v12, -1, -1);
    MEMORY[0x24567AB80](v11, -1, -1);
  }
  else
  {
  }
  uint64_t v15 = *(void *)(v0 + 192);
  uint64_t v17 = *(void *)(v0 + 176);
  uint64_t v16 = *(void *)(v0 + 184);
  uint64_t v19 = *(void *)(v0 + 160);
  uint64_t v18 = *(void *)(v0 + 168);
  uint64_t v28 = *(void *)(v0 + 152);

  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
  sub_24331C07C(v3, (char *)&v37);
  LOBYTE(v16) = v37;
  id v20 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF910]), sel_init);
  objc_msgSend(v20, sel_timeIntervalSinceNow);
  uint64_t v22 = v21;

  sub_24331FCB8();
  id v23 = (void *)swift_allocError();
  unsigned char *v24 = v16;
  *(void *)(v0 + 24) = v33;
  *(void *)(v0 + 32) = v34;
  *(void *)(v0 + 16) = v35;
  *(void *)(v0 + 64) = v31;
  *(void *)(v0 + 72) = v32;
  *(void *)(v0 + 40) = v36;
  *(void *)(v0 + 48) = v29;
  *(void *)(v0 + 56) = v30;
  *(void *)(v0 + 80) = v22;
  *(void *)(v0 + 88) = v23;
  id v25 = v23;
  sub_24334A750();
  (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v18, v28);
  sub_24334A760();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v26 = *(uint64_t (**)(void))(v0 + 8);
  return v26();
}

uint64_t sub_24333400C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, int a5, uint64_t a6, double a7)
{
  uint64_t v62 = a6;
  int v61 = a5;
  id v58 = a4;
  uint64_t v54 = a2;
  uint64_t v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93B38);
  uint64_t v59 = *(void *)(v60 - 8);
  MEMORY[0x270FA5388](v60);
  uint64_t v57 = (char *)&v52 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  SPVector3DMake(0.0, 0.0, 0.0, &v66);
  double v11 = v66;
  double v64 = v68;
  double v65 = v67;
  uint64_t v56 = v69;
  SPVector3DMake(0.0, 0.0, 0.0, &v66);
  double v12 = v66;
  double v13 = v67;
  double v63 = v68;
  uint64_t v55 = v69;
  unint64_t v14 = *(void *)(a3 + 16);
  unint64_t v15 = *(void *)(a1 + 16);
  uint64_t v53 = a1;
  if (v14 != v15 || !v15)
  {
LABEL_26:
    if (!v15 || (uint64_t v33 = v54, *(void *)(v54 + 16) != v15))
    {
LABEL_50:
      double v66 = v12;
      double v67 = v13;
      double v68 = v63;
      uint64_t v69 = v55;
      double v70 = v11;
      double v71 = v65;
      double v72 = v64;
      uint64_t v73 = v56;
      double v74 = a7;
      id v75 = v58;
      id v50 = v58;
      __swift_instantiateConcreteTypeFromMangledName(&qword_268D93B20);
      SPRotation3D v51 = v57;
      sub_24334A750();
      uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v59 + 8))(v51, v60);
      if (v61) {
        return sub_24334A760();
      }
      return result;
    }
    sub_24334A510();
    unint64_t v34 = 0;
    uint64_t v35 = (double *)(v33 + 32);
    uint64_t v36 = (uint64_t *)(v53 + 40);
    while (1)
    {
      uint64_t v38 = *(v36 - 1);
      uint64_t v37 = *v36;
      swift_bridgeObjectRetain();
      if (v38 == sub_24334A4E0() && v37 == v39)
      {
        uint64_t result = swift_bridgeObjectRelease_n();
LABEL_39:
        if (v34 >= v15) {
          goto LABEL_54;
        }
        double v13 = *v35;
        goto LABEL_29;
      }
      char v41 = sub_24334A940();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      if (v41) {
        goto LABEL_39;
      }
      uint64_t v42 = *(v36 - 1);
      uint64_t v43 = *v36;
      swift_bridgeObjectRetain();
      if (v42 == sub_24334A500() && v43 == v44) {
        break;
      }
      char v45 = sub_24334A940();
      swift_bridgeObjectRelease();
      uint64_t result = swift_bridgeObjectRelease();
      if (v45) {
        goto LABEL_42;
      }
      uint64_t v46 = *(v36 - 1);
      uint64_t v47 = *v36;
      swift_bridgeObjectRetain();
      if (v46 == sub_24334A4F0() && v47 == v48)
      {
        uint64_t result = swift_bridgeObjectRelease_n();
      }
      else
      {
        char v49 = sub_24334A940();
        swift_bridgeObjectRelease();
        uint64_t result = swift_bridgeObjectRelease();
        if ((v49 & 1) == 0) {
          goto LABEL_29;
        }
      }
      if (v34 >= v15) {
        goto LABEL_58;
      }
      double v63 = *v35;
LABEL_29:
      ++v34;
      ++v35;
      v36 += 2;
      if (v15 == v34) {
        goto LABEL_50;
      }
    }
    uint64_t result = swift_bridgeObjectRelease_n();
LABEL_42:
    if (v34 >= v15) {
      goto LABEL_56;
    }
    double v12 = -*v35;
    goto LABEL_29;
  }
  sub_24334A510();
  unint64_t v16 = 0;
  uint64_t v17 = (double *)(a3 + 32);
  uint64_t v18 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v21 = *(v18 - 1);
    uint64_t v20 = *v18;
    swift_bridgeObjectRetain();
    if (v21 == sub_24334A4E0() && v20 == v22) {
      break;
    }
    char v24 = sub_24334A940();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v24) {
      goto LABEL_17;
    }
    uint64_t v25 = *(v18 - 1);
    uint64_t v26 = *v18;
    swift_bridgeObjectRetain();
    if (v25 == sub_24334A500() && v26 == v27)
    {
      uint64_t result = swift_bridgeObjectRelease_n();
LABEL_20:
      if (v16 >= v14) {
        goto LABEL_55;
      }
      double v11 = -*v17;
      goto LABEL_7;
    }
    char v28 = sub_24334A940();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v28) {
      goto LABEL_20;
    }
    uint64_t v29 = *(v18 - 1);
    uint64_t v30 = *v18;
    swift_bridgeObjectRetain();
    if (v29 == sub_24334A4F0() && v30 == v31)
    {
      uint64_t result = swift_bridgeObjectRelease_n();
LABEL_5:
      if (v16 >= v14) {
        goto LABEL_57;
      }
      double v64 = *v17;
      goto LABEL_7;
    }
    char v32 = sub_24334A940();
    swift_bridgeObjectRelease();
    uint64_t result = swift_bridgeObjectRelease();
    if (v32) {
      goto LABEL_5;
    }
LABEL_7:
    ++v16;
    ++v17;
    v18 += 2;
    if (v14 == v16) {
      goto LABEL_26;
    }
  }
  uint64_t result = swift_bridgeObjectRelease_n();
LABEL_17:
  if (v16 < v14)
  {
    double v65 = *v17;
    goto LABEL_7;
  }
  __break(1u);
LABEL_54:
  __break(1u);
LABEL_55:
  __break(1u);
LABEL_56:
  __break(1u);
LABEL_57:
  __break(1u);
LABEL_58:
  __break(1u);
  return result;
}

uint64_t sub_243334578(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v10 = *(void *)(v9 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D933D0);
  MEMORY[0x270FA5388](v12 - 8);
  unint64_t v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_24334A740();
  uint64_t v15 = sub_24334A730();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56))(v14, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  unint64_t v16 = (*(unsigned __int8 *)(v10 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v17 = (char *)swift_allocObject();
  *((void *)v17 + 2) = 0;
  *((void *)v17 + 3) = 0;
  *((void *)v17 + 4) = a2;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v17[v16], (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  swift_retain();
  sub_243323308((uint64_t)v14, a6, (uint64_t)v17);
  return swift_release();
}

uint64_t sub_243334764(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D933D0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_24334A730();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = a2;
  int v13 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10);
  swift_retain();
  if (v13 == 1)
  {
    sub_243322E58((uint64_t)v9, &qword_268D933D0);
    uint64_t v14 = 0;
    uint64_t v15 = 0;
  }
  else
  {
    sub_24334A720();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v9, v10);
    if (v12[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v14 = sub_24334A710();
      uint64_t v15 = v16;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v14 = 0;
      uint64_t v15 = 0;
    }
  }
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a5;
  *(void *)(v17 + 24) = v12;
  if (v15 | v14)
  {
    v19[0] = 0;
    v19[1] = 0;
    _OWORD v19[2] = v14;
    v19[3] = v15;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_243334998(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[6] = a4;
  uint64_t v5 = sub_24334A5B0();
  v4[7] = v5;
  v4[8] = *(void *)(v5 - 8);
  v4[9] = swift_task_alloc();
  v4[10] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_243334A68, 0, 0);
}

uint64_t sub_243334A68()
{
  uint64_t v1 = v0[10];
  uint64_t v2 = v0[7];
  uint64_t v3 = v0[8];
  uint64_t v4 = v0[6];
  uint64_t v5 = OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
  v0[11] = OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16);
  v0[12] = v6;
  v0[13] = (v3 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v6(v1, v4 + v5, v2);
  uint64_t v7 = sub_24334A590();
  os_log_type_t v8 = sub_24334A7D0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_243318000, v7, v8, "Stopping tracking states", v9, 2u);
    MEMORY[0x24567AB80](v9, -1, -1);
  }
  uint64_t v10 = v0[10];
  uint64_t v11 = v0[7];
  uint64_t v12 = v0[8];
  uint64_t v13 = v0[6];

  uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
  v0[14] = v14;
  v0[15] = (v12 + 8) & 0xFFFFFFFFFFFFLL | 0x4F8000000000000;
  v14(v10, v11);
  uint64_t v15 = (void **)(v13 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  uint64_t v16 = *v15;
  v0[16] = *v15;
  if (v16)
  {
    uint64_t v20 = (uint64_t (*)(void))((int)*MEMORY[0x263F3A830] + MEMORY[0x263F3A830]);
    v16;
    uint64_t v17 = (void *)swift_task_alloc();
    v0[17] = v17;
    *uint64_t v17 = v0;
    v17[1] = sub_243334C80;
    return v20();
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v19 = (uint64_t (*)(void))v0[1];
    return v19();
  }
}

uint64_t sub_243334C80()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 144) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_243334DCC, 0, 0);
  }
  else
  {

    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_243334DCC()
{
  uint64_t v1 = *(void *)(v0 + 48);
  uint64_t v2 = *(void **)(v0 + 144);
  uint64_t v3 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 96);
  uint64_t v4 = *(void *)(v0 + 88);
  uint64_t v5 = *(void *)(v0 + 72);
  uint64_t v6 = *(void *)(v0 + 56);

  v3(v5, v1 + v4, v6);
  id v7 = v2;
  id v8 = v2;
  uint64_t v9 = sub_24334A590();
  os_log_type_t v10 = sub_24334A7C0();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = *(void **)(v0 + 144);
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 138412290;
    id v14 = v11;
    uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 40) = v15;
    sub_24334A820();
    *uint64_t v13 = v15;

    _os_log_impl(&dword_243318000, v9, v10, "Failed stopping tracking states: %@", v12, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93300);
    swift_arrayDestroy();
    MEMORY[0x24567AB80](v13, -1, -1);
    MEMORY[0x24567AB80](v12, -1, -1);
  }
  else
  {
    uint64_t v16 = *(void **)(v0 + 144);
  }
  (*(void (**)(void, void))(v0 + 112))(*(void *)(v0 + 72), *(void *)(v0 + 56));
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = *(uint64_t (**)(void))(v0 + 8);
  return v17();
}

uint64_t sub_243334FD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[6] = a4;
  v5[7] = a5;
  uint64_t v6 = sub_24334A5B0();
  v5[8] = v6;
  v5[9] = *(void *)(v6 - 8);
  v5[10] = swift_task_alloc();
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93AC8);
  v5[11] = v7;
  uint64_t v8 = *(void *)(v7 - 8);
  v5[12] = v8;
  v5[13] = *(void *)(v8 + 64);
  v5[14] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_243335100, 0, 0);
}

uint64_t sub_243335100()
{
  uint64_t v1 = v0 + 6;
  uint64_t v2 = v0[6];
  uint64_t v3 = v0[14];
  uint64_t v4 = v0[11];
  uint64_t v5 = v0[12];
  uint64_t v6 = v0[7];
  uint64_t v7 = (void **)(v2 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  uint64_t v8 = *v7;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(v3, v6, v4);
  unint64_t v9 = (*(unsigned __int8 *)(v5 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v2;
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v5 + 32))(v10 + v9, v3, v4);
  id v11 = v8;
  swift_retain();
  sub_243330684((uint64_t)v8, (uint64_t)sub_243348E9C, v10, &OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_trackingSummaryCallback, (void (*)(uint64_t, uint64_t))sub_243348F88, (void (*)(uint64_t, uint64_t))sub_243322990);

  swift_release();
  uint64_t v12 = *(void **)(v2 + OBJC_IVAR____TtC7DockKit13DockAccessory_helper);
  v1[9] = v12;
  if (v12)
  {
    uint64_t v13 = *v7;
    v33[16] = *v7;
    if (v13)
    {
      char v32 = (uint64_t (*)(id))((int)*MEMORY[0x263F3A838] + MEMORY[0x263F3A838]);
      v13;
      id v14 = v12;
      uint64_t v15 = (void *)swift_task_alloc();
      v33[17] = v15;
      *uint64_t v15 = v33;
      v15[1] = sub_243335598;
      return v32(v14);
    }
    else
    {
      uint64_t v27 = (void *)swift_task_alloc();
      v33[19] = v27;
      *uint64_t v27 = v33;
      v27[1] = sub_243335710;
      return sub_2433365E4();
    }
  }
  else
  {
    sub_24331FCB8();
    uint64_t v17 = (void *)swift_allocError();
    *uint64_t v18 = 2;
    swift_willThrow();
    (*(void (**)(void, uint64_t, void))(v33[9] + 16))(v33[10], v33[6] + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v33[8]);
    id v19 = v17;
    id v20 = v17;
    uint64_t v21 = sub_24334A590();
    os_log_type_t v22 = sub_24334A7C0();
    if (os_log_type_enabled(v21, v22))
    {
      id v23 = (uint8_t *)swift_slowAlloc();
      char v24 = (void *)swift_slowAlloc();
      *(_DWORD *)id v23 = 138412290;
      id v25 = v17;
      uint64_t v26 = _swift_stdlib_bridgeErrorToNSError();
      *(v1 - 1) = v26;
      sub_24334A820();
      void *v24 = v26;

      _os_log_impl(&dword_243318000, v21, v22, "Failed to get tracking Summary: %@", v23, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268D93300);
      swift_arrayDestroy();
      MEMORY[0x24567AB80](v24, -1, -1);
      MEMORY[0x24567AB80](v23, -1, -1);
    }
    else
    {
    }
    uint64_t v28 = v33[10];
    uint64_t v29 = v33[8];
    uint64_t v30 = v33[9];

    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v28, v29);
    sub_24334A760();

    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v31 = (uint64_t (*)(void))v33[1];
    return v31();
  }
}

uint64_t sub_243335598()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 144) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_243335858, 0, 0);
  }
  else
  {
    uint64_t v3 = *(void **)(v2 + 128);

    uint64_t v4 = (void *)swift_task_alloc();
    *(void *)(v2 + 152) = v4;
    *uint64_t v4 = v2;
    v4[1] = sub_243335710;
    return sub_2433365E4();
  }
}

uint64_t sub_243335710()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 160) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_243335A78, 0, 0);
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_243335858()
{
  uint64_t v1 = *(void **)(v0 + 128);

  uint64_t v2 = *(void **)(v0 + 144);
  (*(void (**)(void, uint64_t, void))(*(void *)(v0 + 72) + 16))(*(void *)(v0 + 80), *(void *)(v0 + 48) + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, *(void *)(v0 + 64));
  id v3 = v2;
  id v4 = v2;
  uint64_t v5 = sub_24334A590();
  os_log_type_t v6 = sub_24334A7C0();
  if (os_log_type_enabled(v5, v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    uint64_t v8 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v7 = 138412290;
    id v9 = v2;
    uint64_t v10 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 40) = v10;
    sub_24334A820();
    *uint64_t v8 = v10;

    _os_log_impl(&dword_243318000, v5, v6, "Failed to get tracking Summary: %@", v7, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93300);
    swift_arrayDestroy();
    MEMORY[0x24567AB80](v8, -1, -1);
    MEMORY[0x24567AB80](v7, -1, -1);
  }
  else
  {
  }
  uint64_t v11 = *(void *)(v0 + 80);
  uint64_t v12 = *(void *)(v0 + 64);
  uint64_t v13 = *(void *)(v0 + 72);

  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  sub_24334A760();

  swift_task_dealloc();
  swift_task_dealloc();
  id v14 = *(uint64_t (**)(void))(v0 + 8);
  return v14();
}

uint64_t sub_243335A78()
{
  uint64_t v1 = (void *)v0[20];
  (*(void (**)(void, uint64_t, void))(v0[9] + 16))(v0[10], v0[6] + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v0[8]);
  id v2 = v1;
  id v3 = v1;
  id v4 = sub_24334A590();
  os_log_type_t v5 = sub_24334A7C0();
  if (os_log_type_enabled(v4, v5))
  {
    os_log_type_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = (void *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v6 = 138412290;
    id v8 = v1;
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    v0[5] = v9;
    sub_24334A820();
    *uint64_t v7 = v9;

    _os_log_impl(&dword_243318000, v4, v5, "Failed to get tracking Summary: %@", v6, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93300);
    swift_arrayDestroy();
    MEMORY[0x24567AB80](v7, -1, -1);
    MEMORY[0x24567AB80](v6, -1, -1);
  }
  else
  {
  }
  uint64_t v10 = v0[10];
  uint64_t v11 = v0[8];
  uint64_t v12 = v0[9];

  (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v10, v11);
  sub_24334A760();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v13 = (uint64_t (*)(void))v0[1];
  return v13();
}

uint64_t sub_243335C8C(uint64_t a1, unint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6)
{
  uint64_t v101 = a6;
  int v100 = a4;
  uint64_t v9 = sub_24334A5B0();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x270FA5388](v9);
  uint64_t v12 = (char *)&v91 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for DockAccessory.TrackedSubjectType(0);
  uint64_t v113 = *(void *)(v13 - 8);
  uint64_t v114 = v13;
  uint64_t v14 = MEMORY[0x270FA5388](v13);
  uint64_t v16 = (char *)&v91 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v14);
  uint64_t v109 = (char *)&v91 - v17;
  uint64_t v112 = sub_24334A4B0();
  uint64_t v18 = *(void *)(v112 - 8);
  uint64_t v19 = MEMORY[0x270FA5388](v112);
  id v111 = (char *)&v91 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v19);
  uint64_t v110 = (char *)&v91 - v21;
  uint64_t v99 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93AF0);
  uint64_t v98 = *(void *)(v99 - 8);
  MEMORY[0x270FA5388](v99);
  uint64_t v96 = (char *)&v91 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = type metadata accessor for DockAccessory.TrackingState(0);
  uint64_t v24 = MEMORY[0x270FA5388](v23);
  uint64_t v25 = MEMORY[0x270FA5388](v24);
  uint64_t v97 = (char *)&v91 - v27;
  if (a2 >> 60 != 15)
  {
    uint64_t v94 = v25;
    uint64_t v95 = v26;
    id v102 = v16;
    sub_24334A4A0();
    uint64_t v28 = a1;
    sub_243348F98(a1, a2);
    uint64_t v29 = sub_24334A470();
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v92 = v28;
      unint64_t v93 = a2;
      unint64_t v31 = sub_24334A490();
      unint64_t v32 = v31;
      if (v31 >> 62)
      {
        uint64_t result = sub_24334A8C0();
        uint64_t v34 = (uint64_t)v102;
        if (result) {
          goto LABEL_5;
        }
      }
      else
      {
        uint64_t result = *(void *)((v31 & 0xFFFFFFFFFFFFFF8) + 0x10);
        uint64_t v34 = (uint64_t)v102;
        if (result)
        {
LABEL_5:
          uint64_t v91 = v30;
          if (result < 1)
          {
            __break(1u);
            return result;
          }
          uint64_t v35 = 0;
          unint64_t v108 = v32 & 0xC000000000000001;
          unsigned int v107 = *MEMORY[0x263F3A8C0];
          uint64_t v105 = (void (**)(char *, uint64_t))(v18 + 8);
          uint64_t v106 = (void (**)(char *, void, uint64_t))(v18 + 104);
          unint64_t v36 = MEMORY[0x263F8EE78];
          uint64_t v103 = result;
          unint64_t v104 = v32;
          do
          {
            unint64_t v115 = v36;
            if (v108) {
              MEMORY[0x24567A440](v35, v32);
            }
            else {
              swift_retain();
            }
            uint64_t v38 = v110;
            sub_24334A450();
            uint64_t v40 = v111;
            uint64_t v39 = v112;
            (*v106)(v111, v107, v112);
            sub_24334175C(&qword_268D93AF8, MEMORY[0x263F3A8C8]);
            sub_24334A690();
            sub_24334A690();
            uint64_t v42 = v116;
            uint64_t v41 = v117;
            uint64_t v43 = *v105;
            (*v105)(v40, v39);
            v43(v38, v39);
            if (v41 == v42)
            {
              uint64_t v44 = v109;
              sub_24334A400();
              sub_24334A440();
              uint64_t v46 = v45;
              uint64_t v48 = v47;
              uint64_t v50 = v49;
              uint64_t v52 = v51;
              uint64_t v53 = sub_24334A410();
              char v55 = v54;
              uint64_t v56 = sub_24334A420();
              char v58 = v57;
              uint64_t v59 = sub_24334A430();
              char v61 = v60;
              uint64_t v62 = (int *)type metadata accessor for DockAccessory.TrackedPerson(0);
              double v63 = &v44[v62[5]];
              *(void *)double v63 = v46;
              *((void *)v63 + 1) = v48;
              *((void *)v63 + 2) = v50;
              *((void *)v63 + 3) = v52;
              double v64 = &v44[v62[6]];
              *(void *)double v64 = v53;
              v64[8] = v55 & 1;
              double v65 = &v44[v62[7]];
              *(void *)double v65 = v56;
              v65[8] = v58 & 1;
              double v66 = &v44[v62[8]];
              *(void *)double v66 = v59;
              v66[8] = v61 & 1;
              swift_storeEnumTagMultiPayload();
              unint64_t v36 = v115;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                unint64_t v36 = sub_24331FA50(0, *(void *)(v36 + 16) + 1, 1, v36);
              }
              uint64_t v67 = v103;
              unint64_t v32 = v104;
              unint64_t v69 = *(void *)(v36 + 16);
              unint64_t v68 = *(void *)(v36 + 24);
              unint64_t v70 = v69 + 1;
              uint64_t v34 = (uint64_t)v102;
              if (v69 >= v68 >> 1) {
                unint64_t v36 = sub_24331FA50(v68 > 1, v69 + 1, 1, v36);
              }
              uint64_t v37 = (uint64_t)v109;
            }
            else
            {
              sub_24334A400();
              sub_24334A440();
              uint64_t v72 = v71;
              uint64_t v74 = v73;
              uint64_t v76 = v75;
              uint64_t v78 = v77;
              uint64_t v79 = sub_24334A410();
              char v81 = v80;
              uint64_t v82 = type metadata accessor for DockAccessory.TrackedObject(0);
              uint64_t v83 = (void *)(v34 + *(int *)(v82 + 20));
              *uint64_t v83 = v72;
              v83[1] = v74;
              v83[2] = v76;
              v83[3] = v78;
              uint64_t v84 = v34 + *(int *)(v82 + 24);
              *(void *)uint64_t v84 = v79;
              *(unsigned char *)(v84 + 8) = v81 & 1;
              swift_storeEnumTagMultiPayload();
              unint64_t v36 = v115;
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
                unint64_t v36 = sub_24331FA50(0, *(void *)(v36 + 16) + 1, 1, v36);
              }
              uint64_t v67 = v103;
              unint64_t v32 = v104;
              unint64_t v69 = *(void *)(v36 + 16);
              unint64_t v85 = *(void *)(v36 + 24);
              unint64_t v70 = v69 + 1;
              if (v69 >= v85 >> 1) {
                unint64_t v36 = sub_24331FA50(v85 > 1, v69 + 1, 1, v36);
              }
              uint64_t v37 = v34;
            }
            ++v35;
            *(void *)(v36 + 16) = v70;
            sub_243342184(v37, v36+ ((*(unsigned __int8 *)(v113 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v113 + 80))+ *(void *)(v113 + 72) * v69, type metadata accessor for DockAccessory.TrackedSubjectType);
            swift_release();
          }
          while (v67 != v35);
          swift_bridgeObjectRelease();
          goto LABEL_29;
        }
      }
      swift_bridgeObjectRelease();
      unint64_t v36 = MEMORY[0x263F8EE78];
LABEL_29:
      uint64_t v89 = (uint64_t)v97;
      sub_24334A460();
      *(void *)(v89 + *(int *)(v94 + 20)) = v36;
      sub_2433417A4(v89, v95, type metadata accessor for DockAccessory.TrackingState);
      __swift_instantiateConcreteTypeFromMangledName(&qword_268D93AC8);
      uint64_t v90 = v96;
      sub_24334A750();
      (*(void (**)(char *, uint64_t))(v98 + 8))(v90, v99);
      if (v100)
      {
        sub_24334A760();
        sub_243348A20(v92, v93);
        swift_release();
        return sub_243342124(v89, type metadata accessor for DockAccessory.TrackingState);
      }
      else
      {
        sub_243342124(v89, type metadata accessor for DockAccessory.TrackingState);
        sub_243348A20(v92, v93);
        return swift_release();
      }
    }
    sub_243348A20(a1, a2);
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))(v12, a5 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v9);
  uint64_t v86 = sub_24334A590();
  os_log_type_t v87 = sub_24334A7C0();
  if (os_log_type_enabled(v86, v87))
  {
    uint64_t v88 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v88 = 0;
    _os_log_impl(&dword_243318000, v86, v87, "Got nil tracking trackingSummary", v88, 2u);
    MEMORY[0x24567AB80](v88, -1, -1);
  }

  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D93AC8);
  return sub_24334A760();
}

uint64_t sub_2433365E4()
{
  *(void *)(v1 + 40) = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D933D0);
  *(void *)(v1 + 48) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_243336678, 0, 0);
}

uint64_t sub_243336678()
{
  uint64_t v1 = v0[5];
  uint64_t v2 = OBJC_IVAR____TtC7DockKit13DockAccessory_accessory;
  v0[7] = OBJC_IVAR____TtC7DockKit13DockAccessory_accessory;
  uint64_t v3 = (void **)(v1 + v2);
  swift_beginAccess();
  id v4 = *v3;
  v0[8] = *v3;
  if (v4)
  {
    id v8 = (uint64_t (*)(void))((int)*MEMORY[0x263F3A840] + MEMORY[0x263F3A840]);
    v4;
    os_log_type_t v5 = (void *)swift_task_alloc();
    v0[9] = v5;
    *os_log_type_t v5 = v0;
    v5[1] = sub_2433367A0;
    return v8();
  }
  else
  {
    swift_task_dealloc();
    uint64_t v7 = (uint64_t (*)(void))v0[1];
    return v7();
  }
}

uint64_t sub_2433367A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *v3;
  *(void *)(v4 + 80) = a1;
  *(void *)(v4 + 88) = a2;
  *(void *)(v4 + 96) = v2;
  swift_task_dealloc();
  if (v2)
  {
    os_log_type_t v5 = sub_243336AF0;
  }
  else
  {

    os_log_type_t v5 = sub_2433368C0;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_2433368C0()
{
  if (v0[11] >> 60 == 15) {
    goto LABEL_14;
  }
  uint64_t v1 = v0[5];
  uint64_t v2 = *(void **)(v1 + v0[7]);
  if (!v2)
  {
    uint64_t v23 = v0[10];
LABEL_11:
    sub_243348A20(v23, v0[11]);
    goto LABEL_14;
  }
  uint64_t v3 = *(void **)(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory_helper);
  if (!v3)
  {
    uint64_t v23 = v0[10];
    goto LABEL_11;
  }
  id v4 = v2;
  os_log_type_t v5 = v3;
  os_log_type_t v6 = (void *)sub_24334A000();
  uint64_t v7 = (void *)sub_243349E10();
  id v8 = &v5[OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_trackingStand];
  uint64_t v9 = (void *)MEMORY[0x24567AC40](&v5[OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_trackingStand]);

  if (v9)
  {
    uint64_t result = MEMORY[0x24567AC40](v8);
    if (!result)
    {
      __break(1u);
      return result;
    }
    uint64_t v11 = (void *)result;
    uint64_t v12 = (void *)sub_24334A000();

    sub_243349F20();
    char v13 = sub_24334A7F0();

    uint64_t v15 = v0[10];
    unint64_t v14 = v0[11];
    if (v13)
    {
      uint64_t v16 = v0[6];
      uint64_t v25 = sub_243349E20();
      uint64_t v18 = v17;
      uint64_t v19 = sub_24334A730();
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v16, 1, 1, v19);
      uint64_t v20 = (void *)swift_allocObject();
      v20[2] = 0;
      v20[3] = 0;
      v20[4] = v5;
      v20[5] = v25;
      v20[6] = v18;
      os_log_type_t v5 = v5;
      sub_2433234B4(v16, (uint64_t)&unk_268D93AE8, (uint64_t)v20);
      swift_release();
    }
    uint64_t v21 = v15;
    unint64_t v22 = v14;
  }
  else
  {
    uint64_t v21 = v0[10];
    unint64_t v22 = v0[11];
  }
  sub_243348A20(v21, v22);

LABEL_14:
  swift_task_dealloc();
  uint64_t v24 = (uint64_t (*)(void))v0[1];
  return v24();
}

uint64_t sub_243336AF0()
{
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t DockAccessory.track(_:cameraInformation:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 80);
  char v7 = *(unsigned char *)(a2 + 104);
  *(void *)(v2 + 16) = *(void *)a2;
  *(void *)(v2 + 24) = v4;
  *(unsigned char *)(v2 + 32) = v5;
  long long v8 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v2 + 48) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v2 + 64) = v8;
  *(_OWORD *)(v2 + 80) = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(v2 + 96) = v6;
  *(_OWORD *)(v2 + 104) = *(_OWORD *)(a2 + 88);
  *(unsigned char *)(v2 + 120) = v7;
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 128) = v9;
  void *v9 = v2;
  v9[1] = sub_243336C44;
  return sub_243336D78(a1, (uint64_t *)(v2 + 16), 0);
}

{
  uint64_t v2;
  uint64_t v4;
  char v5;
  char v6;
  char v7;
  long long v8;
  void *v9;
  uint64_t v11;

  uint64_t v4 = *(void *)(a2 + 8);
  char v5 = *(unsigned char *)(a2 + 16);
  char v6 = *(unsigned char *)(a2 + 80);
  char v7 = *(unsigned char *)(a2 + 104);
  *(void *)(v2 + 16) = *(void *)a2;
  *(void *)(v2 + 24) = v4;
  *(unsigned char *)(v2 + 32) = v5;
  long long v8 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v2 + 48) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v2 + 64) = v8;
  *(_OWORD *)(v2 + 80) = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(v2 + 96) = v6;
  *(_OWORD *)(v2 + 104) = *(_OWORD *)(a2 + 88);
  *(unsigned char *)(v2 + 120) = v7;
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 128) = v9;
  void *v9 = v2;
  v9[1] = sub_243336C44;
  return sub_2433397B0(a1, (uint64_t *)(v2 + 16), 0);
}

uint64_t sub_243336C44()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 136) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_243349D6C, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_243336D78(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  *(void *)(v4 + 136) = a3;
  *(void *)(v4 + 144) = v3;
  *(void *)(v4 + 128) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D934D0);
  *(void *)(v4 + 152) = swift_task_alloc();
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93820);
  *(void *)(v4 + 160) = v6;
  *(void *)(v4 + 168) = *(void *)(v6 - 8);
  *(void *)(v4 + 176) = swift_task_alloc();
  uint64_t v7 = type metadata accessor for DockAccessory.Observation(0);
  *(void *)(v4 + 184) = v7;
  *(void *)(v4 + 192) = *(void *)(v7 - 8);
  *(void *)(v4 + 200) = swift_task_alloc();
  uint64_t v8 = sub_24334A5B0();
  *(void *)(v4 + 208) = v8;
  *(void *)(v4 + 216) = *(void *)(v8 - 8);
  *(void *)(v4 + 224) = swift_task_alloc();
  uint64_t v9 = swift_task_alloc();
  uint64_t v10 = *a2;
  uint64_t v11 = a2[1];
  *(void *)(v4 + 232) = v9;
  *(void *)(v4 + 240) = v10;
  *(void *)(v4 + 248) = v11;
  *(unsigned char *)(v4 + 408) = *((unsigned char *)a2 + 16);
  long long v12 = *((_OWORD *)a2 + 3);
  *(_OWORD *)(v4 + 256) = *((_OWORD *)a2 + 2);
  *(_OWORD *)(v4 + 272) = v12;
  long long v13 = *((_OWORD *)a2 + 4);
  *(unsigned char *)(v4 + 409) = *((unsigned char *)a2 + 80);
  long long v14 = *(_OWORD *)(a2 + 11);
  *(_OWORD *)(v4 + 288) = v13;
  *(_OWORD *)(v4 + 304) = v14;
  *(unsigned char *)(v4 + 410) = *((unsigned char *)a2 + 104);
  return MEMORY[0x270FA2498](sub_243336F70, 0, 0);
}

uint64_t sub_243336F70()
{
  if (qword_268D932C0 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_268D932C8;
  uint64_t v2 = OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock;
  uint64_t v3 = *(os_unfair_lock_s **)(qword_268D932C8 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock);
  swift_retain();
  os_unfair_lock_lock(v3 + 4);
  swift_release();
  char v4 = *(unsigned char *)(v1 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabled);
  uint64_t v5 = *(os_unfair_lock_s **)(v1 + v2);
  swift_retain();
  os_unfair_lock_unlock(v5 + 4);
  swift_release();
  if ((v4 & 1) == 0) {
    return sub_24334A8B0();
  }
  uint64_t v6 = *(void *)(v0 + 144);
  uint64_t v7 = OBJC_IVAR____TtC7DockKit13DockAccessory__tracking;
  *(void *)(v0 + 320) = OBJC_IVAR____TtC7DockKit13DockAccessory__tracking;
  if ((*(unsigned char *)(v6 + v7) & 1) == 0)
  {
    (*(void (**)(void, uint64_t, void))(*(void *)(v0 + 216) + 16))(*(void *)(v0 + 232), v6 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, *(void *)(v0 + 208));
    uint64_t v8 = sub_24334A590();
    os_log_type_t v9 = sub_24334A7D0();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_243318000, v8, v9, "Starting tracker", v10, 2u);
      MEMORY[0x24567AB80](v10, -1, -1);
    }
    uint64_t v11 = *(void *)(v0 + 232);
    uint64_t v12 = *(void *)(v0 + 208);
    uint64_t v13 = *(void *)(v0 + 216);
    uint64_t v14 = *(void *)(v0 + 144);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
    uint64_t v15 = (void **)(v14 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
    swift_beginAccess();
    uint64_t v16 = *v15;
    *(void *)(v0 + 328) = *v15;
    if (v16)
    {
      uint64_t v109 = (uint64_t (*)(void))((int)*MEMORY[0x263F3A848] + MEMORY[0x263F3A848]);
      v16;
      uint64_t v17 = (void *)swift_task_alloc();
      *(void *)(v0 + 336) = v17;
      *uint64_t v17 = v0;
      v17[1] = sub_243337D68;
      return v109();
    }
    *(unsigned char *)(*(void *)(v0 + 144) + *(void *)(v0 + 320)) = 1;
  }
  uint64_t v19 = *(void *)(v0 + 248);
  id v20 = objc_msgSend(objc_allocWithZone((Class)sub_24334A1E0()), sel_init);
  *(void *)(v0 + 344) = v20;
  sub_243348A38();
  sub_24334A800();
  id v110 = v20;
  sub_24334A1C0();
  if (v19 == 2) {
    goto LABEL_25;
  }
  uint64_t v21 = sub_24334A600();
  uint64_t v23 = v22;
  if (v21 == sub_24334A600() && v23 == v24) {
    goto LABEL_19;
  }
  char v25 = sub_24334A940();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v25)
  {
LABEL_25:
    sub_24334A800();
    sub_24334A1C0();
    goto LABEL_26;
  }
  uint64_t v26 = sub_24334A600();
  uint64_t v28 = v27;
  if (v26 == sub_24334A600() && v28 == v29) {
    goto LABEL_19;
  }
  char v30 = sub_24334A940();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v30) {
    goto LABEL_25;
  }
  uint64_t v31 = sub_24334A600();
  uint64_t v33 = v32;
  if (v31 == sub_24334A600() && v33 == v34)
  {
LABEL_19:
    swift_bridgeObjectRelease_n();
    goto LABEL_25;
  }
  char v35 = sub_24334A940();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v35) {
    goto LABEL_25;
  }
LABEL_26:
  unint64_t v36 = (unsigned char *)(v0 + 409);
  uint64_t v37 = *(void *)(v0 + 128);
  sub_24334A190();
  uint64_t v38 = *(void *)(v37 + 16);
  if (v38)
  {
    uint64_t v39 = v0 + 16;
    uint64_t v40 = *(void *)(v0 + 192);
    uint64_t v41 = *(double **)(v0 + 200);
    uint64_t v107 = *(void *)(v0 + 184);
    uint64_t v42 = *(void *)(v0 + 168);
    uint64_t v43 = *(void *)(v0 + 128)
        + ((*(unsigned __int8 *)(v40 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80));
    unint64_t v104 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v42 + 48);
    uint64_t v105 = *(void *)(v40 + 72);
    uint64_t v103 = (void (**)(uint64_t, uint64_t))(v42 + 8);
    swift_bridgeObjectRetain();
    do
    {
      sub_2433417A4(v43, *(void *)(v0 + 200), type metadata accessor for DockAccessory.Observation);
      uint64_t v44 = *(void *)(v0 + 200);
      uint64_t v46 = *(void *)(v0 + 152);
      uint64_t v45 = *(void *)(v0 + 160);
      CGFloat v47 = v41[2];
      CGFloat v48 = v41[3];
      CGFloat v49 = v41[4];
      CGFloat v50 = v41[5];
      v112.origin.x = v47;
      v112.origin.y = v48;
      v112.size.width = v49;
      v112.size.height = v50;
      CGRectGetMinX(v112);
      v113.origin.x = v47;
      v113.origin.y = v48;
      v113.size.width = v49;
      v113.size.height = v50;
      CGRectGetMinY(v113);
      v114.origin.x = v47;
      v114.origin.y = v48;
      v114.size.width = v49;
      v114.size.height = v50;
      CGRectGetHeight(v114);
      v115.origin.x = v47;
      v115.origin.y = v48;
      v115.size.width = v49;
      v115.size.height = v50;
      CGRectGetWidth(v115);
      v116.origin.x = v47;
      v116.origin.y = v48;
      v116.size.width = v49;
      v116.size.height = v50;
      CGRectGetHeight(v116);
      sub_243325B3C(v44 + *(int *)(v107 + 28), v46);
      if ((*v104)(v46, 1, v45) == 1)
      {
        sub_243322E58(*(void *)(v0 + 152), &qword_268D934D0);
      }
      else
      {
        uint64_t v51 = *(void *)(v0 + 176);
        uint64_t v52 = *(void *)(v0 + 152);
        uint64_t v53 = *(void *)(v0 + 160);
        id v54 = objc_msgSend(self, sel_radians);
        sub_243349DB0();

        char v55 = *v103;
        (*v103)(v52, v53);
        sub_243349DA0();
        uint64_t v39 = v0 + 16;
        v55(v51, v53);
      }
      id v56 = objc_allocWithZone((Class)sub_243349ED0());
      sub_243349EC0();
      char v57 = (void (*)(uint64_t, void))sub_24334A180();
      uint64_t v59 = v58;
      MEMORY[0x24567A290](v57, v58, v60, v61, v62);
      if (*(void *)((*v59 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v59 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_24334A6F0();
      }
      uint64_t v63 = *(void *)(v0 + 200);
      sub_24334A700();
      sub_24334A6E0();
      v57(v39, 0);
      sub_243342124(v63, type metadata accessor for DockAccessory.Observation);
      v43 += v105;
      --v38;
    }
    while (v38);
    swift_bridgeObjectRelease();
    unint64_t v36 = (unsigned char *)(v0 + 409);
  }
  if ((*v36 & 1) == 0)
  {
    uint64_t v64 = *(void *)(v0 + 288);
    int32x2_t v65 = *(int32x2_t *)(v0 + 272);
    int32x2_t v66 = *(int32x2_t *)(v0 + 256);
    int32x2_t v67 = v66;
    *(void *)&long long v68 = v64;
    *((void *)&v68 + 1) = *(void *)(v0 + 296);
    long long v106 = v68;
    int32x2_t v69 = *(int32x2_t *)(v0 + 264);
    int32x2_t v70 = *(int32x2_t *)(v0 + 280);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93A90);
    uint64_t v71 = swift_allocObject();
    *(_OWORD *)(v71 + 16) = xmmword_24334B620;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93A98);
    uint64_t v72 = swift_allocObject();
    *(_OWORD *)(v72 + 16) = xmmword_24334B620;
    *(_DWORD *)(v72 + 32) = v66.i32[0];
    *(_DWORD *)(v72 + 36) = v65.i32[0];
    *(_DWORD *)(v72 + 40) = v64;
    uint64_t v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93AA0);
    *(void *)(v71 + 56) = v73;
    *(void *)(v71 + 32) = v72;
    uint64_t v74 = swift_allocObject();
    *(_OWORD *)(v74 + 16) = xmmword_24334B620;
    *(int32x2_t *)(v74 + 32) = vzip2_s32(v67, v65);
    *(_DWORD *)(v74 + 40) = DWORD1(v106);
    *(void *)(v71 + 88) = v73;
    *(void *)(v71 + 64) = v74;
    uint64_t v75 = swift_allocObject();
    *(_OWORD *)(v75 + 16) = xmmword_24334B620;
    *(int32x2_t *)(v75 + 32) = vzip1_s32(v69, v70);
    *(_DWORD *)(v75 + 40) = DWORD2(v106);
    *(void *)(v71 + 120) = v73;
    *(void *)(v71 + 96) = v75;
    id v76 = objc_allocWithZone(MEMORY[0x263EFF8C0]);
    uint64_t v77 = (void *)sub_24334A6B0();
    swift_bridgeObjectRelease();
    objc_msgSend(v76, sel_initWithArray_, v77);

    sub_24334A160();
  }
  if ((v36[1] & 1) == 0)
  {
    sub_24334A1A0();
    sub_24334A1B0();
  }
  switch(*(unsigned char *)(v0 + 408))
  {
    case 1:
      goto LABEL_43;
    case 2:
      goto LABEL_46;
    case 3:
      goto LABEL_49;
    case 4:
      goto LABEL_52;
    case 5:
      goto LABEL_55;
    case 6:
      goto LABEL_58;
    case 7:
      goto LABEL_61;
    default:
      uint64_t v78 = sub_24334A2B0();
      if (v78 < (uint64_t)0xFFFFFFFF80000000)
      {
        __break(1u);
LABEL_75:
        __break(1u);
LABEL_76:
        __break(1u);
LABEL_77:
        __break(1u);
LABEL_78:
        __break(1u);
LABEL_79:
        __break(1u);
LABEL_80:
        __break(1u);
LABEL_81:
        __break(1u);
        goto LABEL_82;
      }
      if (v78 <= 0x7FFFFFFF) {
        goto LABEL_63;
      }
      __break(1u);
LABEL_43:
      uint64_t v79 = sub_24334A2B0();
      if (v79 < (uint64_t)0xFFFFFFFF80000000) {
        goto LABEL_75;
      }
      if (v79 <= 0x7FFFFFFF) {
        goto LABEL_63;
      }
      __break(1u);
LABEL_46:
      uint64_t v80 = sub_24334A2B0();
      if (v80 < (uint64_t)0xFFFFFFFF80000000) {
        goto LABEL_76;
      }
      if (v80 <= 0x7FFFFFFF) {
        goto LABEL_63;
      }
      __break(1u);
LABEL_49:
      uint64_t v81 = sub_24334A2B0();
      if (v81 < (uint64_t)0xFFFFFFFF80000000) {
        goto LABEL_77;
      }
      if (v81 <= 0x7FFFFFFF) {
        goto LABEL_63;
      }
      __break(1u);
LABEL_52:
      uint64_t v82 = sub_24334A2B0();
      if (v82 < (uint64_t)0xFFFFFFFF80000000) {
        goto LABEL_78;
      }
      if (v82 <= 0x7FFFFFFF) {
        goto LABEL_63;
      }
      __break(1u);
LABEL_55:
      uint64_t v83 = sub_24334A2B0();
      if (v83 < (uint64_t)0xFFFFFFFF80000000) {
        goto LABEL_79;
      }
      if (v83 <= 0x7FFFFFFF) {
        goto LABEL_63;
      }
      __break(1u);
LABEL_58:
      uint64_t v84 = sub_24334A2B0();
      if (v84 < (uint64_t)0xFFFFFFFF80000000) {
        goto LABEL_80;
      }
      if (v84 <= 0x7FFFFFFF) {
        goto LABEL_63;
      }
      __break(1u);
LABEL_61:
      uint64_t v85 = sub_24334A2B0();
      if (v85 < (uint64_t)0xFFFFFFFF80000000) {
        goto LABEL_81;
      }
      if (v85 > 0x7FFFFFFF)
      {
LABEL_82:
        __break(1u);
        JUMPOUT(0x243337D48);
      }
LABEL_63:
      uint64_t v86 = *(void *)(v0 + 136);
      sub_24334A170();
      id v87 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF910]), sel_init);
      objc_msgSend(v87, sel_timeIntervalSince1970);

      sub_24334A1D0();
      uint64_t v88 = *(void *)(v0 + 144);
      if (v86)
      {
        uint64_t v89 = *(void **)(v0 + 136);
        uint64_t v90 = (void **)(v88 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
        swift_beginAccess();
        uint64_t v91 = *v90;
        *(void *)(v0 + 352) = *v90;
        if (v91)
        {
          id v92 = objc_allocWithZone(MEMORY[0x263F00650]);
          id v93 = v89;
          v91;
          id v94 = objc_msgSend(v92, sel_initWithCVPixelBuffer_, v93);
          *(void *)(v0 + 360) = v94;
          unint64_t v108 = (uint64_t (*)(id, id))((int)*MEMORY[0x263F3A868] + MEMORY[0x263F3A868]);
          uint64_t v95 = (void *)swift_task_alloc();
          *(void *)(v0 + 368) = v95;
          *uint64_t v95 = v0;
          v95[1] = sub_2433389BC;
          id v96 = v110;
          id v97 = v94;
LABEL_68:
          return v108(v96, v97);
        }
      }
      else
      {
        uint64_t v98 = (void **)(v88 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
        swift_beginAccess();
        uint64_t v99 = *v98;
        *(void *)(v0 + 384) = *v98;
        if (v99)
        {
          unint64_t v108 = (uint64_t (*)(id, id))((int)*MEMORY[0x263F3A868] + MEMORY[0x263F3A868]);
          v99;
          int v100 = (void *)swift_task_alloc();
          *(void *)(v0 + 392) = v100;
          *int v100 = v0;
          v100[1] = sub_243338B9C;
          id v96 = v110;
          id v97 = 0;
          goto LABEL_68;
        }
      }
      uint64_t v101 = *(void **)(v0 + 344);
      sub_243339488();

      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      id v102 = *(uint64_t (**)(void))(v0 + 8);
      return v102();
  }
}

uint64_t sub_243337D68()
{
  uint64_t v1 = *(void **)(*(void *)v0 + 328);
  swift_task_dealloc();

  return MEMORY[0x270FA2498](sub_243337E7C, 0, 0);
}

uint64_t sub_243337E7C()
{
  *(unsigned char *)(*(void *)(v0 + 144) + *(void *)(v0 + 320)) = 1;
  uint64_t v1 = *(void *)(v0 + 248);
  id v2 = objc_msgSend(objc_allocWithZone((Class)sub_24334A1E0()), sel_init);
  *(void *)(v0 + 344) = v2;
  sub_243348A38();
  sub_24334A800();
  id v93 = v2;
  sub_24334A1C0();
  if (v1 == 2) {
    goto LABEL_17;
  }
  uint64_t v3 = sub_24334A600();
  uint64_t v5 = v4;
  if (v3 == sub_24334A600() && v5 == v6)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_17;
  }
  char v8 = sub_24334A940();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v8) {
    goto LABEL_17;
  }
  uint64_t v9 = sub_24334A600();
  uint64_t v11 = v10;
  if (v9 == sub_24334A600() && v11 == v12) {
    goto LABEL_15;
  }
  char v13 = sub_24334A940();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v13)
  {
LABEL_17:
    sub_24334A800();
    sub_24334A1C0();
    goto LABEL_18;
  }
  uint64_t v14 = sub_24334A600();
  uint64_t v16 = v15;
  if (v14 == sub_24334A600() && v16 == v17)
  {
LABEL_15:
    swift_bridgeObjectRelease_n();
    goto LABEL_17;
  }
  char v18 = sub_24334A940();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v18) {
    goto LABEL_17;
  }
LABEL_18:
  uint64_t v19 = (unsigned char *)(v0 + 409);
  uint64_t v20 = *(void *)(v0 + 128);
  sub_24334A190();
  uint64_t v21 = *(void *)(v20 + 16);
  if (v21)
  {
    uint64_t v22 = v0 + 16;
    uint64_t v23 = *(void *)(v0 + 192);
    uint64_t v24 = *(double **)(v0 + 200);
    uint64_t v91 = *(void *)(v0 + 184);
    uint64_t v25 = *(void *)(v0 + 168);
    uint64_t v26 = *(void *)(v0 + 128)
        + ((*(unsigned __int8 *)(v23 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v23 + 80));
    uint64_t v88 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v25 + 48);
    uint64_t v89 = *(void *)(v23 + 72);
    id v87 = (void (**)(uint64_t, uint64_t))(v25 + 8);
    swift_bridgeObjectRetain();
    do
    {
      sub_2433417A4(v26, *(void *)(v0 + 200), type metadata accessor for DockAccessory.Observation);
      uint64_t v27 = *(void *)(v0 + 200);
      uint64_t v29 = *(void *)(v0 + 152);
      uint64_t v28 = *(void *)(v0 + 160);
      CGFloat v30 = v24[2];
      CGFloat v31 = v24[3];
      CGFloat v32 = v24[4];
      CGFloat v33 = v24[5];
      v95.origin.x = v30;
      v95.origin.y = v31;
      v95.size.width = v32;
      v95.size.height = v33;
      CGRectGetMinX(v95);
      v96.origin.x = v30;
      v96.origin.y = v31;
      v96.size.width = v32;
      v96.size.height = v33;
      CGRectGetMinY(v96);
      v97.origin.x = v30;
      v97.origin.y = v31;
      v97.size.width = v32;
      v97.size.height = v33;
      CGRectGetHeight(v97);
      v98.origin.x = v30;
      v98.origin.y = v31;
      v98.size.width = v32;
      v98.size.height = v33;
      CGRectGetWidth(v98);
      v99.origin.x = v30;
      v99.origin.y = v31;
      v99.size.width = v32;
      v99.size.height = v33;
      CGRectGetHeight(v99);
      sub_243325B3C(v27 + *(int *)(v91 + 28), v29);
      if ((*v88)(v29, 1, v28) == 1)
      {
        sub_243322E58(*(void *)(v0 + 152), &qword_268D934D0);
      }
      else
      {
        uint64_t v34 = *(void *)(v0 + 176);
        uint64_t v35 = *(void *)(v0 + 152);
        uint64_t v36 = *(void *)(v0 + 160);
        id v37 = objc_msgSend(self, sel_radians);
        sub_243349DB0();

        uint64_t v38 = *v87;
        (*v87)(v35, v36);
        sub_243349DA0();
        uint64_t v22 = v0 + 16;
        v38(v34, v36);
      }
      id v39 = objc_allocWithZone((Class)sub_243349ED0());
      sub_243349EC0();
      uint64_t v40 = (void (*)(uint64_t, void))sub_24334A180();
      uint64_t v42 = v41;
      MEMORY[0x24567A290](v40, v41, v43, v44, v45);
      if (*(void *)((*v42 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v42 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
        sub_24334A6F0();
      }
      uint64_t v46 = *(void *)(v0 + 200);
      sub_24334A700();
      sub_24334A6E0();
      v40(v22, 0);
      sub_243342124(v46, type metadata accessor for DockAccessory.Observation);
      v26 += v89;
      --v21;
    }
    while (v21);
    swift_bridgeObjectRelease();
    uint64_t v19 = (unsigned char *)(v0 + 409);
  }
  if ((*v19 & 1) == 0)
  {
    uint64_t v47 = *(void *)(v0 + 288);
    int32x2_t v48 = *(int32x2_t *)(v0 + 272);
    int32x2_t v49 = *(int32x2_t *)(v0 + 256);
    int32x2_t v50 = v49;
    *(void *)&long long v51 = v47;
    *((void *)&v51 + 1) = *(void *)(v0 + 296);
    long long v90 = v51;
    int32x2_t v52 = *(int32x2_t *)(v0 + 264);
    int32x2_t v53 = *(int32x2_t *)(v0 + 280);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93A90);
    uint64_t v54 = swift_allocObject();
    *(_OWORD *)(v54 + 16) = xmmword_24334B620;
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93A98);
    uint64_t v55 = swift_allocObject();
    *(_OWORD *)(v55 + 16) = xmmword_24334B620;
    *(_DWORD *)(v55 + 32) = v49.i32[0];
    *(_DWORD *)(v55 + 36) = v48.i32[0];
    *(_DWORD *)(v55 + 40) = v47;
    uint64_t v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93AA0);
    *(void *)(v54 + 56) = v56;
    *(void *)(v54 + 32) = v55;
    uint64_t v57 = swift_allocObject();
    *(_OWORD *)(v57 + 16) = xmmword_24334B620;
    *(int32x2_t *)(v57 + 32) = vzip2_s32(v50, v48);
    *(_DWORD *)(v57 + 40) = DWORD1(v90);
    *(void *)(v54 + 88) = v56;
    *(void *)(v54 + 64) = v57;
    uint64_t v58 = swift_allocObject();
    *(_OWORD *)(v58 + 16) = xmmword_24334B620;
    *(int32x2_t *)(v58 + 32) = vzip1_s32(v52, v53);
    *(_DWORD *)(v58 + 40) = DWORD2(v90);
    *(void *)(v54 + 120) = v56;
    *(void *)(v54 + 96) = v58;
    id v59 = objc_allocWithZone(MEMORY[0x263EFF8C0]);
    uint64_t v60 = (void *)sub_24334A6B0();
    swift_bridgeObjectRelease();
    objc_msgSend(v59, sel_initWithArray_, v60);

    sub_24334A160();
  }
  if ((v19[1] & 1) == 0)
  {
    sub_24334A1A0();
    sub_24334A1B0();
  }
  switch(*(unsigned char *)(v0 + 408))
  {
    case 1:
      goto LABEL_35;
    case 2:
      goto LABEL_38;
    case 3:
      goto LABEL_41;
    case 4:
      goto LABEL_44;
    case 5:
      goto LABEL_47;
    case 6:
      goto LABEL_50;
    case 7:
      goto LABEL_53;
    default:
      uint64_t v61 = sub_24334A2B0();
      if (v61 < (uint64_t)0xFFFFFFFF80000000)
      {
        __break(1u);
LABEL_67:
        __break(1u);
LABEL_68:
        __break(1u);
LABEL_69:
        __break(1u);
LABEL_70:
        __break(1u);
LABEL_71:
        __break(1u);
LABEL_72:
        __break(1u);
LABEL_73:
        __break(1u);
        goto LABEL_74;
      }
      if (v61 <= 0x7FFFFFFF) {
        goto LABEL_55;
      }
      __break(1u);
LABEL_35:
      uint64_t v62 = sub_24334A2B0();
      if (v62 < (uint64_t)0xFFFFFFFF80000000) {
        goto LABEL_67;
      }
      if (v62 <= 0x7FFFFFFF) {
        goto LABEL_55;
      }
      __break(1u);
LABEL_38:
      uint64_t v63 = sub_24334A2B0();
      if (v63 < (uint64_t)0xFFFFFFFF80000000) {
        goto LABEL_68;
      }
      if (v63 <= 0x7FFFFFFF) {
        goto LABEL_55;
      }
      __break(1u);
LABEL_41:
      uint64_t v64 = sub_24334A2B0();
      if (v64 < (uint64_t)0xFFFFFFFF80000000) {
        goto LABEL_69;
      }
      if (v64 <= 0x7FFFFFFF) {
        goto LABEL_55;
      }
      __break(1u);
LABEL_44:
      uint64_t v65 = sub_24334A2B0();
      if (v65 < (uint64_t)0xFFFFFFFF80000000) {
        goto LABEL_70;
      }
      if (v65 <= 0x7FFFFFFF) {
        goto LABEL_55;
      }
      __break(1u);
LABEL_47:
      uint64_t v66 = sub_24334A2B0();
      if (v66 < (uint64_t)0xFFFFFFFF80000000) {
        goto LABEL_71;
      }
      if (v66 <= 0x7FFFFFFF) {
        goto LABEL_55;
      }
      __break(1u);
LABEL_50:
      uint64_t v67 = sub_24334A2B0();
      if (v67 < (uint64_t)0xFFFFFFFF80000000) {
        goto LABEL_72;
      }
      if (v67 <= 0x7FFFFFFF) {
        goto LABEL_55;
      }
      __break(1u);
LABEL_53:
      uint64_t v68 = sub_24334A2B0();
      if (v68 < (uint64_t)0xFFFFFFFF80000000) {
        goto LABEL_73;
      }
      if (v68 > 0x7FFFFFFF)
      {
LABEL_74:
        __break(1u);
        JUMPOUT(0x24333899CLL);
      }
LABEL_55:
      uint64_t v69 = *(void *)(v0 + 136);
      sub_24334A170();
      id v70 = objc_msgSend(objc_allocWithZone(MEMORY[0x263EFF910]), sel_init);
      objc_msgSend(v70, sel_timeIntervalSince1970);

      sub_24334A1D0();
      uint64_t v71 = *(void *)(v0 + 144);
      if (v69)
      {
        uint64_t v72 = *(void **)(v0 + 136);
        uint64_t v73 = (void **)(v71 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
        swift_beginAccess();
        uint64_t v74 = *v73;
        *(void *)(v0 + 352) = *v73;
        if (v74)
        {
          id v75 = objc_allocWithZone(MEMORY[0x263F00650]);
          id v76 = v72;
          v74;
          id v77 = objc_msgSend(v75, sel_initWithCVPixelBuffer_, v76);
          *(void *)(v0 + 360) = v77;
          id v92 = (uint64_t (*)(id, id))((int)*MEMORY[0x263F3A868] + MEMORY[0x263F3A868]);
          uint64_t v78 = (void *)swift_task_alloc();
          *(void *)(v0 + 368) = v78;
          *uint64_t v78 = v0;
          v78[1] = sub_2433389BC;
          id v79 = v93;
          id v80 = v77;
LABEL_60:
          return v92(v79, v80);
        }
      }
      else
      {
        uint64_t v81 = (void **)(v71 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
        swift_beginAccess();
        uint64_t v82 = *v81;
        *(void *)(v0 + 384) = *v81;
        if (v82)
        {
          id v92 = (uint64_t (*)(id, id))((int)*MEMORY[0x263F3A868] + MEMORY[0x263F3A868]);
          v82;
          uint64_t v83 = (void *)swift_task_alloc();
          *(void *)(v0 + 392) = v83;
          *uint64_t v83 = v0;
          v83[1] = sub_243338B9C;
          id v79 = v93;
          id v80 = 0;
          goto LABEL_60;
        }
      }
      uint64_t v85 = *(void **)(v0 + 344);
      sub_243339488();

      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v86 = *(uint64_t (**)(void))(v0 + 8);
      return v86();
  }
}

uint64_t sub_2433389BC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 376) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_243338D70;
  }
  else
  {
    uint64_t v4 = *(void **)(v2 + 352);

    uint64_t v3 = sub_243338ADC;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_243338ADC()
{
  uint64_t v1 = *(void **)(v0 + 344);
  sub_243339488();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_243338B9C()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 400) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_243338FE8;
  }
  else
  {

    uint64_t v3 = sub_243338CB8;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_243338CB8()
{
  uint64_t v1 = *(void **)(v0 + 344);
  sub_243339488();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_243338D70()
{
  uint64_t v1 = *(void **)(v0 + 352);
  uint64_t v2 = *(void **)(v0 + 136);

  uint64_t v3 = *(NSObject **)(v0 + 376);
  (*(void (**)(void, uint64_t, void))(*(void *)(v0 + 216) + 16))(*(void *)(v0 + 224), *(void *)(v0 + 144) + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, *(void *)(v0 + 208));
  uint64_t v4 = v3;
  uint64_t v5 = v3;
  uint64_t v6 = sub_24334A590();
  os_log_type_t v7 = sub_24334A7D0();
  if (os_log_type_enabled(v6, v7))
  {
    char v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = (void *)swift_slowAlloc();
    *(_DWORD *)char v8 = 138412290;
    uint64_t v10 = v3;
    uint64_t v11 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 120) = v11;
    sub_24334A820();
    void *v9 = v11;

    _os_log_impl(&dword_243318000, v6, v7, "caught err %@, returning public", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93300);
    swift_arrayDestroy();
    MEMORY[0x24567AB80](v9, -1, -1);
    MEMORY[0x24567AB80](v8, -1, -1);
  }
  else
  {
  }
  uint64_t v12 = *(void **)(v0 + 344);
  uint64_t v13 = *(void *)(v0 + 224);
  uint64_t v14 = *(void *)(v0 + 208);
  uint64_t v15 = *(void *)(v0 + 216);

  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v13, v14);
  sub_24331FCB8();
  swift_allocError();
  sub_24331C07C(v3, v16);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v17 = *(uint64_t (**)(void))(v0 + 8);
  return v17();
}

uint64_t sub_243338FE8()
{
  uint64_t v1 = *(NSObject **)(v0 + 400);
  (*(void (**)(void, uint64_t, void))(*(void *)(v0 + 216) + 16))(*(void *)(v0 + 224), *(void *)(v0 + 144) + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, *(void *)(v0 + 208));
  uint64_t v2 = v1;
  uint64_t v3 = v1;
  uint64_t v4 = sub_24334A590();
  os_log_type_t v5 = sub_24334A7D0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    os_log_type_t v7 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 138412290;
    char v8 = v1;
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 120) = v9;
    sub_24334A820();
    *os_log_type_t v7 = v9;

    _os_log_impl(&dword_243318000, v4, v5, "caught err %@, returning public", v6, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93300);
    swift_arrayDestroy();
    MEMORY[0x24567AB80](v7, -1, -1);
    MEMORY[0x24567AB80](v6, -1, -1);
  }
  else
  {
  }
  uint64_t v10 = *(void **)(v0 + 344);
  uint64_t v11 = *(void *)(v0 + 224);
  uint64_t v12 = *(void *)(v0 + 208);
  uint64_t v13 = *(void *)(v0 + 216);

  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  sub_24331FCB8();
  swift_allocError();
  sub_24331C07C(v1, v14);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
  return v15();
}

uint64_t DockAccessory.track(_:cameraInformation:image:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void *)(a2 + 8);
  char v7 = *(unsigned char *)(a2 + 16);
  char v8 = *(unsigned char *)(a2 + 80);
  char v9 = *(unsigned char *)(a2 + 104);
  *(void *)(v3 + 16) = *(void *)a2;
  *(void *)(v3 + 24) = v6;
  *(unsigned char *)(v3 + 32) = v7;
  long long v10 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v3 + 48) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v3 + 64) = v10;
  *(_OWORD *)(v3 + 80) = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(v3 + 96) = v8;
  *(_OWORD *)(v3 + 104) = *(_OWORD *)(a2 + 88);
  *(unsigned char *)(v3 + 120) = v9;
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v3 + 128) = v11;
  *uint64_t v11 = v3;
  v11[1] = sub_24333933C;
  return sub_243336D78(a1, (uint64_t *)(v3 + 16), a3);
}

{
  uint64_t v3;
  uint64_t v6;
  char v7;
  char v8;
  char v9;
  long long v10;
  void *v11;
  uint64_t v13;

  uint64_t v6 = *(void *)(a2 + 8);
  char v7 = *(unsigned char *)(a2 + 16);
  char v8 = *(unsigned char *)(a2 + 80);
  char v9 = *(unsigned char *)(a2 + 104);
  *(void *)(v3 + 16) = *(void *)a2;
  *(void *)(v3 + 24) = v6;
  *(unsigned char *)(v3 + 32) = v7;
  long long v10 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(v3 + 48) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(v3 + 64) = v10;
  *(_OWORD *)(v3 + 80) = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(v3 + 96) = v8;
  *(_OWORD *)(v3 + 104) = *(_OWORD *)(a2 + 88);
  *(unsigned char *)(v3 + 120) = v9;
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v3 + 128) = v11;
  *uint64_t v11 = v3;
  v11[1] = sub_243336C44;
  return sub_2433397B0(a1, (uint64_t *)(v3 + 16), a3);
}

uint64_t sub_24333933C()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 136) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_243339470, 0, 0);
  }
  else
  {
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_243339470()
{
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_243339488()
{
  uint64_t v1 = v0;
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D933D0);
  MEMORY[0x270FA5388](v2 - 8);
  uint64_t v4 = (char *)v14 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_24334A730();
  uint64_t v6 = *(void *)(v5 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v4, 1, 1, v5);
  char v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = v1;
  int v8 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v6 + 48))(v4, 1, v5);
  swift_retain();
  if (v8 == 1)
  {
    sub_243322E58((uint64_t)v4, &qword_268D933D0);
    uint64_t v9 = 0;
    uint64_t v10 = 0;
  }
  else
  {
    sub_24334A720();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v4, v5);
    if (v7[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      uint64_t v9 = sub_24334A710();
      uint64_t v10 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
    }
  }
  uint64_t v12 = swift_allocObject();
  *(void *)(v12 + 16) = &unk_268D93A68;
  *(void *)(v12 + 24) = v7;
  if (v10 | v9)
  {
    v14[0] = 0;
    v14[1] = 0;
    v14[2] = v9;
    v14[3] = v10;
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_2433397B0(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  *(void *)(v4 + 160) = a3;
  *(void *)(v4 + 168) = v3;
  *(void *)(v4 + 152) = a1;
  uint64_t v6 = sub_24334A5B0();
  *(void *)(v4 + 176) = v6;
  *(void *)(v4 + 184) = *(void *)(v6 - 8);
  *(void *)(v4 + 192) = swift_task_alloc();
  uint64_t v7 = swift_task_alloc();
  uint64_t v8 = *a2;
  uint64_t v9 = a2[1];
  *(void *)(v4 + 200) = v7;
  *(void *)(v4 + 208) = v8;
  *(void *)(v4 + 216) = v9;
  *(unsigned char *)(v4 + 65) = *((unsigned char *)a2 + 16);
  sub_243342540((uint64_t)(a2 + 4), v4 + 16, &qword_268D93490);
  *(_OWORD *)(v4 + 224) = *(_OWORD *)(a2 + 11);
  *(unsigned char *)(v4 + 66) = *((unsigned char *)a2 + 104);
  return MEMORY[0x270FA2498](sub_2433398C8, 0, 0);
}

uint64_t sub_2433398C8()
{
  if (qword_268D932C0 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_268D932C8;
  uint64_t v2 = OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock;
  uint64_t v3 = *(os_unfair_lock_s **)(qword_268D932C8 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock);
  swift_retain();
  os_unfair_lock_lock(v3 + 4);
  swift_release();
  char v4 = *(unsigned char *)(v1 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabled);
  uint64_t v5 = *(os_unfair_lock_s **)(v1 + v2);
  swift_retain();
  os_unfair_lock_unlock(v5 + 4);
  swift_release();
  if ((v4 & 1) == 0) {
    return sub_24334A8B0();
  }
  uint64_t v6 = *(void *)(v0 + 168);
  uint64_t v7 = OBJC_IVAR____TtC7DockKit13DockAccessory__tracking;
  *(void *)(v0 + 240) = OBJC_IVAR____TtC7DockKit13DockAccessory__tracking;
  if ((*(unsigned char *)(v6 + v7) & 1) == 0)
  {
    (*(void (**)(void, uint64_t, void))(*(void *)(v0 + 184) + 16))(*(void *)(v0 + 200), v6 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, *(void *)(v0 + 176));
    uint64_t v8 = sub_24334A590();
    os_log_type_t v9 = sub_24334A7D0();
    if (os_log_type_enabled(v8, v9))
    {
      uint64_t v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_243318000, v8, v9, "Starting tracker", v10, 2u);
      MEMORY[0x24567AB80](v10, -1, -1);
    }
    uint64_t v11 = *(void *)(v0 + 200);
    uint64_t v12 = *(void *)(v0 + 176);
    uint64_t v13 = *(void *)(v0 + 184);
    uint64_t v14 = *(void *)(v0 + 168);

    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
    uint64_t v15 = (void **)(v14 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
    swift_beginAccess();
    uint64_t v16 = *v15;
    *(void *)(v0 + 248) = *v15;
    if (v16)
    {
      id v59 = (uint64_t (*)(void))((int)*MEMORY[0x263F3A848] + MEMORY[0x263F3A848]);
      v16;
      uint64_t v17 = (void *)swift_task_alloc();
      *(void *)(v0 + 256) = v17;
      *uint64_t v17 = v0;
      v17[1] = sub_24333A048;
      return v59();
    }
    *(unsigned char *)(*(void *)(v0 + 168) + *(void *)(v0 + 240)) = 1;
  }
  if (*(void *)(v0 + 216) == 2) {
    goto LABEL_14;
  }
  uint64_t v20 = sub_24334A600();
  uint64_t v22 = v21;
  if (v20 == sub_24334A600() && v22 == v23)
  {
    swift_bridgeObjectRelease_n();
    uint64_t v19 = 3;
  }
  else
  {
    char v25 = sub_24334A940();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v25)
    {
      uint64_t v19 = 3;
    }
    else
    {
      uint64_t v26 = sub_24334A600();
      uint64_t v28 = v27;
      if (v26 == sub_24334A600() && v28 == v29)
      {
        uint64_t v19 = 2;
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v30 = sub_24334A940();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v30)
        {
          uint64_t v19 = 2;
        }
        else
        {
          uint64_t v54 = sub_24334A600();
          uint64_t v56 = v55;
          if (v54 == sub_24334A600() && v56 == v57)
          {
            swift_bridgeObjectRelease_n();
          }
          else
          {
            char v58 = sub_24334A940();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v58 & 1) == 0)
            {
LABEL_14:
              uint64_t v19 = 0;
              goto LABEL_27;
            }
          }
          uint64_t v19 = 1;
        }
      }
    }
  }
LABEL_27:
  uint64_t v31 = qword_24334C900[*(char *)(v0 + 65)];
  uint64_t v32 = *(void *)(v0 + 160);
  id v33 = objc_allocWithZone((Class)sub_24334A210());
  uint64_t v34 = (void *)sub_24334A200();
  *(void *)(v0 + 264) = v34;
  uint64_t v35 = *(void *)(v0 + 168);
  if (v32)
  {
    uint64_t v36 = *(void **)(v0 + 160);
    id v37 = (void **)(v35 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
    swift_beginAccess();
    uint64_t v38 = *v37;
    *(void *)(v0 + 272) = *v37;
    if (v38)
    {
      id v39 = objc_allocWithZone(MEMORY[0x263F00650]);
      id v40 = v36;
      v38;
      id v41 = objc_msgSend(v39, sel_initWithCVPixelBuffer_, v40);
      *(void *)(v0 + 280) = v41;
      uint64_t v60 = (uint64_t (*)(uint64_t, id, uint64_t, uint64_t, void *))((int)*MEMORY[0x263F3A860]
                                                                          + MEMORY[0x263F3A860]);
      id v42 = v34;
      uint64_t v43 = (void *)swift_task_alloc();
      *(void *)(v0 + 288) = v43;
      *uint64_t v43 = v0;
      v43[1] = sub_24333A624;
      uint64_t v44 = *(void *)(v0 + 152);
      id v45 = v41;
      uint64_t v46 = v19;
      uint64_t v47 = v31;
      int32x2_t v48 = v34;
LABEL_32:
      return v60(v44, v45, v46, v47, v48);
    }
  }
  else
  {
    int32x2_t v49 = (void **)(v35 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
    swift_beginAccess();
    int32x2_t v50 = *v49;
    *(void *)(v0 + 304) = *v49;
    if (v50)
    {
      uint64_t v60 = (uint64_t (*)(uint64_t, id, uint64_t, uint64_t, void *))((int)*MEMORY[0x263F3A860]
                                                                          + MEMORY[0x263F3A860]);
      v50;
      long long v51 = (void *)swift_task_alloc();
      *(void *)(v0 + 312) = v51;
      void *v51 = v0;
      v51[1] = sub_24333A7E4;
      uint64_t v44 = *(void *)(v0 + 152);
      id v45 = 0;
      uint64_t v46 = v19;
      uint64_t v47 = v31;
      int32x2_t v48 = v34;
      goto LABEL_32;
    }
  }
  int32x2_t v52 = *(void **)(v0 + 264);
  sub_243339488();

  swift_task_dealloc();
  swift_task_dealloc();
  int32x2_t v53 = *(uint64_t (**)(void))(v0 + 8);
  return v53();
}

uint64_t sub_24333A048()
{
  uint64_t v1 = *(void **)(*(void *)v0 + 248);
  swift_task_dealloc();

  return MEMORY[0x270FA2498](sub_24333A15C, 0, 0);
}

uint64_t sub_24333A15C()
{
  *(unsigned char *)(*(void *)(v0 + 168) + *(void *)(v0 + 240)) = 1;
  if (*(void *)(v0 + 216) == 2) {
    goto LABEL_2;
  }
  uint64_t v2 = sub_24334A600();
  uint64_t v4 = v3;
  if (v2 == sub_24334A600() && v4 == v5)
  {
    swift_bridgeObjectRelease_n();
    goto LABEL_15;
  }
  char v7 = sub_24334A940();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v7)
  {
LABEL_15:
    uint64_t v1 = 3;
    goto LABEL_16;
  }
  uint64_t v8 = sub_24334A600();
  uint64_t v10 = v9;
  if (v8 == sub_24334A600() && v10 == v11)
  {
    uint64_t v1 = 2;
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v13 = sub_24334A940();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if (v13)
    {
      uint64_t v1 = 2;
    }
    else
    {
      uint64_t v38 = sub_24334A600();
      uint64_t v40 = v39;
      if (v38 == sub_24334A600() && v40 == v41)
      {
        swift_bridgeObjectRelease_n();
      }
      else
      {
        char v42 = sub_24334A940();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v42 & 1) == 0)
        {
LABEL_2:
          uint64_t v1 = 0;
          goto LABEL_16;
        }
      }
      uint64_t v1 = 1;
    }
  }
LABEL_16:
  uint64_t v14 = qword_24334C900[*(char *)(v0 + 65)];
  uint64_t v15 = *(void *)(v0 + 160);
  id v16 = objc_allocWithZone((Class)sub_24334A210());
  uint64_t v17 = (void *)sub_24334A200();
  *(void *)(v0 + 264) = v17;
  uint64_t v18 = *(void *)(v0 + 168);
  if (v15)
  {
    uint64_t v19 = *(void **)(v0 + 160);
    uint64_t v20 = (void **)(v18 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
    swift_beginAccess();
    uint64_t v21 = *v20;
    *(void *)(v0 + 272) = *v20;
    if (v21)
    {
      id v22 = objc_allocWithZone(MEMORY[0x263F00650]);
      id v23 = v19;
      v21;
      id v24 = objc_msgSend(v22, sel_initWithCVPixelBuffer_, v23);
      *(void *)(v0 + 280) = v24;
      uint64_t v43 = (uint64_t (*)(uint64_t, id, uint64_t, uint64_t, void *))((int)*MEMORY[0x263F3A860]
                                                                          + MEMORY[0x263F3A860]);
      id v25 = v17;
      uint64_t v26 = (void *)swift_task_alloc();
      *(void *)(v0 + 288) = v26;
      *uint64_t v26 = v0;
      v26[1] = sub_24333A624;
      uint64_t v27 = *(void *)(v0 + 152);
      id v28 = v24;
      uint64_t v29 = v1;
      uint64_t v30 = v14;
      uint64_t v31 = v17;
LABEL_21:
      return v43(v27, v28, v29, v30, v31);
    }
  }
  else
  {
    uint64_t v32 = (void **)(v18 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
    swift_beginAccess();
    id v33 = *v32;
    *(void *)(v0 + 304) = *v32;
    if (v33)
    {
      uint64_t v43 = (uint64_t (*)(uint64_t, id, uint64_t, uint64_t, void *))((int)*MEMORY[0x263F3A860]
                                                                          + MEMORY[0x263F3A860]);
      v33;
      uint64_t v34 = (void *)swift_task_alloc();
      *(void *)(v0 + 312) = v34;
      *uint64_t v34 = v0;
      v34[1] = sub_24333A7E4;
      uint64_t v27 = *(void *)(v0 + 152);
      id v28 = 0;
      uint64_t v29 = v1;
      uint64_t v30 = v14;
      uint64_t v31 = v17;
      goto LABEL_21;
    }
  }
  uint64_t v36 = *(void **)(v0 + 264);
  sub_243339488();

  swift_task_dealloc();
  swift_task_dealloc();
  id v37 = *(uint64_t (**)(void))(v0 + 8);
  return v37();
}

uint64_t sub_24333A624()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 296) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_24333A988;
  }
  else
  {
    uint64_t v5 = *(void **)(v2 + 272);
    uint64_t v4 = *(void **)(v2 + 280);

    uint64_t v3 = sub_24333A754;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24333A754()
{
  uint64_t v1 = *(void **)(v0 + 264);
  sub_243339488();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24333A7E4()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 320) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = sub_24333ABDC;
  }
  else
  {

    uint64_t v3 = sub_24333A900;
  }
  return MEMORY[0x270FA2498](v3, 0, 0);
}

uint64_t sub_24333A900()
{
  uint64_t v1 = *(void **)(v0 + 264);
  sub_243339488();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24333A988()
{
  uint64_t v1 = *(void **)(v0 + 272);
  uint64_t v2 = *(void **)(v0 + 280);
  uint64_t v3 = *(void **)(v0 + 160);

  uint64_t v4 = *(NSObject **)(v0 + 296);
  (*(void (**)(void, uint64_t, void))(*(void *)(v0 + 184) + 16))(*(void *)(v0 + 192), *(void *)(v0 + 168) + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, *(void *)(v0 + 176));
  uint64_t v5 = v4;
  uint64_t v6 = v4;
  uint64_t v7 = sub_24334A590();
  os_log_type_t v8 = sub_24334A7D0();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    uint64_t v10 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 138412290;
    uint64_t v11 = v4;
    uint64_t v12 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 144) = v12;
    sub_24334A820();
    *uint64_t v10 = v12;

    _os_log_impl(&dword_243318000, v7, v8, "caught err %@, returning public", v9, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93300);
    swift_arrayDestroy();
    MEMORY[0x24567AB80](v10, -1, -1);
    MEMORY[0x24567AB80](v9, -1, -1);
  }
  else
  {
  }
  char v13 = *(void **)(v0 + 264);
  uint64_t v14 = *(void *)(v0 + 192);
  uint64_t v15 = *(void *)(v0 + 176);
  uint64_t v16 = *(void *)(v0 + 184);

  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);
  sub_24331FCB8();
  swift_allocError();
  sub_24331C07C(v4, v17);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = *(uint64_t (**)(void))(v0 + 8);
  return v18();
}

uint64_t sub_24333ABDC()
{
  uint64_t v1 = *(NSObject **)(v0 + 320);
  (*(void (**)(void, uint64_t, void))(*(void *)(v0 + 184) + 16))(*(void *)(v0 + 192), *(void *)(v0 + 168) + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, *(void *)(v0 + 176));
  uint64_t v2 = v1;
  uint64_t v3 = v1;
  uint64_t v4 = sub_24334A590();
  os_log_type_t v5 = sub_24334A7D0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 138412290;
    os_log_type_t v8 = v1;
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 144) = v9;
    sub_24334A820();
    *uint64_t v7 = v9;

    _os_log_impl(&dword_243318000, v4, v5, "caught err %@, returning public", v6, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93300);
    swift_arrayDestroy();
    MEMORY[0x24567AB80](v7, -1, -1);
    MEMORY[0x24567AB80](v6, -1, -1);
  }
  else
  {
  }
  uint64_t v10 = *(void **)(v0 + 264);
  uint64_t v11 = *(void *)(v0 + 192);
  uint64_t v12 = *(void *)(v0 + 176);
  uint64_t v13 = *(void *)(v0 + 184);

  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
  sub_24331FCB8();
  swift_allocError();
  sub_24331C07C(v1, v14);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v15 = *(uint64_t (**)(void))(v0 + 8);
  return v15();
}

uint64_t DockAccessory.selectSubject(at:)(double a1, double a2)
{
  *(void *)(v3 + 80) = v2;
  *(double *)(v3 + 64) = a1;
  *(double *)(v3 + 72) = a2;
  uint64_t v4 = sub_24334A5B0();
  *(void *)(v3 + 88) = v4;
  *(void *)(v3 + 96) = *(void *)(v4 - 8);
  *(void *)(v3 + 104) = swift_task_alloc();
  *(void *)(v3 + 112) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24333AFD8, 0, 0);
}

uint64_t sub_24333AFD8()
{
  uint64_t v38 = v0;
  uint64_t v1 = (void **)(v0[10] + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (!*v1)
  {
    sub_24331FCB8();
    swift_allocError();
    unsigned char *v20 = 1;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v21 = (uint64_t (*)(void))v0[1];
LABEL_17:
    return v21();
  }
  uint64_t v2 = v0[14];
  uint64_t v3 = v0[11];
  uint64_t v4 = v0[12];
  uint64_t v5 = v0[10];
  uint64_t v6 = OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
  v0[15] = OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v0[16] = v7;
  v0[17] = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v7(v2, v5 + v6, v3);
  os_log_type_t v8 = sub_24334A590();
  os_log_type_t v9 = sub_24334A7B0();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v11 = v0[14];
  uint64_t v12 = v0[11];
  uint64_t v13 = v0[12];
  if (v10)
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 136446466;
    v37[0] = v35;
    uint64_t v15 = sub_24334A7A0();
    v0[6] = sub_2433402D0(v15, v16, v37);
    sub_24334A820();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2082;
    uint64_t v17 = sub_24334A7A0();
    v0[7] = sub_2433402D0(v17, v18, v37);
    sub_24334A820();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_243318000, v8, v9, "API: selectSubject: %{public}s, %{public}s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x24567AB80](v35, -1, -1);
    MEMORY[0x24567AB80](v14, -1, -1);

    uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v19(v11, v12);
  }
  else
  {

    uint64_t v19 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v19(v11, v12);
  }
  v0[18] = v19;
  if (qword_268D932C0 != -1) {
    swift_once();
  }
  uint64_t v22 = qword_268D932C8;
  uint64_t v23 = OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock;
  id v24 = *(os_unfair_lock_s **)(qword_268D932C8 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock);
  swift_retain();
  os_unfair_lock_lock(v24 + 4);
  swift_release();
  int v25 = *(unsigned __int8 *)(v22 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabled);
  uint64_t v26 = *(os_unfair_lock_s **)(v22 + v23);
  swift_retain();
  os_unfair_lock_unlock(v26 + 4);
  swift_release();
  if (v25 == 1)
  {
    uint64_t v27 = *v1;
    v0[19] = *v1;
    if (v27)
    {
      uint64_t v36 = (uint64_t (*)(__n128, __n128))((int)*MEMORY[0x263F3A850] + MEMORY[0x263F3A850]);
      v27;
      id v28 = (void *)swift_task_alloc();
      v0[20] = v28;
      *id v28 = v0;
      v28[1] = sub_24333B478;
      v29.n128_u64[0] = v0[8];
      v30.n128_u64[0] = v0[9];
      return v36(v29, v30);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v21 = (uint64_t (*)(void))v0[1];
    goto LABEL_17;
  }
  v0[22] = objc_msgSend(objc_allocWithZone((Class)sub_243349FD0()), sel_init);
  uint64_t v32 = (void *)swift_task_alloc();
  v0[23] = v32;
  void *v32 = v0;
  v32[1] = sub_24333B5C8;
  v33.n128_u64[0] = v0[8];
  v34.n128_u64[0] = v0[9];
  return MEMORY[0x270F267F8](v33, v34);
}

uint64_t sub_24333B478()
{
  uint64_t v2 = *v1;
  *(void *)(v2 + 168) = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24333B750, 0, 0);
  }
  else
  {

    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v3 = *(uint64_t (**)(void))(v2 + 8);
    return v3();
  }
}

uint64_t sub_24333B5C8()
{
  *(void *)(*(void *)v1 + 192) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24333B980;
  }
  else {
    uint64_t v2 = sub_24333B6DC;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24333B6DC()
{
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24333B750()
{
  uint64_t v1 = *(NSObject **)(v0 + 168);
  (*(void (**)(void, void, void))(v0 + 128))(*(void *)(v0 + 104), *(void *)(v0 + 80) + *(void *)(v0 + 120), *(void *)(v0 + 88));
  uint64_t v2 = v1;
  uint64_t v3 = v1;
  uint64_t v4 = sub_24334A590();
  os_log_type_t v5 = sub_24334A7D0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 138412290;
    os_log_type_t v8 = v1;
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 40) = v9;
    sub_24334A820();
    *uint64_t v7 = v9;

    _os_log_impl(&dword_243318000, v4, v5, "caught err %@, returning public", v6, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93300);
    swift_arrayDestroy();
    MEMORY[0x24567AB80](v7, -1, -1);
    MEMORY[0x24567AB80](v6, -1, -1);
  }
  else
  {
  }
  BOOL v10 = *(void (**)(uint64_t, uint64_t))(v0 + 144);
  uint64_t v11 = *(void *)(v0 + 104);
  uint64_t v12 = *(void *)(v0 + 88);

  v10(v11, v12);
  sub_24331FCB8();
  swift_allocError();
  sub_24331C07C(v1, v13);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
  return v14();
}

uint64_t sub_24333B980()
{
  uint64_t v1 = *(NSObject **)(v0 + 192);
  (*(void (**)(void, void, void))(v0 + 128))(*(void *)(v0 + 104), *(void *)(v0 + 80) + *(void *)(v0 + 120), *(void *)(v0 + 88));
  uint64_t v2 = v1;
  uint64_t v3 = v1;
  uint64_t v4 = sub_24334A590();
  os_log_type_t v5 = sub_24334A7D0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 138412290;
    os_log_type_t v8 = v1;
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 40) = v9;
    sub_24334A820();
    *uint64_t v7 = v9;

    _os_log_impl(&dword_243318000, v4, v5, "caught err %@, returning public", v6, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93300);
    swift_arrayDestroy();
    MEMORY[0x24567AB80](v7, -1, -1);
    MEMORY[0x24567AB80](v6, -1, -1);
  }
  else
  {
  }
  BOOL v10 = *(void (**)(uint64_t, uint64_t))(v0 + 144);
  uint64_t v11 = *(void *)(v0 + 104);
  uint64_t v12 = *(void *)(v0 + 88);

  v10(v11, v12);
  sub_24331FCB8();
  swift_allocError();
  sub_24331C07C(v1, v13);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
  return v14();
}

uint64_t DockAccessory.selectSubjects(_:)(uint64_t a1)
{
  v2[7] = a1;
  v2[8] = v1;
  uint64_t v3 = sub_243349EB0();
  v2[9] = v3;
  v2[10] = *(void *)(v3 - 8);
  v2[11] = swift_task_alloc();
  uint64_t v4 = sub_24334A5B0();
  v2[12] = v4;
  v2[13] = *(void *)(v4 - 8);
  v2[14] = swift_task_alloc();
  v2[15] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24333BCDC, 0, 0);
}

uint64_t sub_24333BCDC()
{
  id v76 = v0;
  uint64_t v1 = (void **)(v0[8] + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (!*v1)
  {
    sub_24331FCB8();
    swift_allocError();
    unsigned char *v22 = 1;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v23 = (uint64_t (*)(void))v0[1];
LABEL_29:
    return v23();
  }
  uint64_t v2 = v0 + 7;
  uint64_t v3 = v0[15];
  uint64_t v4 = v0[12];
  uint64_t v5 = v0[13];
  uint64_t v6 = v0[8];
  uint64_t v7 = OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
  v0[16] = OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
  os_log_type_t v8 = *(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16);
  v0[17] = v8;
  v0[18] = (v5 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v8(v3, v6 + v7, v4);
  swift_bridgeObjectRetain_n();
  uint64_t v9 = sub_24334A590();
  os_log_type_t v10 = sub_24334A7B0();
  BOOL v11 = os_log_type_enabled(v9, v10);
  uint64_t v12 = v0[15];
  uint64_t v13 = v0[12];
  uint64_t v14 = v0[13];
  uint64_t v73 = v0;
  if (v11)
  {
    uint64_t v15 = v0[9];
    uint64_t v70 = v0[15];
    uint64_t v68 = v0[12];
    uint64_t v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v66 = swift_slowAlloc();
    uint64_t v75 = v66;
    *(_DWORD *)uint64_t v16 = 136315138;
    uint64_t v17 = swift_bridgeObjectRetain();
    uint64_t v18 = MEMORY[0x24567A2C0](v17, v15);
    unint64_t v20 = v19;
    swift_bridgeObjectRelease();
    v0[6] = sub_2433402D0(v18, v20, &v75);
    sub_24334A820();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_243318000, v9, v10, "API: selectSubjects: %s", v16, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24567AB80](v66, -1, -1);
    MEMORY[0x24567AB80](v16, -1, -1);

    uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    v21(v70, v68);
  }
  else
  {
    swift_bridgeObjectRelease_n();

    uint64_t v21 = *(void (**)(uint64_t, uint64_t))(v14 + 8);
    v21(v12, v13);
  }
  v0[19] = v21;
  if (qword_268D932C0 != -1) {
    swift_once();
  }
  uint64_t v24 = qword_268D932C8;
  uint64_t v25 = OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock;
  uint64_t v26 = *(os_unfair_lock_s **)(qword_268D932C8 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock);
  swift_retain();
  os_unfair_lock_lock(v26 + 4);
  swift_release();
  int v27 = *(unsigned __int8 *)(v24 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabled);
  id v28 = *(os_unfair_lock_s **)(v24 + v25);
  swift_retain();
  os_unfair_lock_unlock(v28 + 4);
  swift_release();
  if (v27 == 1)
  {
    __n128 v29 = *v1;
    if (*v1)
    {
      uint64_t v30 = *v2;
      int64_t v31 = *(void *)(*v2 + 16);
      if (v31)
      {
        uint64_t v32 = v0[10];
        uint64_t v75 = MEMORY[0x263F8EE78];
        id v67 = v29;
        sub_243340948(0, v31, 0);
        __n128 v33 = *(void (**)(uint64_t, uint64_t, uint64_t))(v32 + 16);
        v32 += 16;
        uint64_t v34 = v30 + ((*(unsigned __int8 *)(v32 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v32 + 64));
        uint64_t v69 = *(void *)(v32 + 56);
        uint64_t v71 = v33;
        uint64_t v35 = (void (**)(uint64_t, uint64_t))(v32 - 8);
        do
        {
          uint64_t v36 = v0[11];
          uint64_t v37 = v0[9];
          v71(v36, v34, v37);
          uint64_t v38 = sub_243349E90();
          uint64_t v40 = v39;
          (*v35)(v36, v37);
          uint64_t v41 = v75;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          {
            sub_243340948(0, *(void *)(v41 + 16) + 1, 1);
            uint64_t v41 = v75;
          }
          unint64_t v43 = *(void *)(v41 + 16);
          unint64_t v42 = *(void *)(v41 + 24);
          if (v43 >= v42 >> 1)
          {
            sub_243340948(v42 > 1, v43 + 1, 1);
            uint64_t v41 = v75;
          }
          *(void *)(v41 + 16) = v43 + 1;
          uint64_t v44 = v41 + 16 * v43;
          *(void *)(v44 + 32) = v38;
          *(void *)(v44 + 40) = v40;
          v34 += v69;
          --v31;
          uint64_t v0 = v73;
        }
        while (v31);
        id v63 = v67;
      }
      else
      {
        id v63 = v29;
        uint64_t v41 = MEMORY[0x263F8EE78];
      }
      v0[20] = v63;
      v0[21] = v41;
      uint64_t v74 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x263F3A858] + MEMORY[0x263F3A858]);
      uint64_t v64 = (void *)swift_task_alloc();
      v0[22] = v64;
      *uint64_t v64 = v0;
      v64[1] = sub_24333C400;
      return v74(v41);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v23 = (uint64_t (*)(void))v0[1];
    goto LABEL_29;
  }
  uint64_t v45 = v0[7];
  v0[24] = objc_msgSend(objc_allocWithZone((Class)sub_243349FD0()), sel_init);
  int64_t v46 = *(void *)(v45 + 16);
  uint64_t v47 = MEMORY[0x263F8EE78];
  if (v46)
  {
    uint64_t v48 = v0[10];
    uint64_t v49 = v0[7];
    uint64_t v75 = MEMORY[0x263F8EE78];
    sub_243340948(0, v46, 0);
    long long v51 = *(void (**)(uint64_t, uint64_t, uint64_t))(v48 + 16);
    uint64_t v50 = v48 + 16;
    uint64_t v72 = v51;
    uint64_t v52 = v49 + ((*(unsigned __int8 *)(v50 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v50 + 64));
    uint64_t v53 = *(void *)(v50 + 56);
    do
    {
      uint64_t v54 = v0[11];
      uint64_t v55 = v0[9];
      v72(v54, v52, v55);
      uint64_t v56 = sub_243349E90();
      uint64_t v58 = v57;
      (*(void (**)(uint64_t, uint64_t))(v50 - 8))(v54, v55);
      uint64_t v47 = v75;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_243340948(0, *(void *)(v47 + 16) + 1, 1);
        uint64_t v47 = v75;
      }
      unint64_t v60 = *(void *)(v47 + 16);
      unint64_t v59 = *(void *)(v47 + 24);
      if (v60 >= v59 >> 1)
      {
        sub_243340948(v59 > 1, v60 + 1, 1);
        uint64_t v47 = v75;
      }
      *(void *)(v47 + 16) = v60 + 1;
      uint64_t v61 = v47 + 16 * v60;
      *(void *)(v61 + 32) = v56;
      *(void *)(v61 + 40) = v58;
      v52 += v53;
      --v46;
      uint64_t v0 = v73;
    }
    while (v46);
  }
  v0[25] = v47;
  uint64_t v62 = (void *)swift_task_alloc();
  v0[26] = v62;
  *uint64_t v62 = v0;
  v62[1] = sub_24333C560;
  return MEMORY[0x270F26808](v47);
}

uint64_t sub_24333C400()
{
  uint64_t v2 = (void *)*v1;
  v2[23] = v0;
  swift_task_dealloc();
  if (v0)
  {
    return MEMORY[0x270FA2498](sub_24333C6FC, 0, 0);
  }
  else
  {
    uint64_t v3 = (void *)v2[20];
    swift_bridgeObjectRelease();

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v4 = (uint64_t (*)(void))v2[1];
    return v4();
  }
}

uint64_t sub_24333C560()
{
  *(void *)(*(void *)v1 + 216) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v2 = sub_24333C948;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v2 = sub_24333C67C;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24333C67C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24333C6FC()
{
  uint64_t v1 = *(NSObject **)(v0 + 184);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 136);
  uint64_t v3 = *(void *)(v0 + 128);
  uint64_t v4 = *(void *)(v0 + 112);
  uint64_t v5 = *(void *)(v0 + 96);
  uint64_t v6 = *(void *)(v0 + 64);
  swift_bridgeObjectRelease();
  v2(v4, v6 + v3, v5);
  uint64_t v7 = v1;
  os_log_type_t v8 = v1;
  uint64_t v9 = sub_24334A590();
  os_log_type_t v10 = sub_24334A7D0();
  if (os_log_type_enabled(v9, v10))
  {
    BOOL v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = (void *)swift_slowAlloc();
    *(_DWORD *)BOOL v11 = 138412290;
    uint64_t v13 = v1;
    uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 40) = v14;
    sub_24334A820();
    void *v12 = v14;

    _os_log_impl(&dword_243318000, v9, v10, "caught err %@, returning public", v11, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93300);
    swift_arrayDestroy();
    MEMORY[0x24567AB80](v12, -1, -1);
    MEMORY[0x24567AB80](v11, -1, -1);
  }
  else
  {
  }
  uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v0 + 152);
  uint64_t v16 = *(void *)(v0 + 112);
  uint64_t v17 = *(void *)(v0 + 96);

  v15(v16, v17);
  sub_24331FCB8();
  swift_allocError();
  sub_24331C07C(v1, v18);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
  return v19();
}

uint64_t sub_24333C948()
{
  uint64_t v1 = *(NSObject **)(v0 + 216);
  uint64_t v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 136);
  uint64_t v3 = *(void *)(v0 + 128);
  uint64_t v4 = *(void *)(v0 + 112);
  uint64_t v5 = *(void *)(v0 + 96);
  uint64_t v6 = *(void *)(v0 + 64);
  swift_bridgeObjectRelease();
  v2(v4, v6 + v3, v5);
  uint64_t v7 = v1;
  os_log_type_t v8 = v1;
  uint64_t v9 = sub_24334A590();
  os_log_type_t v10 = sub_24334A7D0();
  if (os_log_type_enabled(v9, v10))
  {
    BOOL v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = (void *)swift_slowAlloc();
    *(_DWORD *)BOOL v11 = 138412290;
    uint64_t v13 = v1;
    uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 40) = v14;
    sub_24334A820();
    void *v12 = v14;

    _os_log_impl(&dword_243318000, v9, v10, "caught err %@, returning public", v11, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93300);
    swift_arrayDestroy();
    MEMORY[0x24567AB80](v12, -1, -1);
    MEMORY[0x24567AB80](v11, -1, -1);
  }
  else
  {
  }
  uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v0 + 152);
  uint64_t v16 = *(void *)(v0 + 112);
  uint64_t v17 = *(void *)(v0 + 96);

  v15(v16, v17);
  sub_24331FCB8();
  swift_allocError();
  sub_24331C07C(v1, v18);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  unint64_t v19 = *(uint64_t (**)(void))(v0 + 8);
  return v19();
}

uint64_t DockAccessory.setFramingMode(_:)(unsigned char *a1)
{
  *(void *)(v2 + 56) = v1;
  uint64_t v4 = sub_24334A5B0();
  *(void *)(v2 + 64) = v4;
  *(void *)(v2 + 72) = *(void *)(v4 - 8);
  *(void *)(v2 + 80) = swift_task_alloc();
  *(void *)(v2 + 88) = swift_task_alloc();
  *(unsigned char *)(v2 + 153) = *a1;
  return MEMORY[0x270FA2498](sub_24333CC70, 0, 0);
}

uint64_t sub_24333CC70()
{
  uint64_t v40 = v0;
  uint64_t v1 = (id *)(*(void *)(v0 + 56) + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (!*v1)
  {
    sub_24331FCB8();
    swift_allocError();
    unsigned char *v16 = 1;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v17 = *(uint64_t (**)(void))(v0 + 8);
LABEL_15:
    return v17();
  }
  uint64_t v2 = *(void *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 64);
  uint64_t v4 = *(void *)(v0 + 72);
  uint64_t v5 = *(void *)(v0 + 56);
  uint64_t v6 = OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
  *(void *)(v0 + 96) = OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
  uint64_t v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  *(void *)(v0 + 104) = v7;
  *(void *)(v0 + 112) = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v7(v2, v5 + v6, v3);
  os_log_type_t v8 = sub_24334A590();
  os_log_type_t v9 = sub_24334A7B0();
  if (os_log_type_enabled(v8, v9))
  {
    char v10 = *(unsigned char *)(v0 + 153);
    uint64_t v36 = *(void *)(v0 + 72);
    uint64_t v37 = *(void *)(v0 + 64);
    uint64_t v38 = *(void *)(v0 + 88);
    BOOL v11 = (uint8_t *)swift_slowAlloc();
    uint64_t v12 = swift_slowAlloc();
    uint64_t v39 = v12;
    *(_DWORD *)BOOL v11 = 136446210;
    *(unsigned char *)(v0 + 152) = v10;
    uint64_t v13 = sub_24334A610();
    *(void *)(v0 + 48) = sub_2433402D0(v13, v14, &v39);
    sub_24334A820();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_243318000, v8, v9, "API: setFramingMode: %{public}s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x24567AB80](v12, -1, -1);
    MEMORY[0x24567AB80](v11, -1, -1);

    uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v36 + 8);
    v15(v38, v37);
  }
  else
  {
    uint64_t v18 = *(void *)(v0 + 88);
    uint64_t v19 = *(void *)(v0 + 64);
    uint64_t v20 = *(void *)(v0 + 72);

    uint64_t v15 = *(void (**)(uint64_t, uint64_t))(v20 + 8);
    v15(v18, v19);
  }
  *(void *)(v0 + 120) = v15;
  uint64_t v21 = *(unsigned __int8 *)(v0 + 153);
  if (qword_268D932C0 != -1) {
    swift_once();
  }
  uint64_t v22 = qword_268D932C8;
  uint64_t v23 = OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock;
  uint64_t v24 = *(os_unfair_lock_s **)(qword_268D932C8 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock);
  swift_retain();
  os_unfair_lock_lock(v24 + 4);
  swift_release();
  int v25 = *(unsigned __int8 *)(v22 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabled);
  uint64_t v26 = *(os_unfair_lock_s **)(v22 + v23);
  swift_retain();
  os_unfair_lock_unlock(v26 + 4);
  swift_release();
  if (v25 == 1)
  {
    if (*v1)
    {
      id v27 = *v1;
      sub_24334A100();
    }
    char v28 = *(unsigned char *)(v0 + 153);
    uint64_t v29 = *(void *)(v0 + 56);
    uint64_t v30 = *(os_unfair_lock_s **)(v29 + OBJC_IVAR____TtC7DockKit13DockAccessory__framingModeLock);
    uint64_t v31 = swift_task_alloc();
    *(void *)(v31 + 16) = v29;
    *(unsigned char *)(v31 + 24) = v28;
    uint64_t v32 = swift_task_alloc();
    *(void *)(v32 + 16) = sub_2433425A4;
    *(void *)(v32 + 24) = v31;
    swift_retain();
    os_unfair_lock_lock(v30 + 4);
    sub_2433425BC(v33);
    os_unfair_lock_unlock(v30 + 4);
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v17 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_15;
  }
  *(void *)(v0 + 128) = objc_msgSend(objc_allocWithZone((Class)sub_243349FD0()), sel_init);
  uint64_t v34 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v34;
  *uint64_t v34 = v0;
  v34[1] = sub_24333D130;
  return MEMORY[0x270F26810](v21);
}

uint64_t sub_24333D130()
{
  *(void *)(*(void *)v1 + 144) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24333D380;
  }
  else {
    uint64_t v2 = sub_24333D244;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24333D244()
{
  uint64_t v1 = *(void *)(v0 + 144);
  char v2 = *(unsigned char *)(v0 + 153);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v4 = *(os_unfair_lock_s **)(v3 + OBJC_IVAR____TtC7DockKit13DockAccessory__framingModeLock);
  uint64_t v5 = swift_task_alloc();
  *(void *)(v5 + 16) = v3;
  *(unsigned char *)(v5 + 24) = v2;
  uint64_t v6 = swift_task_alloc();
  *(void *)(v6 + 16) = sub_2433425A4;
  *(void *)(v6 + 24) = v5;
  swift_retain();
  os_unfair_lock_lock(v4 + 4);
  sub_2433425BC(v7);
  os_unfair_lock_unlock(v4 + 4);
  if (v1)
  {
    return swift_task_dealloc();
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    os_log_type_t v9 = *(uint64_t (**)(void))(v0 + 8);
    return v9();
  }
}

uint64_t sub_24333D380()
{
  uint64_t v1 = *(void **)(v0 + 144);
  char v2 = *(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 104);
  uint64_t v3 = *(void *)(v0 + 96);
  uint64_t v4 = *(void *)(v0 + 80);
  uint64_t v6 = *(void *)(v0 + 56);
  uint64_t v5 = *(void *)(v0 + 64);

  v2(v4, v6 + v3, v5);
  id v7 = v1;
  id v8 = v1;
  os_log_type_t v9 = sub_24334A590();
  os_log_type_t v10 = sub_24334A7D0();
  if (os_log_type_enabled(v9, v10))
  {
    BOOL v11 = *(void **)(v0 + 144);
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 138412290;
    id v14 = v11;
    uint64_t v15 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 40) = v15;
    sub_24334A820();
    *uint64_t v13 = v15;

    _os_log_impl(&dword_243318000, v9, v10, "caught err %@, returning public", v12, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93300);
    swift_arrayDestroy();
    MEMORY[0x24567AB80](v13, -1, -1);
    MEMORY[0x24567AB80](v12, -1, -1);
  }
  else
  {
    uint64_t v16 = *(void **)(v0 + 144);
  }
  uint64_t v17 = *(NSObject **)(v0 + 144);
  uint64_t v18 = *(void (**)(uint64_t, uint64_t))(v0 + 120);
  uint64_t v19 = *(void *)(v0 + 80);
  uint64_t v20 = *(void *)(v0 + 64);

  v18(v19, v20);
  sub_24331FCB8();
  swift_allocError();
  sub_24331C07C(v17, v21);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v22 = *(uint64_t (**)(void))(v0 + 8);
  return v22();
}

uint64_t DockAccessory.setRegionOfInterest(_:)(double a1, double a2, double a3, double a4)
{
  *(void *)(v5 + 112) = v4;
  *(double *)(v5 + 96) = a3;
  *(double *)(v5 + 104) = a4;
  *(double *)(v5 + 80) = a1;
  *(double *)(v5 + 88) = a2;
  uint64_t v6 = sub_24334A5B0();
  *(void *)(v5 + 120) = v6;
  *(void *)(v5 + 128) = *(void *)(v6 - 8);
  *(void *)(v5 + 136) = swift_task_alloc();
  *(void *)(v5 + 144) = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24333D69C, 0, 0);
}

uint64_t sub_24333D69C()
{
  uint64_t v48 = v0;
  uint64_t v1 = (id *)(*(void *)(v0 + 112) + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (!*v1)
  {
    sub_24331FCB8();
    swift_allocError();
    unsigned char *v24 = 1;
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v43 = *(uint64_t (**)(void))(v0 + 8);
LABEL_15:
    return v43();
  }
  uint64_t v2 = *(void *)(v0 + 144);
  uint64_t v3 = *(void *)(v0 + 120);
  uint64_t v4 = *(void *)(v0 + 128);
  uint64_t v5 = *(void *)(v0 + 112);
  uint64_t v6 = OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
  *(void *)(v0 + 152) = OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
  id v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  *(void *)(v0 + 160) = v7;
  *(void *)(v0 + 168) = (v4 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v7(v2, v5 + v6, v3);
  uint64_t v8 = sub_24334A590();
  os_log_type_t v9 = sub_24334A7B0();
  BOOL v10 = os_log_type_enabled(v8, v9);
  uint64_t v11 = *(void *)(v0 + 144);
  uint64_t v12 = *(void *)(v0 + 120);
  uint64_t v13 = *(void *)(v0 + 128);
  if (v10)
  {
    uint64_t v14 = swift_slowAlloc();
    uint64_t v45 = swift_slowAlloc();
    v47[0] = v45;
    *(_DWORD *)uint64_t v14 = 136446978;
    uint64_t v15 = sub_24334A7A0();
    *(void *)(v0 + 48) = sub_2433402D0(v15, v16, v47);
    sub_24334A820();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2082;
    uint64_t v17 = sub_24334A7A0();
    *(void *)(v0 + 56) = sub_2433402D0(v17, v18, v47);
    sub_24334A820();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 22) = 2082;
    uint64_t v19 = sub_24334A7A0();
    *(void *)(v0 + 64) = sub_2433402D0(v19, v20, v47);
    sub_24334A820();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 32) = 2082;
    uint64_t v21 = sub_24334A7A0();
    *(void *)(v0 + 72) = sub_2433402D0(v21, v22, v47);
    sub_24334A820();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_243318000, v8, v9, "API: setRegionOfInterest: %{public}s, %{public}s, %{public}s, %{public}s", (uint8_t *)v14, 0x2Au);
    swift_arrayDestroy();
    MEMORY[0x24567AB80](v45, -1, -1);
    MEMORY[0x24567AB80](v14, -1, -1);

    uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v23(v11, v12);
  }
  else
  {

    uint64_t v23 = *(void (**)(uint64_t, uint64_t))(v13 + 8);
    v23(v11, v12);
  }
  *(void *)(v0 + 176) = v23;
  if (qword_268D932C0 != -1) {
    swift_once();
  }
  uint64_t v25 = qword_268D932C8;
  uint64_t v26 = OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock;
  id v27 = *(os_unfair_lock_s **)(qword_268D932C8 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock);
  swift_retain();
  os_unfair_lock_lock(v27 + 4);
  swift_release();
  int v28 = *(unsigned __int8 *)(v25 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabled);
  uint64_t v29 = *(os_unfair_lock_s **)(v25 + v26);
  swift_retain();
  os_unfair_lock_unlock(v29 + 4);
  swift_release();
  if (v28 == 1)
  {
    if (*v1)
    {
      id v30 = *v1;
      sub_24334A0F0();
    }
    uint64_t v36 = *(void *)(v0 + 112);
    uint64_t v38 = *(void *)(v0 + 96);
    uint64_t v37 = *(void *)(v0 + 104);
    long long v46 = *(_OWORD *)(v0 + 80);
    uint64_t v39 = *(os_unfair_lock_s **)(v36 + OBJC_IVAR____TtC7DockKit13DockAccessory__roiLock);
    uint64_t v40 = swift_task_alloc();
    *(void *)(v40 + 16) = v36;
    *(_OWORD *)(v40 + 24) = v46;
    *(void *)(v40 + 40) = v38;
    *(void *)(v40 + 48) = v37;
    uint64_t v41 = swift_task_alloc();
    *(void *)(v41 + 16) = sub_2433425D8;
    *(void *)(v41 + 24) = v40;
    swift_retain();
    os_unfair_lock_lock(v39 + 4);
    sub_243349D70(v42);
    os_unfair_lock_unlock(v39 + 4);
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    unint64_t v43 = *(uint64_t (**)(void))(v0 + 8);
    goto LABEL_15;
  }
  *(void *)(v0 + 184) = objc_msgSend(objc_allocWithZone((Class)sub_243349FD0()), sel_init);
  uint64_t v31 = (void *)swift_task_alloc();
  *(void *)(v0 + 192) = v31;
  *uint64_t v31 = v0;
  v31[1] = sub_24333DDFC;
  v32.n128_u64[0] = *(void *)(v0 + 96);
  v33.n128_u64[0] = *(void *)(v0 + 104);
  v34.n128_u64[0] = *(void *)(v0 + 80);
  v35.n128_u64[0] = *(void *)(v0 + 88);
  return MEMORY[0x270F26820](v34, v35, v32, v33);
}

uint64_t sub_24333DDFC()
{
  *(void *)(*(void *)v1 + 200) = v0;
  swift_task_dealloc();
  if (v0) {
    uint64_t v2 = sub_24333E068;
  }
  else {
    uint64_t v2 = sub_24333DF10;
  }
  return MEMORY[0x270FA2498](v2, 0, 0);
}

uint64_t sub_24333DF10()
{
  uint64_t v1 = *(void *)(v0 + 200);
  uint64_t v2 = *(void *)(v0 + 112);
  uint64_t v4 = *(void *)(v0 + 96);
  uint64_t v3 = *(void *)(v0 + 104);
  long long v11 = *(_OWORD *)(v0 + 80);
  uint64_t v5 = *(os_unfair_lock_s **)(v2 + OBJC_IVAR____TtC7DockKit13DockAccessory__roiLock);
  uint64_t v6 = swift_task_alloc();
  *(void *)(v6 + 16) = v2;
  *(_OWORD *)(v6 + 24) = v11;
  *(void *)(v6 + 40) = v4;
  *(void *)(v6 + 48) = v3;
  uint64_t v7 = swift_task_alloc();
  *(void *)(v7 + 16) = sub_2433425D8;
  *(void *)(v7 + 24) = v6;
  swift_retain();
  os_unfair_lock_lock(v5 + 4);
  sub_243349D70(v8);
  os_unfair_lock_unlock(v5 + 4);
  if (v1)
  {
    return swift_task_dealloc();
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    BOOL v10 = *(uint64_t (**)(void))(v0 + 8);
    return v10();
  }
}

uint64_t sub_24333E068()
{
  uint64_t v1 = *(NSObject **)(v0 + 200);
  (*(void (**)(void, void, void))(v0 + 160))(*(void *)(v0 + 136), *(void *)(v0 + 112) + *(void *)(v0 + 152), *(void *)(v0 + 120));
  uint64_t v2 = v1;
  uint64_t v3 = v1;
  uint64_t v4 = sub_24334A590();
  os_log_type_t v5 = sub_24334A7D0();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = (void *)swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 138412290;
    uint64_t v8 = v1;
    uint64_t v9 = _swift_stdlib_bridgeErrorToNSError();
    *(void *)(v0 + 40) = v9;
    sub_24334A820();
    *uint64_t v7 = v9;

    _os_log_impl(&dword_243318000, v4, v5, "caught err %@, returning public", v6, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93300);
    swift_arrayDestroy();
    MEMORY[0x24567AB80](v7, -1, -1);
    MEMORY[0x24567AB80](v6, -1, -1);
  }
  else
  {
  }
  BOOL v10 = *(void (**)(uint64_t, uint64_t))(v0 + 176);
  uint64_t v11 = *(void *)(v0 + 136);
  uint64_t v12 = *(void *)(v0 + 120);

  v10(v11, v12);
  sub_24331FCB8();
  swift_allocError();
  sub_24331C07C(v1, v13);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v14 = *(uint64_t (**)(void))(v0 + 8);
  return v14();
}

uint64_t DockAccessory.animate(motion:)(unsigned char *a1)
{
  *(void *)(v2 + 104) = v1;
  uint64_t v4 = sub_24334A2A0();
  *(void *)(v2 + 112) = v4;
  *(void *)(v2 + 120) = *(void *)(v4 - 8);
  *(void *)(v2 + 128) = swift_task_alloc();
  uint64_t v5 = sub_24334A5B0();
  *(void *)(v2 + 136) = v5;
  *(void *)(v2 + 144) = *(void *)(v5 - 8);
  *(void *)(v2 + 152) = swift_task_alloc();
  *(void *)(v2 + 160) = swift_task_alloc();
  *(void *)(v2 + 168) = swift_task_alloc();
  *(void *)(v2 + 176) = swift_task_alloc();
  uint64_t v6 = sub_243349E80();
  *(void *)(v2 + 184) = v6;
  *(void *)(v2 + 192) = *(void *)(v6 - 8);
  *(void *)(v2 + 200) = swift_task_alloc();
  *(unsigned char *)(v2 + 313) = *a1;
  return MEMORY[0x270FA2498](sub_24333E444, 0, 0);
}

uint64_t sub_24333E444()
{
  if (qword_268D932C0 != -1) {
    swift_once();
  }
  uint64_t v1 = qword_268D932C8;
  uint64_t v2 = OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock;
  uint64_t v3 = *(os_unfair_lock_s **)(qword_268D932C8 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabledLock);
  swift_retain();
  os_unfair_lock_lock(v3 + 4);
  swift_release();
  char v4 = *(unsigned char *)(v1 + OBJC_IVAR____TtC7DockKit20DockAccessoryManager__systemDisabled);
  uint64_t v5 = *(os_unfair_lock_s **)(v1 + v2);
  swift_retain();
  os_unfair_lock_unlock(v5 + 4);
  swift_release();
  if ((v4 & 1) == 0) {
    return sub_24334A8B0();
  }
  uint64_t v6 = v0[13];
  uint64_t v7 = OBJC_IVAR____TtC7DockKit13DockAccessory__animateCommandLock;
  v0[26] = OBJC_IVAR____TtC7DockKit13DockAccessory__animateCommandLock;
  v0[27] = *(void *)(v6 + v7);
  BOOL v10 = (uint64_t (*)(void))((int)*MEMORY[0x263F501C8] + MEMORY[0x263F501C8]);
  swift_retain();
  uint64_t v8 = (void *)swift_task_alloc();
  v0[28] = v8;
  *uint64_t v8 = v0;
  v8[1] = sub_24333E608;
  return v10();
}

uint64_t sub_24333E608()
{
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_24333E720, 0, 0);
}

uint64_t sub_24333E720()
{
  uint64_t v2 = v0[24];
  uint64_t v1 = v0[25];
  uint64_t v3 = v0[23];
  uint64_t v4 = v0[13];
  uint64_t v5 = v4 + OBJC_IVAR____TtC7DockKit13DockAccessory__lastAnimateCommandTime;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v5, v3);
  sub_243349E50();
  double v7 = v6;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  double v8 = 1.0 / *(double *)(v4 + OBJC_IVAR____TtC7DockKit13DockAccessory__maxAnimateFrequency);
  uint64_t v9 = v0[13];
  if (fabs(v7) >= v8)
  {
    uint64_t v22 = v0[25];
    uint64_t v23 = v0[26];
    uint64_t v24 = v0[23];
    uint64_t v25 = v0[24];
    sub_243349E70();
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v25 + 40))(v5, v22, v24);
    swift_endAccess();
    v0[30] = *(void *)(v9 + v23);
    sub_24334A570();
    sub_24334175C(&qword_268D936E0, MEMORY[0x263F501D0]);
    swift_retain();
    uint64_t v18 = sub_24334A710();
    uint64_t v20 = v26;
    uint64_t v21 = sub_24333EB5C;
  }
  else
  {
    (*(void (**)(void, uint64_t, void))(v0[18] + 16))(v0[22], v9 + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, v0[17]);
    BOOL v10 = sub_24334A590();
    os_log_type_t v11 = sub_24334A7B0();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_243318000, v10, v11, "rate limiting animate", v12, 2u);
      MEMORY[0x24567AB80](v12, -1, -1);
    }
    uint64_t v13 = v0[26];
    uint64_t v14 = v0[22];
    uint64_t v15 = v0[17];
    uint64_t v16 = v0[18];
    uint64_t v17 = v0[13];

    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);
    v0[29] = *(void *)(v17 + v13);
    sub_24334A570();
    sub_24334175C(&qword_268D936E0, MEMORY[0x263F501D0]);
    swift_retain();
    uint64_t v18 = sub_24334A710();
    uint64_t v20 = v19;
    uint64_t v21 = sub_24333EA10;
  }
  return MEMORY[0x270FA2498](v21, v18, v20);
}

uint64_t sub_24333EA10()
{
  sub_24334A550();
  swift_release();
  return MEMORY[0x270FA2498](sub_24333EA80, 0, 0);
}

uint64_t sub_24333EA80()
{
  sub_24331FCB8();
  swift_allocError();
  *uint64_t v1 = 7;
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_24333EB5C()
{
  sub_24334A550();
  swift_release();
  return MEMORY[0x270FA2498](sub_24333EBCC, 0, 0);
}

uint64_t sub_24333EBCC()
{
  uint64_t v39 = v0;
  uint64_t v1 = (id *)(*(void *)(v0 + 104) + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
  swift_beginAccess();
  if (*v1)
  {
    uint64_t v2 = *(void *)(v0 + 144);
    uint64_t v3 = *(void *)(v0 + 104);
    id v4 = *v1;
    char v5 = sub_24334A120();

    uint64_t v6 = OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
    *(void *)(v0 + 248) = OBJC_IVAR____TtC7DockKit13DockAccessory_logger;
    double v7 = *(void (**)(void, uint64_t, uint64_t))(v2 + 16);
    uint64_t v8 = v3 + v6;
    *(void *)(v0 + 256) = v7;
    *(void *)(v0 + 264) = (v2 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
    uint64_t v9 = *(void *)(v0 + 136);
    if (v5)
    {
      v7(*(void *)(v0 + 160), v8, v9);
      BOOL v10 = sub_24334A590();
      os_log_type_t v11 = sub_24334A7B0();
      if (os_log_type_enabled(v10, v11))
      {
        char v12 = *(unsigned char *)(v0 + 313);
        uint64_t v34 = *(void *)(v0 + 144);
        uint64_t v35 = *(void *)(v0 + 136);
        uint64_t v36 = *(void *)(v0 + 160);
        uint64_t v13 = (uint8_t *)swift_slowAlloc();
        uint64_t v14 = swift_slowAlloc();
        uint64_t v38 = v14;
        *(_DWORD *)uint64_t v13 = 136446210;
        *(unsigned char *)(v0 + 312) = v12;
        uint64_t v15 = sub_24334A610();
        *(void *)(v0 + 96) = sub_2433402D0(v15, v16, &v38);
        sub_24334A820();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_243318000, v10, v11, "API: animate: %{public}s", v13, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x24567AB80](v14, -1, -1);
        MEMORY[0x24567AB80](v13, -1, -1);

        uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v34 + 8);
        v17(v36, v35);
      }
      else
      {
        uint64_t v28 = *(void *)(v0 + 160);
        uint64_t v29 = *(void *)(v0 + 136);
        uint64_t v30 = *(void *)(v0 + 144);

        uint64_t v17 = *(void (**)(uint64_t, uint64_t))(v30 + 8);
        v17(v28, v29);
      }
      *(void *)(v0 + 272) = v17;
      uint64_t result = (*(uint64_t (**)(void, void, void))(*(void *)(v0 + 120) + 104))(*(void *)(v0 + 128), **((unsigned int **)&unk_26517E178 + *(char *)(v0 + 313)), *(void *)(v0 + 112));
      id v31 = *v1;
      *(void *)(v0 + 280) = *v1;
      if (v31)
      {
        uint64_t v37 = (uint64_t (*)(uint64_t))((int)*MEMORY[0x263F3A870] + MEMORY[0x263F3A870]);
        v31;
        __n128 v32 = (void *)swift_task_alloc();
        *(void *)(v0 + 288) = v32;
        void *v32 = v0;
        v32[1] = sub_24333F020;
        uint64_t v33 = *(void *)(v0 + 128);
        return v37(v33);
      }
      else
      {
        __break(1u);
      }
      return result;
    }
    v7(*(void *)(v0 + 168), v8, v9);
    uint64_t v19 = sub_24334A590();
    os_log_type_t v20 = sub_24334A7D0();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_243318000, v19, v20, "Tracking button off, motors disabled", v21, 2u);
      MEMORY[0x24567AB80](v21, -1, -1);
    }
    uint64_t v22 = *(void *)(v0 + 168);
    uint64_t v23 = *(void *)(v0 + 136);
    uint64_t v24 = *(void *)(v0 + 144);

    (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v22, v23);
    char v18 = 2;
  }
  else
  {
    char v18 = 1;
  }
  sub_24331FCB8();
  swift_allocError();
  *uint64_t v25 = v18;
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v26 = *(uint64_t (**)(void))(v0 + 8);
  return v26();
}

uint64_t sub_24333F020(uint64_t a1)
{
  uint64_t v4 = *v2;
  *(void *)(v4 + 296) = v1;
  swift_task_dealloc();

  if (v1)
  {
    char v5 = sub_24333F22C;
  }
  else
  {
    *(void *)(v4 + 304) = a1;
    char v5 = sub_24333F164;
  }
  return MEMORY[0x270FA2498](v5, 0, 0);
}

uint64_t sub_24333F164()
{
  (*(void (**)(void, void))(v0[15] + 8))(v0[16], v0[14]);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(uint64_t))v0[1];
  uint64_t v2 = v0[38];
  return v1(v2);
}

uint64_t sub_24333F22C()
{
  uint64_t v1 = (void *)v0[37];
  uint64_t v2 = (void (*)(uint64_t, uint64_t, uint64_t))v0[32];
  uint64_t v3 = v0[19];
  uint64_t v4 = v0[17];
  uint64_t v5 = v0[13] + v0[31];
  (*(void (**)(void, void))(v0[15] + 8))(v0[16], v0[14]);
  v2(v3, v5, v4);
  id v6 = v1;
  id v7 = v1;
  uint64_t v8 = sub_24334A590();
  os_log_type_t v9 = sub_24334A7D0();
  if (os_log_type_enabled(v8, v9))
  {
    BOOL v10 = (void *)v0[37];
    os_log_type_t v11 = (uint8_t *)swift_slowAlloc();
    char v12 = (void *)swift_slowAlloc();
    *(_DWORD *)os_log_type_t v11 = 138412290;
    id v13 = v10;
    uint64_t v14 = _swift_stdlib_bridgeErrorToNSError();
    v0[11] = v14;
    sub_24334A820();
    void *v12 = v14;

    _os_log_impl(&dword_243318000, v8, v9, "caught err %@, returning public", v11, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93300);
    swift_arrayDestroy();
    MEMORY[0x24567AB80](v12, -1, -1);
    MEMORY[0x24567AB80](v11, -1, -1);
  }
  else
  {
    uint64_t v15 = (void *)v0[37];
  }
  unint64_t v16 = v0[37];
  uint64_t v17 = (void (*)(uint64_t, uint64_t))v0[34];
  uint64_t v18 = v0[19];
  uint64_t v19 = v0[17];

  v17(v18, v19);
  sub_24331FCB8();
  swift_allocError();
  sub_24331C07C(v16, v20);
  swift_willThrow();

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v21 = (uint64_t (*)(void))v0[1];
  return v21();
}

uint64_t sub_24333F4B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[12] = a4;
  uint64_t v5 = sub_24334A5B0();
  v4[13] = v5;
  v4[14] = *(void *)(v5 - 8);
  v4[15] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D933D0);
  v4[16] = swift_task_alloc();
  uint64_t v6 = sub_243349E80();
  v4[17] = v6;
  v4[18] = *(void *)(v6 - 8);
  v4[19] = swift_task_alloc();
  v4[20] = swift_task_alloc();
  return MEMORY[0x270FA2498](sub_24333F60C, 0, 0);
}

uint64_t sub_24333F60C()
{
  uint64_t v1 = v0[12];
  uint64_t v2 = OBJC_IVAR____TtC7DockKit13DockAccessory_trackingSummaryLock;
  v0[21] = OBJC_IVAR____TtC7DockKit13DockAccessory_trackingSummaryLock;
  v0[22] = *(void *)(v1 + v2);
  uint64_t v5 = (uint64_t (*)(void))((int)*MEMORY[0x263F3A9D0] + MEMORY[0x263F3A9D0]);
  swift_retain();
  uint64_t v3 = (void *)swift_task_alloc();
  v0[23] = v3;
  *uint64_t v3 = v0;
  v3[1] = sub_24333F6D4;
  return v5();
}

uint64_t sub_24333F6D4(char a1)
{
  *(unsigned char *)(*(void *)v1 + 208) = a1;
  swift_task_dealloc();
  swift_release();
  return MEMORY[0x270FA2498](sub_24333F7F4, 0, 0);
}

uint64_t sub_24333F7F4()
{
  if (*(unsigned char *)(v0 + 208) == 1)
  {
    uint64_t v2 = *(void *)(v0 + 152);
    uint64_t v1 = *(void *)(v0 + 160);
    uint64_t v3 = *(void *)(v0 + 136);
    uint64_t v4 = *(void *)(v0 + 144);
    uint64_t v5 = *(void *)(v0 + 96);
    sub_243349E60();
    uint64_t v6 = v5 + OBJC_IVAR____TtC7DockKit13DockAccessory_lastSummaryPublishTime;
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v6, v3);
    sub_243349E40();
    double v8 = v7;
    os_log_type_t v9 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
    v9(v2, v3);
    v9(v1, v3);
    if (v8 > 0.05)
    {
      uint64_t v10 = *(void *)(v0 + 160);
      uint64_t v11 = *(void *)(v0 + 136);
      uint64_t v12 = *(void *)(v0 + 144);
      uint64_t v13 = *(void *)(v0 + 96);
      sub_243349E60();
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 40))(v6, v10, v11);
      swift_endAccess();
      uint64_t v14 = (id *)(v13 + OBJC_IVAR____TtC7DockKit13DockAccessory_accessory);
      swift_beginAccess();
      if (!*v14)
      {
LABEL_8:
        (*(void (**)(void, uint64_t, void))(*(void *)(v0 + 112) + 16))(*(void *)(v0 + 120), *(void *)(v0 + 96) + OBJC_IVAR____TtC7DockKit13DockAccessory_logger, *(void *)(v0 + 104));
        uint64_t v18 = sub_24334A590();
        os_log_type_t v19 = sub_24334A7D0();
        if (os_log_type_enabled(v18, v19))
        {
          os_log_type_t v20 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)os_log_type_t v20 = 0;
          _os_log_impl(&dword_243318000, v18, v19, "no summary", v20, 2u);
          MEMORY[0x24567AB80](v20, -1, -1);
        }
        uint64_t v21 = *(void *)(v0 + 168);
        uint64_t v23 = *(void *)(v0 + 112);
        uint64_t v22 = *(void *)(v0 + 120);
        uint64_t v25 = *(void *)(v0 + 96);
        uint64_t v24 = *(void *)(v0 + 104);

        (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v22, v24);
        *(void *)(v0 + 192) = *(void *)(v25 + v21);
        sub_24334A540();
        sub_24334175C(&qword_268D93A78, MEMORY[0x263F3A9D8]);
        swift_retain();
        uint64_t v26 = sub_24334A710();
        uint64_t v28 = v27;
        uint64_t v29 = sub_24333FD98;
        goto LABEL_22;
      }
      id v15 = *v14;
      sub_24334A0C0();
      sub_24334A580();
      swift_release();
      if (!*(void *)(v0 + 88))
      {
LABEL_7:

        goto LABEL_8;
      }
      uint64_t v16 = sub_24334A480();
      if (v17 >> 60 == 15)
      {
        swift_release();
        goto LABEL_7;
      }
      uint64_t v32 = v16;
      unint64_t v33 = v17;
      uint64_t v34 = *(void **)(*(void *)(v0 + 96) + OBJC_IVAR____TtC7DockKit13DockAccessory_helper);
      if (v34)
      {
        id v35 = v15;
        uint64_t v36 = v34;
        uint64_t v37 = (void *)sub_24334A000();

        uint64_t v38 = (void *)sub_243349E10();
        uint64_t v39 = &v36[OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_trackingStand];
        uint64_t v40 = (void *)MEMORY[0x24567AC40](&v36[OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_trackingStand]);

        if (v40)
        {
          uint64_t v41 = MEMORY[0x24567AC40](v39);
          if (!v41)
          {
            __break(1u);
            return MEMORY[0x270FA2498](v41, v42, v43);
          }
          uint64_t v44 = (void *)v41;
          uint64_t v45 = (void *)sub_24334A000();

          sub_243349F20();
          LOBYTE(v44) = sub_24334A7F0();

          if (v44)
          {
            uint64_t v46 = *(void *)(v0 + 128);
            uint64_t v47 = sub_243349E20();
            uint64_t v52 = v48;
            uint64_t v53 = v47;
            uint64_t v49 = sub_24334A730();
            (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v49 - 8) + 56))(v46, 1, 1, v49);
            uint64_t v50 = (void *)swift_allocObject();
            _OWORD v50[2] = 0;
            v50[3] = 0;
            v50[4] = v36;
            v50[5] = v53;
            v50[6] = v52;
            uint64_t v36 = v36;
            sub_2433234B4(v46, (uint64_t)&unk_268D93A80, (uint64_t)v50);
            swift_release();
          }
        }

        swift_release();
        sub_243348A20(v32, v33);
      }
      else
      {

        swift_release();
        sub_243348A20(v32, v33);
      }
    }
    *(void *)(v0 + 200) = *(void *)(*(void *)(v0 + 96) + *(void *)(v0 + 168));
    sub_24334A540();
    sub_24334175C(&qword_268D93A78, MEMORY[0x263F3A9D8]);
    swift_retain();
    uint64_t v26 = sub_24334A710();
    uint64_t v28 = v51;
    uint64_t v29 = sub_24333FE2C;
LABEL_22:
    uint64_t v41 = (uint64_t)v29;
    uint64_t v42 = v26;
    uint64_t v43 = v28;
    return MEMORY[0x270FA2498](v41, v42, v43);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v30 = *(uint64_t (**)(void))(v0 + 8);
  return v30();
}

uint64_t sub_24333FD98()
{
  sub_24334A520();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_24333FE2C()
{
  sub_24334A520();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t DockAccessory.hashValue.getter()
{
  return sub_24334A9D0();
}

unint64_t sub_24333FF70()
{
  return DockAccessory.debugDescription.getter();
}

uint64_t sub_24333FF94()
{
  type metadata accessor for DockAccessory.Identifier(0);

  return sub_243349EA0();
}

uint64_t sub_24333FFEC()
{
  return sub_24334A9D0();
}

uint64_t sub_2433400A0()
{
  return sub_24334A5C0();
}

uint64_t sub_243340144()
{
  return sub_24334A9D0();
}

uint64_t sub_2433401F4(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_243349D9C;
  return v6(a1);
}

uint64_t sub_2433402D0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_2433403A4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_243348B24((uint64_t)v12, *a3);
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
      sub_243348B24((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_2433403A4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_24334A830();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_243340560(a5, a6);
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
  uint64_t v8 = sub_24334A880();
  if (!v8)
  {
    sub_24334A8A0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_24334A8D0();
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

uint64_t sub_243340560(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_2433405F8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_2433407D8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_2433407D8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_2433405F8(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_243340770(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_24334A840();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_24334A8A0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_24334A670();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_24334A8D0();
    __break(1u);
LABEL_14:
    uint64_t result = sub_24334A8A0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_243340770(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_268D93AA8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_2433407D8(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93AA8);
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
  uint64_t result = sub_24334A8D0();
  __break(1u);
  return result;
}

uint64_t sub_243340928(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_243340968(a1, a2, a3, (void *)*v3);
  *unint64_t v3 = result;
  return result;
}

uint64_t sub_243340948(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_243340AF4(a1, a2, a3, *v3);
  *unint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_243340968(char a1, int64_t a2, char a3, void *a4)
{
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D933F8);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = _swift_stdlib_malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x263F8EE78];
  }
  unint64_t v13 = (unint64_t)(v10 + 4);
  unint64_t v14 = (unint64_t)(a4 + 4);
  if (a1)
  {
    if (v10 != a4 || v13 >= v14 + 16 * v8) {
      memmove(v10 + 4, a4 + 4, 16 * v8);
    }
    a4[2] = 0;
    goto LABEL_30;
  }
  if (v14 >= v13 + 16 * v8 || v13 >= v14 + 16 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93400);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_24334A8D0();
  __break(1u);
  return result;
}

uint64_t sub_243340AF4(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_268D93A58);
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
  unint64_t v13 = v10 + 32;
  unint64_t v14 = a4 + 32;
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
  uint64_t result = sub_24334A8D0();
  __break(1u);
  return result;
}

unint64_t sub_243340C60(uint64_t a1, uint64_t a2)
{
  sub_24334A990();
  sub_24334A640();
  uint64_t v4 = sub_24334A9D0();

  return sub_243340CD8(a1, a2, v4);
}

unint64_t sub_243340CD8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_24334A940() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        unint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_24334A940() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_243340DBC(uint64_t a1, int *a2)
{
  *(void *)(v2 + 16) = a1;
  uint64_t v5 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v3 = (void *)swift_task_alloc();
  *(void *)(v2 + 24) = v3;
  *uint64_t v3 = v2;
  v3[1] = sub_243340E9C;
  return v5(v2 + 32);
}

uint64_t sub_243340E9C()
{
  uint64_t v1 = *v0;
  uint64_t v2 = *(unsigned char **)(*v0 + 16);
  uint64_t v5 = *v0;
  swift_task_dealloc();
  *uint64_t v2 = *(unsigned char *)(v1 + 32);
  uint64_t v3 = *(uint64_t (**)(void))(v5 + 8);
  return v3();
}

uint64_t _s7DockKit0A9AccessoryC0C5EventO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)a1;
  uint64_t v3 = *(unsigned __int8 *)(a1 + 8);
  double v4 = *(double *)a2;
  unsigned int v5 = *(unsigned __int8 *)(a2 + 8);
  if (v3 >> 6)
  {
    if (v3 >> 6 == 1)
    {
      if ((v5 & 0xC0) != 0x40 || v2 != v4) {
        return 0;
      }
    }
    else
    {
      uint64_t v9 = v3 ^ 0x80;
      int v10 = v5 & 0xC0;
      if (*(void *)&v2 | v9)
      {
        BOOL v12 = v10 == 128 && *(void *)&v4 == 1;
        if (!v12 || v5 != 128) {
          return 0;
        }
      }
      else
      {
        BOOL v11 = v10 == 128 && *(void *)&v4 == 0;
        if (!v11 || v5 != 128) {
          return 0;
        }
      }
    }
    return 1;
  }
  else
  {
    if (v5 >= 0x40) {
      return 0;
    }
    char v6 = ((v3 & 1) == 0) ^ v5;
    if (*(void *)&v2 == *(void *)&v4) {
      char v7 = v6;
    }
    else {
      char v7 = 0;
    }
    return v7 & 1;
  }
}

BOOL _s7DockKit0A9AccessoryC12BatteryStateV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  double v2 = *(double *)(a1 + 16);
  int v3 = *(unsigned __int8 *)(a1 + 24);
  int v4 = *(unsigned __int8 *)(a1 + 25);
  double v5 = *(double *)(a2 + 16);
  int v6 = *(unsigned __int8 *)(a2 + 24);
  int v7 = *(unsigned __int8 *)(a2 + 25);
  if (*(void *)a1 == *(void *)a2 && *(void *)(a1 + 8) == *(void *)(a2 + 8))
  {
    BOOL result = 0;
    if (v2 != v5) {
      return result;
    }
    goto LABEL_9;
  }
  char v9 = sub_24334A940();
  BOOL result = 0;
  if ((v9 & 1) != 0 && v2 == v5)
  {
LABEL_9:
    if (((v3 ^ v6) & 1) == 0) {
      return v4 == v7;
    }
  }
  return result;
}

BOOL _s7DockKit0A9AccessoryC13TrackedObjectV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  if ((sub_243349EA0() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = type metadata accessor for DockAccessory.TrackedObject(0);
  BOOL result = CGRectEqualToRect(*(CGRect *)(a1 + *(int *)(v4 + 20)), *(CGRect *)(a2 + *(int *)(v4 + 20)));
  if (!result) {
    return result;
  }
  uint64_t v6 = *(int *)(v4 + 24);
  int v7 = (void *)(a1 + v6);
  char v8 = *(unsigned char *)(a1 + v6 + 8);
  char v9 = (void *)(a2 + v6);
  char v10 = *(unsigned char *)(a2 + v6 + 8);
  if ((v8 & 1) == 0)
  {
    if (*v7 != *v9) {
      char v10 = 1;
    }
    return (v10 & 1) == 0;
  }
  return (v10 & 1) != 0;
}

BOOL _s7DockKit0A9AccessoryC13TrackedPersonV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  if ((sub_243349EA0() & 1) == 0) {
    return 0;
  }
  uint64_t v4 = (int *)type metadata accessor for DockAccessory.TrackedPerson(0);
  BOOL result = CGRectEqualToRect(*(CGRect *)(a1 + v4[5]), *(CGRect *)(a2 + v4[5]));
  if (!result) {
    return result;
  }
  uint64_t v6 = v4[6];
  int v7 = (void *)(a1 + v6);
  char v8 = *(unsigned char *)(a1 + v6 + 8);
  char v9 = (void *)(a2 + v6);
  int v10 = *(unsigned __int8 *)(a2 + v6 + 8);
  if (v8)
  {
    if (!v10) {
      return 0;
    }
  }
  else
  {
    if (*v7 != *v9) {
      LOBYTE(v10) = 1;
    }
    if (v10) {
      return 0;
    }
  }
  uint64_t v11 = v4[7];
  BOOL v12 = (double *)(a1 + v11);
  char v13 = *(unsigned char *)(a1 + v11 + 8);
  BOOL v14 = (double *)(a2 + v11);
  int v15 = *(unsigned __int8 *)(a2 + v11 + 8);
  if (v13)
  {
    if (!v15) {
      return 0;
    }
  }
  else
  {
    if (*v12 != *v14) {
      LOBYTE(v15) = 1;
    }
    if (v15) {
      return 0;
    }
  }
  uint64_t v16 = v4[8];
  unint64_t v17 = (double *)(a1 + v16);
  char v18 = *(unsigned char *)(a1 + v16 + 8);
  os_log_type_t v19 = (double *)(a2 + v16);
  char v20 = *(unsigned char *)(a2 + v16 + 8);
  if ((v18 & 1) == 0)
  {
    if (*v17 != *v19) {
      char v20 = 1;
    }
    return (v20 & 1) == 0;
  }
  return (v20 & 1) != 0;
}

BOOL _s7DockKit0A9AccessoryC18TrackedSubjectTypeO2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  uint64_t v30 = a2;
  uint64_t v3 = type metadata accessor for DockAccessory.TrackedObject(0);
  MEMORY[0x270FA5388](v3);
  double v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for DockAccessory.TrackedPerson(0);
  MEMORY[0x270FA5388](v6 - 8);
  char v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for DockAccessory.TrackedSubjectType(0);
  uint64_t v10 = MEMORY[0x270FA5388](v9);
  BOOL v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v10);
  BOOL v14 = (char *)&v29 - v13;
  uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268D93BE0);
  uint64_t v16 = MEMORY[0x270FA5388](v15 - 8);
  char v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = (uint64_t)&v18[*(int *)(v16 + 56)];
  sub_2433417A4(a1, (uint64_t)v18, type metadata accessor for DockAccessory.TrackedSubjectType);
  sub_2433417A4(v30, v19, type metadata accessor for DockAccessory.TrackedSubjectType);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    sub_2433417A4((uint64_t)v18, (uint64_t)v14, type metadata accessor for DockAccessory.TrackedSubjectType);
    if (swift_getEnumCaseMultiPayload() != 1)
    {
      sub_243342184(v19, (uint64_t)v8, type metadata accessor for DockAccessory.TrackedPerson);
      BOOL v27 = _s7DockKit0A9AccessoryC13TrackedPersonV2eeoiySbAE_AEtFZ_0((uint64_t)v14, (uint64_t)v8);
      sub_243342124((uint64_t)v8, type metadata accessor for DockAccessory.TrackedPerson);
      sub_243342124((uint64_t)v14, type metadata accessor for DockAccessory.TrackedPerson);
      sub_243342124((uint64_t)v18, type metadata accessor for DockAccessory.TrackedSubjectType);
      return v27;
    }
    uint64_t v25 = type metadata accessor for DockAccessory.TrackedPerson;
    uint64_t v26 = (uint64_t)v14;
    goto LABEL_11;
  }
  sub_2433417A4((uint64_t)v18, (uint64_t)v12, type metadata accessor for DockAccessory.TrackedSubjectType);
  if (swift_getEnumCaseMultiPayload() != 1)
  {
    uint64_t v25 = type metadata accessor for DockAccessory.TrackedObject;
    uint64_t v26 = (uint64_t)v12;
LABEL_11:
    sub_243342124(v26, v25);
    sub_243322E58((uint64_t)v18, (uint64_t *)&unk_268D93BE0);
    return 0;
  }
  sub_243342184(v19, (uint64_t)v5, type metadata accessor for DockAccessory.TrackedObject);
  if ((sub_243349EA0() & 1) == 0
    || !CGRectEqualToRect(*(CGRect *)&v12[*(int *)(v3 + 20)], *(CGRect *)&v5[*(int *)(v3 + 20)]))
  {
    goto LABEL_7;
  }
  uint64_t v20 = *(int *)(v3 + 24);
  uint64_t v21 = &v12[v20];
  char v22 = v12[v20 + 8];
  uint64_t v23 = &v5[v20];
  int v24 = v5[v20 + 8];
  if ((v22 & 1) == 0)
  {
    if (*(void *)v21 != *(void *)v23) {
      LOBYTE(v24) = 1;
    }
    if (v24) {
      goto LABEL_7;
    }
LABEL_18:
    sub_243342124((uint64_t)v5, type metadata accessor for DockAccessory.TrackedObject);
    sub_243342124((uint64_t)v12, type metadata accessor for DockAccessory.TrackedObject);
    sub_243342124((uint64_t)v18, type metadata accessor for DockAccessory.TrackedSubjectType);
    return 1;
  }
  if (v24) {
    goto LABEL_18;
  }
LABEL_7:
  sub_243342124((uint64_t)v5, type metadata accessor for DockAccessory.TrackedObject);
  sub_243342124((uint64_t)v12, type metadata accessor for DockAccessory.TrackedObject);
  sub_243342124((uint64_t)v18, type metadata accessor for DockAccessory.TrackedSubjectType);
  return 0;
}

uint64_t type metadata accessor for DockAccessory.TrackedPerson(uint64_t a1)
{
  return sub_24332008C(a1, (uint64_t *)&unk_268D938B0);
}

uint64_t type metadata accessor for DockAccessory.TrackedObject(uint64_t a1)
{
  return sub_24332008C(a1, (uint64_t *)&unk_268D938C0);
}

uint64_t type metadata accessor for DockAccessory.TrackingState(uint64_t a1)
{
  return sub_24332008C(a1, (uint64_t *)&unk_268D938D0);
}

uint64_t type metadata accessor for DockAccessory.TrackedSubjectType(uint64_t a1)
{
  return sub_24332008C(a1, (uint64_t *)&unk_268D938A0);
}

uint64_t sub_24334175C(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_2433417A4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

void sub_24334180C(double a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6 = v5;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D933D0);
  MEMORY[0x270FA5388](v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  BOOL v14 = &v5[OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_trackingStand];
  uint64_t v15 = (void *)MEMORY[0x24567AC40](v14);

  if (v15)
  {
    uint64_t v16 = MEMORY[0x24567AC40](v14);
    if (v16)
    {
      uint64_t v17 = (void *)v16;
      char v18 = (void *)sub_24334A000();

      sub_243349F20();
      LOBYTE(v17) = sub_24334A7F0();

      if (v17)
      {
        uint64_t v19 = sub_24334A730();
        (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v13, 1, 1, v19);
        uint64_t v20 = swift_allocObject();
        *(void *)(v20 + 16) = 0;
        *(void *)(v20 + 24) = 0;
        *(void *)(v20 + 32) = v6;
        *(void *)(v20 + 40) = a3;
        *(void *)(v20 + 48) = a5;
        *(void *)(v20 + 56) = a4;
        *(double *)(v20 + 64) = a1;
        id v21 = v6;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        sub_2433234B4((uint64_t)v13, (uint64_t)&unk_268D93A48, v20);
        swift_release();
      }
    }
    else
    {
      __break(1u);
    }
  }
}

uint64_t sub_2433419B8(uint64_t a1, void (*a2)(unsigned char *, uint64_t), void *a3)
{
  uint64_t v53 = a2;
  uint64_t v47 = a1;
  uint64_t v5 = sub_24334A230();
  uint64_t v51 = *(void *)(v5 - 8);
  uint64_t v52 = v5;
  MEMORY[0x270FA5388](v5);
  uint64_t v50 = &v43[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_24334A2A0();
  uint64_t v48 = *(void *)(v7 - 8);
  uint64_t v49 = v7;
  MEMORY[0x270FA5388](v7);
  uint64_t v9 = &v43[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = sub_24334A5B0();
  uint64_t v54 = *(void *)(v10 - 8);
  uint64_t v55 = v10;
  MEMORY[0x270FA5388](v10);
  uint64_t v12 = &v43[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93A38);
  MEMORY[0x270FA5388](v13 - 8);
  uint64_t v15 = &v43[-((v14 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v16 = sub_24334A280();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = MEMORY[0x270FA5388](v16);
  uint64_t v20 = &v43[-((v19 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v21 = MEMORY[0x270FA5388](v18);
  uint64_t v23 = &v43[-v22];
  MEMORY[0x270FA5388](v21);
  uint64_t v25 = &v43[-v24];
  id v26 = a3;
  sub_24334A260();
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v17 + 48))(v15, 1, v16) == 1) {
    return sub_243322E58((uint64_t)v15, &qword_268D93A38);
  }
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v17 + 32))(v25, v15, v16);
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v54 + 16))(v12, v3 + OBJC_IVAR____TtC7DockKit19DockAccessoryHelper_logger, v55);
  uint64_t v28 = *(void (**)(unsigned char *, unsigned char *, uint64_t))(v17 + 16);
  v28(v23, v25, v16);
  v28(v20, v25, v16);
  unint64_t v29 = (unint64_t)v53;
  swift_bridgeObjectRetain_n();
  uint64_t v30 = sub_24334A590();
  os_log_type_t v31 = sub_24334A7D0();
  int v32 = v31;
  if (os_log_type_enabled(v30, v31))
  {
    uint64_t v33 = swift_slowAlloc();
    os_log_t v45 = v30;
    uint64_t v34 = v33;
    uint64_t v46 = swift_slowAlloc();
    uint64_t v57 = v46;
    *(_DWORD *)uint64_t v34 = 136315650;
    int v44 = v32;
    swift_bridgeObjectRetain();
    uint64_t v56 = sub_2433402D0(v47, v29, &v57);
    sub_24334A820();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v34 + 12) = 256;
    sub_24334A250();
    char v35 = sub_24334A220();
    (*(void (**)(unsigned char *, uint64_t))(v48 + 8))(v9, v49);
    uint64_t v53 = *(void (**)(unsigned char *, uint64_t))(v17 + 8);
    v53(v23, v16);
    LOBYTE(v56) = v35;
    sub_24334A820();
    *(_WORD *)(v34 + 15) = 256;
    uint64_t v36 = v50;
    sub_24334A270();
    char v37 = sub_24334A220();
    (*(void (**)(unsigned char *, uint64_t))(v51 + 8))(v36, v52);
    uint64_t v38 = v20;
    uint64_t v39 = (uint64_t (*)(unsigned char *, uint64_t))v53;
    v53(v38, v16);
    LOBYTE(v56) = v37;
    sub_24334A820();
    os_log_t v40 = v45;
    _os_log_impl(&dword_243318000, v45, (os_log_type_t)v44, "Received trajectory progress feedback: s='%s' type='%hhu' status='%hhu'", (uint8_t *)v34, 0x12u);
    uint64_t v41 = v46;
    swift_arrayDestroy();
    MEMORY[0x24567AB80](v41, -1, -1);
    MEMORY[0x24567AB80](v34, -1, -1);

    (*(void (**)(unsigned char *, uint64_t))(v54 + 8))(v12, v55);
    return v39(v25, v16);
  }
  else
  {
    uint64_t v42 = *(void (**)(unsigned char *, uint64_t))(v17 + 8);
    v42(v20, v16);
    v42(v23, v16);
    swift_bridgeObjectRelease_n();

    (*(void (**)(unsigned char *, uint64_t))(v54 + 8))(v12, v55);
    return ((uint64_t (*)(unsigned char *, uint64_t))v42)(v25, v16);
  }
}

uint64_t sub_243341FC4(uint64_t a1, uint64_t a2)
{
  if (a1 == 0x676E696B63617274 && a2 == 0xED0000646E617453)
  {
    swift_bridgeObjectRelease();
    char v4 = 0;
  }
  else
  {
    char v3 = sub_24334A940();
    swift_bridgeObjectRelease();
    char v4 = v3 ^ 1;
  }
  return v4 & 1;
}

uint64_t sub_243342064()
{
  return 0x676E696B63617274;
}

uint64_t sub_243342088(uint64_t a1, uint64_t a2, unint64_t a3, unint64_t a4)
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
    uint64_t v9 = sub_24334A650();
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

uint64_t sub_243342124(uint64_t a1, uint64_t (*a2)(void))
{
  uint64_t v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_243342184(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t type metadata accessor for DockAccessory.TrackingStates.Iterator(uint64_t a1)
{
  return sub_24332008C(a1, (uint64_t *)&unk_268D938F8);
}

uint64_t type metadata accessor for DockAccessory.AccessoryEvents.Iterator(uint64_t a1)
{
  return sub_24332008C(a1, (uint64_t *)&unk_268D93928);
}

uint64_t type metadata accessor for DockAccessory.BatteryStates.Iterator(uint64_t a1)
{
  return sub_24332008C(a1, (uint64_t *)&unk_268D93958);
}

unint64_t sub_24334224C()
{
  unint64_t result = qword_268D93590;
  if (!qword_268D93590)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D93590);
  }
  return result;
}

unint64_t sub_2433422A0()
{
  unint64_t result = qword_268D93598;
  if (!qword_268D93598)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D93598);
  }
  return result;
}

unint64_t sub_2433422F4()
{
  unint64_t result = qword_268D935A0;
  if (!qword_268D935A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D935A0);
  }
  return result;
}

unint64_t sub_243342348()
{
  unint64_t result = qword_268D935A8;
  if (!qword_268D935A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D935A8);
  }
  return result;
}

unint64_t sub_24334239C()
{
  unint64_t result = qword_268D935B0;
  if (!qword_268D935B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D935B0);
  }
  return result;
}

void SPRotation3DGetEulerAngles(SPRotation3D a1@<0:Q0, 16:Q1>, uint64_t a2@<X0>, int a3@<W1>, uint64_t a4@<X8>)
{
  _Q2 = *(int8x16_t *)a2;
  _Q1 = *(_OWORD *)(a2 + 16);
  if (a3 == 2)
  {
    float64x2_t v8 = (float64x2_t)vextq_s8(_Q2, _Q2, 8uLL);
    _Q2.i64[0] = *(void *)(a2 + 16);
  }
  else if (a3 == 1)
  {
    v8.f64[0] = *(float64_t *)(a2 + 16);
    v8.f64[1] = *(float64_t *)(a2 + 8);
  }
  else
  {
    float64x2_t v8 = 0uLL;
    _Q2.i64[0] = 0;
  }
  long long v26 = *(_OWORD *)(a2 + 16);
  _D8 = v8.f64[1];
  double v10 = vmuld_lane_f64(v8.f64[1], v8, 1);
  float64_t v27 = v8.f64[0];
  __asm { FMLA            D0, D2, V1.D[1] }
  *(double *)&_Q0 = atan2(_D0 + _D0, (v10 + *(double *)_Q2.i64 * *(double *)_Q2.i64) * -2.0 + 1.0);
  long long v25 = _Q0;
  _V1.D[1] = *((void *)&v26 + 1);
  __asm { FMLA            D0, D8, V1.D[1] }
  double v18 = *(double *)&_Q0 + *(double *)&_Q0;
  if (v18 > 1.0) {
    double v18 = 1.0;
  }
  if (v18 < -1.0) {
    double v18 = -1.0;
  }
  long double v24 = asin(v18);
  _V2.D[1] = *((void *)&v26 + 1);
  _D1 = v27;
  __asm { FMLA            D0, D1, V2.D[1] }
  *(float *)&_D0 = _D0 + _D0;
  *(float *)&_D1 = vmlad_n_f64(v10, _D1, _D1) * -2.0 + 1.0;
  *(double *)&long long v22 = atan2f(*(float *)&_D0, *(float *)&_D1);
  if (a3 == 2)
  {
    *(long double *)v23.i64 = v24;
    v23.i64[1] = v22;
    long long v22 = v25;
  }
  else if (a3 == 1)
  {
    v23.i64[0] = v25;
    *(long double *)&v23.i64[1] = v24;
  }
  else
  {
    int64x2_t v23 = vdupq_n_s64(0x7FF8000000000000uLL);
    *(void *)&long long v22 = 0x7FF8000000000000;
  }
  *(int64x2_t *)a4 = v23;
  *(_OWORD *)(a4 + 16) = v22;
  *(_DWORD *)(a4 + 32) = a3;
}

void SPVector3DMake(double a1@<D0>, double a2@<D1>, double a3@<D2>, double *a4@<X8>)
{
  *a4 = a1;
  a4[1] = a2;
  a4[2] = a3;
}

uint64_t sub_243342540(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

void sub_2433425A4()
{
  *(unsigned char *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC7DockKit13DockAccessory__framingMode) = *(unsigned char *)(v0 + 24);
}

uint64_t sub_2433425BC(uint64_t a1)
{
  return sub_24331F918(a1, *(uint64_t (**)(void))(v1 + 16));
}

__n128 sub_2433425D8()
{
  uint64_t v1 = *(void *)(v0 + 16) + OBJC_IVAR____TtC7DockKit13DockAccessory__roi;
  __n128 result = *(__n128 *)(v0 + 24);
  long long v3 = *(_OWORD *)(v0 + 40);
  *(__n128 *)uint64_t v1 = result;
  *(_OWORD *)(v1 + 16) = v3;
  return result;
}

uint64_t sub_2433425F8()
{
  return sub_24334175C(&qword_268D936E8, (void (*)(uint64_t))type metadata accessor for DockAccessory.Identifier);
}

unint64_t sub_243342644()
{
  unint64_t result = qword_268D936F0;
  if (!qword_268D936F0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D936F0);
  }
  return result;
}

unint64_t sub_24334269C()
{
  unint64_t result = qword_268D936F8;
  if (!qword_268D936F8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D936F8);
  }
  return result;
}

unint64_t sub_2433426F4()
{
  unint64_t result = qword_268D93700;
  if (!qword_268D93700)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D93700);
  }
  return result;
}

unint64_t sub_24334274C()
{
  unint64_t result = qword_268D93708[0];
  if (!qword_268D93708[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268D93708);
  }
  return result;
}

uint64_t sub_2433427A0()
{
  return MEMORY[0x263F8E658];
}

uint64_t sub_2433427AC()
{
  return sub_24334175C(qword_268D93720, (void (*)(uint64_t))type metadata accessor for DockAccessory.StateChanges.Iterator);
}

uint64_t sub_2433427F4()
{
  return sub_24334175C(qword_268D93738, (void (*)(uint64_t))type metadata accessor for DockAccessory.MotionStates.Iterator);
}

uint64_t sub_24334283C()
{
  return sub_24334175C(&qword_268D93750, (void (*)(uint64_t))type metadata accessor for DockAccessory.TrackingStates.Iterator);
}

unint64_t sub_243342888()
{
  unint64_t result = qword_268D93758[0];
  if (!qword_268D93758[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268D93758);
  }
  return result;
}

uint64_t sub_2433428DC()
{
  return sub_24334175C(&qword_268D93770, (void (*)(uint64_t))type metadata accessor for DockAccessory.AccessoryEvents.Iterator);
}

unint64_t sub_243342928()
{
  unint64_t result = qword_268D93778;
  if (!qword_268D93778)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D93778);
  }
  return result;
}

unint64_t sub_243342980()
{
  unint64_t result = qword_268D93780[0];
  if (!qword_268D93780[0])
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, qword_268D93780);
  }
  return result;
}

uint64_t sub_2433429D4()
{
  return sub_24334175C(&qword_268D93798, (void (*)(uint64_t))type metadata accessor for DockAccessory.BatteryStates.Iterator);
}

unint64_t sub_243342A20()
{
  unint64_t result = qword_268D937A0;
  if (!qword_268D937A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D937A0);
  }
  return result;
}

unint64_t sub_243342A78()
{
  unint64_t result = qword_268D937A8;
  if (!qword_268D937A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D937A8);
  }
  return result;
}

uint64_t sub_243342ACC()
{
  return sub_24334175C(&qword_268D937B0, (void (*)(uint64_t))type metadata accessor for DockAccessory);
}

uint64_t type metadata accessor for DockAccessory(uint64_t a1)
{
  return sub_24332008C(a1, (uint64_t *)&unk_268D93800);
}

uint64_t sub_243342B34()
{
  return type metadata accessor for DockAccessoryHelper(0);
}

uint64_t type metadata accessor for DockAccessoryHelper(uint64_t a1)
{
  return sub_24332008C(a1, (uint64_t *)&unk_268D937E0);
}

uint64_t sub_243342B5C()
{
  uint64_t result = sub_24334A5B0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_243342C08()
{
  return type metadata accessor for DockAccessory(0);
}

uint64_t sub_243342C10()
{
  uint64_t result = sub_24334A5B0();
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for DockAccessory.Identifier(319);
    if (v2 <= 0x3F)
    {
      uint64_t result = sub_243349E80();
      if (v3 <= 0x3F) {
        return swift_updateClassMetadata2();
      }
    }
  }
  return result;
}

uint64_t method lookup function for DockAccessory(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x270FA04D0](a1, a2, &nominal type descriptor for DockAccessory);
}

uint64_t *initializeBufferWithCopyOfBuffer for DockAccessory.Identifier(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  unint64_t v3 = a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v11 = *a2;
    *unint64_t v3 = *a2;
    unint64_t v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    uint64_t v5 = a2[1];
    *a1 = *a2;
    a1[1] = v5;
    uint64_t v6 = *(int *)(a3 + 24);
    uint64_t v7 = (char *)a1 + v6;
    float64x2_t v8 = (char *)a2 + v6;
    uint64_t v9 = sub_243349EB0();
    double v10 = *(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 16);
    swift_bridgeObjectRetain();
    v10(v7, v8, v9);
  }
  return v3;
}

uint64_t destroy for DockAccessory.Identifier(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = a1 + *(int *)(a2 + 24);
  uint64_t v5 = sub_243349EB0();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v5 - 8) + 8);

  return v6(v4, v5);
}

void *initializeWithCopy for DockAccessory.Identifier(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(int *)(a3 + 24);
  uint64_t v6 = (char *)a1 + v5;
  uint64_t v7 = (char *)a2 + v5;
  uint64_t v8 = sub_243349EB0();
  uint64_t v9 = *(void (**)(char *, char *, uint64_t))(*(void *)(v8 - 8) + 16);
  swift_bridgeObjectRetain();
  v9(v6, v7, v8);
  return a1;
}

void *assignWithCopy for DockAccessory.Identifier(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(int *)(a3 + 24);
  uint64_t v7 = (char *)a1 + v6;
  uint64_t v8 = (char *)a2 + v6;
  uint64_t v9 = sub_243349EB0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v9 - 8) + 24))(v7, v8, v9);
  return a1;
}

_OWORD *initializeWithTake for DockAccessory.Identifier(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(int *)(a3 + 24);
  uint64_t v5 = (char *)a1 + v4;
  uint64_t v6 = (char *)a2 + v4;
  uint64_t v7 = sub_243349EB0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

void *assignWithTake for DockAccessory.Identifier(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(int *)(a3 + 24);
  uint64_t v8 = (char *)a1 + v7;
  uint64_t v9 = (char *)a2 + v7;
  uint64_t v10 = sub_243349EB0();
  (*(void (**)(char *, char *, uint64_t))(*(void *)(v10 - 8) + 40))(v8, v9, v10);
  return a1;
}

uint64_t getEnumTagSinglePayload for DockAccessory.Identifier(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_243343148);
}

uint64_t sub_243343148(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 0x7FFFFFFF)
  {
    unint64_t v4 = *(void *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF) {
      LODWORD(v4) = -1;
    }
    return (v4 + 1);
  }
  else
  {
    uint64_t v8 = sub_243349EB0();
    uint64_t v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    uint64_t v11 = a1 + *(int *)(a3 + 24);
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for DockAccessory.Identifier(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24334320C);
}

uint64_t sub_24334320C(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(void *)(result + 8) = (a2 - 1);
  }
  else
  {
    uint64_t v7 = sub_243349EB0();
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = v5 + *(int *)(a4 + 24);
    return v8(v10, a2, a2, v9);
  }
  return result;
}

uint64_t sub_2433432B4()
{
  uint64_t result = sub_243349EB0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

unsigned char *storeEnumTagSinglePayload for DockAccessory.CameraOrientation(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 7 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 7) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xF9) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xF8)
  {
    unsigned int v6 = ((a2 - 249) >> 8) + 1;
    *uint64_t result = a2 + 7;
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
        JUMPOUT(0x243343424);
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
          *uint64_t result = a2 + 7;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DockAccessory.CameraOrientation()
{
  return &type metadata for DockAccessory.CameraOrientation;
}

void destroy for DockAccessory.CameraInformation(id *a1)
{
}

uint64_t initializeWithCopy for DockAccessory.CameraInformation(uint64_t a1, uint64_t a2)
{
  int v3 = *(void **)a2;
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  long long v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  id v6 = v3;
  return a1;
}

uint64_t assignWithCopy for DockAccessory.CameraInformation(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  long long v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  long long v7 = *(_OWORD *)(a2 + 32);
  long long v8 = *(_OWORD *)(a2 + 48);
  long long v9 = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(_OWORD *)(a1 + 48) = v8;
  *(_OWORD *)(a1 + 64) = v9;
  *(_OWORD *)(a1 + 32) = v7;
  long long v10 = *(_OWORD *)(a2 + 88);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  *(_OWORD *)(a1 + 88) = v10;
  return a1;
}

__n128 __swift_memcpy105_16(uint64_t a1, long long *a2)
{
  long long v2 = *a2;
  long long v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  __n128 result = (__n128)a2[3];
  long long v5 = a2[4];
  long long v6 = a2[5];
  *(_OWORD *)(a1 + 89) = *(long long *)((char *)a2 + 89);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t assignWithTake for DockAccessory.CameraInformation(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  long long v5 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v5;
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(unsigned char *)(a1 + 80) = *(unsigned char *)(a2 + 80);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(unsigned char *)(a1 + 104) = *(unsigned char *)(a2 + 104);
  return a1;
}

uint64_t getEnumTagSinglePayload for DockAccessory.CameraInformation(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 105)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DockAccessory.CameraInformation(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 104) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 105) = 1;
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
    *(unsigned char *)(result + 105) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DockAccessory.CameraInformation()
{
  return &type metadata for DockAccessory.CameraInformation;
}

uint64_t getEnumTagSinglePayload for DockAccessory.State(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for DockAccessory.State(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 1;
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
        JUMPOUT(0x2433437ECLL);
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
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

unsigned char *sub_243343814(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for DockAccessory.State()
{
  return &type metadata for DockAccessory.State;
}

uint64_t sub_24334383C()
{
  return 0;
}

ValueMetadata *type metadata accessor for DockAccessory.Category()
{
  return &type metadata for DockAccessory.Category;
}

void *initializeBufferWithCopyOfBuffer for DockAccessory.Observation(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v3 = (void *)a1;
  int v4 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    uint64_t v12 = *a2;
    *int v3 = *a2;
    int v3 = (void *)(v12 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(unsigned char *)a1 = *(unsigned char *)a2;
    *(void *)(a1 + 8) = a2[1];
    long long v5 = *((_OWORD *)a2 + 2);
    *(_OWORD *)(a1 + 16) = *((_OWORD *)a2 + 1);
    *(_OWORD *)(a1 + 32) = v5;
    uint64_t v6 = *(int *)(a3 + 28);
    BOOL v7 = (void *)(a1 + v6);
    int v8 = (char *)a2 + v6;
    uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93820);
    uint64_t v10 = *(void *)(v9 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
    {
      uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D934D0);
      memcpy(v7, v8, *(void *)(*(void *)(v11 - 8) + 64));
    }
    else
    {
      (*(void (**)(void *, char *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(void *, void, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
    }
  }
  return v3;
}

uint64_t destroy for DockAccessory.Observation(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a1 + *(int *)(a2 + 28);
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93820);
  uint64_t v6 = *(void *)(v3 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v2, 1, v3);
  if (!result)
  {
    long long v5 = *(uint64_t (**)(uint64_t, uint64_t))(v6 + 8);
    return v5(v2, v3);
  }
  return result;
}

uint64_t initializeWithCopy for DockAccessory.Observation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = (void *)(a1 + v5);
  BOOL v7 = (const void *)(a2 + v5);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93820);
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D934D0);
    memcpy(v6, v7, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v9 + 16))(v6, v7, v8);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

uint64_t assignWithCopy for DockAccessory.Observation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  uint64_t v4 = *(int *)(a3 + 28);
  uint64_t v5 = (void *)(a1 + v4);
  uint64_t v6 = (void *)(a2 + v4);
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93820);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v8 + 48);
  int v10 = v9(v5, 1, v7);
  int v11 = v9(v6, 1, v7);
  if (!v10)
  {
    if (!v11)
    {
      (*(void (**)(void *, void *, uint64_t))(v8 + 24))(v5, v6, v7);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v8 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D934D0);
    memcpy(v5, v6, *(void *)(*(void *)(v12 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v8 + 16))(v5, v6, v7);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  return a1;
}

uint64_t initializeWithTake for DockAccessory.Observation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = (void *)(a1 + v5);
  uint64_t v7 = (const void *)(a2 + v5);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93820);
  uint64_t v9 = *(void *)(v8 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D934D0);
    memcpy(v6, v7, *(void *)(*(void *)(v10 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v9 + 32))(v6, v7, v8);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  }
  return a1;
}

uint64_t assignWithTake for DockAccessory.Observation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(unsigned char *)a1 = *(unsigned char *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  uint64_t v5 = *(int *)(a3 + 28);
  uint64_t v6 = (void *)(a1 + v5);
  uint64_t v7 = (void *)(a2 + v5);
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93820);
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v9 + 48);
  int v11 = v10(v6, 1, v8);
  int v12 = v10(v7, 1, v8);
  if (!v11)
  {
    if (!v12)
    {
      (*(void (**)(void *, void *, uint64_t))(v9 + 40))(v6, v7, v8);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v9 + 8))(v6, v8);
    goto LABEL_6;
  }
  if (v12)
  {
LABEL_6:
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D934D0);
    memcpy(v6, v7, *(void *)(*(void *)(v13 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v9 + 32))(v6, v7, v8);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for DockAccessory.Observation(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_243344038);
}

uint64_t sub_243344038(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  if (a2 == 253)
  {
    unsigned int v4 = *a1;
    if (v4 >= 3) {
      return v4 - 2;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D934D0);
    uint64_t v9 = *(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 48);
    uint64_t v10 = v8;
    int v11 = &a1[*(int *)(a3 + 28)];
    return v9(v11, a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for DockAccessory.Observation(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2433440F8);
}

unsigned char *sub_2433440F8(unsigned char *result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5 = result;
  if (a3 == 253)
  {
    *uint64_t result = a2 + 2;
  }
  else
  {
    uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D934D0);
    uint64_t v8 = *(uint64_t (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = v7;
    uint64_t v10 = &v5[*(int *)(a4 + 28)];
    return (unsigned char *)v8(v10, a2, a2, v9);
  }
  return result;
}

void sub_2433441A0()
{
  sub_243344250();
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

void sub_243344250()
{
  if (!qword_268D93838)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_268D93820);
    unint64_t v0 = sub_24334A810();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_268D93838);
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

ValueMetadata *type metadata accessor for DockAccessory.Observation.ObservationType()
{
  return &type metadata for DockAccessory.Observation.ObservationType;
}

uint64_t destroy for DockAccessory.StateChange()
{
  return swift_release();
}

uint64_t _s7DockKit13DockAccessoryC11StateChangeVwCP_0(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for DockAccessory.StateChange(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_retain();
  swift_release();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  return a1;
}

uint64_t __swift_memcpy10_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(_WORD *)(result + 8) = *((_WORD *)a2 + 4);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t assignWithTake for DockAccessory.StateChange(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  swift_release();
  *(unsigned char *)(a1 + 8) = *(unsigned char *)(a2 + 8);
  *(unsigned char *)(a1 + 9) = *(unsigned char *)(a2 + 9);
  return a1;
}

uint64_t getEnumTagSinglePayload for DockAccessory.StateChange(uint64_t *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *((unsigned char *)a1 + 10)) {
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

uint64_t storeEnumTagSinglePayload for DockAccessory.StateChange(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_WORD *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 10) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 10) = 0;
    }
    if (a2) {
      *(void *)uint64_t result = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DockAccessory.StateChange()
{
  return &type metadata for DockAccessory.StateChange;
}

uint64_t initializeBufferWithCopyOfBuffer for DockAccessory.StateChanges(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_243346DA4(a1, a2, a3, &qword_268D934E8);
}

uint64_t destroy for DockAccessory.StateChanges(uint64_t a1, uint64_t a2)
{
  return sub_243346E1C(a1, a2, &qword_268D934E8);
}

uint64_t initializeWithCopy for DockAccessory.StateChanges(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_243346E8C(a1, a2, a3, &qword_268D934E8);
}

uint64_t assignWithCopy for DockAccessory.StateChanges(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_243346EFC(a1, a2, a3, &qword_268D934E8);
}

uint64_t initializeWithTake for DockAccessory.StateChanges(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_243346F6C(a1, a2, a3, &qword_268D934E8);
}

uint64_t assignWithTake for DockAccessory.StateChanges(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_243346FDC(a1, a2, a3, &qword_268D934E8);
}

uint64_t getEnumTagSinglePayload for DockAccessory.StateChanges(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_243344528);
}

uint64_t sub_243344528(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_91Tm(a1, a2, a3, &qword_268D934E8);
}

uint64_t storeEnumTagSinglePayload for DockAccessory.StateChanges(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_243344548);
}

uint64_t sub_243344548(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_92Tm(a1, a2, a3, a4, &qword_268D934E8);
}

uint64_t type metadata accessor for DockAccessory.StateChanges(uint64_t a1)
{
  return sub_24332008C(a1, (uint64_t *)&unk_268D93840);
}

void sub_243344574(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t *initializeBufferWithCopyOfBuffer for DockAccessory.StateChanges.Iterator(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_2433471A4(a1, a2, a3, &qword_268D934E8, &qword_268D934E0);
}

uint64_t destroy for DockAccessory.StateChanges.Iterator(uint64_t a1, uint64_t a2)
{
  return sub_2433472C4(a1, a2, &qword_268D934E8, &qword_268D934E0);
}

uint64_t initializeWithCopy for DockAccessory.StateChanges.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24334738C(a1, a2, a3, &qword_268D934E8, &qword_268D934E0);
}

uint64_t assignWithCopy for DockAccessory.StateChanges.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24334745C(a1, a2, a3, &qword_268D934E8, &qword_268D934E0);
}

uint64_t initializeWithTake for DockAccessory.StateChanges.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24334752C(a1, a2, a3, &qword_268D934E8, &qword_268D934E0);
}

uint64_t assignWithTake for DockAccessory.StateChanges.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2433475FC(a1, a2, a3, &qword_268D934E8, &qword_268D934E0);
}

uint64_t getEnumTagSinglePayload for DockAccessory.StateChanges.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_243344614);
}

uint64_t sub_243344614(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_94Tm(a1, a2, a3, &qword_268D934E8, &qword_268D934E0);
}

uint64_t storeEnumTagSinglePayload for DockAccessory.StateChanges.Iterator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_24334463C);
}

uint64_t sub_24334463C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_95Tm(a1, a2, a3, a4, &qword_268D934E8, &qword_268D934E0);
}

void sub_243344650(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void destroy for DockAccessory.MotionState(uint64_t a1)
{
}

uint64_t initializeWithCopy for DockAccessory.MotionState(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  long long v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  uint64_t v5 = *(void **)(a2 + 72);
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  id v6 = v5;
  *(void *)(a1 + 72) = v5;
  return a1;
}

void *assignWithCopy for DockAccessory.MotionState(void *a1, uint64_t *a2)
{
  uint64_t v3 = *a2;
  uint64_t v4 = a2[1];
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  *a1 = v3;
  a1[1] = v4;
  uint64_t v7 = a2[4];
  uint64_t v6 = a2[5];
  uint64_t v8 = a2[7];
  a1[6] = a2[6];
  a1[7] = v8;
  a1[4] = v7;
  a1[5] = v6;
  a1[8] = a2[8];
  uint64_t v9 = (void *)a1[9];
  uint64_t v10 = (void *)a2[9];
  id v11 = v10;
  a1[9] = v10;

  return a1;
}

__n128 __swift_memcpy80_16(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for DockAccessory.MotionState(uint64_t a1, uint64_t a2)
{
  long long v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v3;
  long long v4 = *(_OWORD *)(a2 + 32);
  uint64_t v5 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(void *)(a1 + 56) = v5;
  *(_OWORD *)(a1 + 32) = v4;
  *(void *)(a1 + 64) = *(void *)(a2 + 64);
  uint64_t v6 = *(void **)(a1 + 72);
  *(void *)(a1 + 72) = *(void *)(a2 + 72);

  return a1;
}

uint64_t getEnumTagSinglePayload for DockAccessory.MotionState(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 80)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 72);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for DockAccessory.MotionState(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(void *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 80) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 80) = 0;
    }
    if (a2) {
      *(void *)(result + 72) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DockAccessory.MotionState()
{
  return &type metadata for DockAccessory.MotionState;
}

uint64_t initializeBufferWithCopyOfBuffer for DockAccessory.MotionStates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_243346DA4(a1, a2, a3, &qword_268D93500);
}

uint64_t destroy for DockAccessory.MotionStates(uint64_t a1, uint64_t a2)
{
  return sub_243346E1C(a1, a2, &qword_268D93500);
}

uint64_t initializeWithCopy for DockAccessory.MotionStates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_243346E8C(a1, a2, a3, &qword_268D93500);
}

uint64_t assignWithCopy for DockAccessory.MotionStates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_243346EFC(a1, a2, a3, &qword_268D93500);
}

uint64_t initializeWithTake for DockAccessory.MotionStates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_243346F6C(a1, a2, a3, &qword_268D93500);
}

uint64_t assignWithTake for DockAccessory.MotionStates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_243346FDC(a1, a2, a3, &qword_268D93500);
}

uint64_t getEnumTagSinglePayload for DockAccessory.MotionStates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2433448CC);
}

uint64_t sub_2433448CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_91Tm(a1, a2, a3, &qword_268D93500);
}

uint64_t storeEnumTagSinglePayload for DockAccessory.MotionStates(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2433448EC);
}

uint64_t sub_2433448EC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_92Tm(a1, a2, a3, a4, &qword_268D93500);
}

uint64_t type metadata accessor for DockAccessory.MotionStates(uint64_t a1)
{
  return sub_24332008C(a1, (uint64_t *)&unk_268D93870);
}

void sub_243344918(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_24334492C(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5)
{
  sub_243347934(319, a4, a5, MEMORY[0x263F8F5B8]);
  if (v5 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for DockAccessory.MotionStates.Iterator(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_2433471A4(a1, a2, a3, &qword_268D93500, &qword_268D934F8);
}

uint64_t destroy for DockAccessory.MotionStates.Iterator(uint64_t a1, uint64_t a2)
{
  return sub_2433472C4(a1, a2, &qword_268D93500, &qword_268D934F8);
}

uint64_t initializeWithCopy for DockAccessory.MotionStates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24334738C(a1, a2, a3, &qword_268D93500, &qword_268D934F8);
}

uint64_t assignWithCopy for DockAccessory.MotionStates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24334745C(a1, a2, a3, &qword_268D93500, &qword_268D934F8);
}

uint64_t initializeWithTake for DockAccessory.MotionStates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24334752C(a1, a2, a3, &qword_268D93500, &qword_268D934F8);
}

uint64_t assignWithTake for DockAccessory.MotionStates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2433475FC(a1, a2, a3, &qword_268D93500, &qword_268D934F8);
}

uint64_t getEnumTagSinglePayload for DockAccessory.MotionStates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_243344A60);
}

uint64_t sub_243344A60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_94Tm(a1, a2, a3, &qword_268D93500, &qword_268D934F8);
}

uint64_t storeEnumTagSinglePayload for DockAccessory.MotionStates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_243344A88);
}

uint64_t sub_243344A88(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_95Tm(a1, a2, a3, a4, &qword_268D93500, &qword_268D934F8);
}

void sub_243344A9C(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_243344AB8(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t *a4, uint64_t a5, unint64_t *a6)
{
  sub_243347934(319, a4, a5, MEMORY[0x263F8F5B8]);
  if (v8 <= 0x3F)
  {
    sub_243347934(319, a6, a5, MEMORY[0x263F8F5A8]);
    if (v9 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for DockAccessory.TrackedSubjectType(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v7 = sub_243349EB0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v8 = type metadata accessor for DockAccessory.TrackedObject(0);
      uint64_t v9 = *(int *)(v8 + 20);
      uint64_t v10 = (_OWORD *)((char *)a1 + v9);
      id v11 = (_OWORD *)((char *)a2 + v9);
      long long v12 = v11[1];
      *uint64_t v10 = *v11;
      v10[1] = v12;
      uint64_t v13 = *(int *)(v8 + 24);
    }
    else
    {
      uint64_t v17 = (int *)type metadata accessor for DockAccessory.TrackedPerson(0);
      uint64_t v18 = v17[5];
      uint64_t v19 = (_OWORD *)((char *)a1 + v18);
      uint64_t v20 = (_OWORD *)((char *)a2 + v18);
      long long v21 = v20[1];
      _OWORD *v19 = *v20;
      v19[1] = v21;
      uint64_t v22 = v17[6];
      int64x2_t v23 = (char *)a1 + v22;
      long double v24 = (char *)a2 + v22;
      *(void *)int64x2_t v23 = *(void *)v24;
      v23[8] = v24[8];
      uint64_t v25 = v17[7];
      long long v26 = (char *)a1 + v25;
      float64_t v27 = (char *)a2 + v25;
      v26[8] = v27[8];
      *(void *)long long v26 = *(void *)v27;
      uint64_t v13 = v17[8];
    }
    uint64_t v14 = (char *)a1 + v13;
    uint64_t v15 = (char *)a2 + v13;
    v14[8] = v15[8];
    *(void *)uint64_t v14 = *(void *)v15;
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithCopy for DockAccessory.TrackedSubjectType(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v5 = sub_243349EB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v6 = type metadata accessor for DockAccessory.TrackedObject(0);
    uint64_t v7 = *(int *)(v6 + 20);
    uint64_t v8 = (_OWORD *)(a1 + v7);
    uint64_t v9 = (_OWORD *)(a2 + v7);
    long long v10 = v9[1];
    *uint64_t v8 = *v9;
    v8[1] = v10;
    id v11 = (int *)(v6 + 24);
  }
  else
  {
    long long v12 = (int *)type metadata accessor for DockAccessory.TrackedPerson(0);
    uint64_t v13 = v12[5];
    uint64_t v14 = (_OWORD *)(a1 + v13);
    uint64_t v15 = (_OWORD *)(a2 + v13);
    long long v16 = v15[1];
    _OWORD *v14 = *v15;
    v14[1] = v16;
    uint64_t v17 = v12[6];
    uint64_t v18 = a1 + v17;
    uint64_t v19 = a2 + v17;
    *(void *)uint64_t v18 = *(void *)v19;
    *(unsigned char *)(v18 + 8) = *(unsigned char *)(v19 + 8);
    uint64_t v20 = v12[7];
    uint64_t v21 = a1 + v20;
    uint64_t v22 = a2 + v20;
    *(unsigned char *)(v21 + 8) = *(unsigned char *)(v22 + 8);
    *(void *)uint64_t v21 = *(void *)v22;
    id v11 = v12 + 8;
  }
  uint64_t v23 = *v11;
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  *(void *)uint64_t v24 = *(void *)v25;
  *(unsigned char *)(v24 + 8) = *(unsigned char *)(v25 + 8);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithCopy for DockAccessory.TrackedSubjectType(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_243342124(a1, type metadata accessor for DockAccessory.TrackedSubjectType);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v5 = sub_243349EB0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a1, a2, v5);
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v6 = type metadata accessor for DockAccessory.TrackedObject(0);
      uint64_t v7 = *(int *)(v6 + 20);
      uint64_t v8 = (_OWORD *)(a1 + v7);
      uint64_t v9 = (_OWORD *)(a2 + v7);
      long long v10 = v9[1];
      *uint64_t v8 = *v9;
      v8[1] = v10;
      id v11 = (int *)(v6 + 24);
    }
    else
    {
      long long v12 = (int *)type metadata accessor for DockAccessory.TrackedPerson(0);
      uint64_t v13 = v12[5];
      uint64_t v14 = (_OWORD *)(a1 + v13);
      uint64_t v15 = (_OWORD *)(a2 + v13);
      long long v16 = v15[1];
      _OWORD *v14 = *v15;
      v14[1] = v16;
      uint64_t v17 = v12[6];
      uint64_t v18 = a1 + v17;
      uint64_t v19 = a2 + v17;
      char v20 = *(unsigned char *)(v19 + 8);
      *(void *)uint64_t v18 = *(void *)v19;
      *(unsigned char *)(v18 + 8) = v20;
      uint64_t v21 = v12[7];
      uint64_t v22 = a1 + v21;
      uint64_t v23 = a2 + v21;
      char v24 = *(unsigned char *)(v23 + 8);
      *(void *)uint64_t v22 = *(void *)v23;
      *(unsigned char *)(v22 + 8) = v24;
      id v11 = v12 + 8;
    }
    uint64_t v25 = *v11;
    uint64_t v26 = a1 + v25;
    float64_t v27 = (uint64_t *)(a2 + v25);
    uint64_t v28 = *v27;
    *(unsigned char *)(v26 + 8) = *((unsigned char *)v27 + 8);
    *(void *)uint64_t v26 = v28;
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t initializeWithTake for DockAccessory.TrackedSubjectType(uint64_t a1, uint64_t a2)
{
  int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  uint64_t v5 = sub_243349EB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
  if (EnumCaseMultiPayload == 1)
  {
    uint64_t v6 = type metadata accessor for DockAccessory.TrackedObject(0);
    uint64_t v7 = *(int *)(v6 + 20);
    uint64_t v8 = (_OWORD *)(a1 + v7);
    uint64_t v9 = (_OWORD *)(a2 + v7);
    long long v10 = v9[1];
    *uint64_t v8 = *v9;
    v8[1] = v10;
    id v11 = (int *)(v6 + 24);
  }
  else
  {
    long long v12 = (int *)type metadata accessor for DockAccessory.TrackedPerson(0);
    uint64_t v13 = v12[5];
    uint64_t v14 = (_OWORD *)(a1 + v13);
    uint64_t v15 = (_OWORD *)(a2 + v13);
    long long v16 = v15[1];
    _OWORD *v14 = *v15;
    v14[1] = v16;
    uint64_t v17 = v12[6];
    uint64_t v18 = a1 + v17;
    uint64_t v19 = a2 + v17;
    *(void *)uint64_t v18 = *(void *)v19;
    *(unsigned char *)(v18 + 8) = *(unsigned char *)(v19 + 8);
    uint64_t v20 = v12[7];
    uint64_t v21 = a1 + v20;
    uint64_t v22 = a2 + v20;
    *(unsigned char *)(v21 + 8) = *(unsigned char *)(v22 + 8);
    *(void *)uint64_t v21 = *(void *)v22;
    id v11 = v12 + 8;
  }
  uint64_t v23 = *v11;
  uint64_t v24 = a1 + v23;
  uint64_t v25 = a2 + v23;
  *(void *)uint64_t v24 = *(void *)v25;
  *(unsigned char *)(v24 + 8) = *(unsigned char *)(v25 + 8);
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t assignWithTake for DockAccessory.TrackedSubjectType(uint64_t a1, uint64_t a2)
{
  if (a1 != a2)
  {
    sub_243342124(a1, type metadata accessor for DockAccessory.TrackedSubjectType);
    int EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
    uint64_t v5 = sub_243349EB0();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a1, a2, v5);
    if (EnumCaseMultiPayload == 1)
    {
      uint64_t v6 = type metadata accessor for DockAccessory.TrackedObject(0);
      uint64_t v7 = *(int *)(v6 + 20);
      uint64_t v8 = (_OWORD *)(a1 + v7);
      uint64_t v9 = (_OWORD *)(a2 + v7);
      long long v10 = v9[1];
      *uint64_t v8 = *v9;
      v8[1] = v10;
      id v11 = (int *)(v6 + 24);
    }
    else
    {
      long long v12 = (int *)type metadata accessor for DockAccessory.TrackedPerson(0);
      uint64_t v13 = v12[5];
      uint64_t v14 = (_OWORD *)(a1 + v13);
      uint64_t v15 = (_OWORD *)(a2 + v13);
      long long v16 = v15[1];
      _OWORD *v14 = *v15;
      v14[1] = v16;
      uint64_t v17 = v12[6];
      uint64_t v18 = a1 + v17;
      uint64_t v19 = a2 + v17;
      *(void *)uint64_t v18 = *(void *)v19;
      *(unsigned char *)(v18 + 8) = *(unsigned char *)(v19 + 8);
      uint64_t v20 = v12[7];
      uint64_t v21 = a1 + v20;
      uint64_t v22 = a2 + v20;
      *(unsigned char *)(v21 + 8) = *(unsigned char *)(v22 + 8);
      *(void *)uint64_t v21 = *(void *)v22;
      id v11 = v12 + 8;
    }
    uint64_t v23 = *v11;
    uint64_t v24 = a1 + v23;
    uint64_t v25 = a2 + v23;
    *(void *)uint64_t v24 = *(void *)v25;
    *(unsigned char *)(v24 + 8) = *(unsigned char *)(v25 + 8);
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

uint64_t getEnumTagSinglePayload for DockAccessory.TrackedSubjectType(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(void *)(a3 - 8) + 48))();
}

uint64_t storeEnumTagSinglePayload for DockAccessory.TrackedSubjectType(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(void *)(a4 - 8) + 56))();
}

uint64_t sub_2433452D8()
{
  return swift_storeEnumTagMultiPayload();
}

uint64_t sub_2433452E8()
{
  uint64_t result = type metadata accessor for DockAccessory.TrackedPerson(319);
  if (v1 <= 0x3F)
  {
    uint64_t result = type metadata accessor for DockAccessory.TrackedObject(319);
    if (v2 <= 0x3F)
    {
      swift_initEnumMetadataMultiPayload();
      return 0;
    }
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for DockAccessory.TrackedPerson(uint64_t *a1, uint64_t *a2, int *a3)
{
  int v5 = *(_DWORD *)(*((void *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v21 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v21 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_243349EB0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = a3[5];
    uint64_t v9 = a3[6];
    long long v10 = (_OWORD *)((char *)a1 + v8);
    id v11 = (_OWORD *)((char *)a2 + v8);
    long long v12 = v11[1];
    *long long v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = (char *)a1 + v9;
    uint64_t v14 = (char *)a2 + v9;
    *(void *)uint64_t v13 = *(void *)v14;
    v13[8] = v14[8];
    uint64_t v15 = a3[7];
    uint64_t v16 = a3[8];
    uint64_t v17 = (char *)a1 + v15;
    uint64_t v18 = (char *)a2 + v15;
    *(void *)uint64_t v17 = *(void *)v18;
    v17[8] = v18[8];
    uint64_t v19 = (char *)a1 + v16;
    uint64_t v20 = (char *)a2 + v16;
    *(void *)uint64_t v19 = *(void *)v20;
    v19[8] = v20[8];
  }
  return a1;
}

uint64_t initializeWithCopy for DockAccessory.TrackedPerson(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_243349EB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (_OWORD *)(a1 + v7);
  long long v10 = (_OWORD *)(a2 + v7);
  long long v11 = v10[1];
  _OWORD *v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = a1 + v8;
  uint64_t v13 = a2 + v8;
  *(void *)uint64_t v12 = *(void *)v13;
  *(unsigned char *)(v12 + 8) = *(unsigned char *)(v13 + 8);
  uint64_t v14 = a3[7];
  uint64_t v15 = a3[8];
  uint64_t v16 = a1 + v14;
  uint64_t v17 = a2 + v14;
  *(void *)uint64_t v16 = *(void *)v17;
  *(unsigned char *)(v16 + 8) = *(unsigned char *)(v17 + 8);
  uint64_t v18 = a1 + v15;
  uint64_t v19 = a2 + v15;
  *(void *)uint64_t v18 = *(void *)v19;
  *(unsigned char *)(v18 + 8) = *(unsigned char *)(v19 + 8);
  return a1;
}

uint64_t assignWithCopy for DockAccessory.TrackedPerson(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_243349EB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  v8[2] = v9[2];
  v8[3] = v9[3];
  uint64_t v10 = a3[6];
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  char v13 = *(unsigned char *)(v12 + 8);
  *(void *)uint64_t v11 = *(void *)v12;
  *(unsigned char *)(v11 + 8) = v13;
  uint64_t v14 = a3[7];
  uint64_t v15 = a1 + v14;
  uint64_t v16 = a2 + v14;
  char v17 = *(unsigned char *)(v16 + 8);
  *(void *)uint64_t v15 = *(void *)v16;
  *(unsigned char *)(v15 + 8) = v17;
  uint64_t v18 = a3[8];
  uint64_t v19 = a1 + v18;
  uint64_t v20 = a2 + v18;
  char v21 = *(unsigned char *)(v20 + 8);
  *(void *)uint64_t v19 = *(void *)v20;
  *(unsigned char *)(v19 + 8) = v21;
  return a1;
}

uint64_t initializeWithTake for DockAccessory.TrackedPerson(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_243349EB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (_OWORD *)(a1 + v7);
  uint64_t v10 = (_OWORD *)(a2 + v7);
  long long v11 = v10[1];
  _OWORD *v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = a1 + v8;
  uint64_t v13 = a2 + v8;
  *(void *)uint64_t v12 = *(void *)v13;
  *(unsigned char *)(v12 + 8) = *(unsigned char *)(v13 + 8);
  uint64_t v14 = a3[7];
  uint64_t v15 = a3[8];
  uint64_t v16 = a1 + v14;
  uint64_t v17 = a2 + v14;
  *(void *)uint64_t v16 = *(void *)v17;
  *(unsigned char *)(v16 + 8) = *(unsigned char *)(v17 + 8);
  uint64_t v18 = a1 + v15;
  uint64_t v19 = a2 + v15;
  *(void *)uint64_t v18 = *(void *)v19;
  *(unsigned char *)(v18 + 8) = *(unsigned char *)(v19 + 8);
  return a1;
}

uint64_t assignWithTake for DockAccessory.TrackedPerson(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6 = sub_243349EB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = a3[5];
  uint64_t v8 = a3[6];
  uint64_t v9 = (_OWORD *)(a1 + v7);
  uint64_t v10 = (_OWORD *)(a2 + v7);
  long long v11 = v10[1];
  _OWORD *v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = a1 + v8;
  uint64_t v13 = a2 + v8;
  *(void *)uint64_t v12 = *(void *)v13;
  *(unsigned char *)(v12 + 8) = *(unsigned char *)(v13 + 8);
  uint64_t v14 = a3[7];
  uint64_t v15 = a3[8];
  uint64_t v16 = a1 + v14;
  uint64_t v17 = a2 + v14;
  *(void *)uint64_t v16 = *(void *)v17;
  *(unsigned char *)(v16 + 8) = *(unsigned char *)(v17 + 8);
  uint64_t v18 = a1 + v15;
  uint64_t v19 = a2 + v15;
  *(void *)uint64_t v18 = *(void *)v19;
  *(unsigned char *)(v18 + 8) = *(unsigned char *)(v19 + 8);
  return a1;
}

uint64_t getEnumTagSinglePayload for DockAccessory.TrackedPerson(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, j____swift_get_extra_inhabitant_index_104Tm);
}

uint64_t storeEnumTagSinglePayload for DockAccessory.TrackedPerson(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, j____swift_store_extra_inhabitant_index_105Tm);
}

uint64_t sub_24334585C()
{
  uint64_t result = sub_243349EB0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for DockAccessory.TrackedObject(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = sub_243349EB0();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = *(int *)(a3 + 24);
    uint64_t v10 = (_OWORD *)((char *)a1 + v8);
    long long v11 = (_OWORD *)((char *)a2 + v8);
    long long v12 = v11[1];
    *uint64_t v10 = *v11;
    v10[1] = v12;
    uint64_t v13 = (char *)a1 + v9;
    uint64_t v14 = (char *)a2 + v9;
    *(void *)uint64_t v13 = *(void *)v14;
    v13[8] = v14[8];
  }
  return a1;
}

uint64_t _s7DockKit13DockAccessoryC13TrackedPersonVwxx_0(uint64_t a1)
{
  uint64_t v2 = sub_243349EB0();
  unint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8);

  return v3(a1, v2);
}

uint64_t initializeWithCopy for DockAccessory.TrackedObject(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_243349EB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (_OWORD *)(a1 + v7);
  uint64_t v10 = (_OWORD *)(a2 + v7);
  long long v11 = v10[1];
  _OWORD *v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = a1 + v8;
  uint64_t v13 = a2 + v8;
  *(void *)uint64_t v12 = *(void *)v13;
  *(unsigned char *)(v12 + 8) = *(unsigned char *)(v13 + 8);
  return a1;
}

uint64_t assignWithCopy for DockAccessory.TrackedObject(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_243349EB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  *uint64_t v8 = *v9;
  v8[1] = v9[1];
  v8[2] = v9[2];
  v8[3] = v9[3];
  uint64_t v10 = *(int *)(a3 + 24);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  char v13 = *(unsigned char *)(v12 + 8);
  *(void *)uint64_t v11 = *(void *)v12;
  *(unsigned char *)(v11 + 8) = v13;
  return a1;
}

uint64_t initializeWithTake for DockAccessory.TrackedObject(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_243349EB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (_OWORD *)(a1 + v7);
  uint64_t v10 = (_OWORD *)(a2 + v7);
  long long v11 = v10[1];
  _OWORD *v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = a1 + v8;
  uint64_t v13 = a2 + v8;
  *(void *)uint64_t v12 = *(void *)v13;
  *(unsigned char *)(v12 + 8) = *(unsigned char *)(v13 + 8);
  return a1;
}

uint64_t assignWithTake for DockAccessory.TrackedObject(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_243349EB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = *(int *)(a3 + 24);
  uint64_t v9 = (_OWORD *)(a1 + v7);
  uint64_t v10 = (_OWORD *)(a2 + v7);
  long long v11 = v10[1];
  _OWORD *v9 = *v10;
  v9[1] = v11;
  uint64_t v12 = a1 + v8;
  uint64_t v13 = a2 + v8;
  *(unsigned char *)(v12 + 8) = *(unsigned char *)(v13 + 8);
  *(void *)uint64_t v12 = *(void *)v13;
  return a1;
}

uint64_t getEnumTagSinglePayload for DockAccessory.TrackedObject(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_243345CF0);
}

uint64_t __swift_get_extra_inhabitant_index_104Tm(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_243349EB0();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 48);

  return v5(a1, a2, v4);
}

uint64_t storeEnumTagSinglePayload for DockAccessory.TrackedObject(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_243345D74);
}

uint64_t __swift_store_extra_inhabitant_index_105Tm(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_243349EB0();
  int v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);

  return v5(a1, a2, a2, v4);
}

uint64_t sub_243345DE8()
{
  uint64_t result = sub_243349EB0();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for DockAccessory.TrackingState(uint64_t *a1, uint64_t *a2, uint64_t a3)
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
    uint64_t v7 = sub_243349E80();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    *(uint64_t *)((char *)a1 + *(int *)(a3 + 20)) = *(uint64_t *)((char *)a2 + *(int *)(a3 + 20));
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t destroy for DockAccessory.TrackingState(uint64_t a1)
{
  uint64_t v2 = sub_243349E80();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);

  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DockAccessory.TrackingState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_243349E80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DockAccessory.TrackingState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_243349E80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t initializeWithTake for DockAccessory.TrackingState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_243349E80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  return a1;
}

uint64_t assignWithTake for DockAccessory.TrackingState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_243349E80();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  *(void *)(a1 + *(int *)(a3 + 20)) = *(void *)(a2 + *(int *)(a3 + 20));
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for DockAccessory.TrackingState(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2433461EC);
}

uint64_t sub_2433461EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_243349E80();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    unint64_t v10 = *(void *)(a1 + *(int *)(a3 + 20));
    if (v10 >= 0xFFFFFFFF) {
      LODWORD(v10) = -1;
    }
    return (v10 + 1);
  }
}

uint64_t storeEnumTagSinglePayload for DockAccessory.TrackingState(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2433462C0);
}

uint64_t sub_2433462C0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = sub_243349E80();
  uint64_t v9 = *(void *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    unint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, result);
  }
  else
  {
    *(void *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
  }
  return result;
}

uint64_t sub_24334637C()
{
  uint64_t result = sub_243349E80();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for DockAccessory.TrackingStates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_243346DA4(a1, a2, a3, &qword_268D93530);
}

uint64_t destroy for DockAccessory.TrackingStates(uint64_t a1, uint64_t a2)
{
  return sub_243346E1C(a1, a2, &qword_268D93530);
}

uint64_t initializeWithCopy for DockAccessory.TrackingStates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_243346E8C(a1, a2, a3, &qword_268D93530);
}

uint64_t assignWithCopy for DockAccessory.TrackingStates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_243346EFC(a1, a2, a3, &qword_268D93530);
}

uint64_t initializeWithTake for DockAccessory.TrackingStates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_243346F6C(a1, a2, a3, &qword_268D93530);
}

uint64_t assignWithTake for DockAccessory.TrackingStates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_243346FDC(a1, a2, a3, &qword_268D93530);
}

uint64_t getEnumTagSinglePayload for DockAccessory.TrackingStates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_243346470);
}

uint64_t sub_243346470(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_91Tm(a1, a2, a3, &qword_268D93530);
}

uint64_t storeEnumTagSinglePayload for DockAccessory.TrackingStates(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_243346490);
}

uint64_t sub_243346490(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_92Tm(a1, a2, a3, a4, &qword_268D93530);
}

uint64_t type metadata accessor for DockAccessory.TrackingStates(uint64_t a1)
{
  return sub_24332008C(a1, (uint64_t *)&unk_268D938E0);
}

void sub_2433464BC()
{
  sub_24334672C(319, &qword_268D938F0, MEMORY[0x263F8F5B8]);
  if (v0 <= 0x3F) {
    swift_initStructMetadata();
  }
}

uint64_t *initializeBufferWithCopyOfBuffer for DockAccessory.TrackingStates.Iterator(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_2433471A4(a1, a2, a3, &qword_268D93530, &qword_268D93528);
}

uint64_t destroy for DockAccessory.TrackingStates.Iterator(uint64_t a1, uint64_t a2)
{
  return sub_2433472C4(a1, a2, &qword_268D93530, &qword_268D93528);
}

uint64_t initializeWithCopy for DockAccessory.TrackingStates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24334738C(a1, a2, a3, &qword_268D93530, &qword_268D93528);
}

uint64_t assignWithCopy for DockAccessory.TrackingStates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24334745C(a1, a2, a3, &qword_268D93530, &qword_268D93528);
}

uint64_t initializeWithTake for DockAccessory.TrackingStates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24334752C(a1, a2, a3, &qword_268D93530, &qword_268D93528);
}

uint64_t assignWithTake for DockAccessory.TrackingStates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2433475FC(a1, a2, a3, &qword_268D93530, &qword_268D93528);
}

uint64_t getEnumTagSinglePayload for DockAccessory.TrackingStates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2433465F0);
}

uint64_t sub_2433465F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_94Tm(a1, a2, a3, &qword_268D93530, &qword_268D93528);
}

uint64_t storeEnumTagSinglePayload for DockAccessory.TrackingStates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_243346618);
}

uint64_t sub_243346618(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_95Tm(a1, a2, a3, a4, &qword_268D93530, &qword_268D93528);
}

void sub_24334662C()
{
  sub_24334672C(319, &qword_268D938F0, MEMORY[0x263F8F5B8]);
  if (v0 <= 0x3F)
  {
    sub_24334672C(319, &qword_268D93908, MEMORY[0x263F8F5A8]);
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_24334672C(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v6 = type metadata accessor for DockAccessory.TrackingState(255);
    unint64_t v7 = a3(a1, v6);
    if (!v8) {
      atomic_store(v7, a2);
    }
  }
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *(unsigned char *)(result + 8) = *((unsigned char *)a2 + 8);
  *(void *)uint64_t result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for DockAccessory.AccessoryEvent(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7E && *(unsigned char *)(a1 + 9)) {
    return (*(_DWORD *)a1 + 126);
  }
  unsigned int v3 = ((*(unsigned __int8 *)(a1 + 8) >> 6) & 0xFFFFFF83 | (4 * ((*(unsigned __int8 *)(a1 + 8) >> 1) & 0x1F))) ^ 0x7F;
  if (v3 >= 0x7D) {
    unsigned int v3 = -1;
  }
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for DockAccessory.AccessoryEvent(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7D)
  {
    *(unsigned char *)(result + 8) = 0;
    *(void *)uint64_t result = a2 - 126;
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 9) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7E) {
      *(unsigned char *)(result + 9) = 0;
    }
    if (a2)
    {
      *(void *)uint64_t result = 0;
      *(unsigned char *)(result + 8) = 2 * (((-a2 >> 2) & 0x1F) - 32 * a2);
    }
  }
  return result;
}

uint64_t sub_243346848(uint64_t a1)
{
  unsigned int v1 = *(unsigned __int8 *)(a1 + 8);
  int v2 = (char)v1;
  unsigned int v3 = v1 >> 6;
  if (v2 >= 0) {
    return v3;
  }
  else {
    return (*(_DWORD *)a1 + 2);
  }
}

uint64_t sub_243346868(uint64_t result)
{
  *(unsigned char *)(result + 8) &= 0x3Fu;
  return result;
}

uint64_t sub_243346878(uint64_t result, unsigned int a2)
{
  if (a2 < 2)
  {
    *(unsigned char *)(result + 8) = *(unsigned char *)(result + 8) & 1 | ((_BYTE)a2 << 6);
  }
  else
  {
    *(void *)uint64_t result = a2 - 2;
    *(unsigned char *)(result + 8) = 0x80;
  }
  return result;
}

ValueMetadata *type metadata accessor for DockAccessory.AccessoryEvent()
{
  return &type metadata for DockAccessory.AccessoryEvent;
}

uint64_t initializeBufferWithCopyOfBuffer for DockAccessory.AccessoryEvents(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_243346DA4(a1, a2, a3, &qword_268D93548);
}

uint64_t destroy for DockAccessory.AccessoryEvents(uint64_t a1, uint64_t a2)
{
  return sub_243346E1C(a1, a2, &qword_268D93548);
}

uint64_t initializeWithCopy for DockAccessory.AccessoryEvents(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_243346E8C(a1, a2, a3, &qword_268D93548);
}

uint64_t assignWithCopy for DockAccessory.AccessoryEvents(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_243346EFC(a1, a2, a3, &qword_268D93548);
}

uint64_t initializeWithTake for DockAccessory.AccessoryEvents(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_243346F6C(a1, a2, a3, &qword_268D93548);
}

uint64_t assignWithTake for DockAccessory.AccessoryEvents(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_243346FDC(a1, a2, a3, &qword_268D93548);
}

uint64_t getEnumTagSinglePayload for DockAccessory.AccessoryEvents(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_243346910);
}

uint64_t sub_243346910(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_91Tm(a1, a2, a3, &qword_268D93548);
}

uint64_t storeEnumTagSinglePayload for DockAccessory.AccessoryEvents(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_243346930);
}

uint64_t sub_243346930(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_92Tm(a1, a2, a3, a4, &qword_268D93548);
}

uint64_t type metadata accessor for DockAccessory.AccessoryEvents(uint64_t a1)
{
  return sub_24332008C(a1, (uint64_t *)&unk_268D93910);
}

void sub_24334695C(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t *initializeBufferWithCopyOfBuffer for DockAccessory.AccessoryEvents.Iterator(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_2433471A4(a1, a2, a3, &qword_268D93548, &qword_268D93540);
}

uint64_t destroy for DockAccessory.AccessoryEvents.Iterator(uint64_t a1, uint64_t a2)
{
  return sub_2433472C4(a1, a2, &qword_268D93548, &qword_268D93540);
}

uint64_t initializeWithCopy for DockAccessory.AccessoryEvents.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24334738C(a1, a2, a3, &qword_268D93548, &qword_268D93540);
}

uint64_t assignWithCopy for DockAccessory.AccessoryEvents.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24334745C(a1, a2, a3, &qword_268D93548, &qword_268D93540);
}

uint64_t initializeWithTake for DockAccessory.AccessoryEvents.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24334752C(a1, a2, a3, &qword_268D93548, &qword_268D93540);
}

uint64_t assignWithTake for DockAccessory.AccessoryEvents.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2433475FC(a1, a2, a3, &qword_268D93548, &qword_268D93540);
}

uint64_t getEnumTagSinglePayload for DockAccessory.AccessoryEvents.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2433469FC);
}

uint64_t sub_2433469FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_94Tm(a1, a2, a3, &qword_268D93548, &qword_268D93540);
}

uint64_t storeEnumTagSinglePayload for DockAccessory.AccessoryEvents.Iterator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_243346A24);
}

uint64_t sub_243346A24(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_95Tm(a1, a2, a3, a4, &qword_268D93548, &qword_268D93540);
}

void sub_243346A38(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t _s7DockKit13DockAccessoryC11ObservationV15ObservationTypeOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFE) {
    goto LABEL_17;
  }
  if (a2 + 2 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 2) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 2;
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
      return (*a1 | (v4 << 8)) - 2;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 2;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 3;
  int v8 = v6 - 3;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s7DockKit13DockAccessoryC11ObservationV15ObservationTypeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 2 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 2) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFE) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFD)
  {
    unsigned int v6 = ((a2 - 254) >> 8) + 1;
    *uint64_t result = a2 + 2;
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
        JUMPOUT(0x243346BB0);
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
          *uint64_t result = a2 + 2;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DockAccessory.BatteryChargeState()
{
  return &type metadata for DockAccessory.BatteryChargeState;
}

uint64_t destroy for DockAccessory.BatteryState()
{
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for DockAccessory.BatteryState(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for DockAccessory.BatteryState(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  return a1;
}

__n128 __swift_memcpy26_8(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 10) = *(_OWORD *)(a2 + 10);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for DockAccessory.BatteryState(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(unsigned char *)(a1 + 24) = *(unsigned char *)(a2 + 24);
  *(unsigned char *)(a1 + 25) = *(unsigned char *)(a2 + 25);
  return a1;
}

uint64_t getEnumTagSinglePayload for DockAccessory.BatteryState(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 26)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for DockAccessory.BatteryState(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 8) = 0;
    *(void *)(result + 16) = 0;
    *(_WORD *)(result + 24) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 26) = 1;
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
    *(unsigned char *)(result + 26) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DockAccessory.BatteryState()
{
  return &type metadata for DockAccessory.BatteryState;
}

uint64_t initializeBufferWithCopyOfBuffer for DockAccessory.BatteryStates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_243346DA4(a1, a2, a3, &qword_268D93560);
}

uint64_t sub_243346DA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a4);
  BOOL v7 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v6 - 8);

  return v7(a1, a2, v6);
}

uint64_t destroy for DockAccessory.BatteryStates(uint64_t a1, uint64_t a2)
{
  return sub_243346E1C(a1, a2, &qword_268D93560);
}

uint64_t sub_243346E1C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(a3);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);

  return v5(a1, v4);
}

uint64_t initializeWithCopy for DockAccessory.BatteryStates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_243346E8C(a1, a2, a3, &qword_268D93560);
}

uint64_t sub_243346E8C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  return a1;
}

uint64_t assignWithCopy for DockAccessory.BatteryStates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_243346EFC(a1, a2, a3, &qword_268D93560);
}

uint64_t sub_243346EFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  return a1;
}

uint64_t initializeWithTake for DockAccessory.BatteryStates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_243346F6C(a1, a2, a3, &qword_268D93560);
}

uint64_t sub_243346F6C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  return a1;
}

uint64_t assignWithTake for DockAccessory.BatteryStates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_243346FDC(a1, a2, a3, &qword_268D93560);
}

uint64_t sub_243346FDC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for DockAccessory.BatteryStates(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_243347054);
}

uint64_t sub_243347054(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_91Tm(a1, a2, a3, &qword_268D93560);
}

uint64_t __swift_get_extra_inhabitant_index_91Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(a4);
  BOOL v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48);

  return v7(a1, a2, v6);
}

uint64_t storeEnumTagSinglePayload for DockAccessory.BatteryStates(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2433470E0);
}

uint64_t sub_2433470E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_92Tm(a1, a2, a3, a4, &qword_268D93560);
}

uint64_t __swift_store_extra_inhabitant_index_92Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a5);
  int v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);

  return v8(a1, a2, a2, v7);
}

uint64_t type metadata accessor for DockAccessory.BatteryStates(uint64_t a1)
{
  return sub_24332008C(a1, (uint64_t *)&unk_268D93940);
}

void sub_24334717C(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t *initializeBufferWithCopyOfBuffer for DockAccessory.BatteryStates.Iterator(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  return sub_2433471A4(a1, a2, a3, &qword_268D93560, &qword_268D93558);
}

uint64_t *sub_2433471A4(uint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  int v7 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v7 & 0x20000) != 0)
  {
    uint64_t v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v7 + 16) & ~(unint64_t)v7));
    swift_retain();
  }
  else
  {
    uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(a4);
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v10 - 8) + 16))(a1, a2, v10);
    uint64_t v11 = *(int *)(a3 + 20);
    uint64_t v12 = (char *)a1 + v11;
    uint64_t v13 = (char *)a2 + v11;
    uint64_t v14 = __swift_instantiateConcreteTypeFromMangledName(a5);
    (*(void (**)(char *, char *, uint64_t))(*(void *)(v14 - 8) + 16))(v12, v13, v14);
  }
  return a1;
}

uint64_t destroy for DockAccessory.BatteryStates.Iterator(uint64_t a1, uint64_t a2)
{
  return sub_2433472C4(a1, a2, &qword_268D93560, &qword_268D93558);
}

uint64_t sub_2433472C4(uint64_t a1, uint64_t a2, uint64_t *a3, uint64_t *a4)
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v7 - 8) + 8))(a1, v7);
  uint64_t v8 = a1 + *(int *)(a2 + 20);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a4);
  uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);

  return v10(v8, v9);
}

uint64_t initializeWithCopy for DockAccessory.BatteryStates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24334738C(a1, a2, a3, &qword_268D93560, &qword_268D93558);
}

uint64_t sub_24334738C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 16))(a1, a2, v9);
  uint64_t v10 = *(int *)(a3 + 20);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(a5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 16))(v11, v12, v13);
  return a1;
}

uint64_t assignWithCopy for DockAccessory.BatteryStates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24334745C(a1, a2, a3, &qword_268D93560, &qword_268D93558);
}

uint64_t sub_24334745C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 24))(a1, a2, v9);
  uint64_t v10 = *(int *)(a3 + 20);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(a5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 24))(v11, v12, v13);
  return a1;
}

uint64_t initializeWithTake for DockAccessory.BatteryStates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_24334752C(a1, a2, a3, &qword_268D93560, &qword_268D93558);
}

uint64_t sub_24334752C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 32))(a1, a2, v9);
  uint64_t v10 = *(int *)(a3 + 20);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(a5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 32))(v11, v12, v13);
  return a1;
}

uint64_t assignWithTake for DockAccessory.BatteryStates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_2433475FC(a1, a2, a3, &qword_268D93560, &qword_268D93558);
}

uint64_t sub_2433475FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 40))(a1, a2, v9);
  uint64_t v10 = *(int *)(a3 + 20);
  uint64_t v11 = a1 + v10;
  uint64_t v12 = a2 + v10;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(a5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 40))(v11, v12, v13);
  return a1;
}

uint64_t getEnumTagSinglePayload for DockAccessory.BatteryStates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x270FA0340](a1, a2, a3, sub_2433476CC);
}

uint64_t sub_2433476CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return __swift_get_extra_inhabitant_index_94Tm(a1, a2, a3, &qword_268D93560, &qword_268D93558);
}

uint64_t __swift_get_extra_inhabitant_index_94Tm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t *a5)
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(a4);
  uint64_t v10 = *(void *)(v9 - 8);
  if (*(_DWORD *)(v10 + 84) == a2)
  {
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48);
    return v11(a1, a2, v9);
  }
  else
  {
    uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(a5);
    uint64_t v14 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 48);
    uint64_t v15 = v13;
    uint64_t v16 = a1 + *(int *)(a3 + 20);
    return v14(v16, a2, v15);
  }
}

uint64_t storeEnumTagSinglePayload for DockAccessory.BatteryStates.Iterator(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x270FA0580](a1, a2, a3, a4, sub_2433477F0);
}

uint64_t sub_2433477F0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  return __swift_store_extra_inhabitant_index_95Tm(a1, a2, a3, a4, &qword_268D93560, &qword_268D93558);
}

uint64_t __swift_store_extra_inhabitant_index_95Tm(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t *a5, uint64_t *a6)
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(a5);
  uint64_t v12 = *(void *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == a3)
  {
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56);
    return v13(a1, a2, a2, v11);
  }
  else
  {
    uint64_t v15 = __swift_instantiateConcreteTypeFromMangledName(a6);
    uint64_t v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v15 - 8) + 56);
    uint64_t v17 = v15;
    uint64_t v18 = a1 + *(int *)(a4 + 20);
    return v16(v18, a2, a2, v17);
  }
}

void sub_243347918(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

void sub_243347934(uint64_t a1, unint64_t *a2, uint64_t a3, uint64_t (*a4)(void, uint64_t))
{
  if (!*a2)
  {
    unint64_t v5 = a4(0, a3);
    if (!v6) {
      atomic_store(v5, a2);
    }
  }
}

ValueMetadata *type metadata accessor for DockAccessory.FramingMode()
{
  return &type metadata for DockAccessory.FramingMode;
}

ValueMetadata *type metadata accessor for DockAccessory.Animation()
{
  return &type metadata for DockAccessory.Animation;
}

__n128 __swift_memcpy89_8(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  __n128 result = *(__n128 *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  long long v5 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 73) = *(_OWORD *)(a2 + 73);
  *(_OWORD *)(a1 + 48) = v4;
  *(_OWORD *)(a1 + 64) = v5;
  *(__n128 *)(a1 + 32) = result;
  return result;
}

uint64_t getEnumTagSinglePayload for DockAccessory.Limits(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 89)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for DockAccessory.Limits(uint64_t result, int a2, int a3)
{
  if (a2)
  {
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 88) = 0;
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
  *(unsigned char *)(result + 89) = v3;
  return result;
}

ValueMetadata *type metadata accessor for DockAccessory.Limits()
{
  return &type metadata for DockAccessory.Limits;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for DockAccessory.Limits.Limit(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 24)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t storeEnumTagSinglePayload for DockAccessory.Limits.Limit(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for DockAccessory.Limits.Limit()
{
  return &type metadata for DockAccessory.Limits.Limit;
}

uint64_t _s7DockKit13DockAccessoryC11FramingModeOwet_0(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFD) {
    goto LABEL_17;
  }
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
    if (v4) {
      return (*a1 | (v4 << 8)) - 3;
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
      return (*a1 | (v4 << 8)) - 3;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 3;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 4;
  int v8 = v6 - 4;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *_s7DockKit13DockAccessoryC11FramingModeOwst_0(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *__n128 result = a2 + 3;
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
        JUMPOUT(0x243347C0CLL);
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
          *__n128 result = a2 + 3;
        break;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for DockAccessory.FramingMode.CodingKeys()
{
  return &type metadata for DockAccessory.FramingMode.CodingKeys;
}

ValueMetadata *type metadata accessor for DockAccessory.FramingMode.AutomaticCodingKeys()
{
  return &type metadata for DockAccessory.FramingMode.AutomaticCodingKeys;
}

ValueMetadata *type metadata accessor for DockAccessory.FramingMode.CenterCodingKeys()
{
  return &type metadata for DockAccessory.FramingMode.CenterCodingKeys;
}

ValueMetadata *type metadata accessor for DockAccessory.FramingMode.LeftCodingKeys()
{
  return &type metadata for DockAccessory.FramingMode.LeftCodingKeys;
}

ValueMetadata *type metadata accessor for DockAccessory.FramingMode.RightCodingKeys()
{
  return &type metadata for DockAccessory.FramingMode.RightCodingKeys;
}

uint64_t _s7DockKit13DockAccessoryC8CategoryOwet_0(unsigned int *a1, int a2)
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

unsigned char *_s7DockKit13DockAccessoryC8CategoryOwst_0(unsigned char *result, int a2, int a3)
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
        *__n128 result = a2;
        return result;
      case 2:
        *(_WORD *)__n128 result = a2;
        return result;
      case 3:
        goto LABEL_19;
      case 4:
        *(_DWORD *)__n128 result = a2;
        return result;
      default:
        return result;
    }
  }
  switch(v5)
  {
    case 1:
      *__n128 result = 0;
      break;
    case 2:
      *(_WORD *)__n128 result = 0;
      break;
    case 3:
LABEL_19:
      __break(1u);
      JUMPOUT(0x243347D70);
    case 4:
      *(_DWORD *)__n128 result = 0;
      break;
    default:
      return result;
  }
  return result;
}

ValueMetadata *type metadata accessor for DockAccessory.Category.CodingKeys()
{
  return &type metadata for DockAccessory.Category.CodingKeys;
}

ValueMetadata *type metadata accessor for DockAccessory.Category.TrackingStandCodingKeys()
{
  return &type metadata for DockAccessory.Category.TrackingStandCodingKeys;
}

unint64_t sub_243347DBC()
{
  unint64_t result = qword_268D93970;
  if (!qword_268D93970)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D93970);
  }
  return result;
}

unint64_t sub_243347E14()
{
  unint64_t result = qword_268D93978;
  if (!qword_268D93978)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D93978);
  }
  return result;
}

unint64_t sub_243347E6C()
{
  unint64_t result = qword_268D93980;
  if (!qword_268D93980)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D93980);
  }
  return result;
}

unint64_t sub_243347EC4()
{
  unint64_t result = qword_268D93988;
  if (!qword_268D93988)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D93988);
  }
  return result;
}

unint64_t sub_243347F1C()
{
  unint64_t result = qword_268D93990;
  if (!qword_268D93990)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D93990);
  }
  return result;
}

unint64_t sub_243347F74()
{
  unint64_t result = qword_268D93998;
  if (!qword_268D93998)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D93998);
  }
  return result;
}

unint64_t sub_243347FCC()
{
  unint64_t result = qword_268D939A0;
  if (!qword_268D939A0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D939A0);
  }
  return result;
}

unint64_t sub_243348024()
{
  unint64_t result = qword_268D939A8;
  if (!qword_268D939A8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D939A8);
  }
  return result;
}

unint64_t sub_24334807C()
{
  unint64_t result = qword_268D939B0;
  if (!qword_268D939B0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D939B0);
  }
  return result;
}

unint64_t sub_2433480D4()
{
  unint64_t result = qword_268D939B8;
  if (!qword_268D939B8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D939B8);
  }
  return result;
}

unint64_t sub_24334812C()
{
  unint64_t result = qword_268D939C0;
  if (!qword_268D939C0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D939C0);
  }
  return result;
}

unint64_t sub_243348184()
{
  unint64_t result = qword_268D939C8;
  if (!qword_268D939C8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D939C8);
  }
  return result;
}

unint64_t sub_2433481DC()
{
  unint64_t result = qword_268D939D0;
  if (!qword_268D939D0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D939D0);
  }
  return result;
}

unint64_t sub_243348234()
{
  unint64_t result = qword_268D939D8;
  if (!qword_268D939D8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D939D8);
  }
  return result;
}

unint64_t sub_24334828C()
{
  unint64_t result = qword_268D939E0;
  if (!qword_268D939E0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_268D939E0);
  }
  return result;
}

unint64_t sub_2433482E4()
{
  unint64_t result = qword_268D939E8;
  if (!qword_268D939E8)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, &qword_268D939E8);
  }
  return result;
}

uint64_t sub_243348338(uint64_t a1, uint64_t a2)
{
  BOOL v3 = a1 == 0x6974616D6F747561 && a2 == 0xE900000000000063;
  if (v3 || (sub_24334A940() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x7265746E6563 && a2 == 0xE600000000000000 || (sub_24334A940() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 1952867692 && a2 == 0xE400000000000000 || (sub_24334A940() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7468676972 && a2 == 0xE500000000000000)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else
  {
    char v6 = sub_24334A940();
    swift_bridgeObjectRelease();
    if (v6) {
      return 3;
    }
    else {
      return 4;
    }
  }
}

uint64_t sub_2433484C8(uint64_t a1, unint64_t a2)
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

uint64_t sub_243348520(uint64_t a1)
{
  long long v7 = *(_OWORD *)(v1 + 32);
  uint64_t v4 = *(void *)(v1 + 48);
  uint64_t v5 = swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *(void *)uint64_t v5 = v2;
  *(void *)(v5 + 40) = v4;
  *(_OWORD *)(v5 + 24) = v7;
  *(void *)(v5 + 8) = sub_2433232E8;
  *(void *)(v5 + 16) = a1;
  return MEMORY[0x270FA2498](sub_243323F4C, 0, 0);
}

uint64_t sub_2433485E8()
{
  swift_release();

  return MEMORY[0x270FA0238](v0, 32, 7);
}

uint64_t sub_243348620(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_2433232E8;
  char v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_268D93A00 + dword_268D93A00);
  return v6(a1, v4);
}

uint64_t sub_2433486DC(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v1 + 32);
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_2433232E8;
  *(_OWORD *)(v4 + 24) = v5;
  *(void *)(v4 + 16) = a1;
  return MEMORY[0x270FA2498](sub_243323C6C, 0, 0);
}

uint64_t sub_243348794(uint64_t a1)
{
  uint64_t v4 = swift_task_alloc();
  long long v5 = *(_OWORD *)(v1 + 32);
  *(void *)(v2 + 16) = v4;
  *(void *)uint64_t v4 = v2;
  *(void *)(v4 + 8) = sub_2433202FC;
  *(_OWORD *)(v4 + 24) = v5;
  *(void *)(v4 + 16) = a1;
  return MEMORY[0x270FA2498](sub_243323980, 0, 0);
}

uint64_t sub_243348848()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, 72, 7);
}

uint64_t sub_2433488A0(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 64);
  uint64_t v5 = swift_task_alloc();
  long long v6 = *(_OWORD *)(v1 + 32);
  long long v7 = *(_OWORD *)(v1 + 48);
  *(void *)(v2 + 16) = v5;
  *(void *)uint64_t v5 = v2;
  *(void *)(v5 + 8) = sub_2433232E8;
  *(void *)(v5 + 56) = v4;
  *(_OWORD *)(v5 + 40) = v7;
  *(_OWORD *)(v5 + 24) = v6;
  *(void *)(v5 + 16) = a1;
  return MEMORY[0x270FA2498](sub_243323784, 0, 0);
}

uint64_t sub_24334896C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  long long v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *long long v7 = v2;
  v7[1] = sub_2433232E8;
  return sub_24333F4B0(a1, v4, v5, v6);
}

uint64_t sub_243348A20(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_2433484C8(a1, a2);
  }
  return a1;
}

unint64_t sub_243348A38()
{
  unint64_t result = qword_268D93A88;
  if (!qword_268D93A88)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_268D93A88);
  }
  return result;
}

uint64_t sub_243348A78()
{
  return sub_24332E8BC(v0);
}

id sub_243348A94()
{
  uint64_t v1 = *(void *)(v0 + 16);
  uint64_t v2 = *(void **)(v0 + 24);
  BOOL v3 = *(void **)(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory__orientationProgress);
  *(void *)(v1 + OBJC_IVAR____TtC7DockKit13DockAccessory__orientationProgress) = v2;

  return v2;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_243348B24(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_243348B80()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 80, 7);
}

uint64_t sub_243348BD0(uint64_t a1)
{
  uint64_t v4 = *(void *)(v1 + 16);
  uint64_t v5 = *(void *)(v1 + 24);
  uint64_t v6 = *(void *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 40);
  uint64_t v8 = *(void *)(v1 + 48);
  uint64_t v9 = *(void *)(v1 + 56);
  char v10 = *(unsigned char *)(v1 + 64);
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_2433232E8;
  return sub_24332C89C(a1, v4, v5, v6, v7, v8, v9, v10);
}

char *sub_243348CC0(uint64_t a1)
{
  return sub_24332ECD0(a1, *(void *)(v1 + 16), *(void **)(v1 + 24));
}

uint64_t sub_243348CDC(uint64_t a1)
{
  return sub_243334578(a1, v1, &qword_268D93AC8, (uint64_t)sub_243348D30, (uint64_t)&unk_26F8A2F80, (uint64_t)&unk_268D93AD8);
}

uint64_t sub_243348D30(uint64_t a1)
{
  return sub_243334764(a1, v1, (uint64_t)&unk_26F8A2FF8, (uint64_t)&unk_26F8A3020, (uint64_t)&unk_268D93B08);
}

uint64_t sub_243348D84()
{
  return objectdestroy_246Tm(&qword_268D93AC8);
}

uint64_t sub_243348D90(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268D93AC8) - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_2433232E8;
  return sub_243334FD8(a1, v5, v6, v7, v8);
}

uint64_t sub_243348E90()
{
  return objectdestroy_250Tm(&qword_268D93AC8);
}

uint64_t sub_243348E9C(uint64_t a1, unint64_t a2, uint64_t a3, int a4)
{
  uint64_t v9 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268D93AC8) - 8);
  uint64_t v10 = *(void *)(v4 + 16);
  uint64_t v11 = v4 + ((*(unsigned __int8 *)(v9 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80));

  return sub_243335C8C(a1, a2, a3, a4, v10, v11);
}

uint64_t objectdestroyTm_0()
{
  swift_unknownObjectRelease();

  sub_2433484C8(*(void *)(v0 + 40), *(void *)(v0 + 48));

  return MEMORY[0x270FA0238](v0, 56, 7);
}

uint64_t sub_243348F88(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_243348F98(uint64_t a1, unint64_t a2)
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

uint64_t sub_243348FF4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_2433232E8;
  return sub_243334998(a1, v4, v5, v6);
}

uint64_t sub_2433490A8(uint64_t a1)
{
  return sub_243332BFC(a1, *(void *)(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_2433490B0(uint64_t a1)
{
  return sub_243332E20(a1, v1);
}

uint64_t sub_2433490E8()
{
  uint64_t v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_268D93B20);
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();

  return MEMORY[0x270FA0238](v0, v6, v5);
}

uint64_t sub_2433491DC(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268D93B20) - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = (uint64_t)v1 + v5;
  uint64_t v10 = *(void *)((char *)v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  *uint64_t v11 = v2;
  v11[1] = sub_2433232E8;
  return sub_243333424(a1, v6, v7, v8, v9, v10);
}

uint64_t sub_24334930C()
{
  return objectdestroy_276Tm(&qword_268D93B20);
}

uint64_t sub_243349318(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, int a5, double a6)
{
  uint64_t v13 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268D93B20) - 8);
  uint64_t v14 = v6 + ((*(unsigned __int8 *)(v13 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80));

  return sub_24333400C(a1, a2, a3, a4, a5, v14, a6);
}

uint64_t sub_2433493D0(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_2433232E8;
  return sub_24333303C(a1, v4, v5, v6);
}

uint64_t sub_243349484(uint64_t a1)
{
  return sub_243334578(a1, v1, &qword_268D93B58, (uint64_t)sub_2433494D8, (uint64_t)&unk_26F8A30C0, (uint64_t)&unk_268D93B68);
}

uint64_t sub_2433494D8(uint64_t a1)
{
  return sub_243334764(a1, v1, (uint64_t)&unk_26F8A3160, (uint64_t)&unk_26F8A3188, (uint64_t)&unk_268D93B98);
}

uint64_t sub_24334952C()
{
  return objectdestroy_246Tm(&qword_268D93B58);
}

uint64_t sub_243349538(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268D93B58) - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_2433232E8;
  return sub_2433319EC(a1, v5, v6, v7, v8);
}

uint64_t sub_243349638()
{
  return objectdestroy_250Tm(&qword_268D93B58);
}

uint64_t objectdestroy_250Tm(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 24) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);

  return MEMORY[0x270FA0238](v1, v6, v7);
}

void sub_24334970C(void *a1, uint64_t a2, int a3)
{
  uint64_t v7 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268D93B58) - 8);
  uint64_t v8 = *(void *)(v3 + 16);
  uint64_t v9 = v3 + ((*(unsigned __int8 *)(v7 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));

  sub_2433320DC(a1, a2, a3, v8, v9);
}

uint64_t objectdestroy_187Tm()
{
  swift_unknownObjectRelease();

  return MEMORY[0x270FA0238](v0, 48, 7);
}

uint64_t sub_2433497EC(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_2433232E8;
  return sub_2433313AC(a1, v4, v5, v6);
}

uint64_t sub_2433498A0(uint64_t a1)
{
  return sub_243334578(a1, v1, &qword_268D93BB0, (uint64_t)sub_2433498F4, (uint64_t)&unk_26F8A31B0, (uint64_t)&unk_268D93BC0);
}

uint64_t sub_2433498F4(uint64_t a1)
{
  return sub_243332E20(a1, v1);
}

uint64_t sub_24334992C()
{
  return objectdestroy_246Tm(&qword_268D93BB0);
}

uint64_t objectdestroy_246Tm(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 40) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);

  return MEMORY[0x270FA0238](v1, v6, v7);
}

uint64_t sub_243349A08(uint64_t a1)
{
  uint64_t v4 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268D93BB0) - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  uint64_t v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  void *v9 = v2;
  v9[1] = sub_2433232E8;
  return sub_243330BF0(a1, v5, v6, v7, v8);
}

uint64_t sub_243349B08()
{
  return objectdestroy_276Tm(&qword_268D93BB0);
}

uint64_t objectdestroy_276Tm(uint64_t *a1)
{
  uint64_t v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  uint64_t v3 = *(void *)(v2 - 8);
  uint64_t v4 = *(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = (v4 + 16) & ~v4;
  uint64_t v6 = v5 + *(void *)(v3 + 64);
  uint64_t v7 = v4 | 7;
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1 + v5, v2);

  return MEMORY[0x270FA0238](v1, v6, v7);
}

void sub_243349BA0(void *a1, uint64_t a2, int a3)
{
  uint64_t v7 = *(void *)(__swift_instantiateConcreteTypeFromMangledName(&qword_268D93BB0) - 8);
  uint64_t v8 = v3 + ((*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80));

  sub_2433310FC(a1, a2, a3, v8);
}

uint64_t objectdestroy_218Tm()
{
  swift_unknownObjectRelease();
  swift_release();

  return MEMORY[0x270FA0238](v0, 40, 7);
}

uint64_t sub_243349C70(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  *uint64_t v7 = v2;
  v7[1] = sub_2433202FC;
  return sub_243330790(a1, v4, v5, v6);
}

uint64_t sub_243349D70(uint64_t a1)
{
  return sub_2433425BC(a1);
}

uint64_t sub_243349DA0()
{
  return MEMORY[0x270EEDFC0]();
}

uint64_t sub_243349DB0()
{
  return MEMORY[0x270EEE040]();
}

uint64_t sub_243349DC0()
{
  return MEMORY[0x270EEE920]();
}

uint64_t sub_243349DD0()
{
  return MEMORY[0x270EEE930]();
}

uint64_t sub_243349DE0()
{
  return MEMORY[0x270EEE950]();
}

uint64_t sub_243349DF0()
{
  return MEMORY[0x270EEEEC0]();
}

uint64_t sub_243349E00()
{
  return MEMORY[0x270EEF830]();
}

uint64_t sub_243349E10()
{
  return MEMORY[0x270EF0120]();
}

uint64_t sub_243349E20()
{
  return MEMORY[0x270EF0178]();
}

uint64_t sub_243349E30()
{
  return MEMORY[0x270EF0700]();
}

uint64_t sub_243349E40()
{
  return MEMORY[0x270EF07E0]();
}

uint64_t sub_243349E50()
{
  return MEMORY[0x270EF09E0]();
}

uint64_t sub_243349E60()
{
  return MEMORY[0x270EF0BB8]();
}

uint64_t sub_243349E70()
{
  return MEMORY[0x270EF0C30]();
}

uint64_t sub_243349E80()
{
  return MEMORY[0x270EF0C40]();
}

uint64_t sub_243349E90()
{
  return MEMORY[0x270EF0C68]();
}

uint64_t sub_243349EA0()
{
  return MEMORY[0x270EF0CB0]();
}

uint64_t sub_243349EB0()
{
  return MEMORY[0x270EF0D18]();
}

uint64_t sub_243349EC0()
{
  return MEMORY[0x270F267B0]();
}

uint64_t sub_243349ED0()
{
  return MEMORY[0x270F267B8]();
}

uint64_t sub_243349EE0()
{
  return MEMORY[0x270F267C0]();
}

uint64_t sub_243349EF0()
{
  return MEMORY[0x270F267C8]();
}

uint64_t sub_243349F00()
{
  return MEMORY[0x270F267D0]();
}

uint64_t sub_243349F10()
{
  return MEMORY[0x270F267D8]();
}

uint64_t sub_243349F20()
{
  return MEMORY[0x270F267E0]();
}

uint64_t sub_243349F60()
{
  return MEMORY[0x270F26800]();
}

uint64_t sub_243349F90()
{
  return MEMORY[0x270F26818]();
}

uint64_t sub_243349FB0()
{
  return MEMORY[0x270F26828]();
}

uint64_t sub_243349FD0()
{
  return MEMORY[0x270F26838]();
}

uint64_t sub_243349FE0()
{
  return MEMORY[0x270F26840]();
}

uint64_t sub_243349FF0()
{
  return MEMORY[0x270F26848]();
}

uint64_t sub_24334A000()
{
  return MEMORY[0x270F26850]();
}

uint64_t sub_24334A010()
{
  return MEMORY[0x270F26858]();
}

uint64_t sub_24334A020()
{
  return MEMORY[0x270F26860]();
}

uint64_t sub_24334A030()
{
  return MEMORY[0x270F26868]();
}

uint64_t sub_24334A040()
{
  return MEMORY[0x270F26870]();
}

uint64_t sub_24334A050()
{
  return MEMORY[0x270F26878]();
}

uint64_t sub_24334A060()
{
  return MEMORY[0x270F26880]();
}

uint64_t sub_24334A070()
{
  return MEMORY[0x270F26888]();
}

uint64_t sub_24334A080()
{
  return MEMORY[0x270F26890]();
}

uint64_t sub_24334A090()
{
  return MEMORY[0x270F26898]();
}

uint64_t sub_24334A0A0()
{
  return MEMORY[0x270F268A0]();
}

uint64_t sub_24334A0B0()
{
  return MEMORY[0x270F268A8]();
}

uint64_t sub_24334A0C0()
{
  return MEMORY[0x270F268B0]();
}

uint64_t sub_24334A0D0()
{
  return MEMORY[0x270F268B8]();
}

uint64_t sub_24334A0E0()
{
  return MEMORY[0x270F268C0]();
}

uint64_t sub_24334A0F0()
{
  return MEMORY[0x270F268C8]();
}

uint64_t sub_24334A100()
{
  return MEMORY[0x270F268D0]();
}

uint64_t sub_24334A110()
{
  return MEMORY[0x270F268D8]();
}

uint64_t sub_24334A120()
{
  return MEMORY[0x270F268E0]();
}

uint64_t sub_24334A130()
{
  return MEMORY[0x270F268E8]();
}

uint64_t sub_24334A140()
{
  return MEMORY[0x270F268F0]();
}

uint64_t sub_24334A150()
{
  return MEMORY[0x270F268F8]();
}

uint64_t sub_24334A160()
{
  return MEMORY[0x270F26900]();
}

uint64_t sub_24334A170()
{
  return MEMORY[0x270F26908]();
}

uint64_t sub_24334A180()
{
  return MEMORY[0x270F26910]();
}

uint64_t sub_24334A190()
{
  return MEMORY[0x270F26918]();
}

uint64_t sub_24334A1A0()
{
  return MEMORY[0x270F26920]();
}

uint64_t sub_24334A1B0()
{
  return MEMORY[0x270F26928]();
}

uint64_t sub_24334A1C0()
{
  return MEMORY[0x270F26930]();
}

uint64_t sub_24334A1D0()
{
  return MEMORY[0x270F26938]();
}

uint64_t sub_24334A1E0()
{
  return MEMORY[0x270F26940]();
}

uint64_t sub_24334A1F0()
{
  return MEMORY[0x270F26948]();
}

uint64_t sub_24334A200()
{
  return MEMORY[0x270F26950]();
}

uint64_t sub_24334A210()
{
  return MEMORY[0x270F26958]();
}

uint64_t sub_24334A220()
{
  return MEMORY[0x270F26960]();
}

uint64_t sub_24334A230()
{
  return MEMORY[0x270F26968]();
}

uint64_t sub_24334A240()
{
  return MEMORY[0x270F26970]();
}

uint64_t sub_24334A250()
{
  return MEMORY[0x270F26978]();
}

uint64_t sub_24334A260()
{
  return MEMORY[0x270F26980]();
}

uint64_t sub_24334A270()
{
  return MEMORY[0x270F26988]();
}

uint64_t sub_24334A280()
{
  return MEMORY[0x270F26990]();
}

uint64_t sub_24334A290()
{
  return MEMORY[0x270F26998]();
}

uint64_t sub_24334A2A0()
{
  return MEMORY[0x270F269A0]();
}

uint64_t sub_24334A2B0()
{
  return MEMORY[0x270F269A8]();
}

uint64_t sub_24334A2C0()
{
  return MEMORY[0x270F269B0]();
}

uint64_t sub_24334A2E0()
{
  return MEMORY[0x270F269C0]();
}

uint64_t sub_24334A2F0()
{
  return MEMORY[0x270F269C8]();
}

uint64_t sub_24334A330()
{
  return MEMORY[0x270F269E8]();
}

uint64_t sub_24334A340()
{
  return MEMORY[0x270F269F0]();
}

uint64_t sub_24334A350()
{
  return MEMORY[0x270F269F8]();
}

uint64_t sub_24334A360()
{
  return MEMORY[0x270F26A00]();
}

uint64_t sub_24334A370()
{
  return MEMORY[0x270F26A08]();
}

uint64_t sub_24334A380()
{
  return MEMORY[0x270F26A10]();
}

uint64_t sub_24334A390()
{
  return MEMORY[0x270F26A18]();
}

uint64_t sub_24334A3A0()
{
  return MEMORY[0x270F26A20]();
}

uint64_t sub_24334A3B0()
{
  return MEMORY[0x270F26A28]();
}

uint64_t sub_24334A3C0()
{
  return MEMORY[0x270F26A30]();
}

uint64_t sub_24334A3D0()
{
  return MEMORY[0x270F26A38]();
}

uint64_t sub_24334A3E0()
{
  return MEMORY[0x270F26A40]();
}

uint64_t sub_24334A3F0()
{
  return MEMORY[0x270F26A48]();
}

uint64_t sub_24334A400()
{
  return MEMORY[0x270F26A50]();
}

uint64_t sub_24334A410()
{
  return MEMORY[0x270F26A58]();
}

uint64_t sub_24334A420()
{
  return MEMORY[0x270F26A60]();
}

uint64_t sub_24334A430()
{
  return MEMORY[0x270F26A68]();
}

uint64_t sub_24334A440()
{
  return MEMORY[0x270F26A70]();
}

uint64_t sub_24334A450()
{
  return MEMORY[0x270F26A78]();
}

uint64_t sub_24334A460()
{
  return MEMORY[0x270F26A80]();
}

uint64_t sub_24334A470()
{
  return MEMORY[0x270F26A88]();
}

uint64_t sub_24334A480()
{
  return MEMORY[0x270F26A90]();
}

uint64_t sub_24334A490()
{
  return MEMORY[0x270F26A98]();
}

uint64_t sub_24334A4A0()
{
  return MEMORY[0x270F26AA0]();
}

uint64_t sub_24334A4B0()
{
  return MEMORY[0x270F26AA8]();
}

uint64_t sub_24334A4C0()
{
  return MEMORY[0x270F26AB0]();
}

uint64_t sub_24334A4D0()
{
  return MEMORY[0x270F26AB8]();
}

uint64_t sub_24334A4E0()
{
  return MEMORY[0x270F26AC0]();
}

uint64_t sub_24334A4F0()
{
  return MEMORY[0x270F26AC8]();
}

uint64_t sub_24334A500()
{
  return MEMORY[0x270F26AD0]();
}

uint64_t sub_24334A510()
{
  return MEMORY[0x270F26AD8]();
}

uint64_t sub_24334A520()
{
  return MEMORY[0x270F26AE0]();
}

uint64_t sub_24334A530()
{
  return MEMORY[0x270F26AE8]();
}

uint64_t sub_24334A540()
{
  return MEMORY[0x270F26AF0]();
}

uint64_t sub_24334A550()
{
  return MEMORY[0x270F443B0]();
}

uint64_t sub_24334A560()
{
  return MEMORY[0x270F443B8]();
}

uint64_t sub_24334A570()
{
  return MEMORY[0x270F443C0]();
}

uint64_t sub_24334A580()
{
  return MEMORY[0x270F44460]();
}

uint64_t sub_24334A590()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_24334A5A0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_24334A5B0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_24334A5C0()
{
  return MEMORY[0x270F9D320]();
}

uint64_t sub_24334A5D0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_24334A5E0()
{
  return MEMORY[0x270EF19C8]();
}

uint64_t sub_24334A5F0()
{
  return MEMORY[0x270EF19E0]();
}

uint64_t sub_24334A600()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_24334A610()
{
  return MEMORY[0x270F9D5E0]();
}

uint64_t sub_24334A620()
{
  return MEMORY[0x270F9D600]();
}

uint64_t sub_24334A630()
{
  return MEMORY[0x270F9D648]();
}

uint64_t sub_24334A640()
{
  return MEMORY[0x270F9D708]();
}

uint64_t sub_24334A650()
{
  return MEMORY[0x270F9D758]();
}

uint64_t sub_24334A660()
{
  return MEMORY[0x270F9D798]();
}

uint64_t sub_24334A670()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_24334A690()
{
  return MEMORY[0x270F9DA70]();
}

uint64_t sub_24334A6A0()
{
  return MEMORY[0x270F9DBA0]();
}

uint64_t sub_24334A6B0()
{
  return MEMORY[0x270EF1B88]();
}

uint64_t sub_24334A6C0()
{
  return MEMORY[0x270EF1BB8]();
}

uint64_t sub_24334A6D0()
{
  return MEMORY[0x270F9DBB0]();
}

uint64_t sub_24334A6E0()
{
  return MEMORY[0x270F9DBB8]();
}

uint64_t sub_24334A6F0()
{
  return MEMORY[0x270F9DBF0]();
}

uint64_t sub_24334A700()
{
  return MEMORY[0x270F9DC50]();
}

uint64_t sub_24334A710()
{
  return MEMORY[0x270FA1DF8]();
}

uint64_t sub_24334A720()
{
  return MEMORY[0x270FA1F08]();
}

uint64_t sub_24334A730()
{
  return MEMORY[0x270FA1F10]();
}

uint64_t sub_24334A740()
{
  return MEMORY[0x270FA1F30]();
}

uint64_t sub_24334A750()
{
  return MEMORY[0x270FA1F48]();
}

uint64_t sub_24334A760()
{
  return MEMORY[0x270FA1F50]();
}

uint64_t sub_24334A770()
{
  return MEMORY[0x270FA1F60]();
}

uint64_t sub_24334A790()
{
  return MEMORY[0x270FA1F90]();
}

uint64_t sub_24334A7A0()
{
  return MEMORY[0x270F9DD60]();
}

uint64_t sub_24334A7B0()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_24334A7C0()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_24334A7D0()
{
  return MEMORY[0x270FA2E80]();
}

uint64_t sub_24334A7E0()
{
  return MEMORY[0x270FA13F0]();
}

uint64_t sub_24334A7F0()
{
  return MEMORY[0x270FA1180]();
}

uint64_t sub_24334A800()
{
  return MEMORY[0x270EF21A8]();
}

uint64_t sub_24334A810()
{
  return MEMORY[0x270F9E3C0]();
}

uint64_t sub_24334A820()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_24334A830()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_24334A840()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_24334A850()
{
  return MEMORY[0x270F9EA40]();
}

uint64_t sub_24334A860()
{
  return MEMORY[0x270F9EA78]();
}

uint64_t sub_24334A870()
{
  return MEMORY[0x270F9EA98]();
}

uint64_t sub_24334A880()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_24334A890()
{
  return MEMORY[0x270F9ED70]();
}

uint64_t sub_24334A8A0()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_24334A8B0()
{
  return MEMORY[0x270F9EFF0]();
}

uint64_t sub_24334A8C0()
{
  return MEMORY[0x270F9F080]();
}

uint64_t sub_24334A8D0()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_24334A8F0()
{
  return MEMORY[0x270F9F250]();
}

uint64_t sub_24334A900()
{
  return MEMORY[0x270F9F258]();
}

uint64_t sub_24334A910()
{
  return MEMORY[0x270F9F360]();
}

uint64_t sub_24334A920()
{
  return MEMORY[0x270F9F390]();
}

uint64_t sub_24334A930()
{
  return MEMORY[0x270F9F4E0]();
}

uint64_t sub_24334A940()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_24334A950()
{
  return MEMORY[0x270F9FB30]();
}

uint64_t sub_24334A960()
{
  return MEMORY[0x270F9FB38]();
}

uint64_t sub_24334A970()
{
  return MEMORY[0x270F9FB40]();
}

uint64_t sub_24334A980()
{
  return MEMORY[0x270F9FB48]();
}

uint64_t sub_24334A990()
{
  return MEMORY[0x270F9FC48]();
}

uint64_t sub_24334A9A0()
{
  return MEMORY[0x270F9FC60]();
}

uint64_t sub_24334A9B0()
{
  return MEMORY[0x270F9FC68]();
}

uint64_t sub_24334A9C0()
{
  return MEMORY[0x270F9FC80]();
}

uint64_t sub_24334A9D0()
{
  return MEMORY[0x270F9FC90]();
}

uint64_t sub_24334A9E0()
{
  return MEMORY[0x270F9FD70]();
}

uint64_t sub_24334A9F0()
{
  return MEMORY[0x270F9FD98]();
}

uint64_t sub_24334AA00()
{
  return MEMORY[0x270F9FF68]();
}

uint64_t sub_24334AA10()
{
  return MEMORY[0x270F9FF78]();
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  MEMORY[0x270EE71F8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  MEMORY[0x270EE7210]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

long double asin(long double __x)
{
  MEMORY[0x270ED8610](__x);
  return result;
}

long double atan2(long double __y, long double __x)
{
  MEMORY[0x270ED86A8](__y, __x);
  return result;
}

float atan2f(float a1, float a2)
{
  MEMORY[0x270ED86B8](a1, a2);
  return result;
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x270FA0268]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x270FA0338]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x270FA0460]();
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