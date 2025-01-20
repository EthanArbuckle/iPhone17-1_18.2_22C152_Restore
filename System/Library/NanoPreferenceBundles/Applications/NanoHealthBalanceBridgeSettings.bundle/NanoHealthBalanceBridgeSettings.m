uint64_t sub_379C()
{
  uint64_t v0;

  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for NanoHealthBalanceBridgeSettings()
{
  return self;
}

id sub_37D0(uint64_t a1, uint64_t a2, void *a3)
{
  swift_getObjectType();
  uint64_t v5 = sub_6E48();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_bridgeObjectRelease();
  uint64_t v9 = OBJC_IVAR____TtC31NanoHealthBalanceBridgeSettings22SettingsViewController_settings;
  sub_6E08();
  id v10 = objc_allocWithZone((Class)HKHealthStore);
  v11 = v3;
  [v10 init];
  *(void *)&v3[v9] = sub_6DA8();

  v12 = (objc_class *)type metadata accessor for SettingsViewController();
  v25.receiver = v11;
  v25.super_class = v12;
  id v13 = objc_msgSendSuper2(&v25, "initWithNibName:bundle:", 0, 0);
  sub_6E28();
  v14 = sub_6E38();
  os_log_type_t v15 = sub_6F48();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v22 = v5;
    uint64_t v24 = v17;
    id v21 = a3;
    *(_DWORD *)v16 = 136446210;
    uint64_t v18 = sub_7098();
    uint64_t v23 = sub_51F4(v18, v19, &v24);
    sub_6F88();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_0, v14, v15, "[%{public}s] Initializing settings", v16, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v22);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  }
  return v13;
}

unint64_t sub_3CF4(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_6AA4();
  uint64_t v2 = sub_7028();
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
    sub_6B10(v6, (uint64_t)&v15);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_5864(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_5E64(&v17, (_OWORD *)(v3[7] + 32 * result));
    uint64_t v12 = v3[2];
    BOOL v13 = __OFADD__(v12, 1);
    uint64_t v14 = v12 + 1;
    if (v13) {
      goto LABEL_11;
    }
    v3[2] = v14;
    v6 += 48;
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

uint64_t sub_3E20()
{
  sub_6D28();
  __chkstk_darwin();
  sub_6EA8();
  __chkstk_darwin();
  sub_6DD8();
  sub_6E98();
  type metadata accessor for NanoHealthBalanceBridgeSettings();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v1 = [self bundleForClass:ObjCClassFromMetadata];
  sub_6D18();
  return sub_6ED8();
}

uint64_t sub_3FC4()
{
  sub_6D28();
  __chkstk_darwin();
  sub_6EA8();
  __chkstk_darwin();
  if (sub_6D98() & 1) == 0 && (sub_6DC8()) {
    return 0;
  }
  sub_6E98();
  type metadata accessor for NanoHealthBalanceBridgeSettings();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v2 = [self bundleForClass:ObjCClassFromMetadata];
  sub_6D18();
  return sub_6ED8();
}

uint64_t sub_417C@<X0>(uint64_t *a1@<X8>)
{
  sub_6C8C(0, &qword_C410);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_7550;
  sub_6618();
  *(void *)(v2 + 32) = v3;
  sub_6F18();
  sub_493C();
  uint64_t result = sub_5B60(v4);
  *a1 = v2;
  return result;
}

uint64_t sub_421C()
{
  uint64_t v0 = sub_6E58();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin();
  uint64_t v3 = (char *)v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11[0] = sub_6E78();
  uint64_t v4 = *(void *)(v11[0] - 8);
  __chkstk_darwin();
  uint64_t v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_69DC(0, &qword_C430);
  uint64_t v7 = (void *)sub_6F58();
  uint64_t v8 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_5EF0;
  aBlock[5] = v8;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_4578;
  aBlock[3] = &unk_8638;
  uint64_t v9 = _Block_copy(aBlock);
  swift_retain();
  sub_6E68();
  v11[1] = &_swiftEmptyArrayStorage;
  sub_6994(&qword_C438, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_5F10(0, &qword_C440, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
  sub_5F74();
  sub_6FA8();
  sub_6F68();
  _Block_release(v9);

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  (*(void (**)(char *, void))(v4 + 8))(v6, v11[0]);
  swift_release();
  return swift_release();
}

void sub_451C()
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v1 = Strong;
    [Strong reloadSpecifiers];
  }
}

uint64_t sub_4578(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_45BC(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_7018();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }
  uint64_t v3 = &_swiftEmptyArrayStorage;
  if (!v2) {
    return (uint64_t)v3;
  }
  BOOL v13 = &_swiftEmptyArrayStorage;
  uint64_t result = sub_59C0(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        sub_6FC8();
        sub_69DC(0, &qword_C420);
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_59C0(0, v3[2] + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v7 = v3[2];
        unint64_t v6 = v3[3];
        if (v7 >= v6 >> 1)
        {
          sub_59C0(v6 > 1, v7 + 1, 1);
          uint64_t v3 = v13;
        }
        v3[2] = v7 + 1;
        sub_5E64(v12, &v3[4 * v7 + 4]);
      }
    }
    else
    {
      uint64_t v8 = (id *)(a1 + 32);
      sub_69DC(0, &qword_C420);
      do
      {
        id v9 = *v8;
        swift_dynamicCast();
        uint64_t v3 = v13;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_59C0(0, v3[2] + 1, 1);
          uint64_t v3 = v13;
        }
        unint64_t v11 = v3[2];
        unint64_t v10 = v3[3];
        if (v11 >= v10 >> 1)
        {
          sub_59C0(v10 > 1, v11 + 1, 1);
          uint64_t v3 = v13;
        }
        v3[2] = v11 + 1;
        sub_5E64(v12, &v3[4 * v11 + 4]);
        ++v8;
        --v2;
      }
      while (v2);
    }
    return (uint64_t)v3;
  }
  __break(1u);
  return result;
}

