void sub_486C()
{
  id v0;
  id v1;
  NSString v2;
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  uint64_t v7;

  v0 = [objc_allocWithZone((Class)HKHealthStore) init];
  v1 = objc_allocWithZone((Class)HKSPSleepStore);
  v2 = sub_6F00();
  v3 = [v1 initWithIdentifier:v2 healthStore:v0];

  v4 = sub_6DD0();
  v5 = v0;
  v6 = v3;
  v7 = sub_6DC0();
  qword_C7C0 = v4;
  unk_C7C8 = &protocol witness table for SleepOnboardingManager;

  qword_C7A8 = v7;
}

id sub_4950()
{
  uint64_t v1 = OBJC_IVAR____TtC20NanoSleepBridgeSetup30NanoSleepBridgeSetupController____lazy_storage___onboardingViewController;
  v2 = *(void **)&v0[OBJC_IVAR____TtC20NanoSleepBridgeSetup30NanoSleepBridgeSetupController____lazy_storage___onboardingViewController];
  if (v2)
  {
    id v3 = *(id *)&v0[OBJC_IVAR____TtC20NanoSleepBridgeSetup30NanoSleepBridgeSetupController____lazy_storage___onboardingViewController];
  }
  else
  {
    swift_getObjectType();
    id v4 = sub_49C0(v0);
    v5 = *(void **)&v0[v1];
    *(void *)&v0[v1] = v4;
    id v3 = v4;

    v2 = 0;
  }
  id v6 = v2;
  return v3;
}

id sub_49C0(void *a1)
{
  uint64_t v2 = sub_6E30();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_6EC0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_6EA0();
  v10 = sub_6EB0();
  os_log_type_t v11 = sub_6F50();
  if (os_log_type_enabled(v10, v11))
  {
    uint64_t v23 = v6;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v24 = v2;
    v13 = (uint8_t *)v12;
    uint64_t v27 = swift_slowAlloc();
    v25 = a1;
    *(_DWORD *)v13 = 136446210;
    v22 = v13 + 4;
    uint64_t v14 = sub_7020();
    uint64_t v26 = sub_6064(v14, v15, &v27);
    a1 = v25;
    sub_6FA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v10, v11, "[%{public}s] initializing onboarding view controller", v13, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v2 = v24;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v23);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for SleepOnboardingUserInfo.SleepScheduleType.expected(_:), v2);
  sub_67D4((uint64_t)v5);
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id v16 = objc_allocWithZone((Class)sub_6E90());
  swift_retain();
  v17 = (void *)sub_6E80();
  sub_6CF0(&qword_C6B0, v18, (void (*)(uint64_t))type metadata accessor for NanoSleepBridgeSetupController);
  id v19 = v17;
  id v20 = a1;
  sub_6E60();
  swift_release();

  return v19;
}

