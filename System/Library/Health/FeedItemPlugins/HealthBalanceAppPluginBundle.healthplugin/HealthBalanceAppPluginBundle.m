uint64_t _HealthBalancePluginDelegate.__allocating_init()()
{
  swift_allocObject();
  return _s28HealthBalanceAppPluginBundle01_abD8DelegateCACycfc_0();
}

uint64_t sub_3C70()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for _HealthBalancePluginDelegate()
{
  uint64_t result = qword_C590;
  if (!qword_C590) {
    return swift_getSingletonMetadata();
  }
  return result;
}

id _SleepingSampleChangesAlertTileViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = v3;
  if (a2)
  {
    NSString v6 = sub_6C60();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithNibName:v6 bundle:a3];

  return v7;
}

id _SleepingSampleChangesAlertTileViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a2)
  {
    NSString v7 = sub_6C60();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v7 = 0;
  }
  v10.receiver = v3;
  v10.super_class = ObjectType;
  id v8 = objc_msgSendSuper2(&v10, "initWithNibName:bundle:", v7, a3);

  return v8;
}

id sub_3E10(void *a1, uint64_t a2, NSString a3, void *a4)
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_6C90();
    id v8 = a4;
    a3 = sub_6C60();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = a4;
  }
  v12.receiver = a1;
  v12.super_class = ObjectType;
  id v10 = objc_msgSendSuper2(&v12, "initWithNibName:bundle:", a3, a4);

  return v10;
}

id _SleepingSampleChangesAlertTileViewController.__allocating_init(coder:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id _SleepingSampleChangesAlertTileViewController.init(coder:)(void *a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)swift_getObjectType();
  id v3 = objc_msgSendSuper2(&v5, "initWithCoder:", a1);

  return v3;
}

id sub_3F54(void *a1, uint64_t a2, uint64_t a3)
{
  v5.receiver = a1;
  v5.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v5, "initWithCoder:", a3);
}

id _SleepingSampleChangesAlertTileViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for _SleepingSampleHelpTileViewController()
{
  uint64_t result = qword_C4C0;
  if (!qword_C4C0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_4020()
{
  return swift_initClassMetadata2();
}

uint64_t sub_4060()
{
  return type metadata accessor for _SleepingSampleHelpTileViewController();
}

uint64_t sub_4068(uint64_t a1, uint64_t a2)
{
  return sub_41D4(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_4080(uint64_t a1, id *a2)
{
  uint64_t result = sub_6C70();
  *a2 = 0;
  return result;
}

uint64_t sub_40F8(uint64_t a1, id *a2)
{
  char v3 = sub_6C80();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_4178@<X0>(void *a1@<X8>)
{
  sub_6C90();
  NSString v2 = sub_6C60();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_41BC(uint64_t a1, uint64_t a2)
{
  return sub_41D4(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_41D4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_6C90();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_4218()
{
  sub_6C90();
  sub_6CB0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_426C()
{
  sub_6C90();
  sub_6E00();
  sub_6CB0();
  Swift::Int v0 = sub_6E10();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_42E0()
{
  uint64_t v0 = sub_6C90();
  uint64_t v2 = v1;
  if (v0 == sub_6C90() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_6DF0();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_436C@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_6C60();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_43B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_6C90();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_43E0(uint64_t a1)
{
  uint64_t v2 = sub_456C(&qword_C530);
  uint64_t v3 = sub_456C(&qword_C538);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

void type metadata accessor for OpenURLOptionsKey()
{
  if (!qword_C510)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_C510);
    }
  }
}

uint64_t sub_44D0()
{
  return sub_456C(&qword_C518);
}

uint64_t sub_4504()
{
  return sub_456C(&qword_C520);
}

uint64_t sub_4538()
{
  return sub_456C(&qword_C528);
}

uint64_t sub_456C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for OpenURLOptionsKey();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_45B0(void *a1, uint64_t a2, NSString a3, void *a4)
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    sub_6C90();
    id v8 = a4;
    a3 = sub_6C60();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = a4;
  }
  v12.receiver = a1;
  v12.super_class = ObjectType;
  id v10 = objc_msgSendSuper2(&v12, "initWithNibName:bundle:", a3, a4);

  return v10;
}

id sub_465C(void *a1, uint64_t a2, uint64_t a3)
{
  v5.receiver = a1;
  v5.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v5, "initWithCoder:", a3);
}

uint64_t type metadata accessor for _SleepingSampleChangesAlertTileViewController()
{
  uint64_t result = qword_C540;
  if (!qword_C540) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_46F0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_4730()
{
  return type metadata accessor for _SleepingSampleChangesAlertTileViewController();
}

uint64_t _HealthBalancePluginDelegate.__deallocating_deinit()
{
  uint64_t v0 = _s28HealthBalanceAppPluginBundle01_abD8DelegateCfd_0();

  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_4770()
{
  return type metadata accessor for _HealthBalancePluginDelegate();
}

uint64_t type metadata accessor for _SleepingSampleAnalysisHealthChecklistActionHandler()
{
  uint64_t result = qword_C5E0;
  if (!qword_C5E0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_47C4()
{
  return swift_initClassMetadata2();
}

uint64_t sub_4804(uint64_t a1)
{
  uint64_t v3 = sub_6BD0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin();
  NSString v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_allocWithZone(v1);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  uint64_t v8 = sub_6BE0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return v8;
}

id sub_4904()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _SleepingSampleAnalysisHealthChecklistActionHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_493C()
{
  return type metadata accessor for _SleepingSampleAnalysisHealthChecklistActionHandler();
}

uint64_t _HealthBalanceAppDelegate.open(_:)(uint64_t a1)
{
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v3 = sub_6BC0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin();
  NSString v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_4B48();
  __chkstk_darwin();
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_6D10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  sub_6CF0();
  uint64_t v10 = sub_6CE0();
  unint64_t v11 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  unint64_t v12 = (v5 + v11 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v10;
  *(void *)(v13 + 24) = &protocol witness table for MainActor;
  (*(void (**)(unint64_t, char *, uint64_t))(v4 + 32))(v13 + v11, v6, v3);
  *(void *)(v13 + v12) = ObjectType;
  sub_5344((uint64_t)v8, (uint64_t)&unk_C640, v13);
  return swift_release();
}

void sub_4B48()
{
  if (!qword_C630)
  {
    sub_6D10();
    unint64_t v0 = sub_6D30();
    if (!v1) {
      atomic_store(v0, &qword_C630);
    }
  }
}

uint64_t sub_4BA0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  uint64_t v6 = sub_6BC0();
  v5[7] = v6;
  v5[8] = *(void *)(v6 - 8);
  v5[9] = swift_task_alloc();
  uint64_t v7 = sub_6C40();
  v5[10] = v7;
  v5[11] = *(void *)(v7 - 8);
  v5[12] = swift_task_alloc();
  sub_6CF0();
  v5[13] = sub_6CE0();
  uint64_t v9 = sub_6CD0();
  return _swift_task_switch(sub_4CF0, v9, v8);
}

uint64_t sub_4CF0()
{
  v35 = v0;
  uint64_t v1 = v0;
  uint64_t v3 = v0 + 5;
  uint64_t v2 = v0[5];
  uint64_t v4 = v0[8];
  uint64_t v5 = v3[4];
  uint64_t v6 = v3[2];
  swift_release();
  sub_6C20();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v5, v2, v6);
  uint64_t v7 = sub_6C30();
  os_log_type_t v8 = sub_6D20();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v31 = v1[11];
    uint64_t v9 = v1[9];
    uint64_t v32 = v1[10];
    uint64_t v33 = v1[12];
    uint64_t v10 = v1[7];
    uint64_t v30 = v1[8];
    uint64_t v11 = v1[6];
    uint64_t v12 = swift_slowAlloc();
    uint64_t v34 = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136446466;
    v1[2] = v11;
    swift_getMetatypeMetadata();
    uint64_t v13 = sub_6CA0();
    v1[3] = sub_5EA4(v13, v14, &v34);
    sub_6D40();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 12) = 2082;
    sub_64F4(&qword_C6B0, (void (*)(uint64_t))&type metadata accessor for URL);
    uint64_t v15 = sub_6DD0();
    v1[4] = sub_5EA4(v15, v16, &v34);
    sub_6D40();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v9, v10);
    _os_log_impl(&dword_0, v7, v8, "[%{public}s]: opening url %{public}s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v33, v32);
  }
  else
  {
    uint64_t v18 = v1[11];
    uint64_t v17 = v1[12];
    uint64_t v19 = v1[10];
    (*(void (**)(void, void))(v1[8] + 8))(v1[9], v1[7]);

    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
  }
  v20 = self;
  id v21 = [v20 sharedApplication];
  id v22 = [v21 delegate];

  if (v22)
  {
    if ([v22 respondsToSelector:"application:openURL:options:"])
    {
      id v23 = [v20 sharedApplication];
      sub_522C((uint64_t)&_swiftEmptyArrayStorage);
      sub_6BA0(v24);
      v26 = v25;
      type metadata accessor for OpenURLOptionsKey();
      sub_64F4(&qword_C530, (void (*)(uint64_t))type metadata accessor for OpenURLOptionsKey);
      Class isa = sub_6C50().super.isa;
      [v22 application:v23 openURL:v26 options:isa];

      swift_bridgeObjectRelease();
    }
    swift_unknownObjectRelease();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  v28 = (uint64_t (*)(void))v1[1];
  return v28();
}

uint64_t sub_5108(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_6BC0() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  uint64_t v9 = *(void *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_69D0;
  return sub_4BA0(a1, v6, v7, v8, v9);
}

unint64_t sub_522C(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_6644();
  uint64_t v2 = sub_6D90();
  uint64_t v3 = (void *)v2;
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
    sub_6778(v6, (uint64_t)&v13);
    uint64_t v7 = v13;
    unint64_t result = sub_66E4(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_6848(&v14, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v10 = v3[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v3[2] = v12;
    v6 += 40;
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

uint64_t sub_5344(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_6D10();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_6D00();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_5B84(a1);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_6CD0();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_54E8(void *a1)
{
  uint64_t ObjectType = swift_getObjectType();
  sub_4B48();
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_6BC0();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v8 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v18 - v9;
  sub_6BB0();
  uint64_t v11 = sub_6D10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v3, 1, 1, v11);
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v8, v10, v4);
  sub_6CF0();
  id v12 = a1;
  uint64_t v13 = sub_6CE0();
  unint64_t v14 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  unint64_t v15 = (v6 + v14 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v13;
  *(void *)(v16 + 24) = &protocol witness table for MainActor;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v16 + v14, v8, v4);
  *(void *)(v16 + v15) = ObjectType;
  sub_5344((uint64_t)v3, (uint64_t)&unk_C698, v16);

  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v10, v4);
}

id _HealthBalanceAppDelegate.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

id _HealthBalanceAppDelegate.init()()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "init");
}

id sub_57BC(void *a1)
{
  v2.receiver = a1;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "init");
}

uint64_t type metadata accessor for _HealthBalanceAppDelegate()
{
  uint64_t result = qword_C648;
  if (!qword_C648) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_5848()
{
  return swift_initClassMetadata2();
}

uint64_t sub_5888()
{
  return type metadata accessor for _HealthBalanceAppDelegate();
}

uint64_t sub_5894()
{
  uint64_t v1 = sub_6BC0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 32) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_596C(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_6BC0() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = *(void *)(v1 + 16);
  uint64_t v7 = *(void *)(v1 + 24);
  uint64_t v8 = v1 + v5;
  uint64_t v9 = *(void *)(v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v10 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v10;
  *uint64_t v10 = v2;
  v10[1] = sub_5A90;
  return sub_4BA0(a1, v6, v7, v8, v9);
}

uint64_t sub_5A90()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_5B84(uint64_t a1)
{
  sub_4B48();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_5BE0(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_5CBC;
  return v6(a1);
}

uint64_t sub_5CBC()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_5DB4()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_5DEC(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_5A90;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_C6A0 + dword_C6A0);
  return v6(a1, v4);
}

uint64_t sub_5EA4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_5F78(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_658C((uint64_t)v12, *a3);
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
      sub_658C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_653C((uint64_t)v12);
  return v7;
}

uint64_t sub_5F78(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_6D50();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_6134(a5, a6);
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
  uint64_t v8 = sub_6D70();
  if (!v8)
  {
    sub_6D80();
    __break(1u);
LABEL_17:
    uint64_t result = sub_6DB0();
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

uint64_t sub_6134(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_61CC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_63A8(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_63A8(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_61CC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_6344(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_6D60();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_6D80();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_6CC0();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_6DB0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_6D80();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_6344(uint64_t a1, uint64_t a2)
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
  sub_65E8();
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_63A8(char a1, int64_t a2, char a3, char *a4)
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
    sub_65E8();
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
  uint64_t result = sub_6DB0();
  __break(1u);
  return result;
}

uint64_t sub_64F4(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_653C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_658C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_65E8()
{
  if (!qword_C6B8)
  {
    unint64_t v0 = sub_6DE0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_C6B8);
    }
  }
}

void sub_6644()
{
  if (!qword_C6C0)
  {
    type metadata accessor for OpenURLOptionsKey();
    sub_64F4(&qword_C530, (void (*)(uint64_t))type metadata accessor for OpenURLOptionsKey);
    unint64_t v0 = sub_6DA0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_C6C0);
    }
  }
}

unint64_t sub_66E4(uint64_t a1)
{
  sub_6C90();
  sub_6E00();
  sub_6CB0();
  Swift::Int v2 = sub_6E10();
  swift_bridgeObjectRelease();

  return sub_6858(a1, v2);
}

uint64_t sub_6778(uint64_t a1, uint64_t a2)
{
  sub_67DC();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_67DC()
{
  if (!qword_C6C8)
  {
    type metadata accessor for OpenURLOptionsKey();
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_C6C8);
    }
  }
}

_OWORD *sub_6848(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_6858(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_6C90();
    uint64_t v8 = v7;
    if (v6 == sub_6C90() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_6DF0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_6C90();
          uint64_t v15 = v14;
          if (v13 == sub_6C90() && v15 == v16) {
            break;
          }
          char v18 = sub_6DF0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t type metadata accessor for _BalancePromotionFeedItemViewActionHandler()
{
  uint64_t result = qword_C6D0;
  if (!qword_C6D0) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_6A20()
{
  return swift_initClassMetadata2();
}

uint64_t sub_6A60(uint64_t a1)
{
  uint64_t v3 = sub_6BD0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = objc_allocWithZone(v1);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
  uint64_t v8 = sub_6BF0();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(a1, v3);
  return v8;
}

id sub_6B60()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for _BalancePromotionFeedItemViewActionHandler();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_6B98()
{
  return type metadata accessor for _BalancePromotionFeedItemViewActionHandler();
}

void sub_6BA0(NSURL *retstr@<X8>)
{
}

uint64_t sub_6BB0()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_6BC0()
{
  return type metadata accessor for URL();
}

uint64_t sub_6BD0()
{
  return type metadata accessor for PlatformFeedItemActionContext();
}

uint64_t sub_6BE0()
{
  return SleepingSampleAnalysisHealthChecklistActionHandler.init(context:)();
}

uint64_t sub_6BF0()
{
  return BalancePromotionFeedItemViewActionHandler.init(context:)();
}

uint64_t _s28HealthBalanceAppPluginBundle01_abD8DelegateCACycfc_0()
{
  return HealthBalancePluginDelegate.init()();
}

uint64_t _s28HealthBalanceAppPluginBundle01_abD8DelegateCfd_0()
{
  return HealthBalancePluginDelegate.deinit();
}

uint64_t sub_6C20()
{
  return static Logger.balance.getter();
}

uint64_t sub_6C30()
{
  return Logger.logObject.getter();
}

uint64_t sub_6C40()
{
  return type metadata accessor for Logger();
}

NSDictionary sub_6C50()
{
  return Dictionary._bridgeToObjectiveC()();
}

NSString sub_6C60()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_6C70()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_6C80()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_6C90()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_6CA0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_6CB0()
{
  return String.hash(into:)();
}

Swift::Int sub_6CC0()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_6CD0()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_6CE0()
{
  return static MainActor.shared.getter();
}

uint64_t sub_6CF0()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_6D00()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_6D10()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_6D20()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_6D30()
{
  return type metadata accessor for Optional();
}

uint64_t sub_6D40()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_6D50()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_6D60()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_6D70()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_6D80()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_6D90()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_6DA0()
{
  return type metadata accessor for _DictionaryStorage();
}

uint64_t sub_6DB0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_6DD0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_6DE0()
{
  return type metadata accessor for _ContiguousArrayStorage();
}

uint64_t sub_6DF0()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_6E00()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_6E10()
{
  return Hasher._finalize()();
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

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getMetatypeMetadata()
{
  return _swift_getMetatypeMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return _swift_getTupleTypeMetadata2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
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