void sub_493C()
{
  sub_6D28();
  __chkstk_darwin();
  sub_6EA8();
  __chkstk_darwin();
  if (sub_6DB8())
  {
    uint64_t v0 = self;
    NSString v1 = sub_6EB8();
    id v2 = [v0 groupSpecifierWithID:v1];

    if (v2)
    {
      sub_3E20();
      NSString v3 = sub_6EB8();
      swift_bridgeObjectRelease();
      [v2 setProperty:v3 forKey:PSFooterTextGroupKey];

      sub_6E98();
      type metadata accessor for NanoHealthBalanceBridgeSettings();
      uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      id v5 = [self bundleForClass:ObjCClassFromMetadata];
      sub_6D18();
      uint64_t v6 = sub_6ED8();
      uint64_t v8 = v7;
      sub_6DD8();
      sub_4E84(v6, v8, (uint64_t)"setWithNotificationsEnabled:specifier:", (uint64_t)"notificationsEnabledWithSpecifier:");
      uint64_t v10 = v9;
      swift_bridgeObjectRelease();
      sub_6C8C(0, &qword_C410);
      uint64_t v11 = swift_allocObject();
      *(_OWORD *)(v11 + 16) = xmmword_7560;
      *(void *)(v11 + 32) = v2;
      *(void *)(v11 + 40) = v10;
      sub_6F18();
    }
    else
    {
      __break(1u);
    }
  }
  else
  {
    sub_4BFC();
  }
}

void sub_4BFC()
{
  sub_6D28();
  __chkstk_darwin();
  sub_6EA8();
  __chkstk_darwin();
  uint64_t v0 = self;
  NSString v1 = sub_6EB8();
  id v2 = [v0 groupSpecifierWithID:v1];

  if (v2)
  {
    sub_3FC4();
    if (v3)
    {
      NSString v4 = sub_6EB8();
      swift_bridgeObjectRelease();
    }
    else
    {
      NSString v4 = 0;
    }
    [v2 setProperty:v4 forKey:PSFooterTextGroupKey];
    swift_unknownObjectRelease();
    sub_6E98();
    type metadata accessor for NanoHealthBalanceBridgeSettings();
    uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    id v6 = [self bundleForClass:ObjCClassFromMetadata];
    sub_6D18();
    uint64_t v7 = sub_6ED8();
    uint64_t v9 = v8;
    sub_6DC8();
    sub_4F98(v7, v9, (uint64_t)"launchHealthAppOnboardingWithSpecifier:");
    uint64_t v11 = v10;
    swift_bridgeObjectRelease();
    sub_6C8C(0, &qword_C410);
    uint64_t v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_7560;
    *(void *)(v12 + 32) = v2;
    *(void *)(v12 + 40) = v11;
    sub_6F18();
  }
  else
  {
    __break(1u);
  }
}

