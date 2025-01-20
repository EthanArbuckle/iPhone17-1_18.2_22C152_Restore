uint64_t sub_3710(uint64_t *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  char *v6;

  v2 = *a1;
  v3 = *(void *)&v1[*a1];
  if (v3)
  {
    v4 = v3;
  }
  else
  {
    v5 = v1;
    sub_6608();
    swift_allocObject();
    v6 = v1;
    v4 = sub_65C8();
    *(void *)&v5[v2] = v4;
    swift_retain();
    swift_release();
  }
  swift_retain();
  return v4;
}

id sub_3794()
{
  id result = [objc_allocWithZone((Class)type metadata accessor for HoverTextAXUIService()) init];
  qword_CC28 = (uint64_t)result;
  return result;
}

id sub_37C4()
{
  if (qword_CC20 != -1) {
    swift_once();
  }
  v0 = (void *)swift_dynamicCastClassUnconditional();

  return v0;
}

unint64_t sub_386C(unint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v43 = a3;
  v5 = v4;
  uint64_t v49 = a2;
  uint64_t v8 = sub_6668();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1) {
    unint64_t v12 = a1;
  }
  else {
    unint64_t v12 = sub_3CFC((uint64_t)&_swiftEmptyArrayStorage);
  }
  swift_bridgeObjectRetain();
  uint64_t v42 = sub_6698();
  unint64_t v14 = v13;
  *(void *)&long long v47 = 1954047348;
  *((void *)&v47 + 1) = 0xE400000000000000;
  sub_6788();
  if (*(void *)(v12 + 16) && (unint64_t v15 = sub_612C((uint64_t)v46), (v16 & 1) != 0))
  {
    sub_6344(*(void *)(v12 + 56) + 32 * v15, (uint64_t)&v47);
  }
  else
  {
    long long v47 = 0u;
    long long v48 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_6170((uint64_t)v46);
  if (*((void *)&v48 + 1))
  {
    int v17 = swift_dynamicCast();
    if (v17) {
      uint64_t v18 = v44;
    }
    else {
      uint64_t v18 = 0;
    }
    if (v17) {
      uint64_t v19 = v45;
    }
    else {
      uint64_t v19 = 0;
    }
    uint64_t v40 = v19;
    uint64_t v41 = v18;
  }
  else
  {
    sub_61C4((uint64_t)&v47, &qword_CB88);
    uint64_t v40 = 0;
    uint64_t v41 = 0;
  }
  uint64_t v20 = sub_6648();
  swift_beginAccess();
  v21 = v11;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, v20, v8);
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  v22 = sub_6658();
  os_log_type_t v23 = sub_6738();
  if (os_log_type_enabled(v22, v23))
  {
    uint64_t v24 = swift_slowAlloc();
    v39 = v5;
    uint64_t v25 = v24;
    uint64_t v26 = swift_slowAlloc();
    v37 = v21;
    uint64_t v38 = v8;
    unint64_t v27 = a4;
    uint64_t v36 = v26;
    *(void *)&long long v47 = v26;
    *(_DWORD *)uint64_t v25 = 134218498;
    uint64_t v44 = v49;
    sub_6748();
    *(_WORD *)(v25 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v44 = sub_5AD4(v43, a4, (uint64_t *)&v47);
    sub_6748();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v25 + 22) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v28 = v42;
    uint64_t v44 = sub_5AD4(v42, v14, (uint64_t *)&v47);
    sub_6748();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_0, v22, v23, "Service got a message: %ld from client: %s. Payload: %s", (uint8_t *)v25, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    v5 = v39;
    swift_slowDealloc();

    uint64_t v29 = v28;
    (*(void (**)(char *, uint64_t))(v9 + 8))(v37, v38);
    unint64_t v30 = v14;
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v21, v8);
    unint64_t v27 = a4;
    unint64_t v30 = v14;
    uint64_t v29 = v42;
  }
  uint64_t v32 = v40;
  uint64_t v31 = v41;
  v33 = (void *)swift_allocObject();
  v33[2] = v49;
  v33[3] = v5;
  v33[4] = v31;
  v33[5] = v32;
  v33[6] = v43;
  v33[7] = v27;
  v33[8] = v29;
  v33[9] = v30;
  swift_bridgeObjectRetain();
  id v34 = v5;
  sub_6618();
  swift_release();
  return sub_3CFC((uint64_t)&_swiftEmptyArrayStorage);
}

