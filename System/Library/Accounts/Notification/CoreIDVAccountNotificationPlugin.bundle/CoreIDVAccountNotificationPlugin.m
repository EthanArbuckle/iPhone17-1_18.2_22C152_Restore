id sub_24057E714()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  int v21;
  uint64_t v22;
  objc_super v24;
  uint64_t v25;
  uint64_t aBlock[6];

  v1 = v0;
  v2 = OBJC_IVAR____TtC32CoreIDVAccountNotificationPlugin27DIPSystemNotificationClient_remoteObjectProxy;
  *(void *)&v0[OBJC_IVAR____TtC32CoreIDVAccountNotificationPlugin27DIPSystemNotificationClient_remoteObjectProxy] = 0;
  v3 = qword_26AFC6628;
  v4 = v1;
  if (v3 != -1) {
    swift_once();
  }
  v5 = sub_240580AC0();
  sub_24057EE30(v5, (uint64_t)qword_26AFC6630);
  v6 = sub_240580AA0();
  v7 = sub_240580B10();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = swift_slowAlloc();
    aBlock[0] = v9;
    *(_DWORD *)v8 = 136446210;
    v25 = sub_24057F2E0(0xD000000000000027, 0x8000000240581270, aBlock);
    sub_240580B30();
    _os_log_impl(&dword_24057D000, v6, v7, "DIPSystemNotificationClient connecting to service %{public}s ", v8, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2455ECBD0](v9, -1, -1);
    MEMORY[0x2455ECBD0](v8, -1, -1);
  }

  v10 = objc_allocWithZone(MEMORY[0x263F08D68]);
  v11 = (void *)sub_240580AD0();
  v12 = objc_msgSend(v10, sel_initWithMachServiceName_options_, v11, 4096);

  v13 = OBJC_IVAR____TtC32CoreIDVAccountNotificationPlugin27DIPSystemNotificationClient_serverConnection;
  *(void *)&v4[OBJC_IVAR____TtC32CoreIDVAccountNotificationPlugin27DIPSystemNotificationClient_serverConnection] = v12;
  v14 = self;
  v15 = v12;
  v16 = objc_msgSend(v14, sel_interfaceWithProtocol_, &unk_26F4A8B30);
  objc_msgSend(v15, sel_setRemoteObjectInterface_, v16);

  *(void *)&v1[v2] = 0;
  swift_unknownObjectRelease();
  v17 = *(void **)&v4[v13];
  objc_msgSend(v17, sel_resume);
  aBlock[4] = (uint64_t)sub_24057EA94;
  aBlock[5] = 0;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_24057EC88;
  aBlock[3] = (uint64_t)&unk_26F4A7900;
  v18 = _Block_copy(aBlock);
  v19 = v17;
  v20 = objc_msgSend(v19, sel_remoteObjectProxyWithErrorHandler_, v18);
  _Block_release(v18);

  sub_240580B50();
  swift_unknownObjectRelease();
  sub_24057EE80(&qword_268C88840);
  v21 = swift_dynamicCast();
  v22 = v25;
  if (!v21) {
    v22 = 0;
  }
  *(void *)&v1[v2] = v22;

  swift_unknownObjectRelease();
  v24.receiver = v4;
  v24.super_class = (Class)type metadata accessor for DIPSystemNotificationClient();
  return objc_msgSendSuper2(&v24, sel_init);
}

void sub_24057EA94(void *a1)
{
  if (qword_26AFC6628 != -1) {
    swift_once();
  }
  uint64_t v2 = sub_240580AC0();
  sub_24057EE30(v2, (uint64_t)qword_26AFC6630);
  id v3 = a1;
  id v4 = a1;
  oslog = sub_240580AA0();
  os_log_type_t v5 = sub_240580B10();
  if (os_log_type_enabled(oslog, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v7 = swift_slowAlloc();
    uint64_t v11 = v7;
    *(_DWORD *)v6 = 136446210;
    swift_getErrorValue();
    uint64_t v8 = sub_240580BB0();
    sub_24057F2E0(v8, v9, &v11);
    sub_240580B30();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_24057D000, oslog, v5, "error: system notification client init -> %{public}s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2455ECBD0](v7, -1, -1);
    MEMORY[0x2455ECBD0](v6, -1, -1);
  }
  else
  {
  }
}

void sub_24057EC88(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3();
  swift_release();
}

id sub_24057ED14()
{
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC32CoreIDVAccountNotificationPlugin27DIPSystemNotificationClient_serverConnection], sel_invalidate);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DIPSystemNotificationClient();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for DIPSystemNotificationClient()
{
  return self;
}

