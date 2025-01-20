uint64_t sub_1000049C0(void **a1, uint64_t a2, void *a3, void *a4, uint64_t a5)
{
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  int v16;
  id v17;
  NSURL *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t result;
  uint64_t v26;
  void **aBlock;
  unint64_t v28;
  void (*v29)(uint64_t, void *, void *);
  void *v30;
  void (*v31)(void *, uint64_t);
  void *v32;
  uint64_t v33;
  Swift::String v34;
  Swift::String v35;
  Swift::String v36;

  sub_100005FE8(&qword_10000C4B0);
  __chkstk_darwin();
  v11 = (char *)&v26 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_100006E48();
  v13 = *(void *)(v12 - 8);
  __chkstk_darwin();
  v15 = (char *)&v26 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    aBlock = a1;
    swift_unknownObjectRetain();
    sub_100005FE8(&qword_10000C520);
    v16 = swift_dynamicCast();
    (*(void (**)(char *, void, uint64_t, uint64_t))(v13 + 56))(v11, v16 ^ 1u, 1, v12);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12) != 1)
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v15, v11, v12);
      v17 = [self defaultManager];
      sub_100006E38(v18);
      v20 = v19;
      v21 = (void *)swift_allocObject();
      v21[2] = a3;
      v21[3] = a4;
      v21[4] = a5;
      v31 = sub_100006CA4;
      v32 = v21;
      aBlock = _NSConcreteStackBlock;
      v28 = 1107296256;
      v29 = sub_100004F0C;
      v30 = &unk_1000085D0;
      v22 = _Block_copy(&aBlock);
      v23 = a3;
      v24 = a4;
      swift_retain();
      swift_release();
      [v17 fetchItemForURL:v20 completionHandler:v22];
      _Block_release(v22);

      return (*(uint64_t (**)(char *, uint64_t))(v13 + 8))(v15, v12);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v13 + 56))(v11, 1, 1, v12);
  }
  sub_100006BF8((uint64_t)v11);
  aBlock = 0;
  v28 = 0xE000000000000000;
  sub_100006FE8(52);
  v34._object = (void *)0x8000000100007790;
  v34._countAndFlagsBits = 0xD000000000000031;
  sub_100006F08(v34);
  v33 = a2;
  swift_errorRetain();
  sub_100005FE8(&qword_10000C4B8);
  v35._countAndFlagsBits = sub_100006EF8();
  sub_100006F08(v35);
  swift_bridgeObjectRelease();
  v36._countAndFlagsBits = 46;
  v36._object = (void *)0xE100000000000000;
  sub_100006F08(v36);
  result = sub_100007058();
  __break(1u);
  return result;
}