unint64_t sub_3CFC(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_5558(&qword_CBA8);
  uint64_t v2 = sub_67C8();
  v3 = (void *)v2;
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
    sub_6518(v6, (uint64_t)v15);
    unint64_t result = sub_612C((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_6580(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_3E2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[14] = a7;
  v8[15] = a8;
  v8[12] = a5;
  v8[13] = a6;
  v8[10] = a3;
  v8[11] = a4;
  v8[8] = a1;
  v8[9] = a2;
  uint64_t v9 = sub_6668();
  v8[16] = v9;
  v8[17] = *(void *)(v9 - 8);
  v8[18] = swift_task_alloc();
  sub_66F8();
  v8[19] = sub_66E8();
  uint64_t v11 = sub_66D8();
  v8[20] = v11;
  v8[21] = v10;
  return _swift_task_switch(sub_3F2C, v11, v10);
}

uint64_t sub_3F2C()
{
  unint64_t v30 = v0;
  switch(v0[8])
  {
    case 1:
      v0[24] = sub_3710(&OBJC_IVAR___HoverTextAXUIService____lazy_storage___hoverTextCoordinator);
      v1 = (void *)swift_task_alloc();
      v0[25] = v1;
      void *v1 = v0;
      uint64_t v2 = sub_4600;
      goto LABEL_7;
    case 2:
      v0[22] = sub_3710(&OBJC_IVAR___HoverTextAXUIService____lazy_storage___hoverTextCoordinator);
      v3 = (void *)swift_task_alloc();
      v0[23] = v3;
      void *v3 = v0;
      uint64_t v4 = sub_4454;
      goto LABEL_11;
    case 3:
      uint64_t v5 = v0[11];
      swift_release();
      if (v5)
      {
        uint64_t v7 = v0[10];
        uint64_t v6 = (void *)v0[11];
        sub_3710(&OBJC_IVAR___HoverTextAXUIService____lazy_storage___hoverTextCoordinator);
        v32._countAndFlagsBits = v7;
        v32._object = v6;
        sub_65F8(v32);
        swift_release();
      }
      goto LABEL_17;
    case 4:
      v0[26] = sub_3710(&OBJC_IVAR___HoverTextAXUIService____lazy_storage___hoverTextTypingCoordinator);
      v1 = (void *)swift_task_alloc();
      v0[27] = v1;
      void *v1 = v0;
      uint64_t v2 = sub_4744;
LABEL_7:
      v1[1] = v2;
      return HoverTextCoordinator.startHoverText()();
    case 5:
      v0[28] = sub_3710(&OBJC_IVAR___HoverTextAXUIService____lazy_storage___hoverTextTypingCoordinator);
      v3 = (void *)swift_task_alloc();
      v0[29] = v3;
      void *v3 = v0;
      uint64_t v4 = sub_4888;
LABEL_11:
      v3[1] = v4;
      uint64_t result = HoverTextCoordinator.stopHoverText()();
      break;
    default:
      uint64_t v8 = v0[18];
      uint64_t v9 = v0[16];
      uint64_t v10 = v0[17];
      swift_release();
      uint64_t v11 = sub_6648();
      swift_beginAccess();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 16))(v8, v11, v9);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain_n();
      uint64_t v12 = sub_6658();
      os_log_type_t v13 = sub_6728();
      BOOL v14 = os_log_type_enabled(v12, v13);
      uint64_t v16 = v0[17];
      uint64_t v15 = v0[18];
      unint64_t v18 = v0[15];
      uint64_t v17 = v0[16];
      if (v14)
      {
        uint64_t v27 = v0[18];
        uint64_t v28 = v0[16];
        unint64_t v19 = v0[13];
        uint64_t v25 = v0[14];
        uint64_t v24 = v0[12];
        uint64_t v20 = v0[8];
        os_log_type_t type = v13;
        uint64_t v21 = swift_slowAlloc();
        uint64_t v29 = swift_slowAlloc();
        *(_DWORD *)uint64_t v21 = 134218498;
        v0[5] = v20;
        sub_6748();
        *(_WORD *)(v21 + 12) = 2080;
        swift_bridgeObjectRetain();
        v0[6] = sub_5AD4(v24, v19, &v29);
        sub_6748();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v21 + 22) = 2080;
        swift_bridgeObjectRetain();
        v0[7] = sub_5AD4(v25, v18, &v29);
        sub_6748();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_0, v12, type, "Unhandled service message: %ld from client: %s. Payload: %s", (uint8_t *)v21, 0x20u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v27, v28);
      }
      else
      {
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease_n();

        (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
      }
LABEL_17:
      swift_task_dealloc();
      v22 = (uint64_t (*)(void))v0[1];
      uint64_t result = v22();
      break;
  }
  return result;
}