uint64_t sub_24057EE30(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_24057EE68(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_24057EE78()
{
  return swift_release();
}

uint64_t sub_24057EE80(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void sub_24057EEC4(uint64_t a1, void *a2)
{
  id v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_24057EF30()
{
  uint64_t v0 = sub_240580AC0();
  sub_2405809DC(v0, qword_26AFC6630);
  sub_24057EE30(v0, (uint64_t)qword_26AFC6630);
  return sub_240580AB0();
}

id sub_24057F080(void *a1, uint64_t a2, const char *a3)
{
  if (a1)
  {
    id v6 = a1;
    if (qword_26AFC6628 != -1) {
      swift_once();
    }
    uint64_t v7 = sub_240580AC0();
    sub_24057EE30(v7, (uint64_t)qword_26AFC6630);
    id v8 = a1;
    id v9 = a1;
    v10 = sub_240580AA0();
    os_log_type_t v11 = sub_240580B20();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      uint64_t v13 = swift_slowAlloc();
      uint64_t v18 = v13;
      *(_DWORD *)v12 = 136446210;
      swift_getErrorValue();
      uint64_t v14 = sub_240580BB0();
      uint64_t v17 = sub_24057F2E0(v14, v15, &v18);
      sub_240580B30();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_24057D000, v10, v11, a3, v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2455ECBD0](v13, -1, -1);
      MEMORY[0x2455ECBD0](v12, -1, -1);
    }
    else
    {
    }
  }
  return objc_msgSend(*(id *)(a2 + OBJC_IVAR____TtC32CoreIDVAccountNotificationPlugin27DIPSystemNotificationClient_serverConnection), sel_invalidate, v17);
}

id sub_24057F288()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IDVACDAccountNotificationPlugin();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for IDVACDAccountNotificationPlugin()
{
  return self;
}

uint64_t sub_24057F2E0(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_24057F3B4(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_24058097C((uint64_t)v12, *a3);
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
      sub_24058097C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_24058092C((uint64_t)v12);
  return v7;
}

uint64_t sub_24057F3B4(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_240580B40();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_24057F570(a5, a6);
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
  uint64_t v8 = sub_240580B70();
  if (!v8)
  {
    sub_240580B80();
    __break(1u);
LABEL_17:
    uint64_t result = sub_240580B90();
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

uint64_t sub_24057F570(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = sub_24057F608(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_24057F7E8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_24057F7E8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_24057F608(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_24057F780(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_240580B60();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return (uint64_t)v4;
      }
      sub_240580B80();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_240580AF0();
      if (!v2) {
        return MEMORY[0x263F8EE78];
      }
    }
    sub_240580B90();
    __break(1u);
LABEL_14:
    uint64_t result = sub_240580B80();
    __break(1u);
  }
  else
  {
    return MEMORY[0x263F8EE78];
  }
  return result;
}

void *sub_24057F780(uint64_t a1, uint64_t a2)
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
  sub_24057EE80(&qword_268C888A8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_24057F7E8(char a1, int64_t a2, char a3, char *a4)
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
    sub_24057EE80(&qword_268C888A8);
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
  uint64_t result = sub_240580B90();
  __break(1u);
  return result;
}

void sub_24057F938(void *a1)
{
  uint64_t v2 = sub_240580AC0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  size_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26AFC6628 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_24057EE30(v2, (uint64_t)qword_26AFC6630);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  id v7 = a1;
  int64_t v8 = sub_240580AA0();
  os_log_type_t v9 = sub_240580B00();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    aBlock[0] = v11;
    *(_DWORD *)uint64_t v10 = 136446210;
    id v12 = objc_msgSend(v7, sel_accountType);
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v25 = v11;
      id v26 = v7;
      id v14 = objc_msgSend(v12, sel_identifier);

      if (v14)
      {
        uint64_t v15 = sub_240580AE0();
        unint64_t v17 = v16;

        uint64_t v27 = sub_24057F2E0(v15, v17, aBlock);
        sub_240580B30();
        id v7 = v26;

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24057D000, v8, v9, "User has logged into their Apple account of type: %{public}s", v10, 0xCu);
        uint64_t v18 = v25;
        swift_arrayDestroy();
        MEMORY[0x2455ECBD0](v18, -1, -1);
        MEMORY[0x2455ECBD0](v10, -1, -1);

        goto LABEL_8;
      }
    }
    else
    {

      __break(1u);
    }

    __break(1u);
    return;
  }

LABEL_8:
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v19 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DIPSystemNotificationClient()), sel_init);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v19;
  v21 = *(void **)&v19[OBJC_IVAR____TtC32CoreIDVAccountNotificationPlugin27DIPSystemNotificationClient_remoteObjectProxy];
  if (v21)
  {
    aBlock[4] = (uint64_t)sub_2405808F0;
    aBlock[5] = v20;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_24057EEC4;
    aBlock[3] = (uint64_t)&unk_26F4A7950;
    v22 = _Block_copy(aBlock);
    v23 = v19;
    swift_unknownObjectRetain();
    swift_retain();
    swift_release();
    objc_msgSend(v21, sel_appleAccountCreatedWithAccount_completion_, v7, v22);
    _Block_release(v22);

    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
  }
}

