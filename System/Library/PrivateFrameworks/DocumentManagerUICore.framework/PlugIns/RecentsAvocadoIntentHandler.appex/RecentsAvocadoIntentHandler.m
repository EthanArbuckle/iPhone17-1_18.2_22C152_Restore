void sub_100002318(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  NSObject *v10;
  char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  void *v15;
  char *v16;
  objc_class *v17;
  objc_class *v18;
  NSBundle v19;
  id v20;
  NSString v21;
  NSString v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  char *v31;
  uint64_t v32;
  Swift::String v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void aBlock[6];
  Swift::String v43;
  Swift::String v44;
  Swift::String v45;

  v35 = a2;
  v36 = a3;
  v4 = sub_100005E18();
  v39 = *(void *)(v4 - 8);
  v40 = v4;
  __chkstk_darwin();
  v6 = (char *)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_100005E48();
  v37 = *(void *)(v7 - 8);
  v38 = v7;
  __chkstk_darwin();
  v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *(NSObject **)&a1[OBJC_IVAR____TtC27RecentsAvocadoIntentHandler36RecentsHomeScreenWidgetIntentHandler_dispatchGroup];
  dispatch_group_enter(v10);
  v11 = a1;
  sub_1000052E4(v11);

  dispatch_group_enter(v10);
  v12 = v11;
  sub_1000056CC(v12);

  dispatch_group_enter(v10);
  v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  v14 = v12;
  sub_100003BC8((uint64_t)sub_100005B9C, v13);
  swift_release();
  dispatch_group_enter(v10);
  v15 = (void *)DOCIntentLocationTypeCustomFolder;
  sub_100005E68();
  v16 = v14;
  v17 = (objc_class *)(id)_DocumentManagerBundle();
  if (v17)
  {
    v18 = v17;
    v33._countAndFlagsBits = 0x80000001000069C0;
    v43._countAndFlagsBits = 0x7265646C6F46;
    v43._object = (void *)0xE600000000000000;
    v44._countAndFlagsBits = 0x617A696C61636F4CLL;
    v44._object = (void *)0xEB00000000656C62;
    v19.super.isa = v18;
    v45._countAndFlagsBits = 0;
    v45._object = (void *)0xE000000000000000;
    sub_100005DD8(v43, v44, v19, v45, v33);

    v20 = v15;
    v21 = sub_100005E58();
    swift_bridgeObjectRelease();
    v22 = sub_100005E58();
    swift_bridgeObjectRelease();
    v23 = [self intentLocationWithIdentifier:v21 displayString:v22 type:v20];

    sub_100004830(&qword_10000D108);
    v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_100006540;
    *(void *)(v24 + 32) = v23;
    aBlock[0] = v24;
    sub_100005EA8();
    v25 = aBlock[0];
    v26 = v23;
    sub_100002B04(v25, v16, &OBJC_IVAR____TtC27RecentsAvocadoIntentHandler36RecentsHomeScreenWidgetIntentHandler_customFolder, "provideLocationOptionsCollection() received %ld custom location item. Error: %s");

    swift_bridgeObjectRelease();
    v27 = (void *)swift_allocObject();
    v28 = v35;
    v29 = v36;
    v27[2] = v16;
    v27[3] = v28;
    v27[4] = v29;
    aBlock[4] = sub_100005BE8;
    aBlock[5] = v27;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_10000351C;
    aBlock[3] = &unk_100008690;
    v30 = _Block_copy(aBlock);
    v31 = v16;
    swift_retain();
    sub_100005E28();
    v41 = &_swiftEmptyArrayStorage;
    sub_1000048BC(&qword_10000D0C8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
    sub_100004830(&qword_10000D0D0);
    sub_100004904(&qword_10000D0D8, &qword_10000D0D0);
    v32 = v40;
    sub_100005F58();
    sub_100005EC8();
    _Block_release(v30);
    (*(void (**)(char *, uint64_t))(v39 + 8))(v6, v32);
    (*(void (**)(char *, uint64_t))(v37 + 8))(v9, v38);
    swift_release();
  }
  else
  {

    __break(1u);
  }
}

void sub_100002800(uint64_t a1, uint64_t a2, char *a3)
{
  uint64_t v6 = sub_100005E08();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = OBJC_IVAR____TtC27RecentsAvocadoIntentHandler36RecentsHomeScreenWidgetIntentHandler_favorites;
  *(void *)&a3[OBJC_IVAR____TtC27RecentsAvocadoIntentHandler36RecentsHomeScreenWidgetIntentHandler_favorites] = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_100005DE8();
  swift_errorRetain();
  swift_errorRetain();
  v11 = a3;
  v12 = sub_100005DF8();
  os_log_type_t v13 = sub_100005EB8();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v20 = v6;
    v21 = v11;
    uint64_t v14 = swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 134218242;
    unint64_t v15 = *(void *)&a3[v10];
    if (v15 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v16 = sub_100005FF8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v16 = *(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v22 = v16;
    sub_100005F28();

    *(_WORD *)(v14 + 12) = 2080;
    if (a2)
    {
      swift_getErrorValue();
      uint64_t v17 = sub_100006018();
      unint64_t v19 = v18;
    }
    else
    {
      unint64_t v19 = 0xE300000000000000;
      uint64_t v17 = 7104878;
    }
    uint64_t v22 = sub_100004954(v17, v19, &v23);
    sub_100005F28();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "provideLocationOptionsCollection() received %ld favorites. Error: %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v20);
    v11 = v21;
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  dispatch_group_leave(*(dispatch_group_t *)&v11[OBJC_IVAR____TtC27RecentsAvocadoIntentHandler36RecentsHomeScreenWidgetIntentHandler_dispatchGroup]);
}

void sub_100002B04(uint64_t a1, char *a2, uint64_t *a3, const char *a4)
{
  uint64_t v8 = sub_100005E08();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin();
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = *a3;
  *(void *)&a2[*a3] = a1;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  sub_100005DE8();
  swift_errorRetain();
  swift_errorRetain();
  os_log_type_t v13 = a2;
  uint64_t v14 = sub_100005DF8();
  os_log_type_t v15 = sub_100005EB8();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v20 = a4;
    uint64_t v16 = swift_slowAlloc();
    uint64_t v22 = swift_slowAlloc();
    *(_DWORD *)uint64_t v16 = 134218242;
    unint64_t v17 = *(void *)&a2[v12];
    if (v17 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v18 = sub_100005FF8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v18 = *(void *)((v17 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v21 = v18;
    sub_100005F28();

    *(_WORD *)(v16 + 12) = 2080;
    uint64_t v21 = sub_100004954(7104878, 0xE300000000000000, &v22);
    sub_100005F28();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, v20, (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {

    swift_errorRelease();
    swift_errorRelease();
  }

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  dispatch_group_leave(*(dispatch_group_t *)&v13[OBJC_IVAR____TtC27RecentsAvocadoIntentHandler36RecentsHomeScreenWidgetIntentHandler_dispatchGroup]);
}

void sub_100002DB0(void *a1, void (*a2)(id, void), uint64_t a3)
{
  v55[1] = a3;
  v56 = a2;
  uint64_t v4 = sub_100005E08();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)v55 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005DE8();
  uint64_t v8 = a1;
  uint64_t v9 = sub_100005DF8();
  os_log_type_t v10 = sub_100005EB8();
  if (os_log_type_enabled(v9, v10))
  {
    uint64_t v11 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 134218496;
    unint64_t v12 = *(unint64_t *)((char *)&v8->isa
                              + OBJC_IVAR____TtC27RecentsAvocadoIntentHandler36RecentsHomeScreenWidgetIntentHandler_defaultLocations);
    if (v12 >> 62)
    {
      v55[0] = *((char *)v8
                           + OBJC_IVAR____TtC27RecentsAvocadoIntentHandler36RecentsHomeScreenWidgetIntentHandler_defaultLocations);
      swift_bridgeObjectRetain();
      uint64_t v13 = sub_100005FF8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v57 = v13;
    sub_100005F28();
    *(_WORD *)(v11 + 12) = 2048;
    unint64_t v14 = *(unint64_t *)((char *)&v8->isa
                              + OBJC_IVAR____TtC27RecentsAvocadoIntentHandler36RecentsHomeScreenWidgetIntentHandler_favorites);
    if (v14 >> 62)
    {
      v55[0] = *((char *)v8
                           + OBJC_IVAR____TtC27RecentsAvocadoIntentHandler36RecentsHomeScreenWidgetIntentHandler_favorites);
      swift_bridgeObjectRetain();
      uint64_t v15 = sub_100005FF8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v15 = *(void *)((v14 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v57 = v15;
    sub_100005F28();
    *(_WORD *)(v11 + 22) = 2048;
    unint64_t v16 = *(unint64_t *)((char *)&v8->isa
                              + OBJC_IVAR____TtC27RecentsAvocadoIntentHandler36RecentsHomeScreenWidgetIntentHandler_tags);
    if (v16 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v17 = sub_100005FF8();
      swift_bridgeObjectRelease();
    }
    else
    {
      uint64_t v17 = *(void *)((v16 & 0xFFFFFFFFFFFFFF8) + 0x10);
    }
    uint64_t v57 = v17;
    sub_100005F28();

    _os_log_impl((void *)&_mh_execute_header, v9, v10, "provideLocationOptionsCollection() received %ld default locations %ld favorites and %ld tags.", (uint8_t *)v11, 0x20u);
    swift_slowDealloc();
  }
  else
  {

    uint64_t v9 = v8;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_100004830(&qword_10000D108);
  uint64_t v18 = swift_allocObject();
  *(_OWORD *)(v18 + 16) = xmmword_100006550;
  uint64_t v19 = (objc_class *)(id)_DocumentManagerBundle();
  if (!v19)
  {
    __break(1u);
    goto LABEL_19;
  }
  uint64_t v20 = v19;
  v51._countAndFlagsBits = 0x80000001000069F0;
  v58._countAndFlagsBits = 0x6E6F697461636F4CLL;
  v58._object = (void *)0xE900000000000073;
  v62._countAndFlagsBits = 0x617A696C61636F4CLL;
  v62._object = (void *)0xEB00000000656C62;
  v21.super.Class isa = v20;
  v66._countAndFlagsBits = 0;
  v66._object = (void *)0xE000000000000000;
  sub_100005DD8(v58, v62, v21, v66, v51);

  id v22 = objc_allocWithZone((Class)INObjectSection);
  swift_bridgeObjectRetain();
  NSString v23 = sub_100005E58();
  swift_bridgeObjectRelease();
  sub_100005D54(0, &qword_10000D100);
  Class isa = sub_100005E88().super.isa;
  swift_bridgeObjectRelease();
  id v25 = [v22 initWithTitle:v23 items:isa];

  *(void *)(v18 + 32) = v25;
  v26 = (objc_class *)(id)_DocumentManagerBundle();
  if (!v26)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v27 = v26;
  v52._countAndFlagsBits = 0x8000000100006A10;
  v59._countAndFlagsBits = 0x657469726F766146;
  v59._object = (void *)0xE900000000000073;
  v63._countAndFlagsBits = 0x617A696C61636F4CLL;
  v63._object = (void *)0xEB00000000656C62;
  v28.super.Class isa = v27;
  v67._countAndFlagsBits = 0;
  v67._object = (void *)0xE000000000000000;
  sub_100005DD8(v59, v63, v28, v67, v52);

  id v29 = objc_allocWithZone((Class)INObjectSection);
  swift_bridgeObjectRetain();
  NSString v30 = sub_100005E58();
  swift_bridgeObjectRelease();
  Class v31 = sub_100005E88().super.isa;
  swift_bridgeObjectRelease();
  id v32 = [v29 initWithTitle:v30 items:v31];

  *(void *)(v18 + 40) = v32;
  v33 = (objc_class *)(id)_DocumentManagerBundle();
  if (!v33)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v34 = v33;
  v53._countAndFlagsBits = 0x8000000100006A30;
  v60._countAndFlagsBits = 1936154964;
  v60._object = (void *)0xE400000000000000;
  v64._countAndFlagsBits = 0x617A696C61636F4CLL;
  v64._object = (void *)0xEB00000000656C62;
  v35.super.Class isa = v34;
  v68._countAndFlagsBits = 0;
  v68._object = (void *)0xE000000000000000;
  sub_100005DD8(v60, v64, v35, v68, v53);

  id v36 = objc_allocWithZone((Class)INObjectSection);
  swift_bridgeObjectRetain();
  NSString v37 = sub_100005E58();
  swift_bridgeObjectRelease();
  Class v38 = sub_100005E88().super.isa;
  swift_bridgeObjectRelease();
  id v39 = [v36 initWithTitle:v37 items:v38];

  *(void *)(v18 + 48) = v39;
  v40 = (objc_class *)(id)_DocumentManagerBundle();
  if (v40)
  {
    v41 = v40;
    v54._countAndFlagsBits = 0x8000000100006A50;
    v61._countAndFlagsBits = 0x462061206B636950;
    v61._object = (void *)0xED00007265646C6FLL;
    v65._countAndFlagsBits = 0x617A696C61636F4CLL;
    v65._object = (void *)0xEB00000000656C62;
    v42.super.Class isa = v41;
    v69._countAndFlagsBits = 0;
    v69._object = (void *)0xE000000000000000;
    sub_100005DD8(v61, v65, v42, v69, v54);

    id v43 = objc_allocWithZone((Class)INObjectSection);
    swift_bridgeObjectRetain();
    NSString v44 = sub_100005E58();
    swift_bridgeObjectRelease();
    Class v45 = sub_100005E88().super.isa;
    swift_bridgeObjectRelease();
    id v46 = [v43 initWithTitle:v44 items:v45];

    *(void *)(v18 + 56) = v46;
    uint64_t v57 = v18;
    sub_100005EA8();
    id v47 = objc_allocWithZone((Class)INObjectCollection);
    sub_100004830(&qword_10000D110);
    Class v48 = sub_100005E88().super.isa;
    swift_bridgeObjectRelease();
    id v49 = [v47 initWithSections:v48];

    id v50 = v49;
    v56(v49, 0);

    return;
  }
LABEL_21:
  __break(1u);
}

uint64_t sub_100003520(uint64_t a1)
{
  v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_100003600(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2) {
    uint64_t v5 = sub_100005DA8();
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);
}

id sub_100003698()
{
  v1 = v0;
  uint64_t v2 = sub_100005EF8();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005EE8();
  __chkstk_darwin();
  sub_100005E48();
  __chkstk_darwin();
  *(void *)&v1[OBJC_IVAR____TtC27RecentsAvocadoIntentHandler36RecentsHomeScreenWidgetIntentHandler_defaultLocations] = &_swiftEmptyArrayStorage;
  *(void *)&v1[OBJC_IVAR____TtC27RecentsAvocadoIntentHandler36RecentsHomeScreenWidgetIntentHandler_tags] = &_swiftEmptyArrayStorage;
  *(void *)&v1[OBJC_IVAR____TtC27RecentsAvocadoIntentHandler36RecentsHomeScreenWidgetIntentHandler_favorites] = &_swiftEmptyArrayStorage;
  *(void *)&v1[OBJC_IVAR____TtC27RecentsAvocadoIntentHandler36RecentsHomeScreenWidgetIntentHandler_customFolder] = &_swiftEmptyArrayStorage;
  uint64_t v6 = OBJC_IVAR____TtC27RecentsAvocadoIntentHandler36RecentsHomeScreenWidgetIntentHandler_dispatchQueue;
  sub_100005D54(0, &qword_10000D0E0);
  uint64_t v7 = v1;
  sub_100005E38();
  sub_100005ED8();
  (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v2);
  *(void *)&v1[v6] = sub_100005F18();
  uint64_t v8 = OBJC_IVAR____TtC27RecentsAvocadoIntentHandler36RecentsHomeScreenWidgetIntentHandler_dispatchGroup;
  *(void *)&v7[v8] = dispatch_group_create();
  uint64_t v9 = OBJC_IVAR____TtC27RecentsAvocadoIntentHandler36RecentsHomeScreenWidgetIntentHandler_defaultLocationsSource;
  type metadata accessor for DefaultLocationsSource();
  *(void *)&v7[v9] = swift_allocObject();
  uint64_t v10 = OBJC_IVAR____TtC27RecentsAvocadoIntentHandler36RecentsHomeScreenWidgetIntentHandler_tagsSource;
  type metadata accessor for TagItemsSource();
  *(void *)&v7[v10] = swift_allocObject();
  uint64_t v11 = OBJC_IVAR____TtC27RecentsAvocadoIntentHandler36RecentsHomeScreenWidgetIntentHandler_favoritesSource;
  *(void *)&v7[v11] = [objc_allocWithZone((Class)type metadata accessor for FavoritesItemsSource()) init];
  uint64_t v12 = OBJC_IVAR____TtC27RecentsAvocadoIntentHandler36RecentsHomeScreenWidgetIntentHandler_pickFolderSource;
  *(void *)&v7[v12] = [objc_allocWithZone((Class)type metadata accessor for PickFolderSource()) init];

  uint64_t v13 = (objc_class *)type metadata accessor for RecentsHomeScreenWidgetIntentHandler();
  v15.receiver = v7;
  v15.super_class = v13;
  return objc_msgSendSuper2(&v15, "init");
}

id sub_10000396C()
{
  return sub_100004724(type metadata accessor for RecentsHomeScreenWidgetIntentHandler);
}

uint64_t type metadata accessor for RecentsHomeScreenWidgetIntentHandler()
{
  return self;
}

uint64_t type metadata accessor for DefaultLocationsSource()
{
  return self;
}

void *sub_100003A98(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  result = &_swiftEmptyArrayStorage;
  if (v2)
  {
    uint64_t v6 = &_swiftEmptyArrayStorage;
    sub_100005FB8();
    uint64_t v4 = a1 + 32;
    do
    {
      sub_100005C44(v4, (uint64_t)&v5);
      sub_100005D54(0, (unint64_t *)&unk_10000D120);
      swift_dynamicCast();
      sub_100005F98();
      sub_100005FC8();
      sub_100005FD8();
      sub_100005FA8();
      v4 += 32;
      --v2;
    }
    while (v2);
    return v6;
  }
  return result;
}

uint64_t sub_100003B94()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for TagItemsSource()
{
  return self;
}

uint64_t sub_100003BC8(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = sub_100005E18();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[0] = sub_100005E48();
  uint64_t v9 = *(void *)(v18[0] - 8);
  __chkstk_darwin();
  uint64_t v11 = (char *)v18 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = &v2[OBJC_IVAR____TtC27RecentsAvocadoIntentHandler20FavoritesItemsSource_completion];
  uint64_t v13 = *(void *)&v2[OBJC_IVAR____TtC27RecentsAvocadoIntentHandler20FavoritesItemsSource_completion];
  *(void *)uint64_t v12 = a1;
  *((void *)v12 + 1) = a2;
  swift_retain();
  sub_100004790(v13);
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v2;
  aBlock[4] = sub_1000047D8;
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000351C;
  aBlock[3] = &unk_1000085A0;
  objc_super v15 = _Block_copy(aBlock);
  unint64_t v16 = v2;
  sub_100005E28();
  v18[1] = &_swiftEmptyArrayStorage;
  sub_1000048BC(&qword_10000D0C8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100004830(&qword_10000D0D0);
  sub_100004904(&qword_10000D0D8, &qword_10000D0D0);
  sub_100005F58();
  sub_100005F08();
  _Block_release(v15);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  (*(void (**)(char *, void))(v9 + 8))(v11, v18[0]);
  return swift_release();
}

id sub_100003EA0()
{
  uint64_t v1 = OBJC_IVAR____TtC27RecentsAvocadoIntentHandler20FavoritesItemsSource____lazy_storage___itemCollection;
  uint64_t v2 = *(void **)(v0
                + OBJC_IVAR____TtC27RecentsAvocadoIntentHandler20FavoritesItemsSource____lazy_storage___itemCollection);
  if (v2)
  {
    id v3 = *(id *)(v0
               + OBJC_IVAR____TtC27RecentsAvocadoIntentHandler20FavoritesItemsSource____lazy_storage___itemCollection);
  }
  else
  {
    id v4 = [self favoritesCollection];
    [v4 setDelegate:v0];
    [v4 setWorkingQueue:*(void *)(v0 + OBJC_IVAR____TtC27RecentsAvocadoIntentHandler20FavoritesItemsSource_queue)];
    uint64_t v5 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v4;
    id v3 = v4;

    uint64_t v2 = 0;
  }
  id v6 = v2;
  return v3;
}

void sub_100003F4C(char a1)
{
  char v2 = *(unsigned char *)(v1
                + OBJC_IVAR____TtC27RecentsAvocadoIntentHandler20FavoritesItemsSource_hasSeenInitiallyGatheredFavorites);
  *(unsigned char *)(v1 + OBJC_IVAR____TtC27RecentsAvocadoIntentHandler20FavoritesItemsSource_hasSeenInitiallyGatheredFavorites) = a1;
  if ((a1 & 1) != 0 && (v2 & 1) == 0)
  {
    id v3 = (uint64_t *)(v1 + OBJC_IVAR____TtC27RecentsAvocadoIntentHandler20FavoritesItemsSource_completion);
    id v4 = *(void (**)(uint64_t, void))(v1
                                                + OBJC_IVAR____TtC27RecentsAvocadoIntentHandler20FavoritesItemsSource_completion);
    if (v4)
    {
      sub_100004780((uint64_t)v4);
      uint64_t v5 = swift_bridgeObjectRetain();
      v4(v5, 0);
      sub_100004790((uint64_t)v4);
      swift_bridgeObjectRelease();
      uint64_t v6 = *v3;
    }
    else
    {
      uint64_t v6 = 0;
    }
    *id v3 = 0;
    v3[1] = 0;
    sub_100004790(v6);
    id v7 = sub_100003EA0();
    [v7 stopObserving];
  }
}

void sub_100004050(char a1)
{
  uint64_t v2 = v1;
  id v4 = sub_100003EA0();
  id v5 = [v4 items];

  sub_100005D54(0, &qword_10000D0C0);
  unint64_t v6 = sub_100005E98();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100005FF8();
    swift_bridgeObjectRelease();
    if (!v7) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v7) {
      goto LABEL_11;
    }
  }
  sub_100005FB8();
  if (v7 < 0)
  {
    __break(1u);
    return;
  }
  uint64_t v8 = self;
  uint64_t v9 = 0;
  do
  {
    if ((v6 & 0xC000000000000001) != 0) {
      id v10 = (id)sub_100005F78();
    }
    else {
      id v10 = *(id *)(v6 + 8 * v9 + 32);
    }
    uint64_t v11 = v10;
    ++v9;
    id v12 = [v8 intentLocationWithItem:v10];

    sub_100005F98();
    sub_100005FC8();
    sub_100005FD8();
    sub_100005FA8();
  }
  while (v7 != v9);
LABEL_11:
  swift_bridgeObjectRelease();
  *(void *)(v2 + OBJC_IVAR____TtC27RecentsAvocadoIntentHandler20FavoritesItemsSource_items) = &_swiftEmptyArrayStorage;
  swift_bridgeObjectRelease();
  sub_100003F4C(a1 & 1);
}

id sub_100004240()
{
  uint64_t v10 = sub_100005EF8();
  uint64_t v1 = *(void *)(v10 - 8);
  __chkstk_darwin();
  id v3 = (char *)v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100005EE8();
  __chkstk_darwin();
  sub_100005E48();
  __chkstk_darwin();
  uint64_t v9 = OBJC_IVAR____TtC27RecentsAvocadoIntentHandler20FavoritesItemsSource_queue;
  v8[1] = sub_100005D54(0, &qword_10000D0E0);
  id v4 = v0;
  sub_100005E38();
  id v12 = &_swiftEmptyArrayStorage;
  sub_1000048BC(&qword_10000D0E8, (void (*)(uint64_t))&type metadata accessor for OS_dispatch_queue.Attributes);
  sub_100004830(&qword_10000D0F0);
  sub_100004904(&qword_10000D0F8, &qword_10000D0F0);
  sub_100005F58();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for OS_dispatch_queue.AutoreleaseFrequency.inherit(_:), v10);
  *(void *)(v8[2] + v9) = sub_100005F18();
  id v5 = &v4[OBJC_IVAR____TtC27RecentsAvocadoIntentHandler20FavoritesItemsSource_completion];
  *id v5 = 0;
  v5[1] = 0;
  *(void *)&v4[OBJC_IVAR____TtC27RecentsAvocadoIntentHandler20FavoritesItemsSource_items] = &_swiftEmptyArrayStorage;
  *(void *)&v4[OBJC_IVAR____TtC27RecentsAvocadoIntentHandler20FavoritesItemsSource____lazy_storage___itemCollection] = 0;
  v4[OBJC_IVAR____TtC27RecentsAvocadoIntentHandler20FavoritesItemsSource_hasSeenInitiallyGatheredFavorites] = 0;

  unint64_t v6 = (objc_class *)type metadata accessor for FavoritesItemsSource();
  v11.receiver = v4;
  v11.super_class = v6;
  return objc_msgSendSuper2(&v11, "init");
}

id sub_100004528()
{
  return sub_100004724(type metadata accessor for FavoritesItemsSource);
}

uint64_t type metadata accessor for FavoritesItemsSource()
{
  return self;
}

id sub_10000470C()
{
  return sub_100004724(type metadata accessor for PickFolderSource);
}

id sub_100004724(uint64_t (*a1)(void))
{
  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, "dealloc");
}

uint64_t type metadata accessor for PickFolderSource()
{
  return self;
}

uint64_t sub_100004780(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_100004790(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

uint64_t sub_1000047A0()
{
  return _swift_deallocObject(v0, 24, 7);
}

void sub_1000047D8()
{
  id v0 = sub_100003EA0();
  [v0 startObserving];

  sub_100004050(0);
}

uint64_t sub_100004818(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100004828()
{
  return swift_release();
}

uint64_t sub_100004830(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100004874(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000048BC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100004904(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100004874(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100004954(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100004A28(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_100005C44((uint64_t)v12, *a3);
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
      sub_100005C44((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100005BF4((uint64_t)v12);
  return v7;
}

uint64_t sub_100004A28(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_100005F38();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100004BE4(a5, a6);
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
  uint64_t v8 = sub_100005F88();
  if (!v8)
  {
    sub_100005FE8();
    __break(1u);
LABEL_17:
    uint64_t result = sub_100006008();
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

uint64_t sub_100004BE4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100004C7C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100004E5C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100004E5C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100004C7C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100004DF4(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_100005F68();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_100005FE8();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_100005E78();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_100006008();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_100005FE8();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100004DF4(uint64_t a1, uint64_t a2)
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
  sub_100004830(&qword_10000D118);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100004E5C(char a1, int64_t a2, char a3, char *a4)
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
    sub_100004830(&qword_10000D118);
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
  uint64_t result = sub_100006008();
  __break(1u);
  return result;
}

uint64_t sub_100004FAC(uint64_t a1, uint64_t a2)
{
  uint64_t v20 = a1;
  uint64_t v4 = sub_100005E18();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  int64_t v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_100005E48();
  uint64_t v8 = *(void *)(v21 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v11 = [self defaultPermission];
  uint64_t v12 = DOCDocumentsAppBundleIdentifier;
  [v11 setHostIdentifier:DOCDocumentsAppBundleIdentifier];

  id v13 = [self sharedManager];
  [v13 setHostIdentifier:v12];

  uint64_t v14 = (void *)swift_allocObject();
  uint64_t v15 = v20;
  v14[2] = v2;
  v14[3] = v15;
  v14[4] = a2;
  aBlock[4] = sub_100005B90;
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10000351C;
  aBlock[3] = &unk_100008618;
  unint64_t v16 = _Block_copy(aBlock);
  id v17 = v2;
  swift_retain();
  sub_100005E28();
  id v22 = &_swiftEmptyArrayStorage;
  sub_1000048BC(&qword_10000D0C8, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_100004830(&qword_10000D0D0);
  sub_100004904(&qword_10000D0D8, &qword_10000D0D0);
  sub_100005F58();
  sub_100005F08();
  _Block_release(v16);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v21);
  return swift_release();
}

void sub_1000052E4(void *a1)
{
  sub_100004830(&qword_10000D108);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100006560;
  sub_100005E68();
  unint64_t v3 = (objc_class *)(id)_DocumentManagerBundle();
  if (!v3)
  {

    __break(1u);
    goto LABEL_8;
  }
  uint64_t v4 = v3;
  v25._countAndFlagsBits = 0x8000000100006CC0;
  v29._countAndFlagsBits = 0x73746E65636552;
  v29._object = (void *)0xE700000000000000;
  v32._countAndFlagsBits = 0x617A696C61636F4CLL;
  v32._object = (void *)0xEB00000000656C62;
  v5.super.Class isa = v4;
  v35._countAndFlagsBits = 0;
  v35._object = (void *)0xE000000000000000;
  sub_100005DD8(v29, v32, v5, v35, v25);

  id v6 = DOCIntentLocationTypeRecents;
  NSString v7 = sub_100005E58();
  swift_bridgeObjectRelease();
  NSString v8 = sub_100005E58();
  swift_bridgeObjectRelease();
  uint64_t v9 = self;
  id v10 = [v9 intentLocationWithIdentifier:v7 displayString:v8 type:v6];

  *(void *)(v2 + 32) = v10;
  sub_100005E68();
  id v11 = (objc_class *)(id)_DocumentManagerBundle();
  if (!v11)
  {
LABEL_8:

    __break(1u);
    goto LABEL_9;
  }
  uint64_t v12 = v11;
  v26._countAndFlagsBits = 0x8000000100006CF0;
  v30._countAndFlagsBits = 0x646572616853;
  v30._object = (void *)0xE600000000000000;
  v33._countAndFlagsBits = 0x617A696C61636F4CLL;
  v33._object = (void *)0xEB00000000656C62;
  v13.super.Class isa = v12;
  v36._countAndFlagsBits = 0;
  v36._object = (void *)0xE000000000000000;
  sub_100005DD8(v30, v33, v13, v36, v26);

  id v14 = DOCIntentLocationTypeShared;
  NSString v15 = sub_100005E58();
  swift_bridgeObjectRelease();
  NSString v16 = sub_100005E58();
  swift_bridgeObjectRelease();
  id v17 = [v9 intentLocationWithIdentifier:v15 displayString:v16 type:v14];

  *(void *)(v2 + 40) = v17;
  uint64_t v18 = (objc_class *)(id)_DocumentManagerBundle();
  if (!v18)
  {
LABEL_9:

    __break(1u);
    return;
  }
  uint64_t v19 = v18;
  v27._countAndFlagsBits = 0x8000000100006D50;
  v31._countAndFlagsBits = 0x64616F6C6E776F44;
  v31._object = (void *)0xE900000000000073;
  v34._countAndFlagsBits = 0x617A696C61636F4CLL;
  v34._object = (void *)0xEB00000000656C62;
  v20.super.Class isa = v19;
  v37._countAndFlagsBits = 0;
  v37._object = (void *)0xE000000000000000;
  sub_100005DD8(v31, v34, v20, v37, v27);

  id v21 = DOCIntentLocationTypeDownloads;
  NSString v22 = sub_100005E58();
  NSString v23 = sub_100005E58();
  swift_bridgeObjectRelease();
  id v24 = [v9 intentLocationWithIdentifier:v22 displayString:v23 type:v21];

  *(void *)(v2 + 48) = v24;
  sub_100005EA8();
  sub_100002B04(v2, (char *)a1, &OBJC_IVAR____TtC27RecentsAvocadoIntentHandler36RecentsHomeScreenWidgetIntentHandler_defaultLocations, "provideLocationOptionsCollection() received %ld locations. Error: %s");
  swift_bridgeObjectRelease();
}

uint64_t sub_1000056CC(char *a1)
{
  id v2 = [self sharedInstance];
  id v3 = [v2 userTags];

  id v4 = [v3 array];
  uint64_t v5 = sub_100005E98();

  unint64_t v6 = (unint64_t)sub_100003A98(v5);
  swift_bridgeObjectRelease();
  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100005FF8();
    swift_bridgeObjectRelease();
    if (v7) {
      goto LABEL_3;
    }
LABEL_14:
    swift_bridgeObjectRelease();
    goto LABEL_15;
  }
  uint64_t v7 = *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v7) {
    goto LABEL_14;
  }
LABEL_3:
  uint64_t result = sub_100005FB8();
  if (v7 < 0)
  {
    __break(1u);
    return result;
  }
  Swift::String v26 = a1;
  id v29 = self;
  uint64_t v9 = 0;
  unint64_t v27 = v6 & 0xC000000000000001;
  id v28 = self;
  do
  {
    if (v27) {
      id v11 = (UIImage *)sub_100005F78();
    }
    else {
      id v11 = (UIImage *)*(id *)(v6 + 8 * v9 + 32);
    }
    id v10 = v11;
    id v12 = [v29 intentLocationWithTag:v11];
    id v13 = [v28 requestForTag:v10 tagDimension:16.0];
    id v14 = [objc_allocWithZone((Class)DOCTagRenderer) init];
    NSString v15 = (UIImage *)[v14 renderImageWithRequest:v13];

    NSString v16 = UIImagePNGRepresentation(v15);
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = sub_100005DC8();
      Swift::String v31 = v13;
      unint64_t v20 = v19;

      id v21 = v12;
      sub_100005CA4(v18, v20);
      NSString v22 = (id *)v6;
      Class isa = sub_100005DB8().super.isa;
      Swift::String v30 = v15;
      uint64_t v24 = v7;
      id v25 = [self imageWithImageData:isa];
      sub_100005CFC(v18, v20);

      unint64_t v6 = (unint64_t)v22;
      [v21 setDisplayImage:v25];

      uint64_t v7 = v24;
      sub_100005CFC(v18, v20);
    }
    else
    {

      id v10 = v15;
    }

    ++v9;
    sub_100005F98();
    sub_100005FC8();
    sub_100005FD8();
    sub_100005FA8();
  }
  while (v7 != v9);
  swift_bridgeObjectRelease();
  a1 = v26;
LABEL_15:
  sub_100002B04((uint64_t)&_swiftEmptyArrayStorage, a1, &OBJC_IVAR____TtC27RecentsAvocadoIntentHandler36RecentsHomeScreenWidgetIntentHandler_tags, "provideLocationOptionsCollection() received %ld tags. Error: %s");
  return swift_bridgeObjectRelease();
}

void sub_100005A58()
{
  id v0 = (id)DOCCreateDefaultHomeScreenWidgetIntent();
  NSString v1 = sub_100005E58();
  id v2 = [v0 valueForKey:v1];

  if (v2)
  {
    sub_100005F48();

    swift_unknownObjectRelease();
    sub_100005B3C(&v3, &v4);
    sub_100005D54(0, &qword_10000D100);
    swift_dynamicCast();
  }
  else
  {
    __break(1u);
  }
}

_OWORD *sub_100005B3C(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100005B4C()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

void sub_100005B84(uint64_t a1, uint64_t a2)
{
  sub_100003600(a1, a2, *(void *)(v2 + 16));
}

void sub_100005B90()
{
  sub_100002318(*(char **)(v0 + 16), *(void *)(v0 + 24), *(void *)(v0 + 32));
}

void sub_100005B9C(uint64_t a1, uint64_t a2)
{
  sub_100002800(a1, a2, *(char **)(v2 + 16));
}

uint64_t sub_100005BA8()
{
  swift_release();
  return _swift_deallocObject(v0, 40, 7);
}

void sub_100005BE8()
{
  sub_100002DB0(*(void **)(v0 + 16), *(void (**)(id, void))(v0 + 24), *(void *)(v0 + 32));
}

uint64_t sub_100005BF4(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_100005C44(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100005CA4(uint64_t a1, unint64_t a2)
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

uint64_t sub_100005CFC(uint64_t a1, unint64_t a2)
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

uint64_t sub_100005D54(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100005DA8()
{
  return _convertErrorToNSError(_:)();
}

NSData sub_100005DB8()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_100005DC8()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100005DD8(Swift::String _, Swift::String tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return DOCLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

uint64_t sub_100005DE8()
{
  return static Logger.UI.getter();
}

uint64_t sub_100005DF8()
{
  return Logger.logObject.getter();
}

uint64_t sub_100005E08()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100005E18()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_100005E28()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_100005E38()
{
  return static DispatchQoS.userInitiated.getter();
}

uint64_t sub_100005E48()
{
  return type metadata accessor for DispatchQoS();
}

NSString sub_100005E58()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100005E68()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

Swift::Int sub_100005E78()
{
  return String.UTF8View._foreignCount()();
}

NSArray sub_100005E88()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100005E98()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100005EA8()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100005EB8()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_100005EC8()
{
  return OS_dispatch_group.notify(qos:flags:queue:execute:)();
}

uint64_t sub_100005ED8()
{
  return static OS_dispatch_queue.Attributes.concurrent.getter();
}

uint64_t sub_100005EE8()
{
  return type metadata accessor for OS_dispatch_queue.Attributes();
}

uint64_t sub_100005EF8()
{
  return type metadata accessor for OS_dispatch_queue.AutoreleaseFrequency();
}

uint64_t sub_100005F08()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_100005F18()
{
  return OS_dispatch_queue.init(label:qos:attributes:autoreleaseFrequency:target:)();
}

uint64_t sub_100005F28()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_100005F38()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_100005F48()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_100005F58()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_100005F68()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_100005F78()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100005F88()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_100005F98()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100005FA8()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_100005FB8()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_100005FC8()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100005FD8()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100005FE8()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100005FF8()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_100006008()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_100006018()
{
  return Error.localizedDescription.getter();
}

uint64_t DOCCreateDefaultHomeScreenWidgetIntent()
{
  return _DOCCreateDefaultHomeScreenWidgetIntent();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return _UIImagePNGRepresentation(image);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _DocumentManagerBundle()
{
  return __DocumentManagerBundle();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
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

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
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