id sub_4D18()
{
  uint64_t v1 = v0;
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = sub_6EC0();
  uint64_t v26 = *(void *)(v3 - 8);
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v27 = (char *)v25 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v25 - v6;
  *(void *)&v1[OBJC_IVAR____TtC20NanoSleepBridgeSetup30NanoSleepBridgeSetupController____lazy_storage___onboardingViewController] = 0;
  uint64_t v8 = v1;
  sub_6EA0();
  v9 = sub_6EB0();
  os_log_type_t v10 = sub_6F50();
  BOOL v11 = os_log_type_enabled(v9, v10);
  v25[1] = ObjectType;
  if (v11)
  {
    v25[0] = v3;
    uint64_t v12 = (uint8_t *)swift_slowAlloc();
    v29[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136446210;
    uint64_t v13 = sub_7020();
    uint64_t v28 = sub_6064(v13, v14, v29);
    sub_6FA0();
    uint64_t v3 = v25[0];
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v9, v10, "[%{public}s] init...", v12, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  unint64_t v15 = *(void (**)(char *, uint64_t))(v26 + 8);
  v15(v7, v3);
  v8[OBJC_IVAR____TtC20NanoSleepBridgeSetup30NanoSleepBridgeSetupController_isLoadingSuggestedSchedule] = 1;

  id v16 = (objc_class *)type metadata accessor for NanoSleepBridgeSetupController();
  v30.receiver = v8;
  v30.super_class = v16;
  id v17 = objc_msgSendSuper2(&v30, "init");
  sub_6EA0();
  uint64_t v18 = sub_6EB0();
  os_log_type_t v19 = sub_6F50();
  if (os_log_type_enabled(v18, v19))
  {
    id v20 = (uint8_t *)swift_slowAlloc();
    v29[0] = swift_slowAlloc();
    *(_DWORD *)id v20 = 136446210;
    uint64_t v21 = sub_7020();
    uint64_t v28 = sub_6064(v21, v22, v29);
    sub_6FA0();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v18, v19, "[%{public}s] looking up suggested schedule...", v20, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  v15(v27, v3);
  if (qword_C7A0 != -1) {
    swift_once();
  }
  sub_6B54((uint64_t)&qword_C7A8, (uint64_t)v29);
  sub_6020(v29, v29[3]);
  *(void *)(swift_allocObject() + 16) = v17;
  id v23 = v17;
  sub_6E10();
  swift_release();

  sub_6BF8((uint64_t)v29);
  return v23;
}

uint64_t sub_5160(void *a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_6ED0();
  uint64_t v19 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_6EF0();
  uint64_t v9 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  BOOL v11 = (char *)&v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_6C48(0, &qword_C6B8);
  uint64_t v12 = (void *)sub_6F60();
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a1;
  v13[4] = a2;
  aBlock[4] = sub_6CCC;
  aBlock[5] = v13;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_55DC;
  aBlock[3] = &unk_8538;
  unint64_t v14 = _Block_copy(aBlock);
  swift_unknownObjectRetain();
  id v15 = a3;
  id v16 = a1;
  swift_release();
  sub_6EE0();
  aBlock[0] = &_swiftEmptyArrayStorage;
  sub_6CF0(&qword_C720, 255, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_6D38();
  sub_6CF0((unint64_t *)&unk_C730, 255, (void (*)(uint64_t))sub_6D38);
  sub_6FC0();
  sub_6F70();
  _Block_release(v14);

  (*(void (**)(char *, uint64_t))(v19 + 8))(v8, v6);
  return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v11, v18);
}

uint64_t sub_546C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6 = sub_6E30();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v14 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v14 - v11;
  *(unsigned char *)(a1 + OBJC_IVAR____TtC20NanoSleepBridgeSetup30NanoSleepBridgeSetupController_isLoadingSuggestedSchedule) = 0;
  if (a3)
  {
    swift_getObjectType();
    sub_6F80();
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v12, v10, v6);
  }
  else
  {
    (*(void (**)(char *, void, uint64_t))(v7 + 104))((char *)&v14 - v11, enum case for SleepOnboardingUserInfo.SleepScheduleType.none(_:), v6);
  }
  sub_578C(a2, (uint64_t)v12);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v12, v6);
}

