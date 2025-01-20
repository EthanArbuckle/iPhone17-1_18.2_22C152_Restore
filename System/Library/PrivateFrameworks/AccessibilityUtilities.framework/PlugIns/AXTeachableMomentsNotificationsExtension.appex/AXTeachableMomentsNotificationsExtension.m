uint64_t variable initialization expression of AXTeachableLongFormViewController.TeachableLogger()
{
  return sub_1000070D0();
}

uint64_t AXTeachableLongFormViewController.TeachableLogger.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR___AXTeachableLongFormViewController_TeachableLogger;
  swift_beginAccess();
  uint64_t v4 = sub_1000070E0();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t AXTeachableLongFormViewController.TeachableLogger.setter(uint64_t a1)
{
  uint64_t v3 = v1 + OBJC_IVAR___AXTeachableLongFormViewController_TeachableLogger;
  swift_beginAccess();
  uint64_t v4 = sub_1000070E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(v3, a1, v4);
  return swift_endAccess();
}

uint64_t (*AXTeachableLongFormViewController.TeachableLogger.modify())()
{
  return j_j__swift_endAccess;
}

uint64_t variable initialization expression of AXTeachableLongFormViewController.longFormTitle()
{
  return 0;
}

uint64_t AXTeachableLongFormViewController.longFormTitle.getter()
{
  uint64_t v1 = (uint64_t *)(v0 + OBJC_IVAR___AXTeachableLongFormViewController_longFormTitle);
  swift_beginAccess();
  uint64_t v2 = *v1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t AXTeachableLongFormViewController.longFormTitle.setter(uint64_t a1, uint64_t a2)
{
  v5 = (void *)(v2 + OBJC_IVAR___AXTeachableLongFormViewController_longFormTitle);
  swift_beginAccess();
  void *v5 = a1;
  v5[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*AXTeachableLongFormViewController.longFormTitle.modify())()
{
  return j__swift_endAccess;
}

uint64_t variable initialization expression of AXTeachableLongFormViewController.items()
{
  return 0;
}

uint64_t AXTeachableLongFormViewController.items.getter()
{
  return swift_bridgeObjectRetain();
}

uint64_t AXTeachableLongFormViewController.items.setter(uint64_t a1)
{
  uint64_t v3 = (void *)(v1 + OBJC_IVAR___AXTeachableLongFormViewController_items);
  swift_beginAccess();
  *uint64_t v3 = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*AXTeachableLongFormViewController.items.modify())()
{
  return j_j__swift_endAccess;
}

Swift::Void __swiftcall AXTeachableLongFormViewController.didReceive(_:)(UNNotification a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_1000070E0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  v7 = (char *)&v53 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = [(objc_class *)a1.super.isa request];
  id v9 = [v8 content];

  id v10 = [v9 userInfo];
  uint64_t v11 = sub_1000070F0();

  uint64_t v59 = 0x656C746974;
  unint64_t v60 = 0xE500000000000000;
  sub_100007190();
  if (*(void *)(v11 + 16) && (unint64_t v12 = sub_100006C10((uint64_t)v61), (v13 & 1) != 0))
  {
    sub_100006DF0(*(void *)(v11 + 56) + 32 * v12, (uint64_t)&v62);
  }
  else
  {
    long long v62 = 0u;
    long long v63 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_100006C54((uint64_t)v61);
  uint64_t v55 = v5;
  if (!*((void *)&v63 + 1))
  {
    sub_100006CA8((uint64_t)&v62);
    goto LABEL_9;
  }
  if (!swift_dynamicCast())
  {
LABEL_9:
    uint64_t v14 = 0;
    unint64_t v15 = 0xE000000000000000;
    goto LABEL_10;
  }
  uint64_t v14 = v59;
  unint64_t v15 = v60;
LABEL_10:
  v16 = (uint64_t *)&v2[OBJC_IVAR___AXTeachableLongFormViewController_longFormTitle];
  swift_beginAccess();
  uint64_t *v16 = v14;
  v16[1] = v15;
  swift_bridgeObjectRelease();
  id v17 = [(objc_class *)a1.super.isa request];
  id v18 = [v17 content];

  id v19 = [v18 userInfo];
  uint64_t v20 = sub_1000070F0();

  strcpy((char *)v57, "teachableItems");
  HIBYTE(v57[1]) = -18;
  sub_100007190();
  if (*(void *)(v20 + 16) && (unint64_t v21 = sub_100006C10((uint64_t)v61), (v22 & 1) != 0))
  {
    sub_100006DF0(*(void *)(v20 + 56) + 32 * v21, (uint64_t)&v62);
  }
  else
  {
    long long v62 = 0u;
    long long v63 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_100006C54((uint64_t)v61);
  if (!*((void *)&v63 + 1)) {
    goto LABEL_18;
  }
  if ((swift_dynamicCast() & 1) == 0) {
    goto LABEL_19;
  }
  uint64_t v23 = v57[0];
  unint64_t v24 = v57[1];
  sub_100006D4C(0, &qword_10000C6B8);
  sub_100006D08(&qword_10000C6C0);
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_1000074F0;
  *(void *)(v25 + 32) = sub_100006D4C(0, &qword_10000C6C8);
  *(void *)(v25 + 40) = sub_100006D4C(0, &qword_10000C6D0);
  sub_100007140();
  swift_bridgeObjectRelease();
  if (!*((void *)&v63 + 1))
  {
    sub_100006D88(v23, v24);
LABEL_18:
    sub_100006CA8((uint64_t)&v62);
LABEL_19:
    if (!v16[1]) {
      return;
    }
LABEL_20:
    v26 = &v2[OBJC_IVAR___AXTeachableLongFormViewController_items];
    swift_beginAccess();
    unint64_t v27 = *(void *)v26;
    if (!*(void *)v26) {
      return;
    }
    v28 = &v2[OBJC_IVAR___AXTeachableLongFormViewController_TeachableLogger];
    swift_beginAccess();
    uint64_t v29 = v55;
    (*(void (**)(char *, char *, uint64_t))(v55 + 16))(v7, v28, v4);
    v54 = v2;
    swift_bridgeObjectRetain();
    unint64_t v56 = v27;
    swift_bridgeObjectRetain();
    v30 = sub_1000070C0();
    uint64_t v31 = v4;
    os_log_type_t v32 = sub_100007130();
    if (os_log_type_enabled(v30, v32))
    {
      uint64_t v53 = v31;
      v33 = (uint8_t *)swift_slowAlloc();
      uint64_t v58 = swift_slowAlloc();
      *(_DWORD *)v33 = 136315138;
      if (v16[1])
      {
        uint64_t v34 = *v16;
        unint64_t v35 = v16[1];
      }
      else
      {
        uint64_t v34 = 0;
        unint64_t v35 = 0xE000000000000000;
      }
      swift_bridgeObjectRetain();
      v57[4] = sub_1000065B8(v34, v35, &v58);
      sub_100007150();
      v39 = v54;

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v30, v32, "Received %s", v33, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v55 + 8))(v7, v53);
    }
    else
    {

      v36 = v54;
      (*(void (**)(char *, uint64_t))(v29 + 8))(v7, v31);
    }
    id v40 = objc_allocWithZone((Class)OBTextWelcomeController);
    NSString v41 = sub_100007100();
    swift_bridgeObjectRelease();
    id v42 = [v40 initWithTitle:v41 detailText:0 symbolName:0];

    unint64_t v43 = v56;
    if (v56 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v44 = sub_1000071E0();
      swift_bridgeObjectRelease();
      if (v44) {
        goto LABEL_35;
      }
    }
    else
    {
      uint64_t v44 = *(void *)((v56 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (v44)
      {
LABEL_35:
        if (v44 < 1)
        {
          __break(1u);
          return;
        }
        uint64_t v45 = 0;
        unint64_t v46 = v43 & 0xC000000000000001;
        do
        {
          if (v46) {
            id v47 = (id)sub_1000071B0();
          }
          else {
            id v47 = *(id *)(v43 + 8 * v45 + 32);
          }
          v48 = v47;
          NSString v49 = [v47 itemTitle];
          if (!v49)
          {
            sub_100007110();
            NSString v49 = sub_100007100();
            swift_bridgeObjectRelease();
          }
          NSString v50 = [v48 itemDescription];
          if (!v50)
          {
            sub_100007110();
            NSString v50 = sub_100007100();
            unint64_t v43 = v56;
            swift_bridgeObjectRelease();
          }
          ++v45;
          [v42 addBulletedListItemWithTitle:v49 description:v50];
        }
        while (v44 != v45);
      }
    }
    swift_bridgeObjectRelease();
    NSString v51 = sub_100007100();
    NSString v52 = sub_100007100();
    [v42 addSectionWithHeader:v51 content:v52];

    [v54 presentViewController:v42 animated:0 completion:0];
    return;
  }
  sub_100006DE0(&v62, v61);
  sub_100006DF0((uint64_t)v61, (uint64_t)&v62);
  sub_100006D08(&qword_10000C6D8);
  if (swift_dynamicCast()) {
    uint64_t v37 = v57[0];
  }
  else {
    uint64_t v37 = 0;
  }
  v38 = &v2[OBJC_IVAR___AXTeachableLongFormViewController_items];
  swift_beginAccess();
  *(void *)v38 = v37;
  swift_bridgeObjectRelease();
  sub_100006D88(v23, v24);
  sub_100006E4C((uint64_t)v61);
  if (v16[1]) {
    goto LABEL_20;
  }
}

uint64_t AXTeachableLongFormViewController.canBecomeFirstResponder.getter()
{
  return 1;
}

id AXTeachableLongFormViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = v3;
  if (a2)
  {
    NSString v6 = sub_100007100();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithNibName:v6 bundle:a3];

  return v7;
}

id AXTeachableLongFormViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  NSString v6 = v3;
  sub_1000070D0();
  id v7 = &v6[OBJC_IVAR___AXTeachableLongFormViewController_longFormTitle];
  *(void *)id v7 = 0;
  *((void *)v7 + 1) = 0;
  *(void *)&v6[OBJC_IVAR___AXTeachableLongFormViewController_items] = 0;

  if (a2)
  {
    NSString v8 = sub_100007100();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v8 = 0;
  }
  v11.receiver = v6;
  v11.super_class = (Class)type metadata accessor for AXTeachableLongFormViewController();
  id v9 = objc_msgSendSuper2(&v11, "initWithNibName:bundle:", v8, a3);

  return v9;
}

id AXTeachableLongFormViewController.__allocating_init(coder:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id AXTeachableLongFormViewController.init(coder:)(void *a1)
{
  id v3 = v1;
  sub_1000070D0();
  uint64_t v4 = &v3[OBJC_IVAR___AXTeachableLongFormViewController_longFormTitle];
  *(void *)uint64_t v4 = 0;
  *((void *)v4 + 1) = 0;
  *(void *)&v3[OBJC_IVAR___AXTeachableLongFormViewController_items] = 0;

  v7.receiver = v3;
  v7.super_class = (Class)type metadata accessor for AXTeachableLongFormViewController();
  id v5 = objc_msgSendSuper2(&v7, "initWithCoder:", a1);

  return v5;
}

id AXTeachableLongFormViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AXTeachableLongFormViewController();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1000065B8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_10000668C(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100006DF0((uint64_t)v12, *a3);
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
      sub_100006DF0((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100006E4C((uint64_t)v12);
  return v7;
}

uint64_t sub_10000668C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100007160();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100006848(a5, a6);
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
  uint64_t v8 = sub_1000071C0();
  if (!v8)
  {
    sub_1000071D0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_1000071F0();
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

uint64_t sub_100006848(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_1000068E0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100006AC0(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100006AC0(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_1000068E0(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100006A58(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_1000071A0();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_1000071D0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100007120();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_1000071F0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_1000071D0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100006A58(uint64_t a1, uint64_t a2)
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
  sub_100006D08(&qword_10000C768);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100006AC0(char a1, int64_t a2, char a3, char *a4)
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
    sub_100006D08(&qword_10000C768);
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
  char v13 = a4 + 32;
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
  uint64_t result = sub_1000071F0();
  __break(1u);
  return result;
}

unint64_t sub_100006C10(uint64_t a1)
{
  uint64_t v2 = v1;
  Swift::Int v4 = sub_100007170(*(void *)(v2 + 40));

  return sub_100006F98(a1, v4);
}

uint64_t sub_100006C54(uint64_t a1)
{
  return a1;
}

uint64_t sub_100006CA8(uint64_t a1)
{
  uint64_t v2 = sub_100006D08(&qword_10000C6B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100006D08(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100006D4C(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100006D88(uint64_t a1, unint64_t a2)
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

_OWORD *sub_100006DE0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100006DF0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100006E4C(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t type metadata accessor for AXTeachableLongFormViewController()
{
  uint64_t result = qword_10000C7E8;
  if (!qword_10000C7E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100006EE8()
{
  return type metadata accessor for AXTeachableLongFormViewController();
}

uint64_t sub_100006EF0()
{
  uint64_t result = sub_1000070E0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unint64_t sub_100006F98(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v4 = a2 & ~v3;
  if ((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4))
  {
    uint64_t v5 = ~v3;
    do
    {
      sub_100007060(*(void *)(v2 + 48) + 40 * v4, (uint64_t)v8);
      char v6 = sub_100007180();
      sub_100006C54((uint64_t)v8);
      if (v6) {
        break;
      }
      unint64_t v4 = (v4 + 1) & v5;
    }
    while (((*(void *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_100007060(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_1000070C0()
{
  return Logger.logObject.getter();
}

uint64_t sub_1000070D0()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_1000070E0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_1000070F0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

NSString sub_100007100()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100007110()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Int sub_100007120()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_100007130()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100007140()
{
  return static NSKeyedUnarchiver.unarchivedObject(ofClasses:from:)();
}

uint64_t sub_100007150()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100007160()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

Swift::Int sub_100007170(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_100007180()
{
  return static AnyHashable.== infix(_:_:)();
}

uint64_t sub_100007190()
{
  return AnyHashable.init<A>(_:)();
}

uint64_t sub_1000071A0()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_1000071B0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_1000071C0()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_1000071D0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_1000071E0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_1000071F0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

uint64_t swift_endAccess()
{
  return _swift_endAccess();
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

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_release()
{
  return _swift_release();
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

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}