void sub_3564(id a1)
{
  AXDeviceRemoteScreenUIServiceObjc *v1;
  void *v2;
  AXDisplayManagerObjcWrapper *v3;
  _TtC27AXWatchRemoteScreenUIServer29AXDeviceRemoteScreenUIService *v4;
  AXDisplayManagerObjcWrapper *v5;
  uint64_t vars8;

  v1 = objc_alloc_init(AXDeviceRemoteScreenUIServiceObjc);
  v2 = (void *)qword_CC18;
  qword_CC18 = (uint64_t)v1;

  v3 = [AXDisplayManagerObjcWrapper alloc];
  v5 = [(AXDisplayManagerObjcWrapper *)v3 initWithService:qword_CC18];
  v4 = [[_TtC27AXWatchRemoteScreenUIServer29AXDeviceRemoteScreenUIService alloc] initWithDisplayManager:v5];
  [(id)qword_CC18 setService:v4];
}

void sub_3810(char a1)
{
  uint64_t v2 = v1;
  uint64_t v3 = v1 + OBJC_IVAR____TtC27AXWatchRemoteScreenUIServer29AXDeviceRemoteScreenUIService_rootViewController;
  if (!*(void *)(v1 + OBJC_IVAR____TtC27AXWatchRemoteScreenUIServer29AXDeviceRemoteScreenUIService_rootViewController))
  {
    sub_6250();
    id v5 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    v6 = *(void **)v3;
    *(void *)uint64_t v3 = v5;
    *(void *)(v3 + 8) = &protocol witness table for AXTwiceCompanionRootViewController;

    v7 = *(void **)v3;
    if (*(void *)v3)
    {
      if (a1)
      {
        swift_getObjectType();
        id v8 = v7;
        sub_6230();
      }
      else
      {
        id v9 = v7;
      }
      v10 = *(void **)(v2 + OBJC_IVAR____TtC27AXWatchRemoteScreenUIServer29AXDeviceRemoteScreenUIService_displayManager);
      v13[4] = sub_396C;
      v13[5] = 0;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 1107296256;
      v13[2] = sub_3ADC;
      v13[3] = &unk_8580;
      v11 = _Block_copy(v13);
      id v12 = v7;
      [v10 addContentViewController:v12 withUserInteractionEnabled:1 completion:v11];
      _Block_release(v11);
    }
  }
}

uint64_t sub_396C(char a1)
{
  uint64_t v2 = sub_62A0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  id v5 = (char *)v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_6260();
  v6 = sub_6290();
  os_log_type_t v7 = sub_6320();
  if (os_log_type_enabled(v6, v7))
  {
    id v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v8 = 67109120;
    v10[3] = a1 & 1;
    sub_6340();
    _os_log_impl(&dword_0, v6, v7, "[TWICE] Did show TWICE UI. result: %{BOOL}d", v8, 8u);
    swift_slowDealloc();
  }

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_3ADC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

void sub_3B84()
{
  uint64_t v1 = *(void **)(v0 + OBJC_IVAR____TtC27AXWatchRemoteScreenUIServer29AXDeviceRemoteScreenUIService_rootViewController);
  if (v1)
  {
    uint64_t v2 = *(void *)(v0
                   + OBJC_IVAR____TtC27AXWatchRemoteScreenUIServer29AXDeviceRemoteScreenUIService_rootViewController
                   + 8);
    swift_getObjectType();
    uint64_t v3 = swift_allocObject();
    swift_unknownObjectWeakInit();
    uint64_t v4 = (void *)swift_allocObject();
    v4[2] = v3;
    v4[3] = v1;
    v4[4] = v2;
    id v5 = v1;
    swift_retain();
    sub_6220();

    swift_release();
    swift_release();
  }
}

void sub_3C84(uint64_t a1, uint64_t a2)
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v4 = (void *)Strong;
    id v5 = objc_retain(*(id *)(Strong
                           + OBJC_IVAR____TtC27AXWatchRemoteScreenUIServer29AXDeviceRemoteScreenUIService_displayManager));

    uint64_t v6 = swift_allocObject();
    swift_beginAccess();
    os_log_type_t v7 = (void *)swift_unknownObjectWeakLoadStrong();
    swift_unknownObjectWeakInit();

    v9[4] = sub_53B8;
    v9[5] = v6;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 1107296256;
    v9[2] = sub_3ADC;
    v9[3] = &unk_85A8;
    id v8 = _Block_copy(v9);
    swift_release();
    [v5 removeContentViewController:a2 withUserInteractionEnabled:0 completion:v8];
    _Block_release(v8);
  }
}