void sub_100004D60(void *a1, uint64_t a2, NSObject *a3, void *a4, uint64_t a5)
{
  if (a1)
  {
    v7 = (void *)(a5 + 16);
    id v8 = a1;
    [a4 lock];
    swift_beginAccess();
    id v9 = v8;
    sub_100006F18();
    if (*(void *)((*v7 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((*v7 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_100006F58();
    }
    sub_100006F68();
    sub_100006F48();
    swift_endAccess();
    [a4 unlock];
  }
  else
  {
    sub_100006F78();
    sub_100005FE8(&qword_10000C468);
    uint64_t v10 = swift_allocObject();
    *(_OWORD *)(v10 + 16) = xmmword_100007490;
    swift_errorRetain();
    sub_100005FE8(&qword_10000C4B8);
    uint64_t v11 = sub_100006EF8();
    uint64_t v13 = v12;
    *(void *)(v10 + 56) = &type metadata for String;
    *(void *)(v10 + 64) = sub_100006CB0();
    *(void *)(v10 + 32) = v11;
    *(void *)(v10 + 40) = v13;
    sub_100006DA8(0, &qword_10000C470);
    id v9 = (id)sub_100006FC8();
    sub_100006E98();
    swift_bridgeObjectRelease();
  }

  dispatch_group_leave(a3);
}

void sub_100004F0C(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  id v7 = a2;
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

uint64_t sub_100004F98(uint64_t a1, uint64_t a2, void *a3)
{
  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  swift_unknownObjectRetain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();

  return _swift_unknownObjectRelease(a2);
}

uint64_t sub_100005018(void (*a1)(uint64_t, void))
{
  swift_beginAccess();
  uint64_t v2 = swift_bridgeObjectRetain();
  a1(v2, 0);
  return swift_bridgeObjectRelease();
}

uint64_t sub_100005084(uint64_t a1)
{
  v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

id sub_100005108()
{
  return sub_100005F0C(type metadata accessor for AddTagsActionExtensionController);
}

uint64_t type metadata accessor for AddTagsActionExtensionController()
{
  return self;
}

uint64_t sub_100005144()
{
  v1 = v0;
  v13.receiver = v0;
  v13.super_class = (Class)type metadata accessor for AddTagsActionViewController();
  objc_msgSendSuper2(&v13, "viewDidLoad");
  id v2 = [v0 extensionContext];
  if (v2
    && (v3 = v2,
        id v4 = [v2 inputItems],
        v3,
        uint64_t v5 = sub_100006F38(),
        v4,
        unint64_t v6 = (unint64_t)sub_10000536C(v5),
        swift_bridgeObjectRelease(),
        v6))
  {
    sub_100005FE8(&qword_10000C468);
    uint64_t v7 = swift_allocObject();
    *(_OWORD *)(v7 + 16) = xmmword_100007490;
    if (v6 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_100007068();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v8 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    *(void *)(v7 + 56) = &type metadata for Int;
    *(void *)(v7 + 64) = &protocol witness table for Int;
    *(void *)(v7 + 32) = v8;
    sub_100006DA8(0, &qword_10000C470);
    id v9 = (void *)sub_100006FC8();
    sub_100006F88();
    sub_100006E88();
    swift_bridgeObjectRelease();

    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v1;
    id v11 = v1;
    sub_100006588(v6, (uint64_t)sub_100006064, v10);
    swift_bridgeObjectRelease();
    return swift_release();
  }
  else
  {
    uint64_t result = sub_100007058();
    __break(1u);
  }
  return result;
}

void *sub_10000536C(uint64_t a1)
{
  unint64_t v6 = &_swiftEmptyArrayStorage;
  uint64_t v2 = *(void *)(a1 + 16);
  sub_100007028();
  if (!v2) {
    return v6;
  }
  for (uint64_t i = a1 + 32; ; i += 32)
  {
    sub_100006D4C(i, (uint64_t)v5);
    sub_100006DA8(0, &qword_10000C538);
    if (!swift_dynamicCast()) {
      break;
    }
    sub_100007008();
    sub_100007038();
    sub_100007048();
    sub_100007018();
    if (!--v2) {
      return v6;
    }
  }
  swift_release();

  return 0;
}

uint64_t sub_100005488(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_100006EA8();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  id v9 = (char *)&v19 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100006EC8();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin();
  objc_super v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    sub_100006DA8(0, &qword_10000C478);
    swift_bridgeObjectRetain();
    v14 = (void *)sub_100006FA8();
    uint64_t v15 = swift_allocObject();
    *(void *)(v15 + 16) = a1;
    *(void *)(v15 + 24) = a3;
    v24 = sub_100006D44;
    uint64_t v25 = v15;
    aBlock = _NSConcreteStackBlock;
    unint64_t v21 = 1107296256;
    v22 = sub_100005084;
    v23 = &unk_100008620;
    v16 = _Block_copy(&aBlock);
    id v17 = a3;
    swift_release();
    sub_100006EB8();
    aBlock = (void **)&_swiftEmptyArrayStorage;
    sub_100006AE8();
    sub_100005FE8(&qword_10000C488);
    sub_100006B40();
    sub_100006FD8();
    sub_100006FB8();
    _Block_release(v16);

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    return (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  else
  {
    aBlock = 0;
    unint64_t v21 = 0xE000000000000000;
    sub_100006FE8(74);
    v27._object = (void *)0x8000000100007820;
    v27._countAndFlagsBits = 0xD000000000000048;
    sub_100006F08(v27);
    uint64_t v26 = a2;
    swift_errorRetain();
    sub_100005FE8(&qword_10000C4B8);
    v28._countAndFlagsBits = sub_100006EF8();
    sub_100006F08(v28);
    swift_bridgeObjectRelease();
    uint64_t result = sub_100007058();
    __break(1u);
  }
  return result;
}

void sub_1000057D4(unint64_t a1, void *a2)
{
  sub_100005FE8(&qword_10000C468);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100007490;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v5 = sub_100007068();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v5 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  *(void *)(v4 + 56) = &type metadata for Int;
  *(void *)(v4 + 64) = &protocol witness table for Int;
  *(void *)(v4 + 32) = v5;
  sub_100006DA8(0, &qword_10000C470);
  uint64_t v6 = (void *)sub_100006FC8();
  sub_100006F88();
  sub_100006E88();
  swift_bridgeObjectRelease();

  if (v5 < 1)
  {
    sub_100006F78();
    uint64_t v7 = (void *)sub_100006FC8();
    sub_100006E98();

    [a2 dismissViewControllerAnimated:1 completion:0];
  }
  else
  {
    sub_100006DA8(0, &qword_10000C530);
    Class isa = sub_100006F28().super.isa;
    [a2 setItems:isa];
  }
}

void sub_100005A04(char a1)
{
  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for AddTagsActionViewController();
  objc_msgSendSuper2(&v9, "viewWillAppear:", a1 & 1);
  id v3 = [v1 parentViewController];
  if (v3)
  {
    uint64_t v4 = v3;
    self;
    uint64_t v5 = (void *)swift_dynamicCastObjCClass();
    if (v5)
    {
      id v6 = [v5 view];
      if (v6)
      {
        uint64_t v7 = v6;
        id v8 = [self systemBackgroundColor];
        [v7 setBackgroundColor:v8];

        return;
      }
      __break(1u);
    }
  }
  sub_100007058();
  __break(1u);
}

void sub_100005B94(char a1, void *a2, uint64_t a3)
{
  id v7 = [v3 extensionContext];
  if (v7)
  {
    id v8 = v7;
    [v7 completeRequestReturningItems:0 completionHandler:0];

    if (a2)
    {
      v10[4] = a2;
      v10[5] = a3;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 1107296256;
      v10[2] = sub_100005084;
      v10[3] = &unk_100008490;
      a2 = _Block_copy(v10);
      swift_retain();
      swift_release();
    }
    objc_super v9 = (objc_class *)type metadata accessor for AddTagsActionViewController();
    v11.receiver = v3;
    v11.super_class = v9;
    objc_msgSendSuper2(&v11, "dismissViewControllerAnimated:completion:", a1 & 1, a2);
    _Block_release(a2);
  }
  else
  {
    __break(1u);
  }
}

id sub_100005EF4()
{
  return sub_100005F0C(type metadata accessor for AddTagsActionViewController);
}

id sub_100005F0C(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for AddTagsActionViewController()
{
  return self;
}

uint64_t sub_100005F78(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_100005F88()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100005FC0()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

uint64_t sub_100005FD0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100005FE0()
{
  return swift_release();
}

uint64_t sub_100005FE8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_10000602C()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100006064(uint64_t a1, uint64_t a2)
{
  return sub_100005488(a1, a2, *(void **)(v2 + 16));
}

void *sub_10000606C(void *result, int64_t a2, char a3, void *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = a4[3];
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100005FE8(&qword_10000C4A0);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 3);
  }
  else
  {
    uint64_t v10 = &_swiftEmptyArrayStorage;
  }
  if (v5)
  {
    if (v10 != a4 || v10 + 4 >= &a4[v8 + 4]) {
      memmove(v10 + 4, a4 + 4, 8 * v8);
    }
    a4[2] = 0;
  }
  else
  {
    sub_100005FE8(&qword_10000C4A8);
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return v10;
}

void sub_100006190(uint64_t a1, NSObject *a2, void *a3, uint64_t a4)
{
  v39 = a3;
  uint64_t v40 = a4;
  dispatch_group_t v38 = a2;
  uint64_t v44 = sub_100006E78();
  __chkstk_darwin();
  unint64_t v6 = (char *)v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (void (**)(char *, uint64_t))(v7 + 8);
  v36 = v46;
  uint64_t v32 = a1 + 32;
  uint64_t v33 = a1;
  swift_bridgeObjectRetain();
  unint64_t v34 = 0;
  uint64_t v9 = &AddTagsActionExtensionController;
  v37 = v8;
  v35 = v6;
  do
  {
LABEL_19:
    unint64_t v28 = *(void *)(v33 + 16);
    if (v34 == v28)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return;
    }
    if (v34 >= v28) {
      goto LABEL_26;
    }
    unint64_t v29 = v34 + 1;
    uint64_t v30 = *(void *)(v32 + 8 * v34);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v25 = v30;
    unint64_t v34 = v29;
  }
  while (!v30);
  unint64_t v10 = 0;
  uint64_t v11 = v25 & 0xFFFFFFFFFFFFFF8;
  if (v25 >= 0) {
    uint64_t v12 = v25 & 0xFFFFFFFFFFFFFF8;
  }
  else {
    uint64_t v12 = v25;
  }
  v31[1] = v12;
  uint64_t v42 = v25 & 0xFFFFFFFFFFFFFF8;
  unint64_t v43 = v25 & 0xC000000000000001;
  uint64_t v41 = v25;
  while (1)
  {
    if ((unint64_t)v25 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v27 = sub_100007068();
      swift_bridgeObjectRelease();
      if (v10 == v27) {
        goto LABEL_19;
      }
    }
    else if (v10 == *(void *)(v11 + 16))
    {
      goto LABEL_19;
    }
    if (!v43) {
      break;
    }
    id v14 = (id)sub_100006FF8();
LABEL_13:
    uint64_t v15 = v14;
    if (__OFADD__(v10, 1)) {
      goto LABEL_25;
    }
    sub_100006E68();
    sub_100006E58();
    v16 = *v8;
    (*v8)(v6, v44);
    NSString v17 = sub_100006ED8();
    swift_bridgeObjectRelease();
    unsigned int v18 = objc_msgSend(v15, (SEL)v9[8].base_meths, v17);

    if (v18)
    {
      dispatch_group_t v19 = v38;
      dispatch_group_enter(v38);
      sub_100006E68();
      sub_100006E58();
      v16(v6, v44);
      objc_super v13 = sub_100006ED8();
      swift_bridgeObjectRelease();
      v20 = (void *)swift_allocObject();
      unint64_t v21 = v39;
      uint64_t v22 = v40;
      v20[2] = v19;
      v20[3] = v21;
      v20[4] = v22;
      v46[2] = sub_100006BEC;
      v46[3] = v20;
      aBlock[0] = _NSConcreteStackBlock;
      aBlock[1] = 1107296256;
      v46[0] = sub_100004F98;
      v46[1] = &unk_100008580;
      v23 = _Block_copy(aBlock);
      v24 = v19;
      uint64_t v25 = v41;
      id v26 = v21;
      unint64_t v6 = v35;
      uint64_t v8 = v37;
      uint64_t v9 = &AddTagsActionExtensionController;
      swift_retain();
      swift_release();
      [v15 loadItemForTypeIdentifier:v13 options:0 completionHandler:v23];
      _Block_release(v23);
    }
    else
    {
      sub_100006DA8(0, &qword_10000C470);
      objc_super v13 = (void *)sub_100006FC8();
      sub_100006F88();
      sub_100006E88();
    }
    uint64_t v11 = v42;

    ++v10;
  }
  if (v10 < *(void *)(v11 + 16))
  {
    id v14 = *(id *)(v25 + 8 * v10 + 32);
    goto LABEL_13;
  }
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
}

uint64_t sub_100006588(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v36 = a2;
  uint64_t v5 = sub_100006EA8();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100006EC8();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin();
  uint64_t v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v38 = swift_allocObject();
  *(void *)(v38 + 16) = &_swiftEmptyArrayStorage;
  dispatch_group_t v35 = dispatch_group_create();
  id v34 = [objc_allocWithZone((Class)NSLock) init];
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_100007068();
    uint64_t v13 = result;
  }
  else
  {
    uint64_t v13 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
  }
  uint64_t v43 = v6;
  uint64_t v44 = v5;
  uint64_t v41 = v8;
  uint64_t v42 = v9;
  v39 = v12;
  uint64_t v40 = v10;
  uint64_t v37 = a3;
  if (!v13)
  {
    v16 = &_swiftEmptyArrayStorage;
LABEL_18:
    swift_bridgeObjectRelease();
    v24 = v35;
    id v25 = v34;
    uint64_t v26 = v38;
    swift_retain();
    sub_100006190((uint64_t)v16, v24, v25, v26);
    swift_bridgeObjectRelease();

    swift_release();
    sub_100006DA8(0, &qword_10000C478);
    uint64_t v27 = (void *)sub_100006FA8();
    unint64_t v28 = (void *)swift_allocObject();
    uint64_t v29 = v37;
    v28[2] = v36;
    v28[3] = v29;
    v28[4] = v26;
    aBlock[4] = sub_100006ADC;
    aBlock[5] = v28;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    void aBlock[2] = sub_100005084;
    aBlock[3] = &unk_100008530;
    uint64_t v30 = _Block_copy(aBlock);
    swift_retain();
    swift_retain();
    v31 = v39;
    sub_100006EB8();
    v45 = &_swiftEmptyArrayStorage;
    sub_100006AE8();
    sub_100005FE8(&qword_10000C488);
    sub_100006B40();
    uint64_t v32 = v41;
    uint64_t v33 = v44;
    sub_100006FD8();
    sub_100006F98();

    _Block_release(v30);
    (*(void (**)(char *, uint64_t))(v43 + 8))(v32, v33);
    (*(void (**)(char *, uint64_t))(v40 + 8))(v31, v42);
    swift_release();
    return swift_release();
  }
  if (v13 >= 1)
  {
    uint64_t v15 = 0;
    v16 = &_swiftEmptyArrayStorage;
    do
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v17 = (id)sub_100006FF8();
      }
      else {
        id v17 = *(id *)(a1 + 8 * v15 + 32);
      }
      unsigned int v18 = v17;
      id v19 = objc_msgSend(v17, "attachments", v34);
      if (v19)
      {
        v20 = v19;
        sub_100006DA8(0, &qword_10000C498);
        uint64_t v21 = sub_100006F38();

        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
          v16 = sub_10000606C(0, v16[2] + 1, 1, v16);
        }
        unint64_t v23 = v16[2];
        unint64_t v22 = v16[3];
        if (v23 >= v22 >> 1) {
          v16 = sub_10000606C((void *)(v22 > 1), v23 + 1, 1, v16);
        }
        v16[2] = v23 + 1;
        v16[v23 + 4] = v21;
      }
      else
      {
      }
      ++v15;
    }
    while (v13 != v15);
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

uint64_t sub_100006A64()
{
  swift_bridgeObjectRelease();
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100006A9C()
{
  swift_release();
  swift_release();
  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100006ADC()
{
  return sub_100005018(*(void (**)(uint64_t, void))(v0 + 16));
}

unint64_t sub_100006AE8()
{
  unint64_t result = qword_10000C480;
  if (!qword_10000C480)
  {
    sub_100006EA8();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C480);
  }
  return result;
}

unint64_t sub_100006B40()
{
  unint64_t result = qword_10000C490;
  if (!qword_10000C490)
  {
    sub_100006B9C(&qword_10000C488);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C490);
  }
  return result;
}

uint64_t sub_100006B9C(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100006BEC(void **a1, uint64_t a2)
{
  return sub_1000049C0(a1, a2, *(void **)(v2 + 16), *(void **)(v2 + 24), *(void *)(v2 + 32));
}

uint64_t sub_100006BF8(uint64_t a1)
{
  uint64_t v2 = sub_100005FE8(&qword_10000C4B0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_100006C5C()
{
  swift_release();
  return _swift_deallocObject(v0, 40, 7);
}

void sub_100006CA4(void *a1, uint64_t a2)
{
  sub_100004D60(a1, a2, *(NSObject **)(v2 + 16), *(void **)(v2 + 24), *(void *)(v2 + 32));
}

unint64_t sub_100006CB0()
{
  unint64_t result = qword_10000C528;
  if (!qword_10000C528)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10000C528);
  }
  return result;
}

uint64_t sub_100006D04()
{
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 32, 7);
}

void sub_100006D44()
{
  sub_1000057D4(*(void *)(v0 + 16), *(void **)(v0 + 24));
}

uint64_t sub_100006D4C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100006DA8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100006E04()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_100006E38(NSURL *retstr@<X8>)
{
}

uint64_t sub_100006E48()
{
  return type metadata accessor for URL();
}

uint64_t sub_100006E58()
{
  return UTType.identifier.getter();
}

uint64_t sub_100006E68()
{
  return static UTType.url.getter();
}

uint64_t sub_100006E78()
{
  return type metadata accessor for UTType();
}

uint64_t sub_100006E88()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t sub_100006E98()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_100006EA8()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_100006EB8()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_100006EC8()
{
  return type metadata accessor for DispatchQoS();
}

NSString sub_100006ED8()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100006EE8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100006EF8()
{
  return String.init<A>(describing:)();
}

void sub_100006F08(Swift::String a1)
{
}

uint64_t sub_100006F18()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100006F28()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100006F38()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100006F48()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100006F58()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100006F68()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100006F78()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_100006F88()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_100006F98()
{
  return OS_dispatch_group.notify(qos:flags:queue:execute:)();
}

uint64_t sub_100006FA8()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_100006FB8()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_100006FC8()
{
  return static OS_os_log.default.getter();
}

uint64_t sub_100006FD8()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

void sub_100006FE8(Swift::Int a1)
{
}

uint64_t sub_100006FF8()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100007008()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100007018()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_100007028()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_100007038()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100007048()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100007058()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100007068()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
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

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
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

uint64_t swift_unknownObjectRetain()
{
  return _swift_unknownObjectRetain();
}