void sub_24057FD04(void *a1)
{
  uint64_t v2 = sub_240580AC0();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388]();
  size_t v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26AFC6628 != -1) {
    swift_once();
  }
  uint64_t v6 = sub_24057EE30(v2, (uint64_t)qword_26AFC6630);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  id v7 = a1;
  int64_t v8 = sub_240580AA0();
  os_log_type_t v9 = sub_240580B00();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = (uint8_t *)swift_slowAlloc();
    uint64_t v11 = swift_slowAlloc();
    aBlock[0] = v11;
    *(_DWORD *)uint64_t v10 = 136446210;
    id v12 = objc_msgSend(v7, sel_accountType);
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v25 = v11;
      id v26 = v7;
      id v14 = objc_msgSend(v12, sel_identifier);

      if (v14)
      {
        uint64_t v15 = sub_240580AE0();
        unint64_t v17 = v16;

        uint64_t v27 = sub_24057F2E0(v15, v17, aBlock);
        sub_240580B30();
        id v7 = v26;

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24057D000, v8, v9, "User has logged out of their Apple account of type: %{public}s", v10, 0xCu);
        uint64_t v18 = v25;
        swift_arrayDestroy();
        MEMORY[0x2455ECBD0](v18, -1, -1);
        MEMORY[0x2455ECBD0](v10, -1, -1);

        goto LABEL_8;
      }
    }
    else
    {

      __break(1u);
    }

    __break(1u);
    return;
  }

LABEL_8:
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v19 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DIPSystemNotificationClient()), sel_init);
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v19;
  v21 = *(void **)&v19[OBJC_IVAR____TtC32CoreIDVAccountNotificationPlugin27DIPSystemNotificationClient_remoteObjectProxy];
  if (v21)
  {
    aBlock[4] = (uint64_t)sub_240580A40;
    aBlock[5] = v20;
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 1107296256;
    aBlock[2] = (uint64_t)sub_24057EEC4;
    aBlock[3] = (uint64_t)&unk_26F4A79A0;
    v22 = _Block_copy(aBlock);
    v23 = v19;
    swift_unknownObjectRetain();
    swift_retain();
    swift_release();
    objc_msgSend(v21, sel_appleAccountDeletedWithAccount_completion_, v7, v22);
    _Block_release(v22);

    swift_release();
    swift_unknownObjectRelease();
  }
  else
  {
    swift_release();
  }
}

void sub_2405800D0(void *a1, void *a2)
{
  uint64_t v4 = sub_240580AC0();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388]();
  id v7 = (char *)&v70 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_26AFC6628 != -1) {
    swift_once();
  }
  uint64_t v8 = sub_24057EE30(v4, (uint64_t)qword_26AFC6630);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v8, v4);
  id v9 = a1;
  uint64_t v10 = sub_240580AA0();
  os_log_type_t v11 = sub_240580B10();
  if (os_log_type_enabled(v10, v11))
  {
    v71 = a2;
    id v12 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    aBlock[0] = v13;
    *(_DWORD *)id v12 = 136446210;
    id v72 = v9;
    id v14 = objc_msgSend(v9, sel_accountType);
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v70 = v13;
      id v16 = objc_msgSend(v14, sel_identifier);

      if (v16)
      {
        uint64_t v17 = sub_240580AE0();
        unint64_t v19 = v18;

        uint64_t v73 = sub_24057F2E0(v17, v19, aBlock);
        sub_240580B30();
        id v9 = v72;

        swift_bridgeObjectRelease();
        _os_log_impl(&dword_24057D000, v10, v11, "received modification notification Apple account of type: %{public}s", v12, 0xCu);
        uint64_t v20 = v70;
        swift_arrayDestroy();
        MEMORY[0x2455ECBD0](v20, -1, -1);
        MEMORY[0x2455ECBD0](v12, -1, -1);

        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
        a2 = v71;
        goto LABEL_8;
      }
    }
    else
    {

      __break(1u);
    }

    __break(1u);
    return;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