uint64_t sub_4454()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 168);
  uint64_t v3 = *(void *)(v1 + 160);
  return _swift_task_switch(sub_4598, v3, v2);
}

uint64_t sub_4598()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_4600()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 168);
  uint64_t v3 = *(void *)(v1 + 160);
  return _swift_task_switch(sub_6590, v3, v2);
}

uint64_t sub_4744()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 168);
  uint64_t v3 = *(void *)(v1 + 160);
  return _swift_task_switch(sub_6590, v3, v2);
}

uint64_t sub_4888()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  swift_release();
  uint64_t v2 = *(void *)(v1 + 168);
  uint64_t v3 = *(void *)(v1 + 160);
  return _swift_task_switch(sub_6590, v3, v2);
}

uint64_t sub_4B9C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  sub_66F8();
  v5[4] = sub_66E8();
  uint64_t v7 = sub_66D8();
  return _swift_task_switch(sub_4C34, v7, v6);
}

uint64_t sub_4C34()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_release();
  uint64_t result = sub_3710(&OBJC_IVAR___HoverTextAXUIService____lazy_storage___hoverTextCoordinator);
  if (v1)
  {
    uint64_t v3 = *(objc_class **)(v0 + 24);
    v4.super.super.super.isa = v3;
    sub_65D8(v4);
    swift_release();
    sub_3710(&OBJC_IVAR___HoverTextAXUIService____lazy_storage___hoverTextTypingCoordinator);
    v5.super.super.super.isa = v3;
    sub_65D8(v5);
    swift_release();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_4CF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_6718();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_6708();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_61C4(a1, &qword_CB50);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_66D8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_4F34(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  v24[1] = a3;
  uint64_t v25 = a4;
  uint64_t v6 = v4;
  sub_5558(&qword_CB50);
  __chkstk_darwin();
  uint64_t v9 = (char *)v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_6668();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin();
  os_log_type_t v13 = (char *)v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_6648();
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, v14, v10);
  uint64_t v15 = sub_6658();
  os_log_type_t v16 = sub_6738();
  if (os_log_type_enabled(v15, v16))
  {
    uint64_t v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v17 = 0;
    _os_log_impl(&dword_0, v15, v16, a2, v17, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  uint64_t v18 = sub_6718();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v9, 1, 1, v18);
  sub_66F8();
  id v19 = a1;
  id v20 = v6;
  uint64_t v21 = sub_66E8();
  v22 = (void *)swift_allocObject();
  v22[2] = v21;
  v22[3] = &protocol witness table for MainActor;
  v22[4] = v20;
  v22[5] = a1;
  sub_4CF8((uint64_t)v9, v25, (uint64_t)v22);
  return swift_release();
}

uint64_t sub_5194(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = a4;
  v5[3] = a5;
  sub_66F8();
  v5[4] = sub_66E8();
  uint64_t v7 = sub_66D8();
  return _swift_task_switch(sub_522C, v7, v6);
}

uint64_t sub_522C()
{
  uint64_t v1 = *(void *)(v0 + 24);
  swift_release();
  uint64_t result = sub_3710(&OBJC_IVAR___HoverTextAXUIService____lazy_storage___hoverTextCoordinator);
  if (v1)
  {
    uint64_t v3 = *(objc_class **)(v0 + 24);
    v4.super.super.super.isa = v3;
    sub_65E8(v4);
    swift_release();
    sub_3710(&OBJC_IVAR___HoverTextAXUIService____lazy_storage___hoverTextTypingCoordinator);
    v5.super.super.super.isa = v3;
    sub_65E8(v5);
    swift_release();
    uint64_t v6 = *(uint64_t (**)(void))(v0 + 8);
    return v6();
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_54A0()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for HoverTextAXUIService()
{
  return self;
}

uint64_t sub_5558(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_55A0()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  UIWindowScene v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_6594;
  return sub_5194((uint64_t)v4, v5, v6, v2, v3);
}

uint64_t sub_5638(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  UIWindowScene v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_5714;
  return v6(a1);
}

uint64_t sub_5714()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_580C()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_5844(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  void *v5 = v2;
  v5[1] = sub_58FC;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_CB68 + dword_CB68);
  return v6(a1, v4);
}

uint64_t sub_58FC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_59F4()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_5A3C()
{
  uint64_t v2 = *(void *)(v0 + 32);
  uint64_t v3 = *(void *)(v0 + 40);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v4;
  void *v4 = v1;
  v4[1] = sub_6594;
  return sub_4B9C((uint64_t)v4, v5, v6, v2, v3);
}

uint64_t sub_5AD4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_5BA8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_6344((uint64_t)v12, *a3);
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
      sub_6344((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_63A0((uint64_t)v12);
  return v7;
}

uint64_t sub_5BA8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_6758();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_5D64(a5, a6);
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
  uint64_t v8 = sub_67A8();
  if (!v8)
  {
    sub_67B8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_67D8();
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

uint64_t sub_5D64(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_5DFC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_5FDC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_5FDC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_5DFC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_5F74(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_6798();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_67B8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_66C8();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_67D8();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_67B8();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_5F74(uint64_t a1, uint64_t a2)
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
  sub_5558(&qword_CBA0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_5FDC(char a1, int64_t a2, char a3, char *a4)
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
    sub_5558(&qword_CBA0);
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
  os_log_type_t v13 = a4 + 32;
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
  uint64_t result = sub_67D8();
  __break(1u);
  return result;
}

unint64_t sub_612C(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_6768(*(void *)(v2 + 40));

  return sub_63F4(a1, v4);
}

uint64_t sub_6170(uint64_t a1)
{
  return a1;
}

uint64_t sub_61C4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_5558(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_6220()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 80, 7);
}

uint64_t sub_6270()
{
  uint64_t v2 = v0[2];
  uint64_t v3 = v0[3];
  uint64_t v4 = v0[4];
  uint64_t v5 = v0[5];
  uint64_t v6 = v0[6];
  uint64_t v7 = v0[7];
  uint64_t v9 = v0[8];
  uint64_t v8 = v0[9];
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v1 + 16) = v10;
  *uint64_t v10 = v1;
  v10[1] = sub_58FC;
  return sub_3E2C(v2, v3, v4, v5, v6, v7, v9, v8);
}

uint64_t sub_6344(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_63A0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_63F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_64BC(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_6778();
      sub_6170((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_64BC(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_6518(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_5558((uint64_t *)&unk_CBB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_6580(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_6598()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_65C8()
{
  return HoverTextCoordinator.init(withService:isHoverTextTyping:)();
}

void sub_65D8(UIWindowScene a1)
{
}

void sub_65E8(UIWindowScene a1)
{
}

void sub_65F8(Swift::String a1)
{
}

uint64_t sub_6608()
{
  return type metadata accessor for HoverTextCoordinator();
}

uint64_t sub_6618()
{
  return dispatch thunk of AXMainActorSerialQueue.async(_:)();
}

uint64_t sub_6628()
{
  return AXMainActorSerialQueue.__allocating_init()();
}

uint64_t sub_6638()
{
  return type metadata accessor for AXMainActorSerialQueue();
}

uint64_t sub_6648()
{
  return HTLog.unsafeMutableAddressor();
}

uint64_t sub_6658()
{
  return Logger.logObject.getter();
}

uint64_t sub_6668()
{
  return type metadata accessor for Logger();
}

NSDictionary sub_6678()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_6688()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_6698()
{
  return Dictionary.description.getter();
}

NSString sub_66A8()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_66B8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Int sub_66C8()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_66D8()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_66E8()
{
  return static MainActor.shared.getter();
}

uint64_t sub_66F8()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_6708()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_6718()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_6728()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_6738()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_6748()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_6758()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

Swift::Int sub_6768(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_6778()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_6788()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_6798()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_67A8()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_67B8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_67C8()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_67D8()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t self
{
  return _self;
}

void objc_release(id a1)
{
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
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

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return _swift_bridgeObjectRetain_n();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClassUnconditional()
{
  return _swift_dynamicCastClassUnconditional();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
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

uint64_t swift_task_create()
{
  return _swift_task_create();
}

uint64_t swift_task_dealloc()
{
  return _swift_task_dealloc();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}