void sub_4E84(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = self;
  NSString v8 = sub_6EB8();
  id v9 = [v7 preferenceSpecifierNamed:v8 target:v4 set:a3 get:a4 detail:0 cell:6 edit:0];

  if (v9)
  {
    Class isa = sub_6F38().super.super.isa;
    [v9 setProperty:isa forKey:PSAllowMultilineTitleKey];

    Class v11 = sub_6F38().super.super.isa;
    [v9 setProperty:v11 forKey:PSEnabledKey];
  }
  else
  {
    __break(1u);
  }
}

void sub_4F98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = self;
  NSString v6 = sub_6EB8();
  id v7 = [v5 preferenceSpecifierNamed:v6 target:v3 set:0 get:0 detail:0 cell:13 edit:0];

  if (v7)
  {
    Class isa = sub_6F38().super.super.isa;
    [v7 setProperty:isa forKey:PSAllowMultilineTitleKey];

    Class v9 = sub_6F38().super.super.isa;
    [v7 setProperty:v9 forKey:PSEnabledKey];

    [v7 setButtonAction:a3];
  }
  else
  {
    __break(1u);
  }
}

id sub_50B8()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SettingsViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for SettingsViewController()
{
  return self;
}

uint64_t sub_5120@<X0>(uint64_t *a1@<X8>)
{
  return sub_417C(a1);
}

uint64_t (*sub_5128())()
{
  NSString v1 = *(void **)(v0 + 16);
  *(void *)(swift_allocObject() + 16) = v1;
  id v2 = v1;
  return sub_5EB0;
}

void sub_518C()
{
  if (!qword_C418)
  {
    sub_69DC(255, &qword_C420);
    unint64_t v0 = sub_6F28();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_C418);
    }
  }
}