LABEL_8:
  id v21 = objc_msgSend(v9, sel_aa_firstName);
  if (v21)
  {
    v22 = v21;
    uint64_t v23 = sub_240580AE0();
    uint64_t v25 = v24;
  }
  else
  {
    uint64_t v23 = 0;
    uint64_t v25 = 0;
  }
  id v26 = objc_msgSend(a2, sel_aa_firstName);
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = sub_240580AE0();
    uint64_t v30 = v29;

    if (v25)
    {
      if (!v30) {
        goto LABEL_60;
      }
      if (v23 == v28 && v25 == v30)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        char v31 = sub_240580BA0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v31 & 1) == 0) {
          goto LABEL_61;
        }
      }
    }
    else if (v30)
    {
      goto LABEL_60;
    }
  }
  else if (v25)
  {
    goto LABEL_60;
  }
  id v32 = objc_msgSend(v9, sel_aa_middleName);
  if (v32)
  {
    v33 = v32;
    uint64_t v34 = sub_240580AE0();
    uint64_t v36 = v35;
  }
  else
  {
    uint64_t v34 = 0;
    uint64_t v36 = 0;
  }
  id v37 = objc_msgSend(a2, sel_aa_middleName);
  if (v37)
  {
    v38 = v37;
    uint64_t v39 = sub_240580AE0();
    uint64_t v41 = v40;

    if (v36)
    {
      if (!v41) {
        goto LABEL_60;
      }
      if (v34 == v39 && v36 == v41)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        char v42 = sub_240580BA0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v42 & 1) == 0) {
          goto LABEL_61;
        }
      }
    }
    else if (v41)
    {
      goto LABEL_60;
    }
  }
  else if (v36)
  {
    goto LABEL_60;
  }
  id v43 = objc_msgSend(v9, sel_aa_lastName);
  if (v43)
  {
    v44 = v43;
    uint64_t v45 = sub_240580AE0();
    uint64_t v47 = v46;
  }
  else
  {
    uint64_t v45 = 0;
    uint64_t v47 = 0;
  }
  id v48 = objc_msgSend(a2, sel_aa_lastName);
  if (v48)
  {
    v49 = v48;
    uint64_t v50 = sub_240580AE0();
    uint64_t v52 = v51;

    if (v47)
    {
      if (!v52) {
        goto LABEL_60;
      }
      if (v45 == v50 && v47 == v52)
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {
        char v53 = sub_240580BA0();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if ((v53 & 1) == 0) {
          goto LABEL_61;
        }
      }
    }
    else if (v52)
    {
      goto LABEL_60;
    }
  }
  else if (v47)
  {
    goto LABEL_60;
  }
  id v54 = objc_msgSend(v9, sel_aa_primaryEmail);
  if (v54)
  {
    v55 = v54;
    uint64_t v56 = sub_240580AE0();
    uint64_t v58 = v57;
  }
  else
  {
    uint64_t v56 = 0;
    uint64_t v58 = 0;
  }
  id v59 = objc_msgSend(a2, sel_aa_primaryEmail);
  if (!v59)
  {
    if (!v58) {
      return;
    }
    goto LABEL_60;
  }
  v60 = v59;
  uint64_t v61 = sub_240580AE0();
  uint64_t v63 = v62;

  if (!v58)
  {
    if (!v63) {
      return;
    }
    goto LABEL_60;
  }
  if (!v63)
  {
LABEL_60:
    swift_bridgeObjectRelease();
LABEL_61:
    v64 = (char *)objc_msgSend(objc_allocWithZone((Class)type metadata accessor for DIPSystemNotificationClient()), sel_init);
    uint64_t v65 = swift_allocObject();
    *(void *)(v65 + 16) = v64;
    v66 = *(void **)&v64[OBJC_IVAR____TtC32CoreIDVAccountNotificationPlugin27DIPSystemNotificationClient_remoteObjectProxy];
    if (v66)
    {
      aBlock[4] = (uint64_t)sub_240580A64;
      aBlock[5] = v65;
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 1107296256;
      aBlock[2] = (uint64_t)sub_24057EEC4;
      aBlock[3] = (uint64_t)&unk_26F4A79F0;
      v67 = _Block_copy(aBlock);
      v68 = v64;
      swift_unknownObjectRetain();
      swift_retain();
      swift_release();
      objc_msgSend(v66, sel_appleAccountModifiedWithAccount_oldAccount_completion_, v9, a2, v67);
      _Block_release(v67);

      swift_release();
      swift_unknownObjectRelease();
    }
    else
    {
      swift_release();
    }
    return;
  }
  if (v56 == v61 && v58 == v63)
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return;
  }
  char v69 = sub_240580BA0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v69 & 1) == 0) {
    goto LABEL_61;
  }
}