uint64_t sub_55DC(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_5704()
{
  return [v0 controllerNeedsToRun] ^ 1;
}

id sub_578C(void *a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_getObjectType();
  uint64_t v6 = sub_6EC0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_6EA0();
  id v10 = a1;
  uint64_t v11 = sub_6EB0();
  os_log_type_t v12 = sub_6F50();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v26 = (uint64_t)a1;
    uint64_t v14 = v13;
    uint64_t v15 = swift_slowAlloc();
    uint64_t v24 = v6;
    uint64_t v28 = v15;
    *(_DWORD *)uint64_t v14 = 136446466;
    uint64_t v25 = a2;
    uint64_t v16 = sub_7020();
    uint64_t v27 = sub_6064(v16, v17, &v28);
    sub_6FA0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2082;
    uint64_t v27 = v26;
    sub_676C();
    id v18 = v10;
    uint64_t v19 = sub_6F10();
    uint64_t v27 = sub_6064(v19, v20, &v28);
    sub_6FA0();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v11, v12, "[%{public}s] loaded suggested schedule: %{public}s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v24);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  id v21 = sub_4950();
  sub_6E70();

  id result = [v3 delegate];
  if (result)
  {
    [result buddyControllerReleaseHold:v3];
    return (id)swift_unknownObjectRelease();
  }
  return result;
}

id sub_5A6C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for NanoSleepBridgeSetupController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

id sub_5AB0()
{
  uint64_t v1 = v0;
  swift_getObjectType();
  uint64_t v2 = sub_6EC0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_6EA0();
  uint64_t v6 = sub_6EB0();
  os_log_type_t v7 = sub_6F40();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = swift_slowAlloc();
    uint64_t v14 = v1;
    uint64_t v9 = v8;
    uint64_t v16 = swift_slowAlloc();
    *(_DWORD *)uint64_t v9 = 136446466;
    uint64_t v10 = sub_7020();
    uint64_t v15 = sub_6064(v10, v11, &v16);
    sub_6FA0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2082;
    uint64_t v15 = sub_6064(0xD000000000000016, 0x80000000000077C0, &v16);
    sub_6FA0();
    _os_log_impl(&dword_0, v6, v7, "[%{public}s] %{public}s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v1 = v14;
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  id result = [v1 delegate];
  if (result)
  {
    [result buddyControllerDone:v1];
    return (id)swift_unknownObjectRelease();
  }
  return result;
}

id sub_5D14(uint64_t a1)
{
  uint64_t v2 = v1;
  swift_getObjectType();
  uint64_t v4 = sub_6EC0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  os_log_type_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_6EA0();
  uint64_t v8 = sub_6EB0();
  os_log_type_t v9 = sub_6F40();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v10 = swift_slowAlloc();
    unint64_t v17 = v2;
    uint64_t v11 = v10;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v16 = a1;
    uint64_t v19 = v12;
    *(_DWORD *)uint64_t v11 = 136446466;
    uint64_t v13 = sub_7020();
    uint64_t v18 = sub_6064(v13, v14, &v19);
    sub_6FA0();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2082;
    uint64_t v18 = sub_6064(0xD00000000000001CLL, 0x8000000000007550, &v19);
    sub_6FA0();
    _os_log_impl(&dword_0, v8, v9, "[%{public}s] %{public}s", (uint8_t *)v11, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v2 = v17;
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  if (qword_C7A0 != -1) {
    swift_once();
  }
  sub_6020(&qword_C7A8, qword_C7C0);
  sub_6DE0();
  id result = [v2 delegate];
  if (result)
  {
    [result buddyControllerDone:v2];
    return (id)swift_unknownObjectRelease();
  }
  return result;
}

id sub_5FE4(id a1, SEL a2)
{
  return 0;
}

uint64_t SleepOnboardingSetupViewController.miniFlowDelegate.getter()
{
  return 0;
}

uint64_t type metadata accessor for NanoSleepBridgeSetupController()
{
  return self;
}

void *sub_6020(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_6064(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_6138(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_66B4((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    uint64_t ObjectType = &type metadata for _StringGuts;
    v12[0] = a1;
    v12[1] = a2;
    uint64_t v10 = *a3;
    if (*a3)
    {
      sub_66B4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_6BF8((uint64_t)v12);
  return v7;
}

uint64_t sub_6138(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_6FB0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_62F4(a5, a6);
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
  uint64_t v8 = sub_6FE0();
  if (!v8)
  {
    sub_6FF0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_7000();
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

uint64_t sub_62F4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_638C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_6568(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_6568(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_638C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_6504(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_6FD0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_6FF0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_6F20();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_7000();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_6FF0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_6504(uint64_t a1, uint64_t a2)
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
  sub_6710();
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_6568(char a1, int64_t a2, char a3, char *a4)
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
    sub_6710();
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
  uint64_t result = sub_7000();
  __break(1u);
  return result;
}

uint64_t sub_66B4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_6710()
{
  if (!qword_C698)
  {
    unint64_t v0 = sub_7010();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_C698);
    }
  }
}

void sub_676C()
{
  if (!qword_C6A0)
  {
    sub_6C48(255, &qword_C6A8);
    unint64_t v0 = sub_6F90();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_C6A0);
    }
  }
}

uint64_t sub_67D4(uint64_t a1)
{
  uint64_t v21 = a1;
  uint64_t v20 = sub_6E30();
  uint64_t v18 = *(void *)(v20 - 8);
  ((void (*)(void))__chkstk_darwin)();
  unint64_t v22 = (char *)&v16 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_6D90();
  uint64_t v2 = *(void *)(v17 - 8);
  ((void (*)(void))__chkstk_darwin)();
  unint64_t v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_6DB0();
  uint64_t v5 = *(void *)(v19 - 8);
  uint64_t v6 = ((uint64_t (*)(void))__chkstk_darwin)();
  int64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v10 = (char *)&v16 - v9;
  [objc_allocWithZone((Class)HKSPProvenanceInfo) initWithSource:HKSPProvenanceSourceSleepCompanionSetupFlow presentation:HKSPProvenancePresentationUnknown];
  if (qword_C7A0 != -1) {
    swift_once();
  }
  sub_6020(&qword_C7A8, qword_C7C0);
  char v11 = sub_6E20();
  uint64_t v12 = (unsigned int *)&enum case for SleepOnboardingContext.EntryPoint.sleepTracking(_:);
  if ((v11 & 1) == 0) {
    uint64_t v12 = (unsigned int *)&enum case for SleepOnboardingContext.EntryPoint.sleepCoaching(_:);
  }
  (*(void (**)(char *, void, uint64_t))(v2 + 104))(v4, *v12, v17);
  sub_6DA0();
  sub_6B54((uint64_t)&qword_C7A8, (uint64_t)v23);
  uint64_t v13 = v19;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v19);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v22, v21, v20);
  sub_6020(&qword_C7A8, qword_C7C0);
  sub_6E00();
  sub_6E50();
  swift_allocObject();
  uint64_t v14 = sub_6E40();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v13);
  return v14;
}

uint64_t sub_6B54(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_6BB8()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_6BF0(void *a1, uint64_t a2)
{
  return sub_5160(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_6BF8(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_6C48(uint64_t a1, unint64_t *a2)
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

uint64_t sub_6C84()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_6CCC()
{
  return sub_546C(*(void *)(v0 + 16), *(void **)(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_6CD8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_6CE8()
{
  return swift_release();
}

uint64_t sub_6CF0(unint64_t *a1, uint64_t a2, void (*a3)(uint64_t))
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

void sub_6D38()
{
  if (!qword_C728)
  {
    sub_6ED0();
    unint64_t v0 = sub_6F30();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_C728);
    }
  }
}

uint64_t sub_6D90()
{
  return type metadata accessor for SleepOnboardingContext.EntryPoint();
}

uint64_t sub_6DA0()
{
  return SleepOnboardingContext.init(provenanceInfo:entryPoint:presentationStyle:)();
}

uint64_t sub_6DB0()
{
  return type metadata accessor for SleepOnboardingContext();
}

uint64_t sub_6DC0()
{
  return SleepOnboardingManager.__allocating_init(sleepStore:healthStore:)();
}

uint64_t sub_6DD0()
{
  return type metadata accessor for SleepOnboardingManager();
}

uint64_t sub_6DE0()
{
  return dispatch thunk of SleepOnboardingManaging.saveHasCompletedOnboarding(with:)();
}

uint64_t sub_6DF0()
{
  return dispatch thunk of SleepOnboardingManaging.isSleepTrackingOnboardableOnPairedWatch.getter();
}

uint64_t sub_6E00()
{
  return dispatch thunk of SleepOnboardingManaging.currentSleepSettings()();
}

uint64_t sub_6E10()
{
  return dispatch thunk of SleepOnboardingManaging.suggestedSleepSchedule(with:)();
}

uint64_t sub_6E20()
{
  return dispatch thunk of SleepOnboardingManaging.hasOnboardedFeature(with:)();
}

uint64_t sub_6E30()
{
  return type metadata accessor for SleepOnboardingUserInfo.SleepScheduleType();
}

uint64_t sub_6E40()
{
  return SleepOnboardingUserInfo.init(onboardingManager:onboardingContext:sleepSchedule:sleepScheduleType:sleepSettings:)();
}

uint64_t sub_6E50()
{
  return type metadata accessor for SleepOnboardingUserInfo();
}

uint64_t sub_6E60()
{
  return dispatch thunk of SleepOnboardingFlowController.delegate.setter();
}

uint64_t sub_6E70()
{
  return dispatch thunk of SleepOnboardingSetupViewController.update(with:type:)();
}

uint64_t sub_6E80()
{
  return SleepOnboardingSetupViewController.init(userInfo:presentationStyle:)();
}

uint64_t sub_6E90()
{
  return type metadata accessor for SleepOnboardingSetupViewController();
}

uint64_t sub_6EA0()
{
  return static Logger.bridgeSetup.getter();
}

uint64_t sub_6EB0()
{
  return Logger.logObject.getter();
}

uint64_t sub_6EC0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_6ED0()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_6EE0()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_6EF0()
{
  return type metadata accessor for DispatchQoS();
}

NSString sub_6F00()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_6F10()
{
  return String.init<A>(describing:)();
}

Swift::Int sub_6F20()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_6F30()
{
  return type metadata accessor for Array();
}

uint64_t sub_6F40()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_6F50()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_6F60()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_6F70()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_6F80()
{
  return HKSPSuggestionProvider.sleepScheduleType.getter();
}

uint64_t sub_6F90()
{
  return type metadata accessor for Optional();
}

uint64_t sub_6FA0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_6FB0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_6FC0()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_6FD0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_6FE0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_6FF0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_7000()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_7010()
{
  return type metadata accessor for _ContiguousArrayStorage();
}

uint64_t sub_7020()
{
  return _typeName(_:qualified:)();
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

id objc_retain(id a1)
{
  return _objc_retain(a1);
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

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}