void sub_3DDC(char a1)
{
  uint64_t v2 = sub_62A0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  id v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_6260();
  uint64_t v6 = sub_6290();
  os_log_type_t v7 = sub_6320();
  if (os_log_type_enabled(v6, v7))
  {
    id v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)id v8 = 67109120;
    v12[2] = a1 & 1;
    sub_6340();
    _os_log_impl(&dword_0, v6, v7, "[TWICE] Did hide TWICE UI. result: %{BOOL}d", v8, 8u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  swift_beginAccess();
  uint64_t Strong = (char *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    v10 = &Strong[OBJC_IVAR____TtC27AXWatchRemoteScreenUIServer29AXDeviceRemoteScreenUIService_rootViewController];
    v11 = *(void **)&Strong[OBJC_IVAR____TtC27AXWatchRemoteScreenUIServer29AXDeviceRemoteScreenUIService_rootViewController];
    *(void *)v10 = 0;
    *((void *)v10 + 1) = 0;
  }
}

void sub_3FE0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC27AXWatchRemoteScreenUIServer29AXDeviceRemoteScreenUIService_rootViewController;
  if (!*(void *)(v0 + OBJC_IVAR____TtC27AXWatchRemoteScreenUIServer29AXDeviceRemoteScreenUIService_rootViewController))
  {
    uint64_t v2 = v0;
    sub_6250();
    id v3 = [objc_allocWithZone((Class)swift_getObjCClassFromMetadata()) init];
    uint64_t v4 = *(void **)v1;
    *(void *)uint64_t v1 = v3;
    *(void *)(v1 + 8) = &protocol witness table for AXTwiceCompanionRootViewController;

    id v5 = *(void **)v1;
    if (*(void *)v1)
    {
      swift_getObjectType();
      id v6 = v5;
      sub_6230();
      os_log_type_t v7 = *(void **)(v2 + OBJC_IVAR____TtC27AXWatchRemoteScreenUIServer29AXDeviceRemoteScreenUIService_displayManager);
      _DWORD v10[4] = sub_396C;
      v10[5] = 0;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 1107296256;
      v10[2] = sub_3ADC;
      v10[3] = &unk_85D0;
      id v8 = _Block_copy(v10);
      id v9 = v6;
      [v7 addContentViewController:v9 withUserInteractionEnabled:1 completion:v8];
      _Block_release(v8);
    }
  }
}

unint64_t sub_4174(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v6 = v4;
  uint64_t v42 = a3;
  sub_4BB0(&qword_CBE8);
  uint64_t v10 = ((uint64_t (*)(void))__chkstk_darwin)();
  id v12 = &v36[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v10);
  v45 = &v36[-v13];
  uint64_t v14 = sub_62A0();
  uint64_t v43 = *(void *)(v14 - 8);
  uint64_t v44 = v14;
  __chkstk_darwin(v14);
  v16 = &v36[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (!a1) {
    sub_4730((uint64_t)&_swiftEmptyArrayStorage);
  }
  swift_bridgeObjectRetain();
  sub_6260();
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain();
  v17 = sub_6290();
  os_log_type_t v18 = sub_6330();
  int v19 = v18;
  if (os_log_type_enabled(v17, v18))
  {
    uint64_t v20 = swift_slowAlloc();
    uint64_t v40 = v6;
    uint64_t v21 = v20;
    uint64_t v38 = swift_slowAlloc();
    uint64_t v47 = v38;
    *(_DWORD *)uint64_t v21 = 134218498;
    uint64_t v46 = a2;
    uint64_t v41 = v5;
    sub_6340();
    int v37 = v19;
    *(_WORD *)(v21 + 12) = 2080;
    uint64_t v39 = a2;
    swift_bridgeObjectRetain();
    uint64_t v46 = sub_4C98(v42, a4, &v47);
    sub_6340();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v21 + 22) = 2080;
    uint64_t v42 = v21 + 24;
    swift_bridgeObjectRetain();
    uint64_t v22 = sub_62D0();
    v23 = v12;
    unint64_t v25 = v24;
    swift_bridgeObjectRelease();
    uint64_t v46 = sub_4C98(v22, v25, &v47);
    sub_6340();
    swift_bridgeObjectRelease_n();
    id v12 = v23;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v17, (os_log_type_t)v37, "[TWICE] Server got a message: %ld from client: %s. Payload: %s", (uint8_t *)v21, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v6 = v40;
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();
  }
  (*(void (**)(unsigned char *, uint64_t))(v43 + 8))(v16, v44);
  v26 = v45;
  sub_6270();
  uint64_t v27 = sub_6280();
  uint64_t v28 = *(void *)(v27 - 8);
  if ((*(unsigned int (**)(unsigned char *, uint64_t, uint64_t))(v28 + 48))(v26, 1, v27) != 1)
  {
    sub_5404((uint64_t)v45, (uint64_t)v12, &qword_CBE8);
    int v29 = (*(uint64_t (**)(unsigned char *, uint64_t))(v28 + 88))(v12, v27);
    if (v29 == enum case for AXWatchRemoteScreenAXUIServiceMessageID.startTwiceRemoteScreen(_:))
    {
      sub_3810(0);
    }
    else if (v29 == enum case for AXWatchRemoteScreenAXUIServiceMessageID.stopTwiceRemoteScreen(_:))
    {
      v30 = *(void **)(v6
                     + OBJC_IVAR____TtC27AXWatchRemoteScreenUIServer29AXDeviceRemoteScreenUIService_rootViewController);
      if (v30)
      {
        uint64_t v31 = *(void *)(v6
                        + OBJC_IVAR____TtC27AXWatchRemoteScreenUIServer29AXDeviceRemoteScreenUIService_rootViewController
                        + 8);
        swift_getObjectType();
        uint64_t v32 = swift_allocObject();
        swift_unknownObjectWeakInit();
        v33 = (void *)swift_allocObject();
        v33[2] = v32;
        v33[3] = v30;
        v33[4] = v31;
        id v34 = v30;
        swift_retain();
        sub_6220();

        swift_release();
        swift_release();
      }
    }
    else if (v29 == enum case for AXWatchRemoteScreenAXUIServiceMessageID.restartTwiceRemoteScreen(_:))
    {
      sub_3FE0();
    }
    else if (v29 == enum case for AXWatchRemoteScreenAXUIServiceMessageID.npsTwiceRemoteScreenOn(_:) {
           || v29 == enum case for AXWatchRemoteScreenAXUIServiceMessageID.npsTwiceRemoteScreenOff(_:))
    }
    {
      AXNPSSetWatchRemoteScreenEnabled();
    }
    else
    {
      (*(void (**)(unsigned char *, uint64_t))(v28 + 8))(v12, v27);
    }
  }
  sub_4BF4((uint64_t)v45);
  return sub_4730((uint64_t)&_swiftEmptyArrayStorage);
}

unint64_t sub_4730(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_4BB0(&qword_CBF8);
  uint64_t v2 = sub_63E0();
  id v3 = (void *)v2;
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
    sub_5404(v6, (uint64_t)v15, &qword_CC00);
    unint64_t result = sub_53C0((uint64_t)v15);
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
    unint64_t result = (unint64_t)sub_5468(&v17, (_OWORD *)(v3[7] + 32 * result));
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

id sub_4B08()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for AXDeviceRemoteScreenUIService()
{
  return self;
}

uint64_t sub_4BB0(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_4BF4(uint64_t a1)
{
  uint64_t v2 = sub_4BB0(&qword_CBE8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_4C54()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_4C90()
{
  sub_3C84(*(void *)(v0 + 16), *(void *)(v0 + 24));
}

uint64_t sub_4C98(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_4D6C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_4F78((uint64_t)v12, *a3);
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
      sub_4F78((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_4F28((uint64_t)v12);
  return v7;
}

uint64_t sub_4D6C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_6350();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_4FD4(a5, a6);
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
  uint64_t v8 = sub_63C0();
  if (!v8)
  {
    sub_63D0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_63F0();
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

uint64_t sub_4F28(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_4F78(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_4FD4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_506C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_524C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_524C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_506C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_51E4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_63B0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_63D0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_62F0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_63F0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_63D0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_51E4(uint64_t a1, uint64_t a2)
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
  sub_4BB0(&qword_CBF0);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_524C(char a1, int64_t a2, char a3, char *a4)
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
    sub_4BB0(&qword_CBF0);
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
  BOOL v13 = a4 + 32;
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
  uint64_t result = sub_63F0();
  __break(1u);
  return result;
}

uint64_t sub_53A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_53B0()
{
  return swift_release();
}

void sub_53B8(char a1)
{
}

unint64_t sub_53C0(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_6360(*(void *)(v2 + 40));

  return sub_5478(a1, v4);
}

uint64_t sub_5404(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_4BB0(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

_OWORD *sub_5468(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_5478(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_5540(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_6370();
      sub_559C((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_5540(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_559C(uint64_t a1)
{
  return a1;
}

uint64_t sub_55F4()
{
  swift_release();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_5634(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  Swift::Int v7 = *(void *)(*v2 + 40);
  swift_bridgeObjectRetain();
  Swift::Int v8 = sub_6360(v7);
  uint64_t v9 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v6 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = ~v9;
    while (1)
    {
      sub_5540(*(void *)(v6 + 48) + 40 * v10, (uint64_t)v17);
      char v12 = sub_6370();
      sub_559C((uint64_t)v17);
      if (v12) {
        break;
      }
      unint64_t v10 = (v10 + 1) & v11;
      if (((*(void *)(v6 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        goto LABEL_5;
      }
    }
    swift_bridgeObjectRelease();
    sub_559C(a2);
    sub_5540(*(void *)(*v3 + 48) + 40 * v10, a1);
    return 0;
  }
  else
  {
LABEL_5:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    sub_5540(a2, (uint64_t)v17);
    uint64_t v16 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    sub_5A7C((Swift::Int)v17, v10, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v16;
    swift_bridgeObjectRelease();
    long long v14 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v14;
    *(void *)(a1 + 32) = *(void *)(a2 + 32);
    return 1;
  }
}

uint64_t sub_57B0()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_4BB0(&qword_CC10);
  uint64_t v3 = sub_63A0();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
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
        unint64_t v15 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v16 = v15 | (v12 << 6);
      }
      else
      {
        int64_t v17 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v17 >= v9) {
          goto LABEL_33;
        }
        unint64_t v18 = v6[v17];
        ++v12;
        if (!v18)
        {
          int64_t v12 = v17 + 1;
          if (v17 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v18 = v6[v12];
          if (!v18)
          {
            int64_t v12 = v17 + 2;
            if (v17 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v18 = v6[v12];
            if (!v18)
            {
              int64_t v19 = v17 + 3;
              if (v19 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v28 = 1 << *(unsigned char *)(v2 + 32);
                if (v28 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v28 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  void *v6 = -1 << v28;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v18 = v6[v19];
              if (!v18)
              {
                while (1)
                {
                  int64_t v12 = v19 + 1;
                  if (__OFADD__(v19, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v18 = v6[v12];
                  ++v19;
                  if (v18) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v19;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v18 - 1) & v18;
        unint64_t v16 = __clz(__rbit64(v18)) + (v12 << 6);
      }
      uint64_t v20 = *(void *)(v2 + 48) + 40 * v16;
      long long v29 = *(_OWORD *)v20;
      long long v30 = *(_OWORD *)(v20 + 16);
      uint64_t v31 = *(void *)(v20 + 32);
      uint64_t result = sub_6360(*(void *)(v4 + 40));
      uint64_t v21 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v22 = result & ~v21;
      unint64_t v23 = v22 >> 6;
      if (((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v22) & ~*(void *)(v10 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v24 = 0;
        unint64_t v25 = (unint64_t)(63 - v21) >> 6;
        do
        {
          if (++v23 == v25 && (v24 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v26 = v23 == v25;
          if (v23 == v25) {
            unint64_t v23 = 0;
          }
          v24 |= v26;
          uint64_t v27 = *(void *)(v10 + 8 * v23);
        }
        while (v27 == -1);
        unint64_t v13 = __clz(__rbit64(~v27)) + (v23 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      uint64_t v14 = *(void *)(v4 + 48) + 40 * v13;
      *(_OWORD *)uint64_t v14 = v29;
      *(_OWORD *)(v14 + 16) = v30;
      *(void *)(v14 + 32) = v31;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

Swift::Int sub_5A7C(Swift::Int result, unint64_t a2, char a3)
{
  uint64_t v4 = v3;
  Swift::Int v6 = result;
  unint64_t v7 = *(void *)(*v3 + 16);
  unint64_t v8 = *(void *)(*v3 + 24);
  if (v8 > v7 && (a3 & 1) != 0) {
    goto LABEL_12;
  }
  if (a3)
  {
    sub_57B0();
  }
  else
  {
    if (v8 > v7)
    {
      uint64_t result = (Swift::Int)sub_5BE8();
      goto LABEL_12;
    }
    sub_5DB8();
  }
  uint64_t v9 = *v3;
  uint64_t result = sub_6360(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v9 + 32);
  a2 = result & ~v10;
  if ((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    uint64_t v11 = ~v10;
    do
    {
      sub_5540(*(void *)(v9 + 48) + 40 * a2, (uint64_t)v19);
      char v12 = sub_6370();
      uint64_t result = sub_559C((uint64_t)v19);
      if (v12) {
        goto LABEL_15;
      }
      a2 = (a2 + 1) & v11;
    }
    while (((*(void *)(v9 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) != 0);
  }
LABEL_12:
  uint64_t v13 = *v4;
  *(void *)(*v4 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  uint64_t v14 = *(void *)(v13 + 48) + 40 * a2;
  long long v15 = *(_OWORD *)(v6 + 16);
  *(_OWORD *)uint64_t v14 = *(_OWORD *)v6;
  *(_OWORD *)(v14 + 16) = v15;
  *(void *)(v14 + 32) = *(void *)(v6 + 32);
  uint64_t v16 = *(void *)(v13 + 16);
  BOOL v17 = __OFADD__(v16, 1);
  uint64_t v18 = v16 + 1;
  if (!v17)
  {
    *(void *)(v13 + 16) = v18;
    return result;
  }
  __break(1u);
LABEL_15:
  uint64_t result = sub_6400();
  __break(1u);
  return result;
}

void *sub_5BE8()
{
  uint64_t v1 = v0;
  sub_4BB0(&qword_CC10);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_6390();
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
    int64_t v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      int64_t v9 = v20 + 1;
      if (v20 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v21 = *(void *)(v6 + 8 * v9);
      if (!v21)
      {
        int64_t v9 = v20 + 2;
        if (v20 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v21 = *(void *)(v6 + 8 * v9);
        if (!v21) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v21 - 1) & v21;
    unint64_t v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 40 * v15;
    uint64_t result = (void *)sub_5540(*(void *)(v2 + 48) + 40 * v15, (uint64_t)v23);
    uint64_t v17 = *(void *)(v4 + 48) + v16;
    long long v18 = v23[0];
    long long v19 = v23[1];
    *(void *)(v17 + 32) = v24;
    *(_OWORD *)uint64_t v17 = v18;
    *(_OWORD *)(v17 + 16) = v19;
  }
  int64_t v22 = v20 + 3;
  if (v22 >= v13) {
    goto LABEL_28;
  }
  unint64_t v21 = *(void *)(v6 + 8 * v22);
  if (v21)
  {
    int64_t v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v22 + 1;
    if (__OFADD__(v22, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v21 = *(void *)(v6 + 8 * v9);
    ++v22;
    if (v21) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_5DB8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_4BB0(&qword_CC10);
  uint64_t v3 = sub_63A0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    *uint64_t v1 = v4;
    return result;
  }
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
      unint64_t v17 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v18 = v17 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v19 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v19 >= v9) {
      goto LABEL_33;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v19);
    ++v12;
    if (!v20)
    {
      int64_t v12 = v19 + 1;
      if (v19 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v20 = *(void *)(v6 + 8 * v12);
      if (!v20)
      {
        int64_t v12 = v19 + 2;
        if (v19 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v20 = *(void *)(v6 + 8 * v12);
        if (!v20) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v20 - 1) & v20;
    unint64_t v18 = __clz(__rbit64(v20)) + (v12 << 6);
LABEL_24:
    sub_5540(*(void *)(v2 + 48) + 40 * v18, (uint64_t)v29);
    uint64_t result = sub_6360(*(void *)(v4 + 40));
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v10 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v13 = __clz(__rbit64((-1 << v23) & ~*(void *)(v10 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v25 = 0;
      unint64_t v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v10 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v13 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
    uint64_t v14 = *(void *)(v4 + 48) + 40 * v13;
    long long v15 = v29[0];
    long long v16 = v29[1];
    *(void *)(v14 + 32) = v30;
    *(_OWORD *)uint64_t v14 = v15;
    *(_OWORD *)(v14 + 16) = v16;
    ++*(void *)(v4 + 16);
  }
  int64_t v21 = v19 + 3;
  if (v21 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
  }
  unint64_t v20 = *(void *)(v6 + 8 * v21);
  if (v20)
  {
    int64_t v12 = v21;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v21 + 1;
    if (__OFADD__(v21, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v20 = *(void *)(v6 + 8 * v12);
    ++v21;
    if (v20) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_604C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = sub_6310();
  uint64_t v7 = result;
  if (v2)
  {
    uint64_t v4 = a1 + 32;
    do
    {
      sub_5540(v4, (uint64_t)v5);
      sub_5634((uint64_t)v6, (uint64_t)v5);
      sub_559C((uint64_t)v6);
      v4 += 40;
      --v2;
    }
    while (v2);
    return v7;
  }
  return result;
}

uint64_t sub_60D8()
{
  sub_4BB0(&qword_CC08);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_7780;
  sub_6380();
  sub_6380();
  sub_6380();
  uint64_t v1 = sub_604C(inited);
  swift_setDeallocating();
  swift_arrayDestroy();
  return v1;
}

uint64_t sub_6210()
{
  return _convertErrorToNSError(_:)();
}

uint64_t sub_6220()
{
  return dispatch thunk of AXTwiceRootViewControllerProtocol.prepareToDisappear(completion:)();
}

uint64_t sub_6230()
{
  return dispatch thunk of AXTwiceRootViewControllerProtocol.axuiserverWasRestarted()();
}

uint64_t sub_6240()
{
  return dispatch thunk of AXTwiceRootViewControllerProtocol.connectionWithClientServiceWasInterrupted()();
}

uint64_t sub_6250()
{
  return type metadata accessor for AXTwiceCompanionRootViewController();
}

uint64_t sub_6260()
{
  return AXLogTwiceRemoteScreen.getter();
}

uint64_t sub_6270()
{
  return AXWatchRemoteScreenAXUIServiceMessageID.init(rawValue:)();
}

uint64_t sub_6280()
{
  return type metadata accessor for AXWatchRemoteScreenAXUIServiceMessageID();
}

uint64_t sub_6290()
{
  return Logger.logObject.getter();
}

uint64_t sub_62A0()
{
  return type metadata accessor for Logger();
}

NSDictionary sub_62B0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_62C0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_62D0()
{
  return Dictionary.description.getter();
}

uint64_t sub_62E0()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Int sub_62F0()
{
  return String.UTF8View._foreignCount()();
}

NSSet sub_6300()
{
  return Set._bridgeToObjectiveC()();
}

uint64_t sub_6310()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_6320()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_6330()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_6340()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_6350()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

Swift::Int sub_6360(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_6370()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_6380()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_6390()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_63A0()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_63B0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_63C0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_63D0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_63E0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_63F0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_6400()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t AXLogTwiceRemoteScreen()
{
  return _AXLogTwiceRemoteScreen();
}

uint64_t AXNPSSetWatchRemoteScreenEnabled()
{
  return _AXNPSSetWatchRemoteScreenEnabled();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_destroyWeak(id *location)
{
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
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

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return _swift_unknownObjectWeakDestroy();
}

uint64_t swift_unknownObjectWeakInit()
{
  return _swift_unknownObjectWeakInit();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return _swift_unknownObjectWeakLoadStrong();
}

id objc_msgSend_addContentViewController_withUserInteractionEnabled_forService_context_userInterfaceStyle_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addContentViewController:withUserInteractionEnabled:forService:context:userInterfaceStyle:completion:");
}

id objc_msgSend_clientConnectionWasInterrupted(void *a1, const char *a2, ...)
{
  return _[a1 clientConnectionWasInterrupted];
}

id objc_msgSend_initWithDisplayManager_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDisplayManager:");
}

id objc_msgSend_initWithService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithService:");
}

id objc_msgSend_processMessage_withIdentifier_fromClientWithIdentifier_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processMessage:withIdentifier:fromClientWithIdentifier:error:");
}

id objc_msgSend_removeContentViewController_withUserInteractionEnabled_forService_context_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeContentViewController:withUserInteractionEnabled:forService:context:completion:");
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return _[a1 service];
}

id objc_msgSend_setService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setService:");
}

id objc_msgSend_sharedDisplayManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedDisplayManager];
}