uint64_t sub_240580828(void *a1, int a2, void *a3)
{
  if (a2 == 3)
  {
    if (a3)
    {
      id v4 = a3;
      sub_24057FD04(v4);
      goto LABEL_11;
    }
  }
  else if (a2 == 2)
  {
    if (a1 && a3)
    {
      id v5 = a1;
      id v4 = a3;
      sub_2405800D0(v5, v4);

      goto LABEL_11;
    }
  }
  else if (a2 == 1 && a1)
  {
    id v4 = a1;
    sub_24057F938(v4);
LABEL_11:
  }
  return 0;
}

uint64_t sub_2405808B8()
{
  return MEMORY[0x270FA0238](v0, 24, 7);
}

id sub_2405808F0(void *a1)
{
  return sub_24057F080(a1, *(void *)(v1 + 16), "Received error from account created XPC: %{public}s");
}

uint64_t sub_240580914(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_240580924()
{
  return swift_release();
}

uint64_t sub_24058092C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_24058097C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *sub_2405809DC(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

id sub_240580A40(void *a1)
{
  return sub_24057F080(a1, *(void *)(v1 + 16), "Received error from account deleted XPC: %{public}s");
}

id sub_240580A64(void *a1)
{
  return sub_24057F080(a1, *(void *)(v1 + 16), "Received error from account modified XPC: %{public}s");
}

uint64_t sub_240580AA0()
{
  return MEMORY[0x270FA2E00]();
}

uint64_t sub_240580AB0()
{
  return MEMORY[0x270FA2E08]();
}

uint64_t sub_240580AC0()
{
  return MEMORY[0x270FA2E20]();
}

uint64_t sub_240580AD0()
{
  return MEMORY[0x270EF19B0]();
}

uint64_t sub_240580AE0()
{
  return MEMORY[0x270EF19E8]();
}

uint64_t sub_240580AF0()
{
  return MEMORY[0x270F9D7E0]();
}

uint64_t sub_240580B00()
{
  return MEMORY[0x270FA2E40]();
}

uint64_t sub_240580B10()
{
  return MEMORY[0x270FA2E58]();
}

uint64_t sub_240580B20()
{
  return MEMORY[0x270FA2E60]();
}

uint64_t sub_240580B30()
{
  return MEMORY[0x270F9E530]();
}

uint64_t sub_240580B40()
{
  return MEMORY[0x270F9E560]();
}

uint64_t sub_240580B50()
{
  return MEMORY[0x270F9E670]();
}

uint64_t sub_240580B60()
{
  return MEMORY[0x270F9E9B0]();
}

uint64_t sub_240580B70()
{
  return MEMORY[0x270F9EB28]();
}

uint64_t sub_240580B80()
{
  return MEMORY[0x270F9EFE8]();
}

uint64_t sub_240580B90()
{
  return MEMORY[0x270F9F0C0]();
}

uint64_t sub_240580BA0()
{
  return MEMORY[0x270F9F7D0]();
}

uint64_t sub_240580BB0()
{
  return MEMORY[0x270EF2680]();
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

uint64_t swift_allocObject()
{
  return MEMORY[0x270FA0198]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x270FA01C0]();
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

uint64_t swift_getObjectType()
{
  return MEMORY[0x270FA03E8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x270FA0440]();
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