uint64_t sub_51F4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_52C8(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_6C30((uint64_t)v12, *a3);
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
      sub_6C30((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_6BE0((uint64_t)v12);
  return v7;
}

uint64_t sub_52C8(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_6F98();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_5484(a5, a6);
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
  uint64_t v8 = sub_6FE8();
  if (!v8)
  {
    sub_6FF8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_7048();
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

uint64_t sub_5484(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_551C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_5708(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_5708(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_551C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_5694(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_6FB8();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_6FF8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_6EF8();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_7048();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_6FF8();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_5694(uint64_t a1, uint64_t a2)
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
  sub_6C8C(0, &qword_C478);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_5708(char a1, int64_t a2, char a3, char *a4)
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
    sub_6C8C(0, &qword_C478);
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
  uint64_t result = sub_7048();
  __break(1u);
  return result;
}

unint64_t sub_5864(uint64_t a1, uint64_t a2)
{
  sub_7078();
  sub_6EE8();
  Swift::Int v4 = sub_7088();

  return sub_58DC(a1, a2, v4);
}

unint64_t sub_58DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_7068() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        BOOL v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_7068() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_59C0(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_59E0(a1, a2, a3, *v3);
  void *v3 = (char *)result;
  return result;
}

uint64_t sub_59E0(char a1, int64_t a2, char a3, char *a4)
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
    sub_6C8C(0, &qword_C428);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  BOOL v13 = v10 + 32;
  BOOL v14 = a4 + 32;
  if (a1)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
    }
    *((void *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_7048();
  __break(1u);
  return result;
}

uint64_t sub_5B60(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_7018();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((char *)&dword_10 + (a1 & 0xFFFFFFFFFFFFFF8));
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8));
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_7018();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *uint64_t v1 = v6;
  if (isUniquelyReferenced_nonNull_bridgeObject)
  {
    if ((v6 & 0x8000000000000000) == 0 && (v6 & 0x4000000000000000) == 0)
    {
      uint64_t v8 = v6 & 0xFFFFFFFFFFFFFF8;
      if (v5 <= *(void *)((char *)&dword_18 + (v6 & 0xFFFFFFFFFFFFFF8)) >> 1) {
        goto LABEL_11;
      }
    }
  }
  if (v6 >> 62) {
    goto LABEL_23;
  }
  while (1)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_6FD8();
    swift_bridgeObjectRelease();
    *uint64_t v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_5FFC(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_7018();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8));
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((char *)&dword_10 + (*v1 & 0xFFFFFFFFFFFFFF8)) = v14;
  }
  swift_bridgeObjectRelease();

  return sub_6F18();
}

void (*sub_5D2C(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_5DDC(v6, a2, a3);
  return sub_5D94;
}

void sub_5D94(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_5DDC(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_6FC8();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8)) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_5E5C;
  }
  __break(1u);
  return result;
}

void sub_5E5C(id *a1)
{
}

_OWORD *sub_5E64(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_5E78()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_5EB0()
{
  return sub_421C();
}

uint64_t sub_5EB8()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_5EF0()
{
}

uint64_t sub_5EF8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_5F08()
{
  return swift_release();
}

void sub_5F10(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  if (!*a2)
  {
    uint64_t v7 = a3(255);
    unint64_t v8 = a4(a1, v7);
    if (!v9) {
      atomic_store(v8, a2);
    }
  }
}

unint64_t sub_5F74()
{
  unint64_t result = qword_C448;
  if (!qword_C448)
  {
    sub_5F10(255, &qword_C440, (uint64_t (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Array);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_C448);
  }
  return result;
}

uint64_t sub_5FFC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_7018();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
    if (!v7) {
      return a3;
    }
  }
  if (!a1) {
    goto LABEL_19;
  }
  uint64_t v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    uint64_t v10 = sub_7018();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_518C();
        sub_6994(&qword_C450, (void (*)(uint64_t))sub_518C);
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          uint64_t v12 = sub_5D2C(v16, i, a3);
          id v14 = *v13;
          ((void (*)(void (**)(id *), void))v12)(v16, 0);
          *(void *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  uint64_t v9 = *(void *)((char *)&dword_10 + (a3 & 0xFFFFFFFFFFFFFF8));
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_69DC(0, &qword_C420);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_7048();
  __break(1u);
  return result;
}

void sub_6618()
{
  sub_6D28();
  __chkstk_darwin();
  sub_6EA8();
  __chkstk_darwin();
  uint64_t v0 = self;
  NSString v1 = sub_6EB8();
  id v2 = [v0 groupSpecifierWithID:v1];

  if (v2)
  {
    sub_6E18();
    uint64_t ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
    id v4 = NSStringFromClass(ObjCClassFromMetadata);
    if (!v4)
    {
      sub_6EC8();
      id v4 = (NSString *)sub_6EB8();
      swift_bridgeObjectRelease();
    }
    [v2 setProperty:v4 forKey:PSHeaderCellClassGroupKey];

    sub_69DC(0, &qword_C458);
    uint64_t v5 = (void *)sub_6F78();
    NSString v6 = sub_6EB8();
    id v7 = [self imageNamed:v6 inBundle:v5];

    [v2 setProperty:v7 forKey:PSIconImageKey];
    sub_6E98();
    type metadata accessor for NanoHealthBalanceBridgeSettings();
    uint64_t v8 = swift_getObjCClassFromMetadata();
    uint64_t v9 = self;
    id v10 = [v9 bundleForClass:v8];
    sub_6D18();
    sub_6ED8();
    NSString v11 = sub_6EB8();
    swift_bridgeObjectRelease();
    [v2 setProperty:v11 forKey:PSTitleKey];

    sub_6E98();
    id v12 = [v9 bundleForClass:v8];
    sub_6D18();
    sub_6ED8();
    NSString v13 = sub_6EB8();
    swift_bridgeObjectRelease();
    [v2 setProperty:v13 forKey:PSStaticHeaderTextKey];
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_6994(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_69DC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_6A18(uint64_t a1)
{
  sub_5F10(0, &qword_C460, (uint64_t (*)(uint64_t))&type metadata accessor for BalanceURLBuilder.Route, (uint64_t (*)(uint64_t, uint64_t))&type metadata accessor for Optional);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void sub_6AA4()
{
  if (!qword_C468)
  {
    unint64_t v0 = sub_7038();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_C468);
    }
  }
}

uint64_t sub_6B10(uint64_t a1, uint64_t a2)
{
  sub_6B74();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

void sub_6B74()
{
  if (!qword_C470)
  {
    TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
    if (!v1) {
      atomic_store(TupleTypeMetadata2, (unint64_t *)&qword_C470);
    }
  }
}

uint64_t sub_6BE0(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_6C30(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_6C8C(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t v3 = sub_7058();
    if (!v4) {
      atomic_store(v3, a2);
    }
  }
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_6CF8(NSURL *retstr@<X8>)
{
}

uint64_t sub_6D08()
{
  return type metadata accessor for URL();
}

uint64_t sub_6D18()
{
  return static Locale.current.getter();
}

uint64_t sub_6D28()
{
  return type metadata accessor for Locale();
}

uint64_t sub_6D38()
{
  return withObservationTracking<A>(_:onChange:)();
}

uint64_t sub_6D48()
{
  return BalanceURLBuilder.url(route:source:)();
}

uint64_t sub_6D58()
{
  return type metadata accessor for BalanceURLBuilder.Route();
}

uint64_t sub_6D68()
{
  return type metadata accessor for BalanceURLBuilder.Source();
}

uint64_t sub_6D78()
{
  return BalanceURLBuilder.init()();
}

uint64_t sub_6D88()
{
  return type metadata accessor for BalanceURLBuilder();
}

uint64_t sub_6D98()
{
  return SettingsModelProvider.isAgeGated.getter();
}

uint64_t sub_6DA8()
{
  return SettingsModelProvider.__allocating_init(healthStore:)();
}

uint64_t sub_6DB8()
{
  return SettingsModelProvider.settingsVisible.getter();
}

uint64_t sub_6DC8()
{
  return SettingsModelProvider.onboardingEligible.getter();
}

uint64_t sub_6DD8()
{
  return SettingsModelProvider.settingsUserInteractionEnabled.getter();
}

uint64_t sub_6DE8()
{
  return SettingsModelProvider.sleepingSampleChangeNotificationsEnabled.getter();
}

uint64_t sub_6DF8()
{
  return SettingsModelProvider.sleepingSampleChangeNotificationsEnabled.setter();
}

uint64_t sub_6E08()
{
  return type metadata accessor for SettingsModelProvider();
}

uint64_t sub_6E18()
{
  return type metadata accessor for BridgePreferencesHeaderView();
}

uint64_t sub_6E28()
{
  return static Logger.balance.getter();
}

uint64_t sub_6E38()
{
  return Logger.logObject.getter();
}

uint64_t sub_6E48()
{
  return type metadata accessor for Logger();
}

uint64_t sub_6E58()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_6E68()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_6E78()
{
  return type metadata accessor for DispatchQoS();
}

NSDictionary sub_6E88()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_6E98()
{
  return String.LocalizationValue.init(stringLiteral:)();
}

uint64_t sub_6EA8()
{
  return type metadata accessor for String.LocalizationValue();
}

NSString sub_6EB8()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_6EC8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_6ED8()
{
  return String.init(localized:table:bundle:locale:comment:)();
}

uint64_t sub_6EE8()
{
  return String.hash(into:)();
}

Swift::Int sub_6EF8()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_6F08()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_6F18()
{
  return specialized Array._endMutation()();
}

uint64_t sub_6F28()
{
  return type metadata accessor for Array();
}

NSNumber sub_6F38()
{
  return Bool._bridgeToObjectiveC()();
}

uint64_t sub_6F48()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_6F58()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_6F68()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_6F78()
{
  return static NSBundle.healthBalanceUI.getter();
}

uint64_t sub_6F88()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_6F98()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_6FA8()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_6FB8()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_6FC8()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_6FD8()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_6FE8()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_6FF8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_7008()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_7018()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_7028()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_7038()
{
  return type metadata accessor for _DictionaryStorage();
}

uint64_t sub_7048()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_7058()
{
  return type metadata accessor for _ContiguousArrayStorage();
}

uint64_t sub_7068()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_7078()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_7088()
{
  return Hasher._finalize()();
}

uint64_t sub_7098()
{
  return _typeName(_:qualified:)();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
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

void free(void *a1)
{
}

void *__cdecl malloc(size_t __size)
{
  return _malloc(__size);
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

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return _swift_getTupleTypeMetadata2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
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

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
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