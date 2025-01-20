unint64_t sub_100001FE8(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  long long v17;

  if (!*(void *)(a1 + 16))
  {
    v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_100002D88(&qword_100039450);
  v2 = sub_10002ABC0();
  v3 = (void *)v2;
  v4 = *(void *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_100002DCC(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_100002984(v15, v16);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_100002E34(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
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

uint64_t sub_100002114@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8 = sub_100029FB0();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  v11 = (char *)v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100002D88(&qword_100039460);
  __chkstk_darwin(v12 - 8);
  v14 = (char *)v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v23 = 0;
  unint64_t v24 = 0xE000000000000000;
  sub_10002AB00(43);
  swift_bridgeObjectRelease();
  unint64_t v23 = 0xD000000000000022;
  unint64_t v24 = 0x800000010002BED0;
  v22[1] = a1;
  v25._countAndFlagsBits = sub_10002ABF0();
  sub_10002A910(v25);
  swift_bridgeObjectRelease();
  v26._countAndFlagsBits = 0x5F4B534123;
  v26._object = (void *)0xE500000000000000;
  sub_10002A910(v26);
  v27._countAndFlagsBits = a2;
  v27._object = a3;
  sub_10002A910(v27);
  sub_100029EA0();
  swift_bridgeObjectRelease();
  uint64_t v15 = sub_100029EB0();
  uint64_t v16 = *(void *)(v15 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    sub_100002E44((uint64_t)v14);
    sub_10002A010();
    v17 = sub_100029FA0();
    os_log_type_t v18 = sub_10002AA40();
    if (os_log_type_enabled(v17, v18))
    {
      v19 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, v18, "Unable to build punch out url", v19, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    uint64_t v20 = 1;
  }
  else
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v16 + 32))(a4, v14, v15);
    uint64_t v20 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 56))(a4, v20, 1, v15);
}

uint64_t sub_100002408()
{
  return swift_deallocClassInstance();
}

uint64_t variable initialization expression of ImageCache.directoryURL@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_100029EB0();
  v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56);

  return v3(a1, 1, 1, v2);
}

uint64_t variable initialization expression of ImageCache.hasRunCleanup()
{
  return 0;
}

id variable initialization expression of ImageCache.ramCache()
{
  id v0 = objc_allocWithZone((Class)NSCache);

  return [v0 init];
}

uint64_t variable initialization expression of BubbleContentContainer.$__lazy_storage_$_isIpad()
{
  return 2;
}

uint64_t variable initialization expression of BubbleContentContainer.contentViewController()
{
  return 0;
}

uint64_t variable initialization expression of BubbleContentContainer.resolvedSize()
{
  return 0;
}

uint64_t type metadata accessor for PeopleMessagesURLHandler()
{
  return self;
}

__n128 initializeWithTake for RequestName(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_100002518(uint64_t a1, int a2)
{
  if (a2 && *(unsigned char *)(a1 + 16)) {
    return (*(_DWORD *)a1 + 1);
  }
  else {
    return 0;
  }
}

uint64_t sub_100002538(uint64_t result, int a2, int a3)
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

uint64_t sub_100002574(uint64_t a1, uint64_t a2)
{
  return sub_1000026E0(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_10000258C(uint64_t a1, id *a2)
{
  uint64_t result = sub_10002A870();
  *a2 = 0;
  return result;
}

uint64_t sub_100002604(uint64_t a1, id *a2)
{
  char v3 = sub_10002A880();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_100002684@<X0>(void *a1@<X8>)
{
  sub_10002A890();
  NSString v2 = sub_10002A860();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1000026C8(uint64_t a1, uint64_t a2)
{
  return sub_1000026E0(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_1000026E0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_10002A890();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100002724()
{
  sub_10002A890();
  sub_10002A8C0();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_100002778()
{
  sub_10002A890();
  sub_10002AC60();
  sub_10002A8C0();
  Swift::Int v0 = sub_10002AC80();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1000027EC()
{
  uint64_t v0 = sub_10002A890();
  uint64_t v2 = v1;
  if (v0 == sub_10002A890() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_10002AC00();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_100002878@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_10002A860();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1000028C0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10002A890();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1000028EC(uint64_t a1)
{
  uint64_t v2 = sub_100002F7C(&qword_100039490);
  uint64_t v3 = sub_100002F7C(&qword_100039498);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

unint64_t sub_100002984(uint64_t a1, uint64_t a2)
{
  sub_10002AC60();
  sub_10002A8C0();
  Swift::Int v4 = sub_10002AC80();

  return sub_1000029FC(a1, a2, v4);
}

unint64_t sub_1000029FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_10002AC00() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_10002AC00() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_100002AE0()
{
  uint64_t v0 = sub_100029FB0();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)v20 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  unint64_t v6 = (char *)v20 - v5;
  v7 = [self defaultWorkspace];
  if (v7)
  {
    uint64_t v9 = v7;
    sub_100029E70(v8);
    BOOL v11 = v10;
    sub_100001FE8((uint64_t)&_swiftEmptyArrayStorage);
    Class isa = sub_10002A820().super.isa;
    swift_bridgeObjectRelease();
    unsigned int v13 = [v9 openSensitiveURL:v11 withOptions:isa];

    sub_10002A010();
    BOOL v14 = sub_100029FA0();
    os_log_type_t v15 = sub_10002AA30();
    if (os_log_type_enabled(v14, v15))
    {
      uint64_t v16 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v16 = 67109120;
      v20[3] = v13;
      sub_10002AAD0();
      _os_log_impl((void *)&_mh_execute_header, v14, v15, "pushToSettings %{BOOL}d", v16, 8u);
      swift_slowDealloc();
    }
  }
  else
  {
    sub_10002A010();
    uint64_t v9 = sub_100029FA0();
    os_log_type_t v17 = sub_10002AA40();
    if (os_log_type_enabled(v9, v17))
    {
      os_log_type_t v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)os_log_type_t v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, v17, "Failed to get workspace in bubble action", v18, 2u);
      swift_slowDealloc();
    }
    unint64_t v6 = v4;
  }

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v6, v0);
}

uint64_t sub_100002D88(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_100002DCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002D88(&qword_100039458);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_100002E34(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100002E44(uint64_t a1)
{
  uint64_t v2 = sub_100002D88(&qword_100039460);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void type metadata accessor for URLResourceKey(uint64_t a1)
{
}

void type metadata accessor for Style(uint64_t a1)
{
}

void sub_100002ECC(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100002F14()
{
  return sub_100002F7C(&qword_100039478);
}

uint64_t sub_100002F48()
{
  return sub_100002F7C(&qword_100039480);
}

uint64_t sub_100002F7C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for URLResourceKey(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100002FC0()
{
  return sub_100002F7C(&qword_100039488);
}

uint64_t sub_100002FF4()
{
  uint64_t v0 = sub_100002D88(&qword_100039620);
  sub_100007228(v0, qword_10003AA68);
  sub_1000071A8(v0, (uint64_t)qword_10003AA68);
  id v1 = [self hours];
  sub_10000728C();
  return sub_100029DA0();
}

id sub_100003088()
{
  type metadata accessor for ImageCache();
  uint64_t v0 = swift_allocObject();
  uint64_t v1 = v0 + OBJC_IVAR____TtC24PeopleMessagesScreenTime10ImageCache_directoryURL;
  uint64_t v2 = sub_100029EB0();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v2 - 8) + 56))(v1, 1, 1, v2);
  *(unsigned char *)(v0 + OBJC_IVAR____TtC24PeopleMessagesScreenTime10ImageCache_hasRunCleanup) = 0;
  uint64_t v3 = OBJC_IVAR____TtC24PeopleMessagesScreenTime10ImageCache_ramCache;
  id v4 = [objc_allocWithZone((Class)NSCache) init];
  *(void *)(v0 + v3) = v4;
  sub_100004780();
  sub_100004F64();
  id result = [v4 setCountLimit:30];
  static ImageCache.sharedInstance = v0;
  return result;
}

uint64_t *ImageCache.sharedInstance.unsafeMutableAddressor()
{
  if (qword_1000392B8 != -1) {
    swift_once();
  }
  return &static ImageCache.sharedInstance;
}

uint64_t static ImageCache.sharedInstance.getter()
{
  if (qword_1000392B8 != -1) {
    swift_once();
  }

  return swift_retain();
}

uint64_t ImageCache.addToCache(_:image:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  unint64_t v32 = a4;
  uint64_t v34 = a3;
  uint64_t v33 = sub_100029FB0();
  uint64_t v7 = *(void *)(v33 - 8);
  __chkstk_darwin(v33);
  uint64_t v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100002D88(&qword_1000394A0);
  __chkstk_darwin(v10 - 8);
  uint64_t v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = v4;
  unsigned int v13 = *(void **)(v4 + OBJC_IVAR____TtC24PeopleMessagesScreenTime10ImageCache_ramCache);
  id v14 = objc_allocWithZone((Class)NSString);
  swift_bridgeObjectRetain();
  NSString v15 = sub_10002A860();
  swift_bridgeObjectRelease();
  id v16 = [v14 initWithString:v15];

  id v17 = [v13 objectForKey:v16];
  if (v17)
  {
    uint64_t v18 = a1;
    sub_10002A010();
    swift_bridgeObjectRetain_n();
    v19 = sub_100029FA0();
    os_log_type_t v20 = sub_10002AA30();
    if (os_log_type_enabled(v19, v20))
    {
      v21 = (uint8_t *)swift_slowAlloc();
      uint64_t v36 = swift_slowAlloc();
      *(_DWORD *)v21 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v35 = sub_100006348(v18, a2, &v36);
      sub_10002AAD0();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "%s already in ram cache", v21, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v33);
  }
  else
  {
    unint64_t v22 = v32;
    Class isa = sub_100029ED0().super.isa;
    id v24 = objc_allocWithZone((Class)NSString);
    swift_bridgeObjectRetain();
    NSString v25 = sub_10002A860();
    swift_bridgeObjectRelease();
    id v26 = [v24 initWithString:v25];

    [v13 setObject:isa forKey:v26];
    uint64_t v27 = sub_10002A9D0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v27 - 8) + 56))(v12, 1, 1, v27);
    v28 = (void *)swift_allocObject();
    v28[2] = 0;
    v28[3] = 0;
    v28[4] = v31;
    v28[5] = a1;
    uint64_t v29 = v34;
    v28[6] = a2;
    v28[7] = v29;
    v28[8] = v22;
    swift_bridgeObjectRetain();
    swift_retain();
    sub_100006694(v29, v22);
    sub_100003CDC((uint64_t)v12, (uint64_t)&unk_1000394B8, (uint64_t)v28);
    return swift_release();
  }
}

uint64_t sub_10000361C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  v8[9] = a7;
  v8[10] = a8;
  v8[7] = a5;
  v8[8] = a6;
  v8[6] = a4;
  uint64_t v9 = sub_100029FB0();
  v8[11] = v9;
  v8[12] = *(void *)(v9 - 8);
  v8[13] = swift_task_alloc();
  v8[14] = swift_task_alloc();
  v8[15] = swift_task_alloc();
  sub_100002D88(&qword_100039460);
  v8[16] = swift_task_alloc();
  v8[17] = swift_task_alloc();
  uint64_t v10 = sub_100029EB0();
  v8[18] = v10;
  v8[19] = *(void *)(v10 - 8);
  v8[20] = swift_task_alloc();
  v8[21] = swift_task_alloc();
  v8[22] = swift_task_alloc();
  return _swift_task_switch(sub_1000037B8, 0, 0);
}

uint64_t sub_1000037B8()
{
  v41 = v0;
  uint64_t v1 = v0 + 18;
  uint64_t v2 = v0[18];
  uint64_t v3 = v0[19];
  uint64_t v4 = v0[16];
  uint64_t v5 = v0[6] + OBJC_IVAR____TtC24PeopleMessagesScreenTime10ImageCache_directoryURL;
  swift_beginAccess();
  sub_1000066EC(v5, v4);
  unint64_t v6 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (v6(v4, 1, v2))
  {
    uint64_t v7 = v0[18];
    uint64_t v8 = v0[19];
    uint64_t v9 = v0[17];
    sub_10000714C(v0[16], &qword_100039460);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56))(v9, 1, 1, v7);
  }
  else
  {
    uint64_t v10 = v0[21];
    uint64_t v11 = v0[18];
    uint64_t v12 = v0[19];
    uint64_t v14 = v0[16];
    uint64_t v13 = v0[17];
    v38 = *(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 16);
    v38(v10, v14, v11);
    sub_10000714C(v14, &qword_100039460);
    sub_100029E80();
    v39 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v39(v10, v11);
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v12 + 56))(v13, 0, 1, v11);
    if (v6(v13, 1, v11) != 1)
    {
      NSString v15 = v0 + 22;
      uint64_t v23 = v0[22];
      uint64_t v24 = v0[20];
      uint64_t v25 = v0[18];
      (*(void (**)(uint64_t, void, uint64_t))(v0[19] + 32))(v23, v0[17], v25);
      sub_10002A010();
      v38(v24, v23, v25);
      id v26 = sub_100029FA0();
      os_log_type_t v27 = sub_10002AA30();
      BOOL v28 = os_log_type_enabled(v26, v27);
      uint64_t v29 = v0[20];
      uint64_t v30 = v0[14];
      uint64_t v32 = v0[11];
      uint64_t v31 = v0[12];
      if (v28)
      {
        uint64_t v36 = v0[18];
        os_log_type_t type = v27;
        uint64_t v33 = (uint8_t *)swift_slowAlloc();
        uint64_t v40 = swift_slowAlloc();
        *(_DWORD *)uint64_t v33 = 136315138;
        uint64_t v34 = sub_100029E50();
        v0[5] = sub_100006348(v34, v35, &v40);
        sub_10002AAD0();
        swift_bridgeObjectRelease();
        v39(v29, v36);
        _os_log_impl((void *)&_mh_execute_header, v26, type, "Attempting to cache image to file at url %s", v33, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v32);
      }
      else
      {
        v39(v0[20], v0[18]);

        (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v32);
      }
      sub_100029EF0();
      os_log_type_t v20 = v39;
      goto LABEL_7;
    }
  }
  NSString v15 = v0 + 15;
  sub_10000714C(v0[17], &qword_100039460);
  sub_10002A010();
  id v16 = sub_100029FA0();
  os_log_type_t v17 = sub_10002AA40();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Unable to create save url", v18, 2u);
    swift_slowDealloc();
  }
  uint64_t v19 = v0[12];

  os_log_type_t v20 = *(void (**)(uint64_t, uint64_t))(v19 + 8);
  uint64_t v1 = v0 + 11;
LABEL_7:
  v20(*v15, *v1);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v21 = (uint64_t (*)(void))v0[1];
  return v21();
}

uint64_t sub_100003CDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10002A9D0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_10002A9C0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10000714C(a1, &qword_1000394A0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10002A970();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_100003E88(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_10002A9D0();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_10002A9C0();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10000714C(a1, &qword_1000394A0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10002A970();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  sub_100002D88(&qword_100039600);
  return swift_task_create();
}

uint64_t ImageCache.getFromCache(_:)(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100002D88(&qword_100039460);
  uint64_t v7 = __chkstk_darwin(v6 - 8);
  uint64_t v58 = (uint64_t)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v54 - v9;
  uint64_t v61 = sub_100029EB0();
  uint64_t v59 = *(void *)(v61 - 8);
  uint64_t v11 = __chkstk_darwin(v61);
  uint64_t v13 = (char *)&v54 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  NSString v15 = (char *)&v54 - v14;
  uint64_t v16 = sub_100029FB0();
  uint64_t v62 = *(void *)(v16 - 8);
  uint64_t v63 = v16;
  uint64_t v17 = __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v54 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __chkstk_darwin(v17);
  unint64_t v22 = (char *)&v54 - v21;
  __chkstk_darwin(v20);
  v64 = (char *)&v54 - v23;
  uint64_t v57 = v3;
  uint64_t v24 = *(void **)(v3 + OBJC_IVAR____TtC24PeopleMessagesScreenTime10ImageCache_ramCache);
  id v25 = objc_allocWithZone((Class)NSString);
  swift_bridgeObjectRetain();
  uint64_t v60 = a1;
  NSString v26 = sub_10002A860();
  swift_bridgeObjectRelease();
  id v27 = [v25 initWithString:v26];

  id v28 = [v24 objectForKey:v27];
  if (v28)
  {
    uint64_t v29 = sub_100029EE0();

    sub_10002A010();
    swift_bridgeObjectRetain_n();
    uint64_t v30 = sub_100029FA0();
    os_log_type_t v31 = sub_10002AA30();
    if (os_log_type_enabled(v30, v31))
    {
      uint64_t v32 = (uint8_t *)swift_slowAlloc();
      v66[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v32 = 136315138;
      swift_bridgeObjectRetain();
      uint64_t v65 = sub_100006348(v60, a2, v66);
      sub_10002AAD0();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "%s found in ram cache", v32, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v62 + 8))(v64, v63);
  }
  else
  {
    id v55 = v24;
    v56 = v19;
    v64 = (char *)a2;
    uint64_t v33 = v22;
    uint64_t v34 = v57 + OBJC_IVAR____TtC24PeopleMessagesScreenTime10ImageCache_directoryURL;
    swift_beginAccess();
    uint64_t v35 = v58;
    sub_1000066EC(v34, v58);
    uint64_t v36 = v59;
    v37 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v59 + 48);
    uint64_t v38 = v61;
    if (v37(v35, 1, v61))
    {
      sub_10000714C(v35, &qword_100039460);
      uint64_t v39 = (uint64_t)v10;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v36 + 56))(v10, 1, 1, v38);
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v13, v35, v38);
      sub_10000714C(v35, &qword_100039460);
      uint64_t v39 = (uint64_t)v10;
      sub_100029E80();
      uint64_t v40 = v61;
      v41 = *(void (**)(char *, uint64_t))(v36 + 8);
      v41(v13, v61);
      (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v36 + 56))(v39, 0, 1, v40);
      if (v37(v39, 1, v40) != 1)
      {
        v46 = v41;
        v47 = v15;
        (*(void (**)(char *, uint64_t, uint64_t))(v59 + 32))(v15, v39, v40);
        uint64_t v29 = sub_100029EC0();
        unint64_t v49 = v48;
        sub_100006694(v29, v48);
        Class isa = sub_100029ED0().super.isa;
        sub_10000646C(v29, v49);
        id v51 = objc_allocWithZone((Class)NSString);
        swift_bridgeObjectRetain();
        NSString v52 = sub_10002A860();
        swift_bridgeObjectRelease();
        id v53 = [v51 initWithString:v52];

        [v55 setObject:isa forKey:v53];
        v46(v47, v61);
        return v29;
      }
    }
    sub_10000714C(v39, &qword_100039460);
    sub_10002A010();
    uint64_t v42 = sub_100029FA0();
    os_log_type_t v43 = sub_10002AA40();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v44 = 0;
      _os_log_impl((void *)&_mh_execute_header, v42, v43, "Unable to create get url", v44, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v62 + 8))(v33, v63);
    return 0;
  }
  return v29;
}

uint64_t sub_100004780()
{
  uint64_t v1 = sub_100029FB0();
  uint64_t v63 = *(void *)(v1 - 8);
  uint64_t v64 = v1;
  uint64_t v2 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v59 = (char *)&v57 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v66 = (char *)&v57 - v4;
  uint64_t v5 = sub_100029EB0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v58 = (char *)&v57 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v60 = (char *)&v57 - v9;
  uint64_t v10 = sub_100002D88(&qword_100039460);
  uint64_t v11 = __chkstk_darwin(v10 - 8);
  uint64_t v61 = (uint64_t)&v57 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v62 = (uint64_t)&v57 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v57 - v16;
  uint64_t v18 = __chkstk_darwin(v15);
  uint64_t v20 = (char *)&v57 - v19;
  uint64_t v21 = __chkstk_darwin(v18);
  uint64_t v23 = (char *)&v57 - v22;
  __chkstk_darwin(v21);
  id v25 = (char *)&v57 - v24;
  uint64_t v65 = v0;
  uint64_t v26 = v0 + OBJC_IVAR____TtC24PeopleMessagesScreenTime10ImageCache_directoryURL;
  swift_beginAccess();
  sub_1000066EC(v26, (uint64_t)v25);
  uint64_t v27 = v6;
  id v28 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48);
  unsigned int v29 = v28(v25, 1, v5);
  uint64_t result = sub_10000714C((uint64_t)v25, &qword_100039460);
  if (v29 == 1)
  {
    sub_100029FC0();
    os_log_type_t v31 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v28;
    if (v28(v20, 1, v5) == 1)
    {
      sub_10000714C((uint64_t)v20, &qword_100039460);
      uint64_t v32 = 1;
    }
    else
    {
      sub_100029E80();
      (*(void (**)(char *, uint64_t))(v27 + 8))(v20, v5);
      uint64_t v32 = 0;
    }
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v27 + 56))(v23, v32, 1, v5);
    sub_1000072CC((uint64_t)v23, (uint64_t)v17);
    swift_beginAccess();
    sub_100007334((uint64_t)v17, v26);
    swift_endAccess();
    uint64_t v57 = v26;
    uint64_t v33 = v26;
    uint64_t v34 = v62;
    sub_1000066EC(v33, v62);
    if (v28((char *)v34, 1, v5) == 1)
    {
      sub_10000714C(v34, &qword_100039460);
    }
    else
    {
      uint64_t v35 = v60;
      (*(void (**)(char *, uint64_t, uint64_t))(v27 + 32))(v60, v34, v5);
      id v36 = [self defaultManager];
      sub_100029E70(v37);
      uint64_t v39 = v38;
      id v68 = 0;
      uint64_t v40 = v5;
      unsigned int v41 = [v36 createDirectoryAtURL:v38 withIntermediateDirectories:1 attributes:0 error:&v68];

      if (v41)
      {
        uint64_t v42 = *(void (**)(char *, uint64_t))(v27 + 8);
        id v43 = v68;
        v42(v35, v40);
      }
      else
      {
        id v44 = v68;
        sub_100029E30();

        swift_willThrow();
        v45 = v59;
        sub_10002A010();
        id v68 = 0;
        unint64_t v69 = 0xE000000000000000;
        swift_errorRetain();
        sub_10002AB00(34);
        swift_bridgeObjectRelease();
        id v68 = (id)0xD00000000000001CLL;
        unint64_t v69 = 0x800000010002BF90;
        v70._countAndFlagsBits = sub_100029E50();
        sub_10002A910(v70);
        swift_bridgeObjectRelease();
        v71._countAndFlagsBits = 1076174906;
        v71._object = (void *)0xE400000000000000;
        sub_10002A910(v71);
        sub_100029F90();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        (*(void (**)(char *, uint64_t))(v63 + 8))(v45, v64);
        (*(void (**)(char *, uint64_t))(v27 + 8))(v35, v40);
      }
      uint64_t v5 = v40;
    }
    v46 = v66;
    sub_10002A010();
    swift_retain_n();
    v47 = sub_100029FA0();
    os_log_type_t v48 = sub_10002AA30();
    if (os_log_type_enabled(v47, v48))
    {
      unint64_t v49 = (uint8_t *)swift_slowAlloc();
      id v68 = (id)swift_slowAlloc();
      *(_DWORD *)unint64_t v49 = 136315138;
      uint64_t v50 = v61;
      sub_1000066EC(v57, v61);
      if (v31(v50, 1, v5))
      {
        sub_10000714C(v50, &qword_100039460);
        unint64_t v51 = 0xE300000000000000;
        uint64_t v52 = 7104878;
      }
      else
      {
        id v53 = v58;
        (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v58, v50, v5);
        sub_10000714C(v50, &qword_100039460);
        uint64_t v54 = sub_100029E50();
        uint64_t v55 = v5;
        uint64_t v52 = v54;
        unint64_t v51 = v56;
        (*(void (**)(char *, uint64_t))(v27 + 8))(v53, v55);
      }
      uint64_t v67 = sub_100006348(v52, v51, (uint64_t *)&v68);
      sub_10002AAD0();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v47, v48, "Root folder %s", v49, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      return (*(uint64_t (**)(char *, uint64_t))(v63 + 8))(v66, v64);
    }
    else
    {

      swift_release_n();
      return (*(uint64_t (**)(char *, uint64_t))(v63 + 8))(v46, v64);
    }
  }
  return result;
}

uint64_t sub_100004F64()
{
  uint64_t v113 = sub_100029FB0();
  v112 = *(char ***)(v113 - 8);
  uint64_t v1 = __chkstk_darwin(v113);
  v111 = (char *)v87 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = __chkstk_darwin(v1);
  v108 = (void (*)(char *, unint64_t, uint64_t))((char *)v87 - v4);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v87 - v5;
  uint64_t v7 = sub_100002D88(&qword_100039608);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)v87 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v122 = sub_100029F30();
  v110 = *(char **)(v122 - 8);
  uint64_t v10 = __chkstk_darwin(v122);
  uint64_t v12 = (char *)v87 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v10);
  v121 = (char *)v87 - v14;
  __chkstk_darwin(v13);
  uint64_t v16 = (char *)v87 - v15;
  uint64_t v17 = sub_100002D88(&qword_100039610);
  __chkstk_darwin(v17 - 8);
  v123 = (char *)v87 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v126 = sub_100029E20();
  v109 = *(void (***)(char *, uint64_t))(v126 - 8);
  __chkstk_darwin(v126);
  v127 = (char *)v87 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_100002D88(&qword_100039460);
  uint64_t v21 = __chkstk_darwin(v20 - 8);
  v125 = (char *)v87 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v21);
  uint64_t v24 = (char *)v87 - v23;
  uint64_t v25 = sub_100029EB0();
  uint64_t v26 = *(void **)(v25 - 8);
  uint64_t v27 = __chkstk_darwin(v25);
  v124 = (char *)v87 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v29 = __chkstk_darwin(v27);
  os_log_type_t v31 = (char *)v87 - v30;
  uint64_t result = __chkstk_darwin(v29);
  v120 = (char *)v87 - v33;
  if ((*(unsigned char *)(v0 + OBJC_IVAR____TtC24PeopleMessagesScreenTime10ImageCache_hasRunCleanup) & 1) == 0)
  {
    uint64_t v94 = OBJC_IVAR____TtC24PeopleMessagesScreenTime10ImageCache_hasRunCleanup;
    v116 = v9;
    uint64_t v34 = v0 + OBJC_IVAR____TtC24PeopleMessagesScreenTime10ImageCache_directoryURL;
    swift_beginAccess();
    sub_1000066EC(v34, (uint64_t)v24);
    uint64_t v35 = (unsigned int (*)(char *, uint64_t, uint64_t))v26[6];
    v119 = v26 + 6;
    v118 = v35;
    if (v35(v24, 1, v25) == 1) {
      return sub_10000714C((uint64_t)v24, &qword_100039460);
    }
    v96 = v12;
    uint64_t v91 = v0;
    id v36 = (void (*)(char *, char *, uint64_t))v26[4];
    v107 = v26 + 4;
    v106 = v36;
    v36(v120, v24, v25);
    id v37 = [self defaultManager];
    uint64_t v105 = sub_100002D88(&qword_100039618);
    uint64_t v38 = swift_allocObject();
    long long v104 = xmmword_10002B690;
    *(_OWORD *)(v38 + 16) = xmmword_10002B690;
    *(void *)(v38 + 32) = NSURLContentModificationDateKey;
    uint64_t v39 = NSURLContentModificationDateKey;
    sub_100029E40();
    sub_100029E70(v40);
    uint64_t v42 = v41;
    v117 = v26;
    id v43 = (uint64_t (*)(char *, uint64_t))v26[1];
    v115 = v26 + 1;
    v114 = v43;
    v43(v31, v25);
    type metadata accessor for URLResourceKey(0);
    uint64_t v103 = v44;
    Class isa = sub_10002A940().super.isa;
    swift_bridgeObjectRelease();
    v128[0] = 0;
    id v95 = v37;
    id v46 = [v37 contentsOfDirectoryAtURL:v42 includingPropertiesForKeys:isa options:4 error:v128];

    id v47 = v128[0];
    if (v46)
    {
      v88 = v6;
      uint64_t v48 = sub_10002A950();

      uint64_t v49 = *(void *)(v48 + 16);
      uint64_t v90 = v48;
      if (v49)
      {
        v108 = (void (*)(char *, unint64_t, uint64_t))v117[2];
        unint64_t v50 = v48 + ((*((unsigned __int8 *)v117 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v117 + 80));
        v101 = (void (**)(uint64_t, void, uint64_t, uint64_t))(v109 + 7);
        uint64_t v99 = v117[9];
        v100 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v109 + 6);
        v98 = (void (**)(char *, uint64_t, uint64_t))(v109 + 4);
        NSURLResourceKey v102 = NSURLCreationDateKey;
        v97 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v110 + 48);
        v93 = (void (**)(char *, uint64_t, uint64_t))(v110 + 32);
        v89 = (void (**)(char *, uint64_t))(v112 + 1);
        v92 = (void (**)(char *, uint64_t))(v110 + 8);
        ++v109;
        v112 = (char **)(v117 + 7);
        v87[1] = (unint64_t)(v117 + 7) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
        unint64_t v51 = v124;
        uint64_t v52 = v125;
        v117 += 2;
        v108(v125, v50, v25);
        while (1)
        {
          v110 = *v112;
          ((void (*)(char *, void, uint64_t, uint64_t))v110)(v52, 0, 1, v25);
          if (v118(v52, 1, v25) == 1) {
            goto LABEL_29;
          }
          id v53 = v16;
          v106(v51, v52, v25);
          uint64_t inited = swift_initStackObject();
          *(_OWORD *)(inited + 16) = v104;
          NSURLResourceKey v55 = v102;
          *(void *)(inited + 32) = v102;
          unint64_t v56 = v55;
          sub_100006F1C(inited);
          swift_setDeallocating();
          swift_arrayDestroy();
          uint64_t v57 = (uint64_t)v123;
          sub_100029E60();
          swift_bridgeObjectRelease();
          uint64_t v58 = v126;
          (*v101)(v57, 0, 1, v126);
          if ((*v100)(v57, 1, v58) == 1)
          {
            swift_bridgeObjectRelease();
            sub_10000714C(v57, &qword_100039610);
            v82 = v88;
            sub_10002A010();
            v83 = sub_100029FA0();
            os_log_type_t v84 = sub_10002AA30();
            if (os_log_type_enabled(v83, v84))
            {
              v85 = (uint8_t *)swift_slowAlloc();
              *(_WORD *)v85 = 0;
              _os_log_impl((void *)&_mh_execute_header, v83, v84, "Unable to file list", v85, 2u);
              swift_slowDealloc();
            }

            (*v89)(v82, v113);
            v86 = v114;
            v114(v124, v25);
            return v86(v120, v25);
          }
          uint64_t v59 = v127;
          (*v98)(v127, v57, v58);
          uint64_t v60 = (uint64_t)v116;
          sub_100029E10();
          uint64_t v61 = v122;
          if ((*v97)(v60, 1, v122) == 1)
          {
            (*v109)(v59, v58);
            unint64_t v51 = v124;
            v114(v124, v25);
            sub_10000714C(v60, &qword_100039608);
            uint64_t v16 = v53;
            goto LABEL_8;
          }
          uint64_t v16 = v53;
          (*v93)(v53, v60, v61);
          if (qword_1000392B0 != -1) {
            swift_once();
          }
          uint64_t v62 = sub_100002D88(&qword_100039620);
          sub_1000071A8(v62, (uint64_t)qword_10003AA68);
          sub_100029F10();
          uint64_t v63 = v96;
          sub_100029F20();
          sub_1000071E0(&qword_100039628, (void (*)(uint64_t))&type metadata accessor for Date);
          char v64 = sub_10002A840();
          v66 = v127;
          if (v64) {
            break;
          }
          unint64_t v51 = v124;
          sub_100029E70(v65);
          Swift::String v70 = v69;
          v128[0] = 0;
          unsigned int v71 = [v95 removeItemAtURL:v69 error:v128];

          if (v71)
          {
            v72 = *v92;
            id v73 = v128[0];
            v72(v96, v61);
            v72(v121, v61);
            v72(v16, v61);
            (*v109)(v127, v126);
            goto LABEL_19;
          }
          id v74 = v128[0];
          sub_100029E30();

          swift_willThrow();
          sub_10002A010();
          v128[0] = 0;
          v128[1] = (id)0xE000000000000000;
          swift_errorRetain();
          sub_10002AB00(20);
          swift_bridgeObjectRelease();
          strcpy((char *)v128, "Failed delete ");
          HIBYTE(v128[1]) = -18;
          sub_1000071E0(&qword_100039630, (void (*)(uint64_t))&type metadata accessor for URL);
          v129._countAndFlagsBits = sub_10002ABF0();
          sub_10002A910(v129);
          swift_bridgeObjectRelease();
          v130._countAndFlagsBits = 1076174906;
          v130._object = (void *)0xE400000000000000;
          sub_10002A910(v130);
          v75 = v111;
          sub_100029F90();
          swift_bridgeObjectRelease();
          swift_errorRelease();
          swift_errorRelease();
          (*v89)(v75, v113);
          v76 = *v92;
          (*v92)(v96, v61);
          v76(v121, v61);
          v76(v16, v61);
          (*v109)(v66, v126);
          v114(v51, v25);
LABEL_8:
          v50 += v99;
          --v49;
          uint64_t v52 = v125;
          if (!v49)
          {
            ((void (*)(char *, uint64_t, uint64_t, uint64_t))v110)(v125, 1, 1, v25);
            goto LABEL_29;
          }
          v108(v125, v50, v25);
        }
        uint64_t v67 = v127;
        id v68 = *v92;
        (*v92)(v63, v61);
        v68(v121, v61);
        v68(v16, v61);
        (*v109)(v67, v126);
        unint64_t v51 = v124;
LABEL_19:
        v114(v51, v25);
        goto LABEL_8;
      }
      ((void (*)(char *, uint64_t, uint64_t, uint64_t))v117[7])(v125, 1, 1, v25);
LABEL_29:
      swift_bridgeObjectRelease();

      uint64_t result = v114(v120, v25);
      *(unsigned char *)(v91 + v94) = 1;
    }
    else
    {
      v77 = v47;
      sub_100029E30();

      swift_willThrow();
      swift_errorRelease();
      v78 = (char *)v108;
      sub_10002A010();
      v79 = sub_100029FA0();
      uint64_t v80 = sub_10002AA30();
      if (os_log_type_enabled(v79, (os_log_type_t)v80))
      {
        v81 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v81 = 0;
        _os_log_impl((void *)&_mh_execute_header, v79, (os_log_type_t)v80, "Unable to read folder", v81, 2u);
        swift_slowDealloc();
      }

      ((void (*)(char *, uint64_t))v112[1])(v78, v113);
      return v114(v120, v25);
    }
  }
  return result;
}

uint64_t ImageCache.deinit()
{
  sub_10000714C(v0 + OBJC_IVAR____TtC24PeopleMessagesScreenTime10ImageCache_directoryURL, &qword_100039460);

  return v0;
}

uint64_t ImageCache.__deallocating_deinit()
{
  sub_10000714C(v0 + OBJC_IVAR____TtC24PeopleMessagesScreenTime10ImageCache_directoryURL, &qword_100039460);

  return swift_deallocClassInstance();
}

uint64_t sub_100006098(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_10000750C;
  return v6(a1);
}

uint64_t sub_100006174(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100006250;
  return v6(a1);
}

uint64_t sub_100006250()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100006348(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100006998(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_1000074A4((uint64_t)v12, *a3);
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
      sub_1000074A4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100007454((uint64_t)v12);
  return v7;
}

uint64_t sub_10000641C()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  sub_10000646C(*(void *)(v0 + 56), *(void *)(v0 + 64));

  return _swift_deallocObject(v0, 72, 7);
}

uint64_t sub_10000646C(uint64_t a1, unint64_t a2)
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

uint64_t sub_1000064C4(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  uint64_t v9 = v1[7];
  uint64_t v10 = v1[8];
  uint64_t v11 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v11;
  void *v11 = v2;
  v11[1] = sub_1000065A0;
  return sub_10000361C(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_1000065A0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_100006694(uint64_t a1, unint64_t a2)
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

uint64_t sub_1000066EC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002D88(&qword_100039460);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100006754()
{
  return type metadata accessor for ImageCache();
}

uint64_t type metadata accessor for ImageCache()
{
  uint64_t result = qword_1000394F8;
  if (!qword_1000394F8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_1000067A8()
{
  sub_100006850();
  if (v0 <= 0x3F) {
    swift_updateClassMetadata2();
  }
}

void sub_100006850()
{
  if (!qword_100039508)
  {
    sub_100029EB0();
    unint64_t v0 = sub_10002AAC0();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_100039508);
    }
  }
}

uint64_t sub_1000068A8()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000068E0(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_1000065A0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_1000395F0 + dword_1000395F0);
  return v6(a1, v4);
}

uint64_t sub_100006998(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_10002AAE0();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_100006B54(a5, a6);
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
  uint64_t v8 = sub_10002AB40();
  if (!v8)
  {
    sub_10002ABA0();
    __break(1u);
LABEL_17:
    uint64_t result = sub_10002ABD0();
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

uint64_t sub_100006B54(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100006BEC(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100006DCC(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100006DCC(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100006BEC(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100006D64(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = sub_10002AB10();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      sub_10002ABA0();
      __break(1u);
LABEL_10:
      uint64_t v2 = sub_10002A920();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    sub_10002ABD0();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)sub_10002ABA0();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100006D64(uint64_t a1, uint64_t a2)
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
  sub_100002D88(&qword_100039658);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100006DCC(char a1, int64_t a2, char a3, char *a4)
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
    sub_100002D88(&qword_100039658);
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
  uint64_t result = sub_10002ABD0();
  __break(1u);
  return result;
}

void *sub_100006F1C(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100002D88(&qword_100039640);
    uint64_t v3 = sub_10002AAF0();
    uint64_t v4 = 0;
    uint64_t v5 = v3 + 56;
    uint64_t v31 = v1;
    uint64_t v32 = a1 + 32;
    while (1)
    {
      unint64_t v6 = *(void **)(v32 + 8 * v4);
      sub_10002A890();
      sub_10002AC60();
      id v7 = v6;
      sub_10002A8C0();
      Swift::Int v8 = sub_10002AC80();
      uint64_t result = (void *)swift_bridgeObjectRelease();
      uint64_t v10 = -1 << *(unsigned char *)(v3 + 32);
      unint64_t v11 = v8 & ~v10;
      unint64_t v12 = v11 >> 6;
      uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
      uint64_t v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        uint64_t v15 = sub_10002A890();
        uint64_t v17 = v16;
        if (v15 == sub_10002A890() && v17 == v18)
        {
LABEL_3:
          swift_bridgeObjectRelease_n();
LABEL_4:

          goto LABEL_5;
        }
        char v20 = sub_10002AC00();
        swift_bridgeObjectRelease();
        uint64_t result = (void *)swift_bridgeObjectRelease();
        if (v20) {
          goto LABEL_4;
        }
        uint64_t v21 = ~v10;
        while (1)
        {
          unint64_t v11 = (v11 + 1) & v21;
          unint64_t v12 = v11 >> 6;
          uint64_t v13 = *(void *)(v5 + 8 * (v11 >> 6));
          uint64_t v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0) {
            break;
          }
          uint64_t v22 = sub_10002A890();
          uint64_t v24 = v23;
          if (v22 == sub_10002A890() && v24 == v25) {
            goto LABEL_3;
          }
          char v27 = sub_10002AC00();
          swift_bridgeObjectRelease();
          uint64_t result = (void *)swift_bridgeObjectRelease();
          if (v27) {
            goto LABEL_4;
          }
        }
      }
      *(void *)(v5 + 8 * v12) = v14 | v13;
      *(void *)(*(void *)(v3 + 48) + 8 * v11) = v7;
      uint64_t v28 = *(void *)(v3 + 16);
      BOOL v29 = __OFADD__(v28, 1);
      uint64_t v30 = v28 + 1;
      if (v29)
      {
        __break(1u);
        return result;
      }
      *(void *)(v3 + 16) = v30;
LABEL_5:
      if (++v4 == v31) {
        return (void *)v3;
      }
    }
  }
  return &_swiftEmptySetSingleton;
}

uint64_t sub_10000714C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_100002D88(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000071A8(uint64_t a1, uint64_t a2)
{
  if ((*(unsigned char *)(*(void *)(a1 - 8) + 82) & 2) != 0) {
    return *(void *)a2;
  }
  return a2;
}

uint64_t sub_1000071E0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t *sub_100007228(uint64_t a1, uint64_t *a2)
{
  if ((*(_DWORD *)(*(void *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    uint64_t v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

unint64_t sub_10000728C()
{
  unint64_t result = qword_100039638;
  if (!qword_100039638)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100039638);
  }
  return result;
}

uint64_t sub_1000072CC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002D88(&qword_100039460);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_100007334(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002D88(&qword_100039460);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_10000739C(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_100007504;
  unint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100039648 + dword_100039648);
  return v6(a1, v4);
}

uint64_t sub_100007454(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_1000074A4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100007514()
{
  uint64_t result = sub_10002A080();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_initClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000075B8()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100029FB0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002A010();
  swift_retain_n();
  unint64_t v6 = sub_100029FA0();
  os_log_type_t v7 = sub_10002AA30();
  uint64_t v8 = &off_100039000;
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v17 = v2;
    uint64_t v10 = (uint8_t *)v9;
    uint64_t v19 = swift_slowAlloc();
    *(_DWORD *)uint64_t v10 = 136315138;
    uint64_t v11 = sub_10002A070();
    uint64_t v18 = sub_100006348(v11, v12, &v19);
    sub_10002AAD0();
    swift_release_n();
    uint64_t v8 = &off_100039000;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "BubbleEventRegistration bye bye for %s", v10, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v17);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  uint64_t v13 = (char *)v8[204] + v1;
  uint64_t v14 = sub_10002A080();
  (*(void (**)(char *, uint64_t))(*(void *)(v14 - 8) + 8))(v13, v14);
  swift_release();
  sub_100008FE4(v1 + qword_100039670);
  return v1;
}

uint64_t sub_100007840()
{
  sub_1000075B8();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for BubbleEventRegistration()
{
  return sub_1000091F4();
}

uint64_t sub_1000078AC(void *a1)
{
  uint64_t v3 = sub_100002D88(&qword_1000394A0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v23[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10002A080();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v23[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_1000090C8(0, &qword_1000397B0);
  uint64_t v26 = &protocol witness table for BMScreenTimeRequestEvent;
  v24[0] = a1;
  sub_100008F24(v24, v25);
  id v10 = a1;
  sub_10002AAA0();
  sub_100008F68(&qword_100039788);
  sub_10002A930();
  sub_10002A930();
  if (v23[0] == v23[6] && v23[1] == v23[7])
  {
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else
  {
    char v11 = sub_10002AC00();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    if ((v11 & 1) == 0) {
      goto LABEL_11;
    }
  }
  unint64_t v12 = (void *)(v1 + qword_100039670);
  uint64_t v14 = *(void *)(v1 + qword_100039670 + 16);
  uint64_t v13 = *(void *)(v1 + qword_100039670 + 24);
  sub_100008F24(v24, v25);
  swift_bridgeObjectRetain();
  if (v14 == sub_10002AAB0() && v13 == v15)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v16 = sub_10002AC00();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v16 & 1) == 0) {
      goto LABEL_11;
    }
  }
  sub_100008FAC(v12, v23);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  uint64_t v18 = v23[5];
  sub_100008FE4((uint64_t)v23);
  if (Strong)
  {
    uint64_t v19 = sub_10002A9D0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v5, 1, 1, v19);
    char v20 = (void *)swift_allocObject();
    v20[2] = 0;
    v20[3] = 0;
    _DWORD v20[4] = Strong;
    v20[5] = v18;
    sub_100003CDC((uint64_t)v5, (uint64_t)&unk_1000397B8, (uint64_t)v20);
    swift_release();
  }
LABEL_11:
  sub_100007454((uint64_t)v24);
  sub_100002D88(&qword_100039790);
  swift_allocObject();
  return sub_100029F70();
}

uint64_t sub_100007C38(void *a1)
{
  uint64_t v3 = sub_100002D88(&qword_1000394A0);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v23[-1] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10002A080();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v23[-1] - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_1000090C8(0, &qword_100039780);
  uint64_t v26 = &protocol witness table for BMAskToBuyEvent;
  v24[0] = a1;
  sub_100008F24(v24, v25);
  id v10 = a1;
  sub_10002AA80();
  sub_100008F68(&qword_100039788);
  sub_10002A930();
  sub_10002A930();
  if (v23[0] == v23[6] && v23[1] == v23[7])
  {
    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  else
  {
    char v11 = sub_10002AC00();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    if ((v11 & 1) == 0) {
      goto LABEL_11;
    }
  }
  unint64_t v12 = (void *)(v1 + qword_100039670);
  uint64_t v14 = *(void *)(v1 + qword_100039670 + 16);
  uint64_t v13 = *(void *)(v1 + qword_100039670 + 24);
  sub_100008F24(v24, v25);
  swift_bridgeObjectRetain();
  if (v14 == sub_10002AA90() && v13 == v15)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    char v16 = sub_10002AC00();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v16 & 1) == 0) {
      goto LABEL_11;
    }
  }
  sub_100008FAC(v12, v23);
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  uint64_t v18 = v23[5];
  sub_100008FE4((uint64_t)v23);
  if (Strong)
  {
    uint64_t v19 = sub_10002A9D0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v19 - 8) + 56))(v5, 1, 1, v19);
    char v20 = (void *)swift_allocObject();
    v20[2] = 0;
    v20[3] = 0;
    _DWORD v20[4] = Strong;
    v20[5] = v18;
    sub_100003CDC((uint64_t)v5, (uint64_t)&unk_1000397A0, (uint64_t)v20);
    swift_release();
  }
LABEL_11:
  sub_100007454((uint64_t)v24);
  sub_100002D88(&qword_100039790);
  swift_allocObject();
  return sub_100029F70();
}

uint64_t sub_100007FC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(v5 + 16) = a4;
  *(void *)(v5 + 24) = a5;
  return _swift_task_switch(sub_100007FE4, 0, 0);
}

uint64_t sub_100007FE4()
{
  uint64_t v1 = *(void *)(v0 + 24);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(ObjectType, v1);
  uint64_t v3 = *(uint64_t (**)(void))(v0 + 8);
  return v3();
}

uint64_t sub_100008060(uint64_t (*a1)(uint64_t *))
{
  uint64_t v2 = 0;
  char v3 = 0;
  return a1(&v2);
}

uint64_t sub_1000080A0(uint64_t a1, unint64_t a2, uint64_t a3, void (*a4)(char *, uint64_t, uint64_t), uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t *a9, uint64_t a10)
{
  uint64_t v11 = v10;
  uint64_t v54 = a7;
  id v55 = a8;
  uint64_t v49 = a3;
  unint64_t v50 = a4;
  uint64_t v52 = a9;
  uint64_t v53 = a10;
  uint64_t v16 = sub_10002A080();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v18 = __chkstk_darwin(v16);
  unint64_t v51 = (char *)&v40 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v40 - v20;
  uint64_t v22 = sub_100029FB0();
  uint64_t v47 = *(void *)(v22 - 8);
  uint64_t v48 = v22;
  __chkstk_darwin(v22);
  uint64_t v24 = (char *)&v40 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)(v11 + qword_100039668) = 0;
  uint64_t v45 = v17;
  uint64_t v25 = *(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16);
  v25(v11 + qword_100039660, a5, v16);
  uint64_t v42 = a1;
  v57[0] = a1;
  v57[1] = a2;
  v57[2] = v49;
  v57[3] = (uint64_t)v50;
  v57[5] = v54;
  uint64_t v54 = a6;
  swift_unknownObjectWeakInit();
  uint64_t v44 = v11;
  sub_100008ED4((uint64_t)v57, v11 + qword_100039670);
  swift_bridgeObjectRetain();
  sub_10002A010();
  uint64_t v26 = a5;
  uint64_t v49 = v16;
  unint64_t v50 = (void (*)(char *, uint64_t, uint64_t))v25;
  uint64_t v43 = v17 + 16;
  v25((uint64_t)v21, a5, v16);
  swift_bridgeObjectRetain();
  id v46 = v24;
  char v27 = sub_100029FA0();
  os_log_type_t v28 = sub_10002AA30();
  if (os_log_type_enabled(v27, v28))
  {
    uint64_t v29 = swift_slowAlloc();
    uint64_t v41 = v26;
    uint64_t v30 = v29;
    v57[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v30 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v56 = sub_100006348(v42, a2, v57);
    sub_10002AAD0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v30 + 12) = 2080;
    sub_100008F68((unint64_t *)&unk_100039770);
    uint64_t v31 = v49;
    uint64_t v32 = sub_10002ABF0();
    uint64_t v56 = sub_100006348(v32, v33, v57);
    sub_10002AAD0();
    swift_bridgeObjectRelease();
    uint64_t v45 = *(void *)(v45 + 8);
    ((void (*)(char *, uint64_t))v45)(v21, v31);
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "Created listener with %s for %s listener", (uint8_t *)v30, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v26 = v41;
    swift_slowDealloc();
  }
  else
  {
    swift_bridgeObjectRelease_n();
    uint64_t v31 = v49;
    uint64_t v45 = *(void *)(v45 + 8);
    ((void (*)(char *, uint64_t))v45)(v21, v49);
  }

  (*(void (**)(char *, uint64_t))(v47 + 8))(v46, v48);
  sub_10002A0C0();
  sub_10002A0A0();
  uint64_t v34 = (void *)sub_10002A0B0();
  swift_release();
  id v35 = v55;
  id v36 = [v55 subscribeOn:v34];
  v50(v51, v26, v31);
  sub_100002D88(v52);
  swift_allocObject();
  uint64_t v37 = v44;
  swift_retain();
  uint64_t v38 = sub_10002A300();

  swift_unknownObjectRelease();
  ((void (*)(uint64_t, uint64_t))v45)(v26, v31);
  *(void *)(v37 + qword_100039668) = v38;
  swift_release();
  return v37;
}

uint64_t sub_1000085B0()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_100029FB0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002A010();
  swift_retain_n();
  uint64_t v6 = sub_100029FA0();
  os_log_type_t v7 = sub_10002AA30();
  uint64_t v8 = &off_100039000;
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v17 = swift_slowAlloc();
    uint64_t v19 = v17;
    *(_DWORD *)uint64_t v9 = 136315394;
    uint64_t v10 = sub_10002A070();
    uint64_t v18 = sub_100006348(v10, v11, &v19);
    sub_10002AAD0();
    swift_release_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v9 + 12) = 2080;
    uint64_t v16 = v2;
    uint64_t v13 = *(void *)(v1 + qword_100039670);
    unint64_t v12 = *(void *)(v1 + qword_100039670 + 8);
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_100006348(v13, v12, &v19);
    uint64_t v8 = &off_100039000;
    sub_10002AAD0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Shutdown %s for %s", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v16);
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  *(void *)((char *)v8[206] + v1 + 40) = 0;
  swift_unknownObjectWeakAssign();
  uint64_t v14 = qword_100039668;
  if (*(void *)(v1 + qword_100039668))
  {
    swift_retain();
    sub_10002A310();
    swift_release();
  }
  *(void *)(v1 + v14) = 0;
  return swift_release();
}

uint64_t initializeBufferWithCopyOfBuffer for InterestedParty(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for InterestedParty()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_unknownObjectWeakDestroy();
}

void *initializeWithCopy for InterestedParty(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_unknownObjectWeakCopyInit();
  a1[5] = a2[5];
  return a1;
}

void *assignWithCopy for InterestedParty(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakCopyAssign();
  a1[5] = a2[5];
  return a1;
}

uint64_t initializeWithTake for InterestedParty(uint64_t a1, uint64_t a2)
{
  long long v4 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v4;
  swift_unknownObjectWeakTakeInit();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  return a1;
}

void *assignWithTake for InterestedParty(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakTakeAssign();
  a1[5] = a2[5];
  return a1;
}

uint64_t getEnumTagSinglePayload for InterestedParty(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for InterestedParty(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)uint64_t result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
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
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for InterestedParty()
{
  return &type metadata for InterestedParty;
}

uint64_t sub_100008B2C()
{
  return sub_1000085B0();
}

uint64_t sub_100008B50@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, void (*a4)(char *, uint64_t, uint64_t)@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t *a8@<X8>)
{
  uint64_t v38 = a3;
  uint64_t v39 = a7;
  uint64_t v36 = a1;
  uint64_t v37 = a6;
  uint64_t v40 = a8;
  uint64_t v11 = sub_10002A080();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v35 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v35 - v16;
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
  v18((char *)&v35 - v16, a5, v11);
  int v19 = (*(uint64_t (**)(char *, uint64_t))(v12 + 88))(v17, v11);
  if (v19 == enum case for StatusType.askToBuyRequest(_:))
  {
    v18(v15, a5, v11);
    uint64_t v20 = self;
    swift_bridgeObjectRetain();
    uint64_t v21 = a4;
    swift_bridgeObjectRetain();
    uint64_t v22 = v37;
    swift_unknownObjectRetain();
    id v23 = [v20 askToBuyStream];
    id v24 = [v23 publisher];

    uint64_t v25 = sub_100002D88(&qword_100039760);
    swift_allocObject();
    uint64_t result = sub_1000080A0(v36, a2, v38, v21, (uint64_t)v15, v22, v39, v24, &qword_100039768, (uint64_t)sub_100008F20);
LABEL_5:
    uint64_t v34 = v40;
    v40[3] = v25;
    v34[4] = (uint64_t)&off_100035650;
    *uint64_t v34 = result;
    return result;
  }
  if (v19 == enum case for StatusType.screenTimeRequest(_:))
  {
    char v27 = v15;
    unint64_t v28 = a2;
    uint64_t v29 = (uint64_t)v27;
    v18(v27, a5, v11);
    uint64_t v30 = self;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    uint64_t v31 = v37;
    swift_unknownObjectRetain();
    id v32 = [v30 screenTimeRequestStream];
    id v33 = [v32 publisher];

    uint64_t v25 = sub_100002D88(&qword_100039758);
    swift_allocObject();
    uint64_t result = sub_1000080A0(v36, v28, v38, a4, v29, v31, v39, v33, &qword_1000397A8, (uint64_t)sub_1000090C4);
    goto LABEL_5;
  }
  sub_100029FF0();
  swift_willThrow();
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v17, v11);
}

uint64_t sub_100008ED4(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a2 = *(_OWORD *)a1;
  *(_OWORD *)(a2 + 16) = *(_OWORD *)(a1 + 16);
  swift_unknownObjectWeakTakeInit();
  *(void *)(a2 + 40) = *(void *)(a1 + 40);
  return a2;
}

void *sub_100008F24(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100008F68(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10002A080();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void *sub_100008FAC(void *a1, void *a2)
{
  return a2;
}

uint64_t sub_100008FE4(uint64_t a1)
{
  return a1;
}

uint64_t sub_100009018()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_100007504;
  *(_OWORD *)(v2 + 16) = v3;
  return _swift_task_switch(sub_100007FE4, 0, 0);
}

uint64_t sub_1000090C8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_100009108()
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100009148()
{
  uint64_t v2 = swift_task_alloc();
  long long v3 = *(_OWORD *)(v0 + 32);
  *(void *)(v1 + 16) = v2;
  *(void *)uint64_t v2 = v1;
  *(void *)(v2 + 8) = sub_1000065A0;
  *(_OWORD *)(v2 + 16) = v3;
  return _swift_task_switch(sub_100007FE4, 0, 0);
}

uint64_t sub_1000091F4()
{
  return swift_getGenericMetadata();
}

void sub_100009224()
{
  qword_100039820 = (uint64_t)&_swiftEmptySetSingleton;
}

BOOL sub_100009238()
{
  uint64_t v1 = OBJC_IVAR____TtC24PeopleMessagesScreenTime22BubbleContentContainer____lazy_storage___isMac;
  int v2 = *(unsigned __int8 *)(v0
                          + OBJC_IVAR____TtC24PeopleMessagesScreenTime22BubbleContentContainer____lazy_storage___isMac);
  if (v2 != 2) {
    return v2 & 1;
  }
  id v3 = [self currentDevice];
  id v4 = [v3 userInterfaceIdiom];

  BOOL result = v4 == (id)5;
  *(unsigned char *)(v0 + v1) = result;
  return result;
}

uint64_t sub_1000092BC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = sub_10002A110();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(a2 + 16)
    && (sub_10000C140(&qword_1000399E0, (void (*)(uint64_t))&type metadata accessor for MessageDetails.EventSource), v7 = sub_10002A830(), uint64_t v8 = -1 << *(unsigned char *)(a2 + 32), v9 = v7 & ~v8, v10 = a2 + 56, ((*(void *)(a2 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0))
  {
    uint64_t v17 = ~v8;
    uint64_t v18 = a2;
    uint64_t v11 = v4 + 16;
    uint64_t v12 = *(void (**)(char *, unint64_t, uint64_t))(v4 + 16);
    uint64_t v13 = *(void *)(v11 + 56);
    uint64_t v14 = (void (**)(char *, uint64_t))(v11 - 8);
    do
    {
      v12(v6, *(void *)(v18 + 48) + v13 * v9, v3);
      sub_10000C140((unint64_t *)&qword_1000399E8, (void (*)(uint64_t))&type metadata accessor for MessageDetails.EventSource);
      char v15 = sub_10002A850();
      (*v14)(v6, v3);
      if (v15) {
        break;
      }
      unint64_t v9 = (v9 + 1) & v17;
    }
    while (((*(void *)(v10 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) != 0);
  }
  else
  {
    char v15 = 0;
  }
  return v15 & 1;
}

uint64_t sub_1000094D0()
{
  uint64_t v1 = sub_10002A130();
  uint64_t v58 = *(void *)(v1 - 8);
  uint64_t v59 = v1;
  uint64_t v2 = __chkstk_darwin(v1);
  id v55 = (char *)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __chkstk_darwin(v2);
  uint64_t v56 = (char *)&v52 - v5;
  __chkstk_darwin(v4);
  uint64_t v57 = (char *)&v52 - v6;
  uint64_t v7 = sub_100002D88(&qword_1000399B8);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  uint64_t v10 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v52 - v11;
  uint64_t v13 = sub_10002A2C0();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v64 = v13;
  uint64_t v65 = v14;
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v62 = (char *)&v52 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v52 - v17;
  uint64_t v19 = sub_100029FB0();
  uint64_t v60 = *(void *)(v19 - 8);
  uint64_t v61 = v19;
  __chkstk_darwin(v19);
  uint64_t v21 = (char *)&v52 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v22 = sub_100002D88(&qword_1000399C0);
  __chkstk_darwin(v22 - 8);
  id v24 = (char *)&v52 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v25 = sub_10002A110();
  uint64_t v26 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  unint64_t v28 = (char *)&v52 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = v0 + OBJC_IVAR____TtC24PeopleMessagesScreenTime22BubbleContentContainer_details;
  sub_10002A150();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v25) == 1)
  {
    sub_10000714C((uint64_t)v24, &qword_1000399C0);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v28, v24, v25);
    if (qword_1000392C0 != -1) {
      swift_once();
    }
    char v29 = sub_1000092BC((uint64_t)v28, qword_100039820);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v28, v25);
    if (v29) {
      goto LABEL_23;
    }
  }
  sub_10002A000();
  swift_retain_n();
  uint64_t v30 = sub_100029FA0();
  int v31 = sub_10002AA30();
  if (os_log_type_enabled(v30, (os_log_type_t)v31))
  {
    int v54 = v31;
    uint64_t v32 = swift_slowAlloc();
    uint64_t v53 = swift_slowAlloc();
    v68[0] = v53;
    *(_DWORD *)uint64_t v32 = 67109634;
    sub_10002A1F0();
    uint64_t v34 = v64;
    uint64_t v33 = v65;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v65 + 48))(v12, 1, v64) == 1)
    {
      sub_10000714C((uint64_t)v12, &qword_1000399B8);
      swift_release();
      BOOL v35 = 1;
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v33 + 32))(v18, v12, v34);
      unint64_t v37 = sub_10002A2B0();
      if (v37 >> 62) {
        uint64_t v38 = sub_10002ABB0();
      }
      else {
        uint64_t v38 = *(void *)((v37 & 0xFFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      BOOL v35 = v38 == 0;
      (*(void (**)(char *, uint64_t))(v65 + 8))(v18, v34);
      swift_release();
    }
    LODWORD(v66) = v35;
    sub_10002AAD0();
    swift_release();
    *(_WORD *)(v32 + 8) = 1024;
    unsigned __int8 v39 = sub_100009DC0();
    swift_release();
    LODWORD(v66) = v39 & 1;
    sub_10002AAD0();
    swift_release();
    *(_WORD *)(v32 + 14) = 2080;
    uint64_t v40 = v57;
    sub_10002A210();
    uint64_t v41 = sub_10002A120();
    unint64_t v43 = v42;
    (*(void (**)(char *, uint64_t))(v58 + 8))(v40, v59);
    uint64_t v66 = sub_100006348(v41, v43, v68);
    sub_10002AAD0();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v30, (os_log_type_t)v54, "[canPresentApprovalActions] familyIsEmpty: %{BOOL}d, amIaParent: %{BOOL}d, details.status: %s", (uint8_t *)v32, 0x18u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v60 + 8))(v21, v61);
    uint64_t v36 = v64;
  }
  else
  {

    swift_release_n();
    (*(void (**)(char *, uint64_t))(v60 + 8))(v21, v61);
    uint64_t v36 = v64;
  }
  sub_10002A1F0();
  uint64_t v44 = v65;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v65 + 48))(v10, 1, v36) == 1)
  {
    sub_10000714C((uint64_t)v10, &qword_1000399B8);
LABEL_23:
    char v48 = 0;
    return v48 & 1;
  }
  (*(void (**)(char *, char *, uint64_t))(v44 + 32))(v62, v10, v36);
  unint64_t v45 = sub_10002A2B0();
  if (v45 >> 62) {
    uint64_t v46 = sub_10002ABB0();
  }
  else {
    uint64_t v46 = *(void *)((v45 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v44 + 8))(v62, v36);
  if (!v46 || (sub_100009DC0() & 1) == 0) {
    goto LABEL_23;
  }
  sub_10002A210();
  uint64_t v47 = v55;
  (*(void (**)(char *, void, uint64_t))(v58 + 104))(v55, enum case for MessageDetails.EventStatus.pending(_:), v59);
  sub_10000C140((unint64_t *)&qword_1000399F8, (void (*)(uint64_t))&type metadata accessor for MessageDetails.EventStatus);
  sub_10002A930();
  sub_10002A930();
  if (v68[0] == v66 && v68[1] == v67) {
    char v48 = 1;
  }
  else {
    char v48 = sub_10002AC00();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v50 = v59;
  unint64_t v51 = *(void (**)(char *, uint64_t))(v58 + 8);
  v51(v47, v59);
  v51(v56, v50);
  return v48 & 1;
}

id sub_100009DC0()
{
  uint64_t v0 = sub_100002D88(&qword_1000399B8);
  __chkstk_darwin(v0 - 8);
  uint64_t v2 = (char *)&v11 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = sub_10002A2C0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002A1F0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_10000714C((uint64_t)v2, &qword_1000399B8);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
  uint64_t v7 = (void *)sub_10002A2A0();
  if (!v7)
  {
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    return 0;
  }
  uint64_t v8 = v7;
  id v9 = [v7 isParent];

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v9;
}

uint64_t sub_100009F80(uint64_t a1)
{
  uint64_t v2 = v1;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC24PeopleMessagesScreenTime22BubbleContentContainer____lazy_storage___isIpad) = 2;
  *(unsigned char *)(v1 + OBJC_IVAR____TtC24PeopleMessagesScreenTime22BubbleContentContainer____lazy_storage___isMac) = 2;
  *(void *)(v1 + OBJC_IVAR____TtC24PeopleMessagesScreenTime22BubbleContentContainer_contentViewController) = 0;
  uint64_t v4 = v1 + OBJC_IVAR____TtC24PeopleMessagesScreenTime22BubbleContentContainer_resolvedSize;
  *(void *)uint64_t v4 = 0;
  *(void *)(v4 + 8) = 0;
  *(unsigned char *)(v4 + 16) = 1;
  uint64_t v5 = v1 + OBJC_IVAR____TtC24PeopleMessagesScreenTime22BubbleContentContainer_details;
  uint64_t v6 = sub_10002A280();
  uint64_t v7 = *(void *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v5, a1, v6);
  uint64_t v8 = sub_10002A180();
  if (v9 >> 60 == 15) {
    uint64_t v10 = 0;
  }
  else {
    uint64_t v10 = v8;
  }
  if (v9 >> 60 == 15) {
    unint64_t v11 = 0xC000000000000000;
  }
  else {
    unint64_t v11 = v9;
  }
  id v12 = objc_allocWithZone((Class)UIImage);
  Class isa = sub_100029ED0().super.isa;
  id v14 = [v12 initWithData:isa];
  sub_10000646C(v10, v11);

  if (!v14) {
    id v14 = [objc_allocWithZone((Class)UIImage) init];
  }
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
  *(void *)(v2 + OBJC_IVAR____TtC24PeopleMessagesScreenTime22BubbleContentContainer_image) = v14;
  return v2;
}

uint64_t sub_10000A10C()
{
  uint64_t v1 = sub_100029FB0();
  uint64_t v118 = *(void *)(v1 - 8);
  uint64_t v119 = v1;
  uint64_t v2 = __chkstk_darwin(v1);
  v116 = (char *)&v109 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  v115 = (char *)&v109 - v4;
  uint64_t v5 = sub_100002D88(&qword_1000399C0);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  uint64_t v109 = (uint64_t)&v109 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  uint64_t v110 = (uint64_t)&v109 - v8;
  uint64_t v9 = sub_100002D88(&qword_1000399B8);
  __chkstk_darwin(v9 - 8);
  v120 = (char *)&v109 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_10002A2C0();
  uint64_t v121 = *(void *)(v11 - 8);
  uint64_t v122 = v11;
  __chkstk_darwin(v11);
  v117 = (char *)&v109 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_10002A130();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v15 = __chkstk_darwin(v13);
  v112 = (char *)&v109 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15);
  v111 = (char *)&v109 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  v114 = (char *)&v109 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v113 = (char *)&v109 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  v124 = (char *)&v109 - v24;
  uint64_t v25 = __chkstk_darwin(v23);
  v123 = (char *)&v109 - v26;
  uint64_t v27 = __chkstk_darwin(v25);
  char v29 = (char *)&v109 - v28;
  uint64_t v30 = __chkstk_darwin(v27);
  uint64_t v32 = (char *)&v109 - v31;
  uint64_t v33 = __chkstk_darwin(v30);
  BOOL v35 = (char *)&v109 - v34;
  __chkstk_darwin(v33);
  unint64_t v37 = (char *)&v109 - v36;
  uint64_t v127 = v0 + OBJC_IVAR____TtC24PeopleMessagesScreenTime22BubbleContentContainer_details;
  sub_10002A210();
  v125 = *(void (**)(char *, void, uint64_t))(v14 + 104);
  uint64_t v126 = v14 + 104;
  v125(v35, enum case for MessageDetails.EventStatus.pending(_:), v13);
  sub_10000C140((unint64_t *)&qword_1000399F8, (void (*)(uint64_t))&type metadata accessor for MessageDetails.EventStatus);
  sub_10002A930();
  sub_10002A930();
  if (v130 == v128 && v131 == v129) {
    char v38 = 1;
  }
  else {
    char v38 = sub_10002AC00();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unsigned __int8 v39 = *(void (**)(char *, uint64_t))(v14 + 8);
  v39(v35, v13);
  v39(v37, v13);
  if (v38) {
    return sub_10002A8E0();
  }
  uint64_t v40 = 2099744;
  sub_10002A210();
  v125(v29, enum case for MessageDetails.EventStatus.expired(_:), v13);
  sub_10002A930();
  sub_10002A930();
  if (v130 == v128 && v131 == v129)
  {
    swift_bridgeObjectRelease_n();
    v39(v29, v13);
    uint64_t v41 = v32;
LABEL_14:
    v39(v41, v13);
    return v40;
  }
  char v42 = sub_10002AC00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v39(v29, v13);
  v39(v32, v13);
  if (v42) {
    return v40;
  }
  unint64_t v43 = v123;
  sub_10002A210();
  v125(v124, enum case for MessageDetails.EventStatus.unknown(_:), v13);
  sub_10002A930();
  sub_10002A930();
  if (v130 == v128 && v131 == v129)
  {
    swift_bridgeObjectRelease_n();
    v39(v124, v13);
    uint64_t v41 = v43;
    goto LABEL_14;
  }
  char v45 = sub_10002AC00();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v39(v124, v13);
  v39(v43, v13);
  if (v45) {
    return v40;
  }
  uint64_t v46 = (uint64_t)v120;
  sub_10002A1F0();
  uint64_t v47 = v121;
  uint64_t v48 = v122;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v121 + 48))(v46, 1, v122) == 1)
  {
    sub_10000714C(v46, &qword_1000399B8);
    uint64_t v49 = v116;
    sub_10002A010();
    uint64_t v50 = sub_100029FA0();
    os_log_type_t v51 = sub_10002AA40();
    if (os_log_type_enabled(v50, v51))
    {
      uint64_t v52 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v52 = 0;
      _os_log_impl((void *)&_mh_execute_header, v50, v51, "No family!", v52, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v118 + 8))(v49, v119);
    return v40;
  }
  uint64_t v53 = v117;
  (*(void (**)(char *, uint64_t, uint64_t))(v47 + 32))(v117, v46, v48);
  v120 = (char *)sub_10002A1B0();
  if ((v54 & 1) == 0)
  {
    unint64_t v55 = sub_10002A2B0();
    unint64_t v56 = v55;
    if (v55 >> 62)
    {
      swift_bridgeObjectRetain();
      uint64_t v57 = sub_10002ABB0();
      if (v57) {
        goto LABEL_24;
      }
    }
    else
    {
      uint64_t v57 = *(void *)((v55 & 0xFFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v57)
      {
LABEL_24:
        v123 = (char *)(v56 & 0xC000000000000001);
        uint64_t v58 = 4;
        unint64_t v59 = v56;
        while (1)
        {
          uint64_t v60 = v123 ? (char *)sub_10002AB20() : (char *)*(id *)(v56 + 8 * v58);
          uint64_t v61 = v60;
          uint64_t v62 = v58 - 3;
          if (__OFADD__(v58 - 4, 1)) {
            break;
          }
          id v63 = [v60 dsid];
          if (v63)
          {
            uint64_t v64 = v63;
            uint64_t v65 = (char *)[v63 integerValue];
            v124 = v61;
            uint64_t v66 = v65;

            BOOL v67 = v66 == v120;
            uint64_t v61 = v124;
            if (v67)
            {
              swift_bridgeObjectRelease_n();
              id v68 = v113;
              sub_10002A210();
              v125(v114, enum case for MessageDetails.EventStatus.denied(_:), v13);
              sub_10002A930();
              sub_10002A930();
              uint64_t v69 = v121;
              uint64_t v70 = v122;
              if (v130 == v128 && v131 == v129)
              {
                swift_bridgeObjectRelease_n();
                v39(v114, v13);
                v39(v68, v13);
LABEL_37:
                [v61 isMe];
                sub_10002A8E0();
                swift_bridgeObjectRelease();
                sub_100002D88(&qword_100039A00);
                uint64_t v72 = swift_allocObject();
                *(_OWORD *)(v72 + 16) = xmmword_10002B690;
                uint64_t v73 = sub_10002AA70();
                id v74 = v61;
                uint64_t v76 = v75;
                *(void *)(v72 + 56) = &type metadata for String;
                *(void *)(v72 + 64) = sub_10000C1F0();
                *(void *)(v72 + 32) = v73;
                *(void *)(v72 + 40) = v76;
                uint64_t v40 = sub_10002A8A0();

                swift_bridgeObjectRelease();
                (*(void (**)(char *, uint64_t))(v69 + 8))(v117, v70);
                return v40;
              }
              char v71 = sub_10002AC00();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v39(v114, v13);
              v39(v68, v13);
              if (v71) {
                goto LABEL_37;
              }
              v77 = v111;
              sub_10002A210();
              v78 = v112;
              v125(v112, enum case for MessageDetails.EventStatus.approved(_:), v13);
              sub_10000C140(&qword_1000399D0, (void (*)(uint64_t))&type metadata accessor for MessageDetails.EventStatus);
              char v79 = sub_10002A850();
              v39(v78, v13);
              v39(v77, v13);
              if ((v79 & 1) == 0)
              {
                (*(void (**)(char *, uint64_t))(v69 + 8))(v117, v122);

                return 2099744;
              }
              uint64_t v80 = v110;
              sub_10002A150();
              uint64_t v58 = sub_10002A110();
              uint64_t v57 = *(void *)(v58 - 8);
              int v81 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v57 + 48))(v80, 1, v58);
              uint64_t v82 = v122;
              if (v81 == 1)
              {
LABEL_40:
                uint64_t v40 = sub_10002A8E0();

LABEL_44:
                (*(void (**)(char *, uint64_t))(v69 + 8))(v117, v82);
                sub_10000714C(v80, &qword_1000399C0);
                return v40;
              }
              uint64_t v83 = v109;
              sub_10000C188(v80, v109);
              int v84 = (*(uint64_t (**)(uint64_t, uint64_t))(v57 + 88))(v83, v58);
              if (v84 == enum case for MessageDetails.EventSource.askToBuy(_:))
              {
                [v61 isMe];
                sub_10002A8E0();
                swift_bridgeObjectRelease();
                sub_100002D88(&qword_100039A00);
                uint64_t v85 = swift_allocObject();
                *(_OWORD *)(v85 + 16) = xmmword_10002B690;
                uint64_t v86 = sub_10002AA70();
                v87 = v61;
                uint64_t v89 = v88;
                *(void *)(v85 + 56) = &type metadata for String;
                *(void *)(v85 + 64) = sub_10000C1F0();
                *(void *)(v85 + 32) = v86;
                *(void *)(v85 + 40) = v89;
                uint64_t v40 = sub_10002A8A0();
                swift_bridgeObjectRelease();

                goto LABEL_44;
              }
              if (v84 == enum case for MessageDetails.EventSource.screenTime(_:))
              {
                sub_10002A160();
                uint64_t v90 = sub_10002A900();
                uint64_t v92 = v91;
                swift_bridgeObjectRelease();
                if (v92)
                {
                  if ([v124 isMe])
                  {
                    sub_10002A8E0();
                    sub_100002D88(&qword_100039A00);
                    uint64_t v93 = swift_allocObject();
                    *(_OWORD *)(v93 + 16) = xmmword_10002B690;
                    *(void *)(v93 + 56) = &type metadata for String;
                    *(void *)(v93 + 64) = sub_10000C1F0();
                    *(void *)(v93 + 32) = v90;
                    *(void *)(v93 + 40) = v92;
                    uint64_t v40 = sub_10002A8A0();
                    swift_bridgeObjectRelease();
                  }
                  else
                  {
                    sub_10002A8E0();
                    sub_100002D88(&qword_100039A00);
                    uint64_t v99 = swift_allocObject();
                    *(_OWORD *)(v99 + 16) = xmmword_10002B7B0;
                    id v100 = v124;
                    uint64_t v101 = sub_10002AA70();
                    uint64_t v103 = v102;
                    *(void *)(v99 + 56) = &type metadata for String;
                    unint64_t v104 = sub_10000C1F0();
                    *(void *)(v99 + 32) = v101;
                    *(void *)(v99 + 40) = v103;
                    *(void *)(v99 + 96) = &type metadata for String;
                    *(void *)(v99 + 104) = v104;
                    *(void *)(v99 + 64) = v104;
                    *(void *)(v99 + 72) = v90;
                    *(void *)(v99 + 80) = v92;
                    uint64_t v40 = sub_10002A8A0();
                    swift_bridgeObjectRelease();
                  }
                }
                else
                {
                  id v94 = v124;
                  [v124 isMe];
                  sub_10002A8E0();
                  swift_bridgeObjectRelease();
                  sub_100002D88(&qword_100039A00);
                  uint64_t v95 = swift_allocObject();
                  *(_OWORD *)(v95 + 16) = xmmword_10002B690;
                  uint64_t v96 = sub_10002AA70();
                  uint64_t v98 = v97;
                  *(void *)(v95 + 56) = &type metadata for String;
                  *(void *)(v95 + 64) = sub_10000C1F0();
                  *(void *)(v95 + 32) = v96;
                  *(void *)(v95 + 40) = v98;
                  uint64_t v40 = sub_10002A8A0();
                  swift_bridgeObjectRelease();
                }
                (*(void (**)(char *, uint64_t))(v121 + 8))(v117, v122);
                sub_10000714C(v110, &qword_1000399C0);
                return v40;
              }
LABEL_50:
              (*(void (**)(uint64_t, uint64_t))(v57 + 8))(v109, v58);
              uint64_t v69 = v121;
              uint64_t v82 = v122;
              uint64_t v80 = v110;
              uint64_t v61 = v124;
              goto LABEL_40;
            }
          }

          ++v58;
          unint64_t v56 = v59;
          if (v62 == v57) {
            goto LABEL_55;
          }
        }
        __break(1u);
        goto LABEL_50;
      }
    }
LABEL_55:
    swift_bridgeObjectRelease_n();
    uint64_t v47 = v121;
    uint64_t v48 = v122;
    uint64_t v53 = v117;
    uint64_t v40 = 2099744;
  }
  uint64_t v105 = v115;
  sub_10002A010();
  v106 = sub_100029FA0();
  os_log_type_t v107 = sub_10002AA40();
  if (os_log_type_enabled(v106, v107))
  {
    v108 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v108 = 0;
    _os_log_impl((void *)&_mh_execute_header, v106, v107, "No approver found", v108, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v118 + 8))(v105, v119);
  (*(void (**)(char *, uint64_t))(v47 + 8))(v53, v48);
  return v40;
}

id sub_10000B280()
{
  uint64_t v0 = sub_10002A130();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002A210();
  int v4 = (*(uint64_t (**)(char *, uint64_t))(v1 + 88))(v3, v0);
  if (v4 == enum case for MessageDetails.EventStatus.approved(_:)) {
    return [self systemGreenColor];
  }
  if (v4 == enum case for MessageDetails.EventStatus.denied(_:)) {
    return [self systemRedColor];
  }
  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return 0;
}

void *sub_10000B414@<X0>(char **a1@<X8>)
{
  char v71 = a1;
  uint64_t v2 = sub_100002D88(&qword_1000399B8);
  __chkstk_darwin(v2 - 8);
  uint64_t v69 = (char *)&v61 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_10002A2C0();
  uint64_t v75 = *(void *)(v73 - 8);
  __chkstk_darwin(v73);
  uint64_t v70 = (char *)&v61 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100002D88(&qword_1000399C0);
  uint64_t v6 = __chkstk_darwin(v5 - 8);
  BOOL v67 = (char *)&v61 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  id v63 = (char *)&v61 - v8;
  uint64_t v74 = sub_10002A110();
  uint64_t v68 = *(void *)(v74 - 8);
  uint64_t v9 = __chkstk_darwin(v74);
  uint64_t v64 = (char *)&v61 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v62 = (char *)&v61 - v11;
  uint64_t v12 = sub_10002A130();
  uint64_t v13 = *(void *)(v12 - 8);
  uint64_t v14 = v13;
  uint64_t v15 = __chkstk_darwin(v12);
  uint64_t v17 = (char *)&v61 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v19 = (char *)&v61 - v18;
  sub_100002D88(&qword_1000399C8);
  uint64_t v20 = *(void *)(v13 + 72);
  unint64_t v21 = (*(unsigned __int8 *)(v14 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80);
  uint64_t v22 = swift_allocObject();
  long long v61 = xmmword_10002B7B0;
  *(_OWORD *)(v22 + 16) = xmmword_10002B7B0;
  unint64_t v23 = v22 + v21;
  uint64_t v24 = *(void (**)(void))(v14 + 104);
  ((void (*)(unint64_t, void, uint64_t))v24)(v23, enum case for MessageDetails.EventStatus.approved(_:), v12);
  uint64_t v66 = v23 + v20;
  v24();
  uint64_t v72 = v1;
  uint64_t v76 = v1 + OBJC_IVAR____TtC24PeopleMessagesScreenTime22BubbleContentContainer_details;
  sub_10002A210();
  uint64_t v65 = *(void (**)(char *, unint64_t, uint64_t))(v14 + 16);
  v65(v17, v23, v12);
  sub_10000C140(&qword_1000399D0, (void (*)(uint64_t))&type metadata accessor for MessageDetails.EventStatus);
  char v25 = sub_10002A850();
  uint64_t v26 = *(void (**)(char *, uint64_t))(v14 + 8);
  swift_bridgeObjectRetain();
  v26(v17, v12);
  if (v25)
  {
    swift_bridgeObjectRelease();
    v26(v19, v12);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    uint64_t v27 = v73;
    uint64_t v28 = v74;
  }
  else
  {
    v65(v17, v66, v12);
    char v29 = sub_10002A850();
    v26(v17, v12);
    swift_bridgeObjectRelease();
    v26(v19, v12);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_deallocClassInstance();
    uint64_t v27 = v73;
    uint64_t v28 = v74;
    if ((v29 & 1) == 0)
    {
      uint64_t v30 = (uint64_t)v63;
      sub_10002A150();
      uint64_t v31 = v68;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v68 + 48))(v30, 1, v28) == 1)
      {
        sub_10000714C(v30, &qword_1000399C0);
      }
      else
      {
        uint64_t v19 = v62;
        (*(void (**)(char *, uint64_t, uint64_t))(v31 + 32))(v62, v30, v28);
        if (qword_1000392C0 != -1) {
          swift_once();
        }
        char v32 = sub_1000092BC((uint64_t)v19, qword_100039820);
        (*(void (**)(char *, uint64_t))(v31 + 8))(v19, v28);
        if (v32)
        {
          sub_100002D88(&qword_1000399D8);
          uint64_t v33 = swift_allocObject();
          *(_OWORD *)(v33 + 16) = v61;
          *(void *)(v33 + 32) = 0;
          *(void *)(v33 + 40) = 0;
          *(void *)(v33 + 48) = sub_10002A8E0();
          *(void *)(v33 + 56) = v34;
          goto LABEL_11;
        }
      }
    }
  }
  sub_10000A10C();
  uint64_t v35 = sub_10002A8F0();
  swift_bridgeObjectRelease();
  uint64_t v33 = (uint64_t)sub_10000BD6C(v35);
  swift_bridgeObjectRelease();
LABEL_11:
  uint64_t v36 = sub_10000B280();
  unint64_t v37 = v36;
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  if (v36)
  {
    v36;
    swift_bridgeObjectRetain();
    uint64_t v36 = (void *)sub_10002A6B0();
    uint64_t v42 = v39;
    unint64_t v43 = v41;
  }
  else
  {
    uint64_t v42 = 0;
    unint64_t v43 = 0;
  }
  uint64_t v44 = *(void *)(v33 + 16);
  uint64_t v73 = v39;
  uint64_t v74 = (uint64_t)v36;
  uint64_t v72 = v42;
  if (v44 == 2)
  {
    uint64_t v19 = *(char **)(v33 + 32);
    uint64_t v22 = *(void *)(v33 + 40);
    uint64_t v39 = *(void *)(v33 + 56);
    uint64_t v66 = *(void *)(v33 + 48);
    swift_bridgeObjectRetain();
  }
  else
  {
    if (!v44)
    {
      __break(1u);
      goto LABEL_32;
    }
    uint64_t v66 = 0;
    uint64_t v39 = 0;
    uint64_t v19 = *(char **)(v33 + 32);
    uint64_t v22 = *(void *)(v33 + 40);
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v45 = (uint64_t)v69;
  sub_10002A1F0();
  uint64_t v46 = v75;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v75 + 48))(v45, 1, v27) != 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v46 + 32))(v70, v45, v27);
    unint64_t v47 = sub_10002A2B0();
    if (!(v47 >> 62))
    {
      uint64_t v48 = *(void *)((v47 & 0xFFFFFFFFFFFFFF8) + 0x10);
      goto LABEL_22;
    }
LABEL_32:
    uint64_t v48 = sub_10002ABB0();
LABEL_22:
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v75 + 8))(v70, v27);
    if (v48) {
      goto LABEL_28;
    }
    goto LABEL_23;
  }
  sub_10000714C(v45, &qword_1000399B8);
LABEL_23:
  uint64_t v49 = v67;
  sub_10002A150();
  uint64_t v50 = (uint64_t)v49;
  uint64_t v51 = v68;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v68 + 48))(v50, 1, v28) == 1)
  {
    sub_10000714C(v50, &qword_1000399C0);
LABEL_29:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_10002A8D0();
    uint64_t v56 = sub_10002A8E0();
    uint64_t v39 = v58;
    swift_bridgeObjectRelease();
    uint64_t v19 = (char *)sub_10002A8E0();
    uint64_t v22 = v59;
    BOOL result = sub_10000C100(v37);
    uint64_t v57 = 0;
    unint64_t v43 = 0;
    uint64_t v55 = v74;
    goto LABEL_30;
  }
  uint64_t v52 = (uint64_t)v64;
  (*(void (**)(char *, uint64_t, uint64_t))(v51 + 32))(v64, v50, v28);
  if (qword_1000392C0 != -1) {
    swift_once();
  }
  char v53 = sub_1000092BC(v52, qword_100039820);
  (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v52, v28);
  if ((v53 & 1) == 0) {
    goto LABEL_29;
  }
LABEL_28:
  BOOL result = sub_10000C100(v37);
  uint64_t v55 = v74;
  uint64_t v56 = v66;
  uint64_t v57 = (char *)v72;
LABEL_30:
  uint64_t v60 = v71;
  *char v71 = v19;
  v60[1] = (char *)v22;
  v60[2] = (char *)v56;
  v60[3] = (char *)v39;
  v60[4] = v57;
  v60[5] = v43;
  v60[6] = (char *)v55;
  return result;
}

void *sub_10000BD6C(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {
    sub_100018AA8(0, v1, 0);
    uint64_t v3 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain_n();
      sub_100002D88(&qword_1000399F0);
      swift_dynamicCast();
      swift_bridgeObjectRelease();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        sub_100018AA8(0, _swiftEmptyArrayStorage[2] + 1, 1);
      }
      unint64_t v5 = _swiftEmptyArrayStorage[2];
      unint64_t v4 = _swiftEmptyArrayStorage[3];
      if (v5 >= v4 >> 1) {
        sub_100018AA8(v4 > 1, v5 + 1, 1);
      }
      v3 += 16;
      _swiftEmptyArrayStorage[2] = v5 + 1;
      uint64_t v6 = (char *)&_swiftEmptyArrayStorage[2 * v5];
      *((void *)v6 + 4) = v8;
      *((void *)v6 + 5) = v9;
      --v1;
    }
    while (v1);
  }
  return _swiftEmptyArrayStorage;
}

uint64_t BubbleContentContainer.deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC24PeopleMessagesScreenTime22BubbleContentContainer_details;
  uint64_t v2 = sub_10002A280();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return v0;
}

uint64_t BubbleContentContainer.__deallocating_deinit()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC24PeopleMessagesScreenTime22BubbleContentContainer_details;
  uint64_t v2 = sub_10002A280();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_10000BFF0()
{
  return type metadata accessor for BubbleContentContainer();
}

uint64_t type metadata accessor for BubbleContentContainer()
{
  uint64_t result = qword_100039860;
  if (!qword_100039860) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_10000C044()
{
  uint64_t result = sub_10002A280();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

void *sub_10000C100(void *result)
{
  if (result)
  {

    return (void *)swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_10000C140(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000C188(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002D88(&qword_1000399C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_10000C1F0()
{
  unint64_t result = qword_100039A08;
  if (!qword_100039A08)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039A08);
  }
  return result;
}

BOOL sub_10000C244(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

Swift::Int sub_10000C258()
{
  Swift::UInt v1 = *v0;
  sub_10002AC60();
  sub_10002AC70(v1);
  return sub_10002AC80();
}

void sub_10000C2A0()
{
  sub_10002AC70(*v0);
}

Swift::Int sub_10000C2CC()
{
  Swift::UInt v1 = *v0;
  sub_10002AC60();
  sub_10002AC70(v1);
  return sub_10002AC80();
}

uint64_t sub_10000C320(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v71 = a1;
  uint64_t v73 = (void (*)(char *, unint64_t, uint64_t))sub_100029FB0();
  uint64_t v3 = *((void *)v73 - 1);
  uint64_t v4 = __chkstk_darwin(v73);
  uint64_t v6 = (char *)&v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v65 = (char *)&v62 - v7;
  uint64_t v72 = sub_100029DD0();
  uint64_t v8 = *(void *)(v72 - 8);
  __chkstk_darwin(v72);
  uint64_t v10 = (char *)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100002D88(&qword_100039AD0);
  __chkstk_darwin(v11 - 8);
  uint64_t v64 = (char *)&v62 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100002D88(&qword_100039AD8);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v62 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_100029E00();
  uint64_t v17 = *(void *)(v16 - 8);
  uint64_t v67 = v16;
  uint64_t v68 = v17;
  __chkstk_darwin(v16);
  uint64_t v66 = (char *)&v62 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_100002D88(&qword_100039460);
  uint64_t v20 = __chkstk_darwin(v19 - 8);
  uint64_t v22 = (char *)&v62 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v20);
  uint64_t v24 = (char *)&v62 - v23;
  uint64_t v25 = sub_100029EB0();
  uint64_t v26 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  uint64_t v69 = (char *)&v62 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v28 = [v2 selectedMessage];
  if (!v28)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v26 + 56))(v24, 1, 1, v25);
    goto LABEL_7;
  }
  char v29 = v28;
  uint64_t v70 = v25;
  id v30 = [v28 URL];

  if (v30)
  {
    sub_100029E90();

    uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v26 + 56);
    char v32 = v22;
    uint64_t v33 = 0;
  }
  else
  {
    uint64_t v31 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v26 + 56);
    char v32 = v22;
    uint64_t v33 = 1;
  }
  uint64_t v34 = v70;
  v31(v32, v33, 1, v70);
  sub_100012440((uint64_t)v22, (uint64_t)v24, &qword_100039460);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v24, 1, v34) == 1)
  {
LABEL_7:
    sub_10000714C((uint64_t)v24, &qword_100039460);
    sub_10002A010();
    uint64_t v35 = sub_100029FA0();
    os_log_type_t v36 = sub_10002AA40();
    if (os_log_type_enabled(v35, v36))
    {
      unint64_t v37 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)unint64_t v37 = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, v36, "No message url in conversation", v37, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, void (*)(char *, unint64_t, uint64_t)))(v3 + 8))(v6, v73);
    return 0;
  }
  uint64_t v40 = v69;
  (*(void (**)(char *, char *, uint64_t))(v26 + 32))(v69, v24, v34);
  sub_100029DF0();
  uint64_t v42 = v67;
  uint64_t v41 = v68;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v68 + 48))(v15, 1, v67) == 1)
  {
    sub_10000714C((uint64_t)v15, &qword_100039AD8);
    unint64_t v43 = v65;
    sub_10002A010();
    uint64_t v44 = sub_100029FA0();
    os_log_type_t v45 = sub_10002AA40();
    if (os_log_type_enabled(v44, v45))
    {
      uint64_t v46 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v46 = 0;
      _os_log_impl((void *)&_mh_execute_header, v44, v45, "Can't parse bubble view url components", v46, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, void (*)(char *, unint64_t, uint64_t)))(v3 + 8))(v43, v73);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v40, v70);
  }
  else
  {
    unint64_t v47 = v66;
    (*(void (**)(char *, char *, uint64_t))(v41 + 32))(v66, v15, v42);
    uint64_t v48 = v41;
    uint64_t v49 = sub_100029DE0();
    uint64_t v38 = v49;
    if (!v49)
    {
      (*(void (**)(char *, uint64_t))(v48 + 8))(v47, v42);
      (*(void (**)(char *, uint64_t))(v26 + 8))(v40, v34);
      return v38;
    }
    uint64_t v50 = *(void *)(v49 + 16);
    if (v50)
    {
      uint64_t v62 = v49;
      uint64_t v63 = v8;
      uint64_t v51 = v8 + 16;
      uint64_t v73 = *(void (**)(char *, unint64_t, uint64_t))(v8 + 16);
      unint64_t v52 = v49 + ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
      char v53 = (void (**)(char *, uint64_t))(v8 + 8);
      uint64_t v65 = *(char **)(v51 + 56);
      swift_bridgeObjectRetain();
      uint64_t v54 = v72;
      while (1)
      {
        v73(v10, v52, v54);
        uint64_t v55 = sub_100029DB0();
        uint64_t v57 = v56;
        if (v55 == sub_100029FD0() && v57 == v58)
        {
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease_n();
          goto LABEL_28;
        }
        char v59 = sub_10002AC00();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        if (v59) {
          break;
        }
        uint64_t v54 = v72;
        (*v53)(v10, v72);
        v52 += (unint64_t)v65;
        if (!--v50)
        {
          swift_bridgeObjectRelease();
          uint64_t v60 = 1;
          uint64_t v8 = v63;
          uint64_t v61 = (uint64_t)v64;
          goto LABEL_29;
        }
      }
      swift_bridgeObjectRelease();
LABEL_28:
      uint64_t v8 = v63;
      uint64_t v61 = (uint64_t)v64;
      uint64_t v54 = v72;
      (*(void (**)(char *, char *, uint64_t))(v63 + 32))(v64, v10, v72);
      uint64_t v60 = 0;
LABEL_29:
      unint64_t v47 = v66;
      uint64_t v42 = v67;
    }
    else
    {
      uint64_t v60 = 1;
      uint64_t v54 = v72;
      uint64_t v61 = (uint64_t)v64;
    }
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56))(v61, v60, 1, v54);
    swift_bridgeObjectRelease();
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v61, 1, v54) != 1)
    {
      uint64_t v38 = sub_100029DC0();
      (*(void (**)(char *, uint64_t))(v68 + 8))(v47, v42);
      (*(void (**)(char *, uint64_t))(v26 + 8))(v69, v70);
      (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v61, v54);
      return v38;
    }
    (*(void (**)(char *, uint64_t))(v68 + 8))(v47, v42);
    (*(void (**)(char *, uint64_t))(v26 + 8))(v69, v70);
    sub_10000714C(v61, &qword_100039AD0);
  }
  return 0;
}

uint64_t sub_10000CBEC@<X0>(uint64_t a1@<X1>, unint64_t a2@<X2>, char *a3@<X8>)
{
  unint64_t v112 = a2;
  uint64_t v114 = a1;
  uint64_t v110 = a3;
  uint64_t v4 = sub_100029FB0();
  uint64_t v111 = *(void *)(v4 - 8);
  uint64_t v5 = __chkstk_darwin(v4);
  uint64_t v103 = (char *)&v86 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v8 = __chkstk_darwin(v7);
  uint64_t v98 = (char *)&v86 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v99 = (char *)&v86 - v11;
  __chkstk_darwin(v10);
  uint64_t v96 = (char *)&v86 - v12;
  uint64_t v94 = sub_10002A2C0();
  uint64_t v93 = *(void *)(v94 - 8);
  __chkstk_darwin(v94);
  uint64_t v90 = (char *)&v86 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100002D88(&qword_1000399B8);
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  uint64_t v92 = (uint64_t)&v86 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v91 = (uint64_t)&v86 - v18;
  __chkstk_darwin(v17);
  uint64_t v95 = (char *)&v86 - v19;
  uint64_t v20 = sub_10002A280();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v97 = (char *)&v86 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v102 = (char *)&v86 - v25;
  uint64_t v26 = __chkstk_darwin(v24);
  uint64_t v109 = (char *)&v86 - v27;
  __chkstk_darwin(v26);
  v108 = (char *)&v86 - v28;
  uint64_t v29 = sub_100002D88(&qword_100039AE0);
  uint64_t v30 = __chkstk_darwin(v29 - 8);
  unint64_t v104 = (char *)&v86 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32 = __chkstk_darwin(v30);
  uint64_t v34 = (char *)&v86 - v33;
  uint64_t v35 = __chkstk_darwin(v32);
  unint64_t v37 = (char *)&v86 - v36;
  __chkstk_darwin(v35);
  uint64_t v39 = (char *)&v86 - v38;
  uint64_t v113 = v21;
  uint64_t v40 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v21 + 56);
  v40((char *)&v86 - v38, 1, 1, v20);
  uint64_t v107 = v3;
  sub_10000DC18(1, (uint64_t)v37);
  uint64_t v105 = v4;
  v106 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v40;
  sub_10000714C((uint64_t)v39, &qword_100039AE0);
  v40(v37, 0, 1, v20);
  sub_100012440((uint64_t)v37, (uint64_t)v39, &qword_100039AE0);
  uint64_t v41 = v21 + 56;
  uint64_t v42 = v113;
  uint64_t v43 = v107;
  sub_1000123DC((uint64_t)v39, (uint64_t)v34, &qword_100039AE0);
  uint64_t v44 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v42 + 48);
  if (v44((uint64_t)v34, 1, v20) == 1)
  {
    sub_10000714C((uint64_t)v39, &qword_100039AE0);
    sub_10000714C((uint64_t)v34, &qword_100039AE0);
    return v106((uint64_t)v110, 1, 1, v20);
  }
  else
  {
    uint64_t v89 = v41;
    uint64_t v88 = v39;
    uint64_t v46 = v108;
    id v100 = *(void (**)(char *, char *, uint64_t))(v42 + 32);
    uint64_t v101 = v42 + 32;
    v100(v108, v34, v20);
    (*(void (**)(char *, char *, uint64_t))(v42 + 16))(v109, v46, v20);
    sub_100008F24((void *)(v43 + 48), *(void *)(v43 + 72));
    uint64_t v47 = (uint64_t)v104;
    unint64_t v48 = v112;
    sub_10002A360();
    if (v44(v47, 1, v20) == 1)
    {
      sub_10000714C(v47, &qword_100039AE0);
      uint64_t v49 = v98;
      sub_10002A010();
      swift_bridgeObjectRetain_n();
      uint64_t v50 = sub_100029FA0();
      os_log_type_t v51 = sub_10002AA20();
      if (os_log_type_enabled(v50, v51))
      {
        unint64_t v52 = (uint8_t *)swift_slowAlloc();
        uint64_t v116 = swift_slowAlloc();
        *(_DWORD *)unint64_t v52 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v115 = sub_100006348(v114, v48, &v116);
        sub_10002AAD0();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v50, v51, "%s - cached message details is nil", v52, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v111 + 8))(v98, v105);
      }
      else
      {
        swift_bridgeObjectRelease_n();

        (*(void (**)(char *, uint64_t))(v111 + 8))(v49, v105);
      }
      (*(void (**)(char *, uint64_t))(v42 + 8))(v108, v20);
      sub_10000714C((uint64_t)v88, &qword_100039AE0);
      uint64_t v62 = v110;
      uint64_t v63 = v106;
    }
    else
    {
      v100(v102, (char *)v47, v20);
      char v53 = v108;
      sub_10002A240();
      uint64_t v87 = v20;
      if (v54)
      {
        uint64_t v64 = v96;
        sub_10002A010();
        swift_bridgeObjectRetain_n();
        uint64_t v65 = sub_100029FA0();
        os_log_type_t v66 = sub_10002AA40();
        BOOL v67 = os_log_type_enabled(v65, v66);
        uint64_t v68 = v111;
        uint64_t v69 = v114;
        if (v67)
        {
          uint64_t v70 = (uint8_t *)swift_slowAlloc();
          unint64_t v71 = v48;
          uint64_t v116 = swift_slowAlloc();
          *(_DWORD *)uint64_t v70 = 136315138;
          swift_bridgeObjectRetain();
          uint64_t v115 = sub_100006348(v69, v48, &v116);
          uint64_t v42 = v113;
          sub_10002AAD0();
          swift_bridgeObjectRelease_n();
          _os_log_impl((void *)&_mh_execute_header, v65, v66, "%s - userDSID is nil", v70, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          uint64_t v72 = *(void (**)(char *, uint64_t))(v68 + 8);
          uint64_t v73 = v96;
        }
        else
        {

          swift_bridgeObjectRelease_n();
          uint64_t v72 = *(void (**)(char *, uint64_t))(v68 + 8);
          uint64_t v73 = v64;
          unint64_t v71 = v48;
        }
        uint64_t v60 = v105;
        v72(v73, v105);
      }
      else
      {
        sub_100008F24((void *)(v107 + 88), *(void *)(v107 + 112));
        uint64_t v55 = (uint64_t)v95;
        sub_10002A380();
        sub_1000123DC(v55, v91, &qword_1000399B8);
        sub_10002A200();
        uint64_t v56 = v92;
        sub_1000123DC(v55, v92, &qword_1000399B8);
        uint64_t v57 = v93;
        uint64_t v58 = v94;
        int v59 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v93 + 48))(v56, 1, v94);
        uint64_t v60 = v105;
        if (v59 == 1)
        {
          sub_10000714C(v55, &qword_1000399B8);
          uint64_t v61 = v56;
        }
        else
        {
          uint64_t v74 = v90;
          (*(void (**)(char *, uint64_t, uint64_t))(v57 + 32))(v90, v56, v58);
          uint64_t v75 = (void *)sub_10002A290();
          sub_10002AA70();

          sub_10002A250();
          uint64_t v76 = v74;
          char v53 = v108;
          (*(void (**)(char *, uint64_t))(v57 + 8))(v76, v58);
          uint64_t v61 = (uint64_t)v95;
        }
        sub_10000714C(v61, &qword_1000399B8);
        unint64_t v71 = v112;
      }
      v77 = v99;
      v78 = v97;
      sub_10002A100();
      char v79 = v53;
      uint64_t v80 = *(void (**)(char *, uint64_t))(v42 + 8);
      int v81 = v109;
      uint64_t v20 = v87;
      v80(v109, v87);
      v100(v81, v78, v20);
      sub_10002A010();
      swift_bridgeObjectRetain_n();
      uint64_t v82 = sub_100029FA0();
      os_log_type_t v83 = sub_10002AA20();
      if (os_log_type_enabled(v82, v83))
      {
        int v84 = (uint8_t *)swift_slowAlloc();
        uint64_t v116 = swift_slowAlloc();
        *(_DWORD *)int v84 = 136315138;
        swift_bridgeObjectRetain();
        uint64_t v115 = sub_100006348(v114, v71, &v116);
        sub_10002AAD0();
        swift_bridgeObjectRelease_n();
        _os_log_impl((void *)&_mh_execute_header, v82, v83, "%s - loaded cached message details from cache", v84, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v111 + 8))(v99, v105);
        v80(v102, v20);
        uint64_t v85 = v108;
      }
      else
      {
        swift_bridgeObjectRelease_n();

        (*(void (**)(char *, uint64_t))(v111 + 8))(v77, v60);
        v80(v102, v20);
        uint64_t v85 = v79;
      }
      v80(v85, v20);
      sub_10000714C((uint64_t)v88, &qword_100039AE0);
      uint64_t v63 = v106;
      uint64_t v62 = v110;
    }
    v100(v62, v109, v20);
    return v63((uint64_t)v62, 0, 1, v20);
  }
}

uint64_t sub_10000DC18@<X0>(int a1@<W3>, uint64_t a2@<X8>)
{
  int v57 = a1;
  uint64_t v56 = a2;
  uint64_t v3 = sub_100029FB0();
  uint64_t v58 = *(void *)(v3 - 8);
  uint64_t v59 = v3;
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v47 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v8 = (char *)&v47 - v7;
  uint64_t v9 = sub_10002A280();
  uint64_t v54 = *(void *)(v9 - 8);
  uint64_t v55 = v9;
  __chkstk_darwin(v9);
  uint64_t v11 = (char *)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_100002D88(&qword_100039AD8);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_100029E00();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100029DF0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    sub_10000714C((uint64_t)v14, &qword_100039AD8);
    sub_10002A010();
    uint64_t v19 = sub_100029FA0();
    os_log_type_t v20 = sub_10002AA40();
    if (os_log_type_enabled(v19, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, v20, "Can't parse bubble view url components", v21, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v58 + 8))(v6, v59);
    sub_1000124A4();
    swift_allocError();
    *uint64_t v22 = 2;
    return swift_willThrow();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v18, v14, v15);
    sub_10002A140();
    if (v2)
    {
      return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
    }
    else
    {
      uint64_t v24 = sub_10002A230();
      if (!v25) {
        uint64_t v24 = sub_10002A270();
      }
      uint64_t v26 = v24;
      unint64_t v27 = v25;
      uint64_t v28 = sub_10002A180();
      unint64_t v30 = v29;
      sub_1000124F8(v28, v29);
      if (v30 >> 60 == 15)
      {
        if (qword_1000392B8 != -1) {
          swift_once();
        }
        ImageCache.getFromCache(_:)(v26, v27);
        unint64_t v32 = v31;
        swift_bridgeObjectRelease();
        if (v32 >> 60 != 15) {
          sub_10002A190();
        }
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      if (v57)
      {
        uint64_t v33 = v8;
        uint64_t v34 = sub_10002A180();
        unint64_t v36 = v35;
        sub_1000124F8(v34, v35);
        if (v36 >> 60 == 15)
        {
          if (swift_unknownObjectWeakLoadStrong())
          {
            if (qword_1000392D0 != -1) {
              swift_once();
            }
            uint64_t v37 = qword_10003AAC0;
            unint64_t v38 = *(void *)algn_10003AAC8;
            sub_10001250C(qword_10003AAC0, *(unint64_t *)algn_10003AAC8);
            swift_unknownObjectRelease();
            if (v38 >> 60 != 15)
            {
              sub_100006694(v37, v38);
              sub_10002A190();
              sub_10002A010();
              uint64_t v39 = sub_100029FA0();
              os_log_type_t v40 = sub_10002AA20();
              int v57 = v40;
              if (os_log_type_enabled(v39, v40))
              {
                os_log_t v53 = v39;
                uint64_t v41 = (uint8_t *)swift_slowAlloc();
                uint64_t v51 = swift_slowAlloc();
                uint64_t v61 = v51;
                unint64_t v52 = v33;
                *(_DWORD *)uint64_t v41 = 136315138;
                uint64_t v49 = v41 + 4;
                uint64_t v50 = v41;
                swift_beginAccess();
                uint64_t v48 = sub_10002A270();
                unint64_t v43 = v42;
                swift_endAccess();
                uint64_t v60 = sub_100006348(v48, v43, &v61);
                sub_10002AAD0();
                swift_bridgeObjectRelease();
                _os_log_impl((void *)&_mh_execute_header, v53, (os_log_type_t)v57, "%s - using fallback icon", v50, 0xCu);
                swift_arrayDestroy();
                swift_slowDealloc();
                swift_slowDealloc();

                sub_1000124F8(v37, v38);
                (*(void (**)(char *, uint64_t))(v58 + 8))(v52, v59);
              }
              else
              {

                sub_1000124F8(v37, v38);
                (*(void (**)(char *, uint64_t))(v58 + 8))(v33, v59);
              }
            }
          }
        }
      }
      (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
      uint64_t v45 = v55;
      uint64_t v44 = v56;
      uint64_t v46 = v54;
      swift_beginAccess();
      (*(void (**)(uint64_t, char *, uint64_t))(v46 + 16))(v44, v11, v45);
      return (*(uint64_t (**)(char *, uint64_t))(v46 + 8))(v11, v45);
    }
  }
}

uint64_t sub_10000E2FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v23 = a2;
  uint64_t v7 = sub_100029EB0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = *(void *)(v8 + 64);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100002D88(&qword_1000394A0);
  __chkstk_darwin(v11 - 8);
  uint64_t v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(void *)(v4 + 128))
  {
    sub_10002A280();
    swift_retain();
    sub_100002D88(&qword_100039AF8);
    sub_10002A9F0();
    swift_release();
  }
  *(void *)(v4 + 128) = 0;
  swift_release();
  sub_10002A9B0();
  uint64_t v14 = sub_10002A9D0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v13, 0, 1, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))((char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v7);
  sub_10002A9A0();
  swift_retain();
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_10002A990();
  unint64_t v16 = (*(unsigned __int8 *)(v8 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80);
  unint64_t v17 = (v9 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v18 = (char *)swift_allocObject();
  *((void *)v18 + 2) = v15;
  *((void *)v18 + 3) = &protocol witness table for MainActor;
  *((void *)v18 + 4) = v4;
  (*(void (**)(char *, char *, uint64_t))(v8 + 32))(&v18[v16], v10, v7);
  uint64_t v19 = &v18[v17];
  *(void *)uint64_t v19 = v23;
  *((void *)v19 + 1) = a3;
  uint64_t v20 = sub_100011578((uint64_t)v13, (uint64_t)&unk_100039B08, (uint64_t)v18);
  *(void *)(v4 + 128) = v20;
  swift_retain();
  swift_release();
  return v20;
}

uint64_t sub_10000E59C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[5] = a6;
  v7[6] = a7;
  v7[3] = a4;
  v7[4] = a5;
  v7[2] = a1;
  sub_100002D88(&qword_1000399B8);
  v7[7] = swift_task_alloc();
  uint64_t v8 = sub_10002A2C0();
  v7[8] = v8;
  v7[9] = *(void *)(v8 - 8);
  v7[10] = swift_task_alloc();
  uint64_t v9 = sub_10002A280();
  v7[11] = v9;
  v7[12] = *(void *)(v9 - 8);
  v7[13] = swift_task_alloc();
  sub_10002A9A0();
  v7[14] = sub_10002A990();
  uint64_t v11 = sub_10002A970();
  v7[15] = v11;
  v7[16] = v10;
  return _swift_task_switch(sub_10000E724, v11, v10);
}

uint64_t sub_10000E724()
{
  sub_10000DC18(0, v0[13]);
  Swift::UInt v1 = (void *)swift_task_alloc();
  v0[17] = v1;
  *Swift::UInt v1 = v0;
  v1[1] = sub_10000E840;
  uint64_t v2 = v0[13];
  uint64_t v3 = v0[5];
  uint64_t v4 = v0[6];
  uint64_t v5 = v0[2];
  return sub_10000EC38(v5, v3, v4, v2);
}

uint64_t sub_10000E840()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 144) = v0;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 128);
  uint64_t v4 = *(void *)(v2 + 120);
  if (v0) {
    uint64_t v5 = sub_10000EB90;
  }
  else {
    uint64_t v5 = sub_10000E97C;
  }
  return _swift_task_switch(v5, v4, v3);
}

uint64_t sub_10000E97C()
{
  uint64_t v1 = v0[18];
  uint64_t v2 = v0[5];
  unint64_t v3 = v0[6];
  uint64_t v4 = v0[2];
  swift_release();
  sub_100010EE0(v4, v2, v3);
  if (v1)
  {
    uint64_t v5 = v0[13];
    uint64_t v6 = v0[11];
    uint64_t v7 = *(void (**)(uint64_t, uint64_t))(v0[12] + 8);
    v7(v0[2], v6);
    v7(v5, v6);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v8 = (uint64_t (*)(void))v0[1];
  }
  else
  {
    uint64_t v9 = v0[8];
    uint64_t v10 = v0[9];
    uint64_t v11 = v0[7];
    sub_10002A1F0();
    int v12 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v10 + 48))(v11, 1, v9);
    uint64_t v14 = v0[12];
    uint64_t v13 = v0[13];
    uint64_t v15 = v0[11];
    if (v12 == 1)
    {
      uint64_t v16 = v0[7];
      (*(void (**)(void, void))(v14 + 8))(v0[13], v0[11]);
      sub_10000714C(v16, &qword_1000399B8);
    }
    else
    {
      uint64_t v18 = v0[9];
      uint64_t v17 = v0[10];
      uint64_t v19 = v0[8];
      uint64_t v20 = v0[3];
      (*(void (**)(uint64_t, void, uint64_t))(v18 + 32))(v17, v0[7], v19);
      sub_100008F24((void *)(v20 + 88), *(void *)(v20 + 112));
      sub_10002A390();
      (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v8 = (uint64_t (*)(void))v0[1];
  }
  return v8();
}

uint64_t sub_10000EB90()
{
  uint64_t v1 = v0[13];
  uint64_t v2 = v0[11];
  uint64_t v3 = v0[12];
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_10000EC38(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[15] = a4;
  v5[16] = v4;
  v5[13] = a2;
  v5[14] = a3;
  v5[12] = a1;
  uint64_t v6 = sub_10002A980();
  v5[17] = v6;
  v5[18] = *(void *)(v6 - 8);
  v5[19] = swift_task_alloc();
  uint64_t v7 = sub_100029FB0();
  v5[20] = v7;
  v5[21] = *(void *)(v7 - 8);
  v5[22] = swift_task_alloc();
  v5[23] = swift_task_alloc();
  v5[24] = swift_task_alloc();
  v5[25] = swift_task_alloc();
  uint64_t v8 = sub_10002A280();
  v5[26] = v8;
  v5[27] = *(void *)(v8 - 8);
  v5[28] = swift_task_alloc();
  v5[29] = swift_task_alloc();
  v5[30] = swift_task_alloc();
  v5[31] = sub_10002A9A0();
  v5[32] = sub_10002A990();
  uint64_t v10 = sub_10002A970();
  v5[33] = v10;
  v5[34] = v9;
  return _swift_task_switch(sub_10000EE34, v10, v9);
}

uint64_t sub_10000EE34()
{
  uint64_t v72 = v0;
  (*(void (**)(void, void, void))(*(void *)(v0 + 216) + 16))(*(void *)(v0 + 240), *(void *)(v0 + 120), *(void *)(v0 + 208));
  sub_10002AA10();
  *(void *)(v0 + 280) = 0;
  uint64_t v1 = swift_bridgeObjectRelease_n;
  uint64_t v2 = sub_10002A180();
  unint64_t v4 = v3;
  sub_1000124F8(v2, v3);
  if (v4 >> 60 == 15)
  {
    sub_10002A010();
    swift_bridgeObjectRetain_n();
    uint64_t v5 = sub_100029FA0();
    os_log_type_t v6 = sub_10002AA30();
    BOOL v7 = os_log_type_enabled(v5, v6);
    uint64_t v8 = *(void *)(v0 + 200);
    uint64_t v10 = *(void *)(v0 + 160);
    uint64_t v9 = *(void *)(v0 + 168);
    unint64_t v11 = *(void *)(v0 + 112);
    if (v7)
    {
      uint64_t v12 = *(void *)(v0 + 104);
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      v71[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v13 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 88) = sub_100006348(v12, v11, v71);
      sub_10002AAD0();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "%s stable details had no thumbnail data. Fetching it.", v13, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
      v14(v8, v10);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      uint64_t v14 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
      v14(v8, v10);
    }
    uint64_t Strong = swift_unknownObjectWeakLoadStrong();
    *(void *)(v0 + 288) = Strong;
    if (Strong)
    {
      uint64_t v16 = (void *)swift_task_alloc();
      *(void *)(v0 + 296) = v16;
      *uint64_t v16 = v0;
      v16[1] = sub_10000F898;
      uint64_t v17 = *(void *)(v0 + 232);
      uint64_t v18 = *(void *)(v0 + 240);
      return sub_10001B578(v17, v18);
    }
    sub_10002A010();
    swift_bridgeObjectRetain_n();
    uint64_t v20 = sub_100029FA0();
    os_log_type_t v21 = sub_10002AA30();
    BOOL v22 = os_log_type_enabled(v20, v21);
    uint64_t v23 = *(void *)(v0 + 192);
    uint64_t v24 = *(void *)(v0 + 160);
    unint64_t v25 = *(void *)(v0 + 112);
    if (v22)
    {
      uint64_t v26 = *(void *)(v0 + 104);
      unint64_t v27 = (uint8_t *)swift_slowAlloc();
      v71[0] = swift_slowAlloc();
      *(_DWORD *)unint64_t v27 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 80) = sub_100006348(v26, v25, v71);
      sub_10002AAD0();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "%s thumbnail is nil", v27, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    v14(v23, v24);
    uint64_t v1 = swift_bridgeObjectRelease_n;
  }
  *(_OWORD *)(v0 + 304) = *((_OWORD *)v1 + 130);
  uint64_t v28 = *(void *)(v0 + 280);
  sub_10002AA10();
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)(v0 + 240);
    uint64_t v31 = *(void *)(v0 + 208);
    uint64_t v32 = *(void *)(v0 + 216);
    sub_100012750(*(void *)(v0 + 104), *(void *)(v0 + 112), "%s has been deactivated prior to loading message status!");
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v32 + 8))(v30, v31);
    goto LABEL_15;
  }
  uint64_t v51 = swift_unknownObjectWeakLoadStrong();
  *(void *)(v0 + 320) = v51;
  if (!v51)
  {
    sub_10002A010();
    swift_bridgeObjectRetain_n();
    uint64_t v54 = sub_100029FA0();
    os_log_type_t v55 = sub_10002AA30();
    BOOL v56 = os_log_type_enabled(v54, v55);
    uint64_t v57 = *(void *)(v0 + 184);
    uint64_t v59 = *(void *)(v0 + 160);
    uint64_t v58 = *(void *)(v0 + 168);
    unint64_t v60 = *(void *)(v0 + 112);
    if (v56)
    {
      uint64_t v70 = *(void *)(v0 + 184);
      uint64_t v61 = *(void *)(v0 + 104);
      uint64_t v68 = *(void *)(v0 + 160);
      uint64_t v62 = (uint8_t *)swift_slowAlloc();
      v71[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v62 = 136315138;
      swift_bridgeObjectRetain();
      *(void *)(v0 + 72) = sub_100006348(v61, v60, v71);
      sub_10002AAD0();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v54, v55, "%s messageStatusProvider == nil", v62, 0xCu);
      swift_arrayDestroy();
      uint64_t v1 = swift_bridgeObjectRelease_n;
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v70, v68);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v57, v59);
    }
    uint64_t v63 = *(void *)(v0 + 240);
    uint64_t v64 = *(void *)(v0 + 208);
    uint64_t v65 = *(void *)(v0 + 216);
    sub_1000124A4();
    uint64_t v29 = swift_allocError();
    unsigned char *v66 = 3;
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v63, v64);
LABEL_15:
    *(_OWORD *)(v0 + 384) = *((_OWORD *)v1 + 130);
    *(void *)(v0 + 376) = v29;
    *(void *)(v0 + 56) = v29;
    swift_errorRetain();
    sub_100002D88(&qword_100039AF8);
    if (swift_dynamicCast())
    {
      uint64_t v33 = *(void *)(v0 + 144);
      uint64_t v34 = *(void *)(v0 + 152);
      uint64_t v35 = *(void *)(v0 + 136);
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v34, v35);
      swift_willThrow();
      sub_1000124F8(0, 0xF000000000000000);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      unint64_t v36 = *(uint64_t (**)(void))(v0 + 8);
      return v36();
    }
    else
    {
      sub_10002A010();
      swift_bridgeObjectRetain();
      swift_errorRetain();
      swift_bridgeObjectRetain();
      swift_errorRetain();
      uint64_t v37 = sub_100029FA0();
      os_log_type_t v38 = sub_10002AA30();
      BOOL v39 = os_log_type_enabled(v37, v38);
      uint64_t v41 = *(void *)(v0 + 168);
      uint64_t v40 = *(void *)(v0 + 176);
      uint64_t v42 = *(void *)(v0 + 160);
      unint64_t v43 = *(void *)(v0 + 112);
      if (v39)
      {
        uint64_t v69 = *(void *)(v0 + 176);
        uint64_t v44 = *(void *)(v0 + 104);
        uint64_t v45 = swift_slowAlloc();
        uint64_t v67 = swift_slowAlloc();
        *(_DWORD *)uint64_t v45 = 136315394;
        v71[0] = v67;
        swift_bridgeObjectRetain();
        *(void *)(v0 + 40) = sub_100006348(v44, v43, v71);
        sub_10002AAD0();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v45 + 12) = 2080;
        swift_getErrorValue();
        uint64_t v46 = sub_10002AC10();
        *(void *)(v0 + 64) = sub_100006348(v46, v47, v71);
        sub_10002AAD0();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v37, v38, "%s failed load details %s, using fallback", (uint8_t *)v45, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v69, v42);
      }
      else
      {
        swift_bridgeObjectRelease_n();
        swift_errorRelease();
        swift_errorRelease();

        (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v40, v42);
      }
      uint64_t v48 = (void *)swift_task_alloc();
      *(void *)(v0 + 400) = v48;
      *uint64_t v48 = v0;
      v48[1] = sub_100010CDC;
      uint64_t v49 = *(void *)(v0 + 120);
      uint64_t v50 = *(void *)(v0 + 96);
      return sub_1000116FC(v50, v49, 0, 0xF000000000000000);
    }
  }
  *(void *)(v0 + 328) = sub_10002A990();
  uint64_t v53 = sub_10002A970();
  *(void *)(v0 + 336) = v53;
  *(void *)(v0 + 344) = v52;
  return _swift_task_switch(sub_10001008C, v53, v52);
}

uint64_t sub_10000F898()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 272);
  uint64_t v3 = *(void *)(v1 + 264);
  return _swift_task_switch(sub_10000F9B8, v3, v2);
}

uint64_t sub_10000F9B8()
{
  uint64_t v50 = v0;
  uint64_t v1 = v0[29];
  uint64_t v3 = v0[26];
  uint64_t v2 = v0[27];
  uint64_t v4 = sub_10002A180();
  unint64_t v6 = v5;
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  if (v6 >> 60 != 15)
  {
    sub_100006694(v4, v6);
    sub_10002A190();
  }
  v0[38] = v4;
  v0[39] = v6;
  uint64_t v7 = v0[35];
  sub_10002AA10();
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = v0[30];
    uint64_t v11 = v0[26];
    uint64_t v10 = v0[27];
    sub_100012750(v0[13], v0[14], "%s has been deactivated prior to loading message status!");
    goto LABEL_5;
  }
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  v0[40] = Strong;
  if (!Strong)
  {
    sub_10002A010();
    swift_bridgeObjectRetain_n();
    unint64_t v36 = sub_100029FA0();
    os_log_type_t v37 = sub_10002AA30();
    BOOL v38 = os_log_type_enabled(v36, v37);
    uint64_t v39 = v0[23];
    uint64_t v41 = v0[20];
    uint64_t v40 = v0[21];
    unint64_t v42 = v0[14];
    if (v38)
    {
      uint64_t v45 = v0[13];
      uint64_t v47 = v0[20];
      unint64_t v43 = (uint8_t *)swift_slowAlloc();
      v49[0] = swift_slowAlloc();
      *(_DWORD *)unint64_t v43 = 136315138;
      swift_bridgeObjectRetain();
      v0[9] = sub_100006348(v45, v42, v49);
      sub_10002AAD0();
      swift_bridgeObjectRelease_n();
      _os_log_impl((void *)&_mh_execute_header, v36, v37, "%s messageStatusProvider == nil", v43, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v39, v47);
    }
    else
    {
      swift_bridgeObjectRelease_n();

      (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v39, v41);
    }
    uint64_t v9 = v0[30];
    uint64_t v11 = v0[26];
    uint64_t v10 = v0[27];
    sub_1000124A4();
    uint64_t v8 = swift_allocError();
    unsigned char *v44 = 3;
LABEL_5:
    swift_willThrow();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
    v0[48] = v4;
    v0[49] = v6;
    v0[47] = v8;
    v0[7] = v8;
    swift_errorRetain();
    sub_100002D88(&qword_100039AF8);
    if (swift_dynamicCast())
    {
      unint64_t v12 = v6;
      uint64_t v14 = v0[18];
      uint64_t v13 = v0[19];
      uint64_t v15 = v0[17];
      swift_release();
      (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v13, v15);
      swift_willThrow();
      sub_1000124F8(v4, v12);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v16 = (uint64_t (*)(void))v0[1];
      return v16();
    }
    else
    {
      uint64_t v48 = v4;
      sub_10002A010();
      swift_bridgeObjectRetain();
      swift_errorRetain();
      swift_bridgeObjectRetain();
      swift_errorRetain();
      uint64_t v18 = sub_100029FA0();
      os_log_type_t v19 = sub_10002AA30();
      BOOL v20 = os_log_type_enabled(v18, v19);
      uint64_t v22 = v0[21];
      uint64_t v21 = v0[22];
      uint64_t v23 = v0[20];
      unint64_t v24 = v0[14];
      if (v20)
      {
        unint64_t v46 = v6;
        uint64_t v25 = v0[13];
        uint64_t v26 = swift_slowAlloc();
        v49[0] = swift_slowAlloc();
        *(_DWORD *)uint64_t v26 = 136315394;
        swift_bridgeObjectRetain();
        uint64_t v27 = v25;
        unint64_t v6 = v46;
        v0[5] = sub_100006348(v27, v24, v49);
        sub_10002AAD0();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v26 + 12) = 2080;
        swift_getErrorValue();
        uint64_t v28 = sub_10002AC10();
        v0[8] = sub_100006348(v28, v29, v49);
        sub_10002AAD0();
        swift_bridgeObjectRelease();
        swift_errorRelease();
        swift_errorRelease();
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "%s failed load details %s, using fallback", (uint8_t *)v26, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
        swift_bridgeObjectRelease_n();
        swift_errorRelease();
        swift_errorRelease();
      }

      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
      uint64_t v33 = (void *)swift_task_alloc();
      v0[50] = v33;
      *uint64_t v33 = v0;
      v33[1] = sub_100010CDC;
      uint64_t v34 = v0[15];
      uint64_t v35 = v0[12];
      return sub_1000116FC(v35, v34, v48, v6);
    }
  }
  v0[41] = sub_10002A990();
  uint64_t v32 = sub_10002A970();
  v0[42] = v32;
  v0[43] = v31;
  return _swift_task_switch(sub_10001008C, v32, v31);
}

uint64_t sub_10001008C()
{
  uint64_t v1 = (uint64_t *)(v0[40] + OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID);
  uint64_t v3 = *v1;
  uint64_t v2 = v1[1];
  v0[44] = v2;
  swift_bridgeObjectRetain();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[45] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_100010160;
  uint64_t v5 = v0[30];
  uint64_t v6 = v0[28];
  return static ScreenTimeSupport.getCurrentStatusDetails(withDetails:forId:)(v6, v5, v3, v2);
}

uint64_t sub_100010160()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 368) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 336);
    uint64_t v4 = *(void *)(v2 + 344);
    uint64_t v5 = sub_100010848;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v2 + 336);
    uint64_t v4 = *(void *)(v2 + 344);
    uint64_t v5 = sub_10001027C;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_10001027C()
{
  swift_release();
  uint64_t v1 = *(void *)(v0 + 264);
  uint64_t v2 = *(void *)(v0 + 272);
  return _swift_task_switch(sub_1000102E0, v1, v2);
}

uint64_t sub_1000102E0()
{
  uint64_t v45 = v0;
  uint64_t v1 = v0[46];
  uint64_t v2 = v0[27];
  sub_10002AA10();
  uint64_t v3 = (void (**)(uint64_t, uint64_t))(v2 + 8);
  if (!v1)
  {
    uint64_t v15 = v0[38];
    unint64_t v14 = v0[39];
    uint64_t v17 = v0[29];
    uint64_t v16 = v0[30];
    uint64_t v19 = v0[27];
    uint64_t v18 = v0[28];
    uint64_t v20 = v0[26];
    uint64_t v42 = v0[12];
    swift_release();
    sub_10002A100();
    swift_unknownObjectRelease();
    sub_1000124F8(v15, v14);
    uint64_t v21 = *v3;
    (*v3)(v18, v20);
    v21(v16, v20);
    uint64_t v22 = *(void (**)(uint64_t, uint64_t, uint64_t))(v19 + 32);
    v22(v16, v17, v20);
    v22(v42, v16, v20);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v13 = (uint64_t (*)(void))v0[1];
    goto LABEL_5;
  }
  uint64_t v4 = v0[30];
  uint64_t v5 = v0[28];
  uint64_t v6 = v0[26];
  sub_100012750(v0[13], v0[14], "%s has been deactivated prior to updating details!");
  swift_willThrow();
  swift_unknownObjectRelease();
  uint64_t v7 = *v3;
  (*v3)(v5, v6);
  v7(v4, v6);
  uint64_t v9 = v0[38];
  unint64_t v8 = v0[39];
  v0[48] = v9;
  v0[49] = v8;
  v0[47] = v1;
  v0[7] = v1;
  swift_errorRetain();
  sub_100002D88(&qword_100039AF8);
  if (swift_dynamicCast())
  {
    uint64_t v11 = v0[18];
    uint64_t v10 = v0[19];
    uint64_t v12 = v0[17];
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v10, v12);
    swift_willThrow();
    sub_1000124F8(v9, v8);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v13 = (uint64_t (*)(void))v0[1];
LABEL_5:
    return v13();
  }
  sub_10002A010();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  swift_bridgeObjectRetain();
  swift_errorRetain();
  unint64_t v24 = sub_100029FA0();
  os_log_type_t v25 = sub_10002AA30();
  BOOL v26 = os_log_type_enabled(v24, v25);
  uint64_t v28 = v0[21];
  uint64_t v27 = v0[22];
  uint64_t v29 = v0[20];
  unint64_t v30 = v0[14];
  if (v26)
  {
    uint64_t v41 = v0[22];
    uint64_t v43 = v9;
    unint64_t v31 = v8;
    uint64_t v32 = v0[13];
    os_log_type_t type = v25;
    uint64_t v33 = swift_slowAlloc();
    v44[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v33 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v34 = v32;
    unint64_t v8 = v31;
    uint64_t v9 = v43;
    v0[5] = sub_100006348(v34, v30, v44);
    sub_10002AAD0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v33 + 12) = 2080;
    swift_getErrorValue();
    uint64_t v35 = sub_10002AC10();
    v0[8] = sub_100006348(v35, v36, v44);
    sub_10002AAD0();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    _os_log_impl((void *)&_mh_execute_header, v24, type, "%s failed load details %s, using fallback", (uint8_t *)v33, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v41, v29);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    swift_errorRelease();
    swift_errorRelease();

    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
  }
  os_log_type_t v37 = (void *)swift_task_alloc();
  v0[50] = v37;
  void *v37 = v0;
  v37[1] = sub_100010CDC;
  uint64_t v38 = v0[15];
  uint64_t v39 = v0[12];
  return sub_1000116FC(v39, v38, v9, v8);
}

uint64_t sub_100010848()
{
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v1 = *(void *)(v0 + 264);
  uint64_t v2 = *(void *)(v0 + 272);
  return _swift_task_switch(sub_1000108B8, v1, v2);
}

uint64_t sub_1000108B8()
{
  unint64_t v31 = v0;
  uint64_t v1 = v0[30];
  uint64_t v2 = v0[26];
  uint64_t v3 = v0[27];
  swift_unknownObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  uint64_t v4 = v0[46];
  v0[7] = v4;
  uint64_t v6 = v0[38];
  unint64_t v5 = v0[39];
  v0[48] = v6;
  v0[49] = v5;
  v0[47] = v4;
  swift_errorRetain();
  sub_100002D88(&qword_100039AF8);
  if (swift_dynamicCast())
  {
    uint64_t v7 = v0[18];
    uint64_t v8 = v0[19];
    uint64_t v9 = v0[17];
    swift_release();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v8, v9);
    swift_willThrow();
    sub_1000124F8(v6, v5);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = (uint64_t (*)(void))v0[1];
    return v10();
  }
  else
  {
    sub_10002A010();
    swift_bridgeObjectRetain();
    swift_errorRetain();
    swift_bridgeObjectRetain();
    swift_errorRetain();
    uint64_t v12 = sub_100029FA0();
    os_log_type_t type = sub_10002AA30();
    BOOL v13 = os_log_type_enabled(v12, type);
    uint64_t v15 = v0[21];
    uint64_t v14 = v0[22];
    uint64_t v16 = v0[20];
    unint64_t v17 = v0[14];
    if (v13)
    {
      uint64_t v27 = v0[22];
      unint64_t v18 = v5;
      uint64_t v19 = v0[13];
      uint64_t v28 = v6;
      uint64_t v20 = swift_slowAlloc();
      v30[0] = swift_slowAlloc();
      *(_DWORD *)uint64_t v20 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v21 = v19;
      unint64_t v5 = v18;
      v0[5] = sub_100006348(v21, v17, v30);
      sub_10002AAD0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v20 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v22 = sub_10002AC10();
      v0[8] = sub_100006348(v22, v23, v30);
      sub_10002AAD0();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v12, type, "%s failed load details %s, using fallback", (uint8_t *)v20, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      uint64_t v6 = v28;
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v27, v16);
    }
    else
    {
      swift_bridgeObjectRelease_n();
      swift_errorRelease();
      swift_errorRelease();

      (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v14, v16);
    }
    unint64_t v24 = (void *)swift_task_alloc();
    v0[50] = v24;
    *unint64_t v24 = v0;
    v24[1] = sub_100010CDC;
    uint64_t v25 = v0[15];
    uint64_t v26 = v0[12];
    return sub_1000116FC(v26, v25, v6, v5);
  }
}

uint64_t sub_100010CDC()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 272);
  uint64_t v3 = *(void *)(v1 + 264);
  return _swift_task_switch(sub_100010DFC, v3, v2);
}

uint64_t sub_100010DFC()
{
  sub_1000124F8(v0[48], v0[49]);
  swift_release();
  swift_errorRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v1 = (uint64_t (*)(void))v0[1];
  return v1();
}

uint64_t sub_100010EE0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t v7 = sub_100029FB0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v43 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v44 = (char *)&v37 - v12;
  __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v37 - v13;
  sub_10002A010();
  swift_bridgeObjectRetain_n();
  uint64_t v15 = sub_100029FA0();
  os_log_type_t v16 = sub_10002AA20();
  BOOL v17 = os_log_type_enabled(v15, v16);
  uint64_t v45 = v8;
  uint64_t v41 = v3;
  uint64_t v42 = a2;
  uint64_t v40 = a1;
  if (v17)
  {
    uint64_t v38 = v7;
    unint64_t v18 = (uint8_t *)swift_slowAlloc();
    uint64_t v47 = swift_slowAlloc();
    *(_DWORD *)unint64_t v18 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v46 = sub_100006348(a2, a3, &v47);
    uint64_t v7 = v38;
    sub_10002AAD0();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "%s - Finished background loading details ignoring cache!", v18, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v8 = v45;
    swift_slowDealloc();
  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  uint64_t v19 = *(void (**)(char *, uint64_t))(v8 + 8);
  v19(v14, v7);
  uint64_t v20 = v44;
  sub_10002A010();
  swift_bridgeObjectRetain_n();
  uint64_t v21 = sub_100029FA0();
  os_log_type_t v22 = sub_10002AA30();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = swift_slowAlloc();
    uint64_t v24 = swift_slowAlloc();
    os_log_type_t v37 = v19;
    uint64_t v47 = v24;
    *(_DWORD *)uint64_t v23 = 136315394;
    swift_bridgeObjectRetain();
    uint64_t v25 = v42;
    uint64_t v46 = sub_100006348(v42, a3, &v47);
    sub_10002AAD0();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v23 + 12) = 2080;
    uint64_t v46 = sub_100006348(0xD000000000000019, 0x800000010002C570, &v47);
    sub_10002AAD0();
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "%s %s - Caching message details...", (uint8_t *)v23, 0x16u);
    swift_arrayDestroy();
    uint64_t v19 = v37;
    swift_slowDealloc();
    swift_slowDealloc();

    v19(v44, v7);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    v19(v20, v7);
    uint64_t v25 = v42;
  }
  uint64_t v26 = v41;
  sub_100008F24((void *)(v39 + 48), *(void *)(v39 + 72));
  uint64_t result = sub_10002A370();
  if (v26)
  {
    uint64_t v28 = v43;
    sub_10002A010();
    swift_bridgeObjectRetain();
    swift_errorRetain();
    swift_bridgeObjectRetain();
    swift_errorRetain();
    uint64_t v29 = sub_100029FA0();
    os_log_type_t v30 = sub_10002AA40();
    if (os_log_type_enabled(v29, v30))
    {
      uint64_t v31 = swift_slowAlloc();
      uint64_t v38 = v7;
      uint64_t v32 = v31;
      uint64_t v33 = swift_slowAlloc();
      os_log_type_t v37 = v19;
      uint64_t v34 = (void *)v33;
      uint64_t v35 = swift_slowAlloc();
      uint64_t v44 = 0;
      uint64_t v47 = v35;
      *(_DWORD *)uint64_t v32 = 136315394;
      swift_bridgeObjectRetain();
      uint64_t v46 = sub_100006348(v25, a3, &v47);
      sub_10002AAD0();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v32 + 12) = 2112;
      swift_errorRetain();
      uint64_t v36 = _swift_stdlib_bridgeErrorToNSError();
      uint64_t v46 = v36;
      sub_10002AAD0();
      *uint64_t v34 = v36;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v29, v30, "%s - Error saving message details to cache! %@", (uint8_t *)v32, 0x16u);
      sub_100002D88(&qword_100039AE8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      return ((uint64_t (*)(char *, uint64_t))v37)(v43, v38);
    }
    else
    {
      swift_errorRelease();
      swift_bridgeObjectRelease_n();
      swift_errorRelease();
      swift_errorRelease();

      return ((uint64_t (*)(char *, uint64_t))v19)(v28, v7);
    }
  }
  return result;
}

uint64_t sub_100011578(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = sub_10002A9D0();
  uint64_t v6 = *(void *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_10002A9C0();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_10000714C(a1, &qword_1000394A0);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_10002A970();
    swift_unknownObjectRelease();
  }
LABEL_5:
  sub_10002A280();
  return swift_task_create();
}

uint64_t sub_1000116FC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v5[29] = a4;
  v5[30] = v4;
  v5[27] = a2;
  v5[28] = a3;
  v5[26] = a1;
  uint64_t v6 = sub_10002A2C0();
  v5[31] = v6;
  v5[32] = *(void *)(v6 - 8);
  v5[33] = swift_task_alloc();
  sub_100002D88(&qword_1000399B8);
  v5[34] = swift_task_alloc();
  v5[35] = swift_task_alloc();
  v5[36] = swift_task_alloc();
  uint64_t v7 = sub_10002A130();
  v5[37] = v7;
  v5[38] = *(void *)(v7 - 8);
  v5[39] = swift_task_alloc();
  uint64_t v8 = sub_100029FB0();
  v5[40] = v8;
  v5[41] = *(void *)(v8 - 8);
  v5[42] = swift_task_alloc();
  uint64_t v9 = sub_10002A280();
  v5[43] = v9;
  v5[44] = *(void *)(v9 - 8);
  v5[45] = swift_task_alloc();
  sub_10002A9A0();
  v5[46] = sub_10002A990();
  uint64_t v11 = sub_10002A970();
  v5[47] = v11;
  v5[48] = v10;
  return _swift_task_switch(sub_100011958, v11, v10);
}

uint64_t sub_100011958()
{
  uint64_t v43 = v0;
  uint64_t v2 = v0[44];
  uint64_t v1 = v0[45];
  uint64_t v3 = v0[43];
  unint64_t v4 = v0[29];
  uint64_t v5 = v0[27];
  uint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  v0[49] = v6;
  v0[50] = (v2 + 16) & 0xFFFFFFFFFFFFLL | 0xE3BA000000000000;
  v6(v1, v5, v3);
  if (v4 >> 60 == 15)
  {
    uint64_t v7 = sub_10002A180();
    unint64_t v9 = v8;
    sub_1000124F8(v7, v8);
    if (v9 >> 60 == 15 && swift_unknownObjectWeakLoadStrong())
    {
      if (qword_1000392D0 != -1) {
        swift_once();
      }
      uint64_t v11 = qword_10003AAC0;
      unint64_t v10 = *(void *)algn_10003AAC8;
      sub_10001250C(qword_10003AAC0, *(unint64_t *)algn_10003AAC8);
      swift_unknownObjectRelease();
      if (v10 >> 60 != 15)
      {
        sub_100006694(v11, v10);
        sub_10002A190();
        sub_10002A010();
        uint64_t v12 = sub_100029FA0();
        os_log_type_t v13 = sub_10002AA20();
        if (os_log_type_enabled(v12, v13))
        {
          os_log_type_t type = v13;
          uint64_t v39 = v0[41];
          uint64_t v40 = v0[40];
          uint64_t v41 = v0[42];
          log = v12;
          uint64_t v14 = (uint8_t *)swift_slowAlloc();
          uint64_t v42 = swift_slowAlloc();
          *(_DWORD *)uint64_t v14 = 136315138;
          swift_beginAccess();
          uint64_t v15 = sub_10002A270();
          unint64_t v17 = v16;
          swift_endAccess();
          v0[25] = sub_100006348(v15, v17, &v42);
          sub_10002AAD0();
          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, log, type, "%s - using fallback icon (2)", v14, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          sub_1000124F8(v11, v10);
          (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v41, v40);
        }
        else
        {
          uint64_t v34 = v0[41];
          uint64_t v33 = v0[42];
          uint64_t v35 = v0[40];
          sub_1000124F8(v11, v10);

          (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v33, v35);
        }
      }
    }
  }
  else
  {
    sub_100006694(v0[28], v0[29]);
    sub_10002A190();
  }
  uint64_t v18 = v0[36];
  uint64_t v19 = v0[31];
  uint64_t v20 = v0[32];
  (*(void (**)(void, void, void))(v0[38] + 104))(v0[39], enum case for MessageDetails.EventStatus.purged(_:), v0[37]);
  swift_beginAccess();
  sub_10002A220();
  swift_endAccess();
  swift_beginAccess();
  sub_10002A1F0();
  swift_endAccess();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v20 + 48))(v18, 1, v19) == 1)
  {
    sub_10000714C(v0[36], &qword_1000399B8);
    swift_beginAccess();
    uint64_t v21 = sub_10002A240();
    if ((v22 & 1) == 0)
    {
      uint64_t v23 = v21;
      swift_endAccess();
      sub_100012968();
      uint64_t v24 = sub_10002A0E0();
      uint64_t v25 = sub_10002A0D0();
      v0[5] = v24;
      v0[6] = &protocol witness table for ContactFetcher;
      v0[2] = v25;
      uint64_t v26 = (void *)swift_task_alloc();
      v0[51] = v26;
      *uint64_t v26 = v0;
      v26[1] = sub_100011EDC;
      uint64_t v27 = v0[35];
      return static FAFamilyCircle.resolveFamily(userDSID:actionUserDSID:withContactFetcher:useCache:)(v27, v23, 0, 1, v0 + 2, 1);
    }
    swift_endAccess();
    swift_release();
  }
  else
  {
    uint64_t v28 = v0[36];
    swift_release();
    sub_10000714C(v28, &qword_1000399B8);
  }
  uint64_t v30 = v0[44];
  uint64_t v29 = v0[45];
  uint64_t v31 = v0[43];
  ((void (*)(void, uint64_t, uint64_t))v0[49])(v0[26], v29, v31);
  (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v29, v31);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v32 = (uint64_t (*)(void))v0[1];
  return v32();
}

uint64_t sub_100011EDC()
{
  uint64_t v2 = *v1;
  swift_task_dealloc();
  if (v0)
  {
    swift_errorRelease();
    uint64_t v3 = *(void *)(v2 + 376);
    uint64_t v4 = *(void *)(v2 + 384);
    uint64_t v5 = sub_100012224;
  }
  else
  {
    sub_100007454(v2 + 16);
    uint64_t v3 = *(void *)(v2 + 376);
    uint64_t v4 = *(void *)(v2 + 384);
    uint64_t v5 = sub_100012008;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_100012008()
{
  uint64_t v2 = *(void *)(v0 + 272);
  uint64_t v1 = *(void *)(v0 + 280);
  uint64_t v4 = *(void *)(v0 + 256);
  uint64_t v3 = *(void *)(v0 + 264);
  uint64_t v5 = *(void *)(v0 + 248);
  swift_release();
  uint64_t v6 = *(void (**)(uint64_t, void, uint64_t, uint64_t))(v4 + 56);
  v6(v1, 0, 1, v5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v3, v1, v5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v3, v5);
  v6(v2, 0, 1, v5);
  swift_beginAccess();
  sub_10002A200();
  swift_endAccess();
  uint64_t v7 = (void *)sub_10002A290();
  sub_10002AA70();

  swift_beginAccess();
  sub_10002A250();
  swift_endAccess();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  uint64_t v9 = *(void *)(v0 + 352);
  uint64_t v8 = *(void *)(v0 + 360);
  uint64_t v10 = *(void *)(v0 + 344);
  (*(void (**)(void, uint64_t, uint64_t))(v0 + 392))(*(void *)(v0 + 208), v8, v10);
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v11 = *(uint64_t (**)(void))(v0 + 8);
  return v11();
}

uint64_t sub_100012224()
{
  uint64_t v1 = *(void *)(v0 + 280);
  uint64_t v2 = *(void *)(v0 + 248);
  uint64_t v3 = *(void *)(v0 + 256);
  swift_release();
  sub_100007454(v0 + 16);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v3 + 56))(v1, 1, 1, v2);
  sub_10000714C(v1, &qword_1000399B8);
  uint64_t v5 = *(void *)(v0 + 352);
  uint64_t v4 = *(void *)(v0 + 360);
  uint64_t v6 = *(void *)(v0 + 344);
  (*(void (**)(void, uint64_t, uint64_t))(v0 + 392))(*(void *)(v0 + 208), v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v7 = *(uint64_t (**)(void))(v0 + 8);
  return v7();
}

uint64_t sub_100012360()
{
  sub_1000129A8(v0 + 16);
  sub_1000129A8(v0 + 32);
  sub_100007454(v0 + 48);
  sub_100007454(v0 + 88);
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for MessageDetailsLoader()
{
  return self;
}

uint64_t sub_1000123DC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100002D88(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_100012440(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_100002D88(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_1000124A4()
{
  unint64_t result = qword_100039AF0;
  if (!qword_100039AF0)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039AF0);
  }
  return result;
}

uint64_t sub_1000124F8(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_10000646C(a1, a2);
  }
  return a1;
}

uint64_t sub_10001250C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15) {
    return sub_100006694(a1, a2);
  }
  return a1;
}

uint64_t sub_100012520()
{
  uint64_t v1 = sub_100029EB0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_100012614(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_100029EB0() - 8);
  unint64_t v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  uint64_t v6 = v1[2];
  uint64_t v7 = v1[3];
  uint64_t v8 = v1[4];
  uint64_t v9 = (uint64_t)v1 + v5;
  uint64_t v10 = (void *)((char *)v1 + ((*(void *)(v4 + 64) + v5 + 7) & 0xFFFFFFFFFFFFFFF8));
  uint64_t v11 = *v10;
  uint64_t v12 = v10[1];
  uint64_t v13 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v13;
  *uint64_t v13 = v2;
  v13[1] = sub_1000065A0;
  return sub_10000E59C(a1, v6, v7, v8, v9, v11, v12);
}

uint64_t sub_100012750(uint64_t a1, unint64_t a2, const char *a3)
{
  uint64_t v6 = sub_100029FB0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002A010();
  swift_bridgeObjectRetain_n();
  uint64_t v10 = sub_100029FA0();
  os_log_type_t v11 = sub_10002AA30();
  if (os_log_type_enabled(v10, v11))
  {
    unint64_t v16 = a3;
    uint64_t v12 = swift_slowAlloc();
    uint64_t v17 = v6;
    uint64_t v13 = a1;
    uint64_t v14 = (uint8_t *)v12;
    uint64_t v19 = swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v18 = sub_100006348(v13, a2, &v19);
    sub_10002AAD0();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v10, v11, v16, v14, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v17);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
}

unint64_t sub_100012968()
{
  unint64_t result = qword_100039B20;
  if (!qword_100039B20)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100039B20);
  }
  return result;
}

uint64_t sub_1000129A8(uint64_t a1)
{
  return a1;
}

unsigned char *initializeBufferWithCopyOfBuffer for MessageDetailsLoaderError(unsigned char *result, unsigned char *a2)
{
  *unint64_t result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for MessageDetailsLoaderError(unsigned __int8 *a1, unsigned int a2)
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

unsigned char *storeEnumTagSinglePayload for MessageDetailsLoaderError(unsigned char *result, unsigned int a2, unsigned int a3)
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
    *unint64_t result = a2 + 3;
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
        JUMPOUT(0x100012B38);
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
          *unint64_t result = a2 + 3;
        break;
    }
  }
  return result;
}

uint64_t sub_100012B60(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_100012B6C(unsigned char *result, char a2)
{
  *unint64_t result = a2;
  return result;
}

ValueMetadata *type metadata accessor for MessageDetailsLoaderError()
{
  return &type metadata for MessageDetailsLoaderError;
}

unint64_t sub_100012B88()
{
  unint64_t result = qword_100039B28;
  if (!qword_100039B28)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039B28);
  }
  return result;
}

uint64_t sub_100012BDC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v22 = a2;
  uint64_t v4 = sub_10002A280();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 64);
  __chkstk_darwin(v4);
  BOOL v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100002D88(&qword_100039D78);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100002D88(&qword_100039E70);
  uint64_t v11 = swift_allocObject();
  *(_OWORD *)(v11 + 16) = xmmword_10002B990;
  *(void *)(v11 + 32) = sub_10002A8E0();
  *(void *)(v11 + 40) = v12;
  *(void *)(v11 + 48) = 0;
  *(void *)(v11 + 56) = sub_10002A8E0();
  *(void *)(v11 + 64) = v13;
  *(void *)(v11 + 72) = 0;
  *(void *)(v11 + 80) = sub_10002A8E0();
  *(void *)(v11 + 88) = v14;
  *(void *)(v11 + 96) = 0;
  *(void *)(v11 + 104) = sub_10002A8E0();
  *(void *)(v11 + 112) = v15;
  *(void *)(v11 + 120) = 2;
  uint64_t v16 = v2 + OBJC_IVAR____TtC24PeopleMessagesScreenTime22BubbleContentContainer_details;
  *(void *)(v11 + 128) = sub_10002A8E0();
  *(void *)(v11 + 136) = v17;
  *(void *)(v11 + 144) = 1;
  *(void *)uint64_t v10 = sub_10002A4B0();
  *((void *)v10 + 1) = 0x4024000000000000;
  v10[16] = 0;
  sub_100002D88(&qword_100039E78);
  sub_100016C44(a1, (uint64_t)v23);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v16, v4);
  unint64_t v18 = (*(unsigned __int8 *)(v5 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v19 = swift_allocObject();
  sub_100016D7C(v23, v19 + 16);
  *(void *)(v19 + 56) = v11;
  (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v19 + v18, v7, v4);
  swift_bridgeObjectRetain();
  sub_100002D88(&qword_100039DA0);
  sub_1000166F8();
  sub_10002A760();
  swift_bridgeObjectRelease();
  if (qword_100039310 != -1) {
    swift_once();
  }
  double v20 = *(double *)&qword_10003AB00;
  sub_10002A7B0();
  sub_10001323C(0.0, 1, 0.0, 1, 0.0, 1, 0.0, 1, v22, 0.0, 1, v20, 0);
  return sub_10000714C((uint64_t)v10, &qword_100039D78);
}

uint64_t sub_100012F6C(void *a1, int64_t *a2, uint64_t a3)
{
  uint64_t v6 = sub_10002A280();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100008F24(a1, a1[3]);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a3, v6);
  unint64_t v10 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v11 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v11 + v10, v9, v6);
  sub_1000186CC(a2, (uint64_t)sub_100016E90, v11);
  return swift_release();
}

uint64_t sub_1000130C4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10002A8E0();
  uint64_t v4 = v3;
  uint64_t v5 = self;
  id v6 = [v5 labelColor];
  uint64_t v7 = sub_10002A6B0();
  id v8 = [v5 tertiarySystemFillColor];
  uint64_t v9 = sub_10002A6B0();
  sub_10002A7C0();
  if (qword_100039388 != -1) {
    swift_once();
  }
  uint64_t v10 = qword_10003AB98;
  uint64_t v11 = unk_10003ABA0;
  id v12 = [v5 tertiaryLabelColor];
  uint64_t v13 = sub_10002A6B0();
  sub_1000234BC(v2, v4, v7, v9, v10, v11, a1, v13);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();

  return swift_release();
}

__n128 sub_10001323C@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_10002AA50();
    uint64_t v23 = (void *)sub_10002A540();
    sub_100029F80();
  }
  sub_10002A3F0();
  sub_1000123DC(v13, a9, &qword_100039D78);
  uint64_t v24 = (_OWORD *)(a9 + *(int *)(sub_100002D88(&qword_100039D38) + 36));
  v24[4] = v30;
  v24[5] = v31;
  v24[6] = v32;
  *uint64_t v24 = v26;
  v24[1] = v27;
  __n128 result = v29;
  v24[2] = v28;
  void v24[3] = v29;
  return result;
}

__n128 sub_1000133FC@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_10002AA50();
    uint64_t v23 = (void *)sub_10002A540();
    sub_100029F80();
  }
  sub_10002A3F0();
  uint64_t v24 = sub_100002D88(&qword_100039D90);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v24 - 8) + 16))(a9, v13, v24);
  uint64_t v25 = (_OWORD *)(a9 + *(int *)(sub_100002D88(&qword_100039D98) + 36));
  v25[4] = v31;
  v25[5] = v32;
  v25[6] = v33;
  *uint64_t v25 = v27;
  v25[1] = v28;
  __n128 result = v30;
  v25[2] = v29;
  v25[3] = v30;
  return result;
}

__n128 sub_1000135E8@<Q0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  char v18 = a17;
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_10002AA50();
    long long v27 = (void *)sub_10002A540();
    sub_100029F80();

    char v18 = a17;
  }
  sub_10002A3F0();
  *(void *)a9 = a16;
  *(unsigned char *)(a9 + 8) = v18 & 1;
  *(_OWORD *)(a9 + 80) = v33;
  *(_OWORD *)(a9 + 96) = v34;
  *(_OWORD *)(a9 + 112) = v35;
  *(_OWORD *)(a9 + 16) = v29;
  *(_OWORD *)(a9 + 32) = v30;
  __n128 result = v32;
  *(_OWORD *)(a9 + 48) = v31;
  *(__n128 *)(a9 + 64) = v32;
  return result;
}

uint64_t sub_100013794@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_10002AA50();
    uint64_t v23 = (void *)sub_10002A540();
    sub_100029F80();
  }
  sub_10002A3F0();
  long long v24 = *(_OWORD *)(v13 + 80);
  *(_OWORD *)(a9 + 64) = *(_OWORD *)(v13 + 64);
  *(_OWORD *)(a9 + 80) = v24;
  *(unsigned char *)(a9 + 96) = *(unsigned char *)(v13 + 96);
  long long v25 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)a9 = *(_OWORD *)v13;
  *(_OWORD *)(a9 + 16) = v25;
  long long v26 = *(_OWORD *)(v13 + 48);
  *(_OWORD *)(a9 + 32) = *(_OWORD *)(v13 + 32);
  *(_OWORD *)(a9 + 48) = v26;
  *(_OWORD *)(a9 + 104) = v28;
  *(_OWORD *)(a9 + 120) = v29;
  *(_OWORD *)(a9 + 136) = v30;
  *(_OWORD *)(a9 + 200) = v34;
  *(_OWORD *)(a9 + 184) = v33;
  *(_OWORD *)(a9 + 168) = v32;
  *(_OWORD *)(a9 + 152) = v31;

  return sub_100016A94(v13);
}

uint64_t sub_100013968@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, char a18)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_10002AA50();
    long long v27 = (void *)sub_10002A540();
    sub_100029F80();
  }
  sub_10002A3F0();
  *(void *)a9 = a16;
  *(unsigned char *)(a9 + 8) = a17 & 1;
  *(unsigned char *)(a9 + 9) = a18 & 1;
  *(_OWORD *)(a9 + 80) = v33;
  *(_OWORD *)(a9 + 96) = v34;
  *(_OWORD *)(a9 + 112) = v35;
  *(_OWORD *)(a9 + 16) = v29;
  *(_OWORD *)(a9 + 32) = v30;
  *(_OWORD *)(a9 + 48) = v31;
  *(_OWORD *)(a9 + 64) = v32;

  return swift_retain();
}

uint64_t sub_100013B34@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_10002AA50();
    uint64_t v23 = (void *)sub_10002A540();
    sub_100029F80();
  }
  sub_10002A3F0();
  long long v24 = *(_OWORD *)(v13 + 48);
  *(_OWORD *)(a9 + 32) = *(_OWORD *)(v13 + 32);
  *(_OWORD *)(a9 + 48) = v24;
  *(_OWORD *)(a9 + 64) = *(_OWORD *)(v13 + 64);
  long long v25 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)a9 = *(_OWORD *)v13;
  *(_OWORD *)(a9 + 16) = v25;
  *(_OWORD *)(a9 + 136) = v30;
  *(_OWORD *)(a9 + 152) = v31;
  *(_OWORD *)(a9 + 168) = v32;
  *(_OWORD *)(a9 + 184) = v33;
  *(_OWORD *)(a9 + 88) = v27;
  *(_OWORD *)(a9 + 104) = v28;
  *(unsigned char *)(a9 + 80) = *(unsigned char *)(v13 + 80);
  *(_OWORD *)(a9 + 120) = v29;

  return sub_100016F78(v13);
}

uint64_t sub_100013D08@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_10002AA50();
    uint64_t v23 = (void *)sub_10002A540();
    sub_100029F80();
  }
  sub_10002A3F0();
  long long v24 = *(_OWORD *)(v13 + 48);
  *(_OWORD *)(a9 + 32) = *(_OWORD *)(v13 + 32);
  *(_OWORD *)(a9 + 48) = v24;
  long long v25 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)a9 = *(_OWORD *)v13;
  *(_OWORD *)(a9 + 16) = v25;
  *(_OWORD *)(a9 + 120) = v30;
  *(_OWORD *)(a9 + 136) = v31;
  *(_OWORD *)(a9 + 152) = v32;
  *(_OWORD *)(a9 + 168) = v33;
  *(_OWORD *)(a9 + 72) = v27;
  *(_OWORD *)(a9 + 88) = v28;
  *(_DWORD *)(a9 + 63) = *(_DWORD *)(v13 + 63);
  *(_OWORD *)(a9 + 104) = v29;
  return sub_100016F1C(v13);
}

uint64_t sub_100013EC8@<X0>(double a1@<X0>, char a2@<W1>, double a3@<X2>, char a4@<W3>, double a5@<X4>, char a6@<W5>, double a7@<X6>, char a8@<W7>, uint64_t a9@<X8>, double a10, char a11, double a12, char a13)
{
  if (a2) {
    a1 = -INFINITY;
  }
  if (a4) {
    a3 = a1;
  }
  if (a6) {
    a5 = a3;
  }
  if (a1 > a3 || a3 > a5) {
    goto LABEL_22;
  }
  if (a8) {
    a7 = -INFINITY;
  }
  if (a11) {
    a10 = a7;
  }
  if (a13) {
    a12 = a10;
  }
  if (a7 > a10 || a10 > a12)
  {
LABEL_22:
    sub_10002AA50();
    uint64_t v23 = (void *)sub_10002A540();
    sub_100029F80();
  }
  sub_10002A3F0();
  long long v24 = *(_OWORD *)(v13 + 48);
  *(_OWORD *)(a9 + 32) = *(_OWORD *)(v13 + 32);
  *(_OWORD *)(a9 + 48) = v24;
  long long v25 = *(_OWORD *)(v13 + 16);
  *(_OWORD *)a9 = *(_OWORD *)v13;
  *(_OWORD *)(a9 + 16) = v25;
  *(_OWORD *)(a9 + 120) = v30;
  *(_OWORD *)(a9 + 136) = v31;
  *(_OWORD *)(a9 + 152) = v32;
  *(_OWORD *)(a9 + 168) = v33;
  *(_OWORD *)(a9 + 72) = v27;
  *(_OWORD *)(a9 + 88) = v28;
  *(unsigned char *)(a9 + 64) = *(unsigned char *)(v13 + 64);
  *(_OWORD *)(a9 + 104) = v29;
  return sub_100016F1C(v13);
}

uint64_t sub_100014088@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100002D88(&qword_100039D90);
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v18[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = sub_100002D88(&qword_100039D98);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v11 = &v18[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v9);
  uint64_t v13 = &v18[-v12];
  uint64_t v19 = a1;
  sub_100002D88(&qword_100039DA0);
  sub_100002D88(&qword_100039DA8);
  sub_1000166F8();
  sub_100016A50(&qword_100039E48, &qword_100039DA8);
  sub_10002A610();
  if (qword_100039310 != -1) {
    swift_once();
  }
  double v14 = *(double *)&qword_10003AB00;
  sub_10002A790();
  __n128 v15 = sub_1000133FC(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v11, 0.0, 1, v14, 0);
  (*(void (**)(unsigned char *, uint64_t, __n128))(v5 + 8))(v7, v4, v15);
  sub_100012440((uint64_t)v11, (uint64_t)v13, &qword_100039D98);
  sub_1000123DC((uint64_t)v13, (uint64_t)v11, &qword_100039D98);
  *(void *)a2 = 0;
  *(unsigned char *)(a2 + 8) = 1;
  uint64_t v16 = sub_100002D88(&qword_100039E50);
  sub_1000123DC((uint64_t)v11, a2 + *(int *)(v16 + 48), &qword_100039D98);
  sub_10000714C((uint64_t)v13, &qword_100039D98);
  return sub_10000714C((uint64_t)v11, &qword_100039D98);
}

uint64_t sub_100014358@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v57 = a2;
  uint64_t v58 = a1;
  uint64_t v3 = sub_10002A280();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = *(void *)(v4 + 64);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)v48 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v49 = sub_100002D88(&qword_100039E58);
  uint64_t v55 = *(void *)(v49 - 8);
  uint64_t v7 = __chkstk_darwin(v49);
  BOOL v56 = (char *)v48 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v54 = (char *)v48 - v10;
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v53 = (char *)v48 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v52 = (char *)v48 - v14;
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v62 = (char *)v48 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v61 = (char *)v48 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v64 = (char *)v48 - v20;
  __chkstk_darwin(v19);
  uint64_t v63 = (char *)v48 - v21;
  uint64_t v51 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
  uint64_t v59 = v4 + 16;
  v51(v6, a1, v3);
  uint64_t v22 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v23 = ((v22 + 16) & ~v22) + v5;
  uint64_t v24 = (v22 + 16) & ~v22;
  uint64_t v50 = v24;
  uint64_t v25 = swift_allocObject();
  long long v26 = *(void (**)(uint64_t, char *, uint64_t))(v4 + 32);
  uint64_t v60 = v4 + 32;
  v26(v25 + v24, v6, v3);
  sub_10002A760();
  uint64_t v27 = v58;
  uint64_t v28 = v3;
  long long v29 = v51;
  v51(v6, v58, v3);
  v48[1] = v23;
  uint64_t v30 = swift_allocObject();
  uint64_t v31 = v50;
  v48[0] = v26;
  v26(v30 + v50, v6, v3);
  sub_10002A760();
  v29(v6, v27, v3);
  uint64_t v32 = swift_allocObject();
  long long v33 = (void (*)(uint64_t, char *, uint64_t))v48[0];
  ((void (*)(uint64_t, char *, uint64_t))v48[0])(v32 + v31, v6, v28);
  long long v34 = v61;
  sub_10002A760();
  v29(v6, v58, v28);
  uint64_t v35 = swift_allocObject();
  v33(v35 + v31, v6, v28);
  uint64_t v36 = v62;
  sub_10002A760();
  uint64_t v37 = v55;
  uint64_t v38 = *(void (**)(char *, char *, uint64_t))(v55 + 16);
  uint64_t v39 = v52;
  uint64_t v40 = v49;
  v38(v52, v63, v49);
  uint64_t v41 = v53;
  v38(v53, v64, v40);
  uint64_t v42 = v54;
  v38(v54, v34, v40);
  uint64_t v43 = v56;
  v38(v56, v36, v40);
  uint64_t v44 = v57;
  v38(v57, v39, v40);
  uint64_t v45 = (int *)sub_100002D88(&qword_100039E60);
  v38(&v44[v45[12]], v41, v40);
  v38(&v44[v45[16]], v42, v40);
  v38(&v44[v45[20]], v43, v40);
  uint64_t v46 = *(void (**)(char *, uint64_t))(v37 + 8);
  v46(v62, v40);
  v46(v61, v40);
  v46(v64, v40);
  v46(v63, v40);
  v46(v43, v40);
  v46(v42, v40);
  v46(v41, v40);
  return ((uint64_t (*)(char *, uint64_t))v46)(v39, v40);
}

uint64_t sub_1000149E0@<X0>(uint64_t a1@<X8>)
{
  return sub_100014A50(a1);
}

uint64_t sub_1000149FC@<X0>(uint64_t a1@<X8>)
{
  return sub_100014A50(a1);
}

uint64_t sub_100014A18@<X0>(uint64_t a1@<X8>)
{
  return sub_100014A50(a1);
}

uint64_t sub_100014A34@<X0>(uint64_t a1@<X8>)
{
  return sub_100014A50(a1);
}

uint64_t sub_100014A50@<X0>(uint64_t a1@<X8>)
{
  sub_10002A8E0();
  sub_100016BD8();
  uint64_t result = sub_10002A640();
  *(void *)a1 = result;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = v4 & 1;
  *(void *)(a1 + 24) = v5;
  return result;
}

uint64_t sub_100014AA8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = sub_10002A8E0();
  uint64_t v4 = v3;
  uint64_t v5 = sub_10002A6E0();
  id v6 = [self linkColor];
  uint64_t v7 = sub_10002A6B0();
  sub_10002A7D0();
  sub_1000234BC(v2, v4, v5, v7, 0, 0, a1, 0);
  swift_bridgeObjectRelease();
  swift_release();

  return swift_release();
}

uint64_t sub_100014B84@<X0>(void *a1@<X0>, uint64_t a2@<X1>, int a3@<W3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v60 = a4;
  int v58 = a3;
  uint64_t v68 = a5;
  uint64_t v7 = sub_100002D88(&qword_100039CD8);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = &v52[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v61 = sub_100002D88(&qword_100039CE0);
  __chkstk_darwin(v61);
  uint64_t v65 = &v52[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v63 = sub_100002D88(&qword_100039CE8);
  uint64_t v11 = __chkstk_darwin(v63);
  uint64_t v67 = &v52[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v64 = &v52[-v14];
  __chkstk_darwin(v13);
  os_log_type_t v66 = &v52[-v15];
  uint64_t v16 = sub_10002A530();
  uint64_t v55 = *(void *)(v16 - 8);
  uint64_t v56 = v16;
  __chkstk_darwin(v16);
  uint64_t v18 = &v52[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v57 = sub_100002D88(&qword_100039CF0);
  uint64_t v19 = *(void *)(v57 - 8);
  __chkstk_darwin(v57);
  uint64_t v21 = &v52[-((v20 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v54 = sub_100002D88(&qword_100039CF8);
  uint64_t v22 = __chkstk_darwin(v54);
  uint64_t v62 = &v52[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v24 = __chkstk_darwin(v22);
  long long v26 = &v52[-v25];
  __chkstk_darwin(v24);
  uint64_t v69 = &v52[-v27];
  uint64_t v53 = sub_10002A4A0();
  uint64_t v59 = a2;
  sub_10001558C(a1, a2, (uint64_t)v99);
  if (qword_100039350 != -1) {
    swift_once();
  }
  sub_10002A7B0();
  *(_OWORD *)&v71[167] = v99[10];
  *(_OWORD *)&v71[183] = v99[11];
  *(_OWORD *)&v71[199] = v99[12];
  *(_OWORD *)&v71[103] = v99[6];
  *(_OWORD *)&v71[119] = v99[7];
  *(_OWORD *)&v71[135] = v99[8];
  *(_OWORD *)&v71[151] = v99[9];
  *(_OWORD *)&v71[39] = v99[2];
  *(_OWORD *)&v71[55] = v99[3];
  *(_OWORD *)&v71[71] = v99[4];
  *(_OWORD *)&v71[87] = v99[5];
  *(_OWORD *)&v71[7] = v99[0];
  char v72 = 0;
  v71[215] = v100;
  *(_OWORD *)&v71[23] = v99[1];
  sub_10002A3F0();
  *(_OWORD *)((char *)&v70[11] + 1) = *(_OWORD *)&v71[160];
  *(_OWORD *)((char *)&v70[12] + 1) = *(_OWORD *)&v71[176];
  *(_OWORD *)((char *)&v70[13] + 1) = *(_OWORD *)&v71[192];
  *(_OWORD *)((char *)&v70[7] + 1) = *(_OWORD *)&v71[96];
  *(_OWORD *)((char *)&v70[8] + 1) = *(_OWORD *)&v71[112];
  *(_OWORD *)((char *)&v70[9] + 1) = *(_OWORD *)&v71[128];
  *(_OWORD *)((char *)&v70[10] + 1) = *(_OWORD *)&v71[144];
  *(_OWORD *)((char *)&v70[3] + 1) = *(_OWORD *)&v71[32];
  *(_OWORD *)((char *)&v70[4] + 1) = *(_OWORD *)&v71[48];
  *(_OWORD *)((char *)&v70[5] + 1) = *(_OWORD *)&v71[64];
  *(_OWORD *)((char *)&v70[6] + 1) = *(_OWORD *)&v71[80];
  *(_OWORD *)((char *)&v70[1] + 1) = *(_OWORD *)v71;
  char v78 = v81;
  char v77 = v83;
  char v76 = v85;
  char v75 = v87;
  char v74 = v89;
  char v73 = v91;
  v70[0] = (unint64_t)v53;
  LOBYTE(v70[1]) = 0;
  *(void *)((char *)&v70[14] + 1) = *(void *)&v71[208];
  *(_OWORD *)((char *)&v70[2] + 1) = *(_OWORD *)&v71[16];
  *(void *)&v70[15] = v80;
  BYTE8(v70[15]) = v81;
  *(void *)&v70[16] = v82;
  BYTE8(v70[16]) = v83;
  *(void *)&v70[17] = v84;
  BYTE8(v70[17]) = v85;
  *(void *)&v70[18] = v86;
  BYTE8(v70[18]) = v87;
  *(void *)&v70[19] = v88;
  BYTE8(v70[19]) = v89;
  *(void *)&v70[20] = v90;
  BYTE8(v70[20]) = v91;
  v70[21] = v92;
  sub_10002A520();
  sub_100002D88(&qword_100039D00);
  sub_1000163C0();
  sub_10002A6A0();
  (*(void (**)(unsigned char *, uint64_t))(v55 + 8))(v18, v56);
  memcpy(v79, v70, sizeof(v79));
  sub_1000164A8((uint64_t)v79);
  uint64_t v28 = sub_10002A6D0();
  char v29 = sub_10002A550();
  uint64_t v30 = v57;
  (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v19 + 16))(v26, v21, v57);
  uint64_t v31 = &v26[*(int *)(v54 + 36)];
  *(void *)uint64_t v31 = v28;
  v31[8] = v29;
  (*(void (**)(unsigned char *, uint64_t))(v19 + 8))(v21, v30);
  sub_100012440((uint64_t)v26, (uint64_t)v69, &qword_100039CF8);
  sub_10002A7B0();
  sub_10002A3B0();
  uint64_t v57 = v93;
  LODWORD(v56) = v94;
  char v32 = v96;
  uint64_t v54 = v97;
  uint64_t v55 = v95;
  uint64_t v53 = v98;
  *(void *)uint64_t v9 = sub_10002A4D0();
  *((void *)v9 + 1) = 0;
  v9[16] = 0;
  uint64_t v33 = sub_100002D88(&qword_100039D20);
  sub_1000159B0(v58 & 1, v59, v60, (uint64_t)&v9[*(int *)(v33 + 44)]);
  if (qword_100039360 != -1) {
    swift_once();
  }
  uint64_t v34 = qword_10003AB50;
  swift_retain();
  char v35 = sub_10002A550();
  uint64_t v36 = v65;
  sub_1000123DC((uint64_t)v9, (uint64_t)v65, &qword_100039CD8);
  uint64_t v37 = &v36[*(int *)(v61 + 36)];
  *(void *)uint64_t v37 = v34;
  v37[8] = v35;
  sub_10000714C((uint64_t)v9, &qword_100039CD8);
  if (qword_1000392D8 != -1) {
    swift_once();
  }
  if (byte_10003A108 != 1 && qword_100039348 != -1) {
    swift_once();
  }
  sub_10002A7A0();
  sub_10002A3F0();
  uint64_t v38 = v64;
  sub_1000123DC((uint64_t)v36, (uint64_t)v64, &qword_100039CE0);
  uint64_t v39 = &v38[*(int *)(v63 + 36)];
  long long v40 = v70[5];
  v39[4] = v70[4];
  v39[5] = v40;
  v39[6] = v70[6];
  long long v41 = v70[1];
  *uint64_t v39 = v70[0];
  v39[1] = v41;
  long long v42 = v70[3];
  v39[2] = v70[2];
  v39[3] = v42;
  sub_10000714C((uint64_t)v36, &qword_100039CE0);
  uint64_t v43 = v66;
  sub_100012440((uint64_t)v38, (uint64_t)v66, &qword_100039CE8);
  uint64_t v44 = v69;
  uint64_t v45 = v62;
  sub_1000123DC((uint64_t)v69, (uint64_t)v62, &qword_100039CF8);
  uint64_t v46 = v67;
  sub_1000123DC((uint64_t)v43, (uint64_t)v67, &qword_100039CE8);
  uint64_t v47 = v68;
  sub_1000123DC((uint64_t)v45, v68, &qword_100039CF8);
  uint64_t v48 = sub_100002D88(&qword_100039D28);
  uint64_t v49 = v47 + *(int *)(v48 + 48);
  *(void *)uint64_t v49 = 0;
  *(unsigned char *)(v49 + 8) = 1;
  *(void *)(v49 + 16) = v57;
  *(unsigned char *)(v49 + 24) = v56;
  *(void *)(v49 + 32) = v55;
  *(unsigned char *)(v49 + 40) = v32;
  uint64_t v50 = v53;
  *(void *)(v49 + 48) = v54;
  *(void *)(v49 + 56) = v50;
  sub_1000123DC((uint64_t)v46, v47 + *(int *)(v48 + 64), &qword_100039CE8);
  sub_10000714C((uint64_t)v43, &qword_100039CE8);
  sub_10000714C((uint64_t)v44, &qword_100039CF8);
  sub_10000714C((uint64_t)v46, &qword_100039CE8);
  return sub_10000714C((uint64_t)v45, &qword_100039CF8);
}

uint64_t sub_10001558C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5 = qword_100039380;
  id v6 = a1;
  if (v5 != -1) {
    swift_once();
  }
  uint64_t v7 = qword_10003AB88;
  uint64_t v8 = unk_10003AB90;
  uint64_t v9 = qword_100039340;
  swift_bridgeObjectRetain();
  if (v9 != -1) {
    swift_once();
  }
  uint64_t v10 = qword_10003AB30;
  uint64_t v11 = qword_10003AB38;
  swift_retain();
  swift_retain();
  swift_retain();
  uint64_t v12 = sub_10002A6E0();
  sub_100027720(v6, v7, v8, v12, v10, v11, (uint64_t)sub_100016C2C, a2, (uint64_t)v39);
  sub_10002A7B0();
  sub_10002A3B0();
  char v13 = v42;
  uint64_t v37 = v43;
  uint64_t v38 = v41;
  char v32 = v44;
  uint64_t v35 = v46;
  uint64_t v36 = v45;
  uint64_t v34 = sub_10002A8E0();
  uint64_t v15 = v14;
  uint64_t v33 = sub_10002A170();
  uint64_t v17 = v16;
  uint64_t v31 = sub_10002A4E0();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  uint64_t v30 = sub_10002A6D0();
  char v29 = sub_10002A550();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v18 = (void *)v39[0];
  uint64_t v19 = v39[1];
  uint64_t v20 = v39[2];
  uint64_t v21 = v39[3];
  uint64_t v23 = v39[4];
  uint64_t v22 = v39[5];
  uint64_t v24 = v39[6];
  uint64_t v25 = v39[7];
  char v26 = v40 & 1;
  char v50 = 1;
  char v49 = v13;
  char v48 = v32;
  char v47 = 0;
  *(void *)a3 = v39[0];
  *(void *)(a3 + 8) = v19;
  *(void *)(a3 + 16) = v20;
  *(void *)(a3 + 24) = v21;
  *(void *)(a3 + 32) = v23;
  *(void *)(a3 + 40) = v22;
  *(void *)(a3 + 48) = v24;
  *(void *)(a3 + 56) = v25;
  *(unsigned char *)(a3 + 64) = v26;
  *(void *)(a3 + 72) = 0;
  *(unsigned char *)(a3 + 80) = 1;
  *(void *)(a3 + 88) = v38;
  *(unsigned char *)(a3 + 96) = v13;
  *(void *)(a3 + 104) = v37;
  *(unsigned char *)(a3 + 112) = v32;
  *(void *)(a3 + 120) = v36;
  *(void *)(a3 + 128) = v35;
  *(void *)(a3 + 136) = v31;
  *(void *)(a3 + 144) = 0;
  *(unsigned char *)(a3 + 152) = 0;
  *(void *)(a3 + 160) = v34;
  *(void *)(a3 + 168) = v15;
  *(void *)(a3 + 176) = v33;
  *(void *)(a3 + 184) = v17;
  *(unsigned char *)(a3 + 192) = 0;
  *(void *)(a3 + 200) = v30;
  *(unsigned char *)(a3 + 208) = v29;
  id v27 = v18;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100016C34(v24);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  return sub_10001654C(v24);
}

uint64_t sub_100015878(uint64_t a1)
{
  uint64_t v2 = sub_10002A030();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = sub_100009238();
  if ((result & 1) == 0)
  {
    sub_10002A060();
    sub_10002A050();
    (*(void (**)(char *, void, uint64_t))(v3 + 104))(v5, enum case for PeopleAnalytics.MessageRequestBubbleSource.screenTime(_:), v2);
    sub_10002A040();
    swift_release();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return sub_100028F70(a1 + OBJC_IVAR____TtC24PeopleMessagesScreenTime22BubbleContentContainer_details);
  }
  return result;
}

uint64_t sub_1000159B0@<X0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v31 = a3;
  uint64_t v32 = a4;
  LODWORD(v33) = a1;
  uint64_t v5 = sub_100002D88(&qword_100039D30);
  __chkstk_darwin(v5);
  uint64_t v7 = (char *)&v30 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100002D88(&qword_100039D38);
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100002D88(&qword_100039D40);
  __chkstk_darwin(v11);
  char v13 = (char *)&v30 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100002D88(&qword_100039D48);
  __chkstk_darwin(v14);
  uint64_t v16 = (char *)&v30 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100002D88(&qword_100039D50);
  uint64_t v18 = __chkstk_darwin(v17);
  uint64_t v20 = (char *)&v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (v33)
  {
    uint64_t v33 = v11;
    uint64_t v21 = v31;
    uint64_t v30 = v18;
    if (sub_100009238())
    {
      uint64_t v22 = a2 + OBJC_IVAR____TtC24PeopleMessagesScreenTime22BubbleContentContainer_details;
      *(void *)uint64_t v16 = sub_10002A4B0();
      *((void *)v16 + 1) = 0;
      v16[16] = 0;
      uint64_t v23 = sub_100002D88(&qword_100039D88);
      sub_100014088(v22, (uint64_t)&v16[*(int *)(v23 + 44)]);
      uint64_t v24 = &qword_100039D48;
      sub_1000123DC((uint64_t)v16, (uint64_t)v13, &qword_100039D48);
      swift_storeEnumTagMultiPayload();
      sub_100016A50(&qword_100039D60, &qword_100039D48);
      sub_1000165FC();
      sub_10002A510();
      uint64_t v25 = (uint64_t)v16;
    }
    else
    {
      sub_100012BDC(v21, (uint64_t)v10);
      uint64_t v24 = &qword_100039D38;
      sub_1000123DC((uint64_t)v10, (uint64_t)v13, &qword_100039D38);
      swift_storeEnumTagMultiPayload();
      sub_100016A50(&qword_100039D60, &qword_100039D48);
      sub_1000165FC();
      sub_10002A510();
      uint64_t v25 = (uint64_t)v10;
    }
    sub_10000714C(v25, v24);
    sub_1000123DC((uint64_t)v20, (uint64_t)v7, &qword_100039D50);
    swift_storeEnumTagMultiPayload();
    sub_10001655C();
    sub_10001669C();
    sub_10002A510();
    return sub_10000714C((uint64_t)v20, &qword_100039D50);
  }
  else
  {
    sub_10000B414((char **)v34);
    uint64_t v26 = v35;
    long long v27 = v34[1];
    long long v28 = v34[2];
    *(_OWORD *)uint64_t v7 = v34[0];
    *((_OWORD *)v7 + 1) = v27;
    *((_OWORD *)v7 + 2) = v28;
    *((void *)v7 + 6) = v26;
    swift_storeEnumTagMultiPayload();
    sub_10001655C();
    sub_10001669C();
    return sub_10002A510();
  }
}

uint64_t sub_100015DA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10002A030();
  uint64_t v33 = *(void *)(v4 - 8);
  uint64_t v34 = v4;
  __chkstk_darwin(v4);
  uint64_t v32 = (char *)&v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_10002A130();
  uint64_t v37 = *(void *)(v6 - 8);
  uint64_t v7 = __chkstk_darwin(v6);
  uint64_t v38 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v36 = (char *)&v31 - v9;
  uint64_t v10 = sub_10002A280();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = __chkstk_darwin(v10);
  uint64_t v14 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v31 - v15;
  unsigned __int8 v17 = sub_100009DC0();
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v18(v16, a2, v10);
  uint64_t v35 = a1;
  if (v17) {
    char v19 = sub_10002A260() ^ 1;
  }
  else {
    char v19 = 0;
  }
  uint64_t v20 = *(void (**)(char *, uint64_t))(v11 + 8);
  v20(v16, v10);
  v18(v14, a2, v10);
  if ((v19 & 1) == 0) {
    return ((uint64_t (*)(char *, uint64_t))v20)(v14, v10);
  }
  uint64_t v21 = v36;
  sub_10002A210();
  uint64_t v22 = v37;
  (*(void (**)(char *, void, uint64_t))(v37 + 104))(v38, enum case for MessageDetails.EventStatus.purged(_:), v6);
  sub_100016368();
  sub_10002A930();
  sub_10002A930();
  if (v41 == v39 && v42 == v40)
  {
    swift_bridgeObjectRelease_n();
    uint64_t v23 = *(void (**)(char *, uint64_t))(v22 + 8);
    v23(v38, v6);
    v23(v21, v6);
    v20(v14, v10);
    uint64_t v24 = v35;
  }
  else
  {
    char v26 = sub_10002AC00();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    long long v27 = *(void (**)(char *, uint64_t))(v22 + 8);
    v27(v38, v6);
    v27(v21, v6);
    uint64_t result = ((uint64_t (*)(char *, uint64_t))v20)(v14, v10);
    uint64_t v24 = v35;
    if ((v26 & 1) == 0) {
      return result;
    }
  }
  uint64_t result = sub_100009238();
  if ((result & 1) == 0)
  {
    sub_10002A060();
    sub_10002A050();
    char v29 = v32;
    uint64_t v28 = v33;
    uint64_t v30 = v34;
    (*(void (**)(char *, void, uint64_t))(v33 + 104))(v32, enum case for PeopleAnalytics.MessageRequestBubbleSource.screenTime(_:), v34);
    sub_10002A040();
    swift_release();
    (*(void (**)(char *, uint64_t))(v28 + 8))(v29, v30);
    return sub_100028F70(v24 + OBJC_IVAR____TtC24PeopleMessagesScreenTime22BubbleContentContainer_details);
  }
  return result;
}

uint64_t sub_100016210()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC24PeopleMessagesScreenTime22BubbleContentContainer_details;
  uint64_t v2 = sub_10002A280();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);

  return swift_deallocClassInstance();
}

uint64_t sub_1000162DC()
{
  return type metadata accessor for ScreenTimeBubble();
}

uint64_t type metadata accessor for ScreenTimeBubble()
{
  uint64_t result = qword_100039B58;
  if (!qword_100039B58) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100016330()
{
  return swift_updateClassMetadata2();
}

unint64_t sub_100016368()
{
  unint64_t result = qword_1000399F8;
  if (!qword_1000399F8)
  {
    sub_10002A130();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000399F8);
  }
  return result;
}

unint64_t sub_1000163C0()
{
  unint64_t result = qword_100039D08;
  if (!qword_100039D08)
  {
    sub_100016460(&qword_100039D00);
    sub_100016A50(&qword_100039D10, &qword_100039D18);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039D08);
  }
  return result;
}

uint64_t sub_100016460(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000164A8(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 24);
  uint64_t v3 = *(void *)(a1 + 72);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();

  sub_10001654C(v3);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_10001654C(uint64_t result)
{
  if (result) {
    return swift_release();
  }
  return result;
}

unint64_t sub_10001655C()
{
  unint64_t result = qword_100039D58;
  if (!qword_100039D58)
  {
    sub_100016460(&qword_100039D50);
    sub_100016A50(&qword_100039D60, &qword_100039D48);
    sub_1000165FC();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039D58);
  }
  return result;
}

unint64_t sub_1000165FC()
{
  unint64_t result = qword_100039D68;
  if (!qword_100039D68)
  {
    sub_100016460(&qword_100039D38);
    sub_100016A50(&qword_100039D70, &qword_100039D78);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039D68);
  }
  return result;
}

unint64_t sub_10001669C()
{
  unint64_t result = qword_100039D80;
  if (!qword_100039D80)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039D80);
  }
  return result;
}

uint64_t sub_1000166F0@<X0>(char *a1@<X8>)
{
  return sub_100014358(*(void *)(v1 + 16), a1);
}

unint64_t sub_1000166F8()
{
  unint64_t result = qword_100039DB0;
  if (!qword_100039DB0)
  {
    sub_100016460(&qword_100039DA0);
    sub_100016798();
    sub_100016A50(&qword_100039E38, &qword_100039E40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039DB0);
  }
  return result;
}

unint64_t sub_100016798()
{
  unint64_t result = qword_100039DB8;
  if (!qword_100039DB8)
  {
    sub_100016460(&qword_100039DC0);
    sub_100016838();
    sub_100016A50(&qword_100039E28, &qword_100039E30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039DB8);
  }
  return result;
}

unint64_t sub_100016838()
{
  unint64_t result = qword_100039DC8;
  if (!qword_100039DC8)
  {
    sub_100016460(&qword_100039DD0);
    sub_100016904(&qword_100039DD8, &qword_100039DE0, (void (*)(void))sub_100016980);
    sub_100016A50(&qword_100039E18, &qword_100039E20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039DC8);
  }
  return result;
}

uint64_t sub_100016904(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100016460(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100016980()
{
  return sub_100016904(&qword_100039DE8, &qword_100039DF0, (void (*)(void))sub_1000169B0);
}

unint64_t sub_1000169B0()
{
  unint64_t result = qword_100039DF8;
  if (!qword_100039DF8)
  {
    sub_100016460(&qword_100039E00);
    sub_100016A50(&qword_100039E08, &qword_100039E10);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039DF8);
  }
  return result;
}

uint64_t sub_100016A50(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100016460(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100016A94(uint64_t a1)
{
  return a1;
}

uint64_t sub_100016B28(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

uint64_t sub_100016B3C()
{
  return sub_100016B68((void *)1);
}

uint64_t sub_100016B48()
{
  return sub_100016B68((void *)2);
}

uint64_t sub_100016B54()
{
  return sub_100016B68((void *)3);
}

uint64_t sub_100016B60()
{
  return sub_100016B68(0);
}

uint64_t sub_100016B68(void *a1)
{
  uint64_t v3 = *(void *)(sub_10002A280() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_100029718(v4, a1);
}

unint64_t sub_100016BD8()
{
  unint64_t result = qword_100039E68;
  if (!qword_100039E68)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039E68);
  }
  return result;
}

uint64_t sub_100016C2C()
{
  return sub_100015878(v0);
}

uint64_t sub_100016C34(uint64_t result)
{
  if (result) {
    return swift_retain();
  }
  return result;
}

uint64_t sub_100016C44(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100016CA8()
{
  uint64_t v1 = sub_10002A280();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 64) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  sub_100007454(v0 + 16);
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100016D7C(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_100016D94()
{
  uint64_t v1 = *(void *)(sub_10002A280() - 8);
  long long v2 = *(int64_t **)(v0 + 56);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_100012F6C((void *)(v0 + 16), v2, v3);
}

uint64_t sub_100016E00()
{
  uint64_t v1 = sub_10002A280();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100016E90(unsigned int a1)
{
  uint64_t v3 = sub_10002A280();
  uint64_t v6 = *(void *)(v3 - 8);
  uint64_t result = v3 - 8;
  uint64_t v5 = v6;
  if (a1 <= 3)
  {
    uint64_t v7 = v1 + ((*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    uint64_t v8 = (void *)qword_10002B9B8[a1];
    return sub_100029718(v7, v8);
  }
  return result;
}

uint64_t sub_100016F1C(uint64_t a1)
{
  return a1;
}

uint64_t sub_100016F78(uint64_t a1)
{
  return a1;
}

uint64_t sub_100016FE8()
{
  uint64_t v0 = sub_10002A110();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for AppStateStore();
  uint64_t v4 = swift_allocObject();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v3, enum case for MessageDetails.EventSource.screenTime(_:), v0);
  id v5 = [self defaultManager];
  v7[4] = sub_1000090C8(0, &qword_100039FE8);
  v7[5] = &protocol witness table for NSFileManager;
  v7[1] = v5;
  sub_10002A330();
  swift_allocObject();
  *(void *)(v4 + 16) = sub_10002A320();
  sub_10002A350();
  uint64_t result = sub_10002A340();
  *(void *)(v4 + 24) = result;
  qword_10003AAA8 = v4;
  return result;
}

uint64_t sub_10001715C()
{
  swift_release();
  swift_release();

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for AppStateStore()
{
  return self;
}

uint64_t sub_1000171C0(uint64_t a1)
{
  uint64_t v75 = a1;
  uint64_t v77 = sub_100029FB0();
  uint64_t v73 = *(void *)(v77 - 8);
  uint64_t v2 = __chkstk_darwin(v77);
  uint64_t v68 = (char *)&v62 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __chkstk_darwin(v2);
  char v72 = (char *)&v62 - v5;
  __chkstk_darwin(v4);
  unint64_t v71 = (char *)&v62 - v6;
  uint64_t v69 = sub_10002A080();
  uint64_t v70 = *(void *)(v69 - 8);
  __chkstk_darwin(v69);
  uint64_t v8 = (char *)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = sub_10002A110();
  uint64_t v78 = *(void *)(v76 - 8);
  __chkstk_darwin(v76);
  uint64_t v10 = (char *)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v74 = sub_100002D88(&qword_100039FF0);
  __chkstk_darwin(v74);
  uint64_t v12 = (char *)&v62 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = sub_100002D88(&qword_1000399C0);
  uint64_t v14 = __chkstk_darwin(v13 - 8);
  uint64_t v16 = (char *)&v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v14);
  char v19 = (char *)&v62 - v18;
  __chkstk_darwin(v17);
  uint64_t v21 = (char *)&v62 - v20;
  uint64_t v22 = (uint64_t)&v1[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_eventNotifier];
  swift_beginAccess();
  sub_1000123DC(v22, (uint64_t)v80, &qword_100039FF8);
  uint64_t v23 = v80[3];
  uint64_t result = sub_10000714C((uint64_t)v80, &qword_100039FF8);
  if (!v23)
  {
    uint64_t v67 = v16;
    uint64_t v65 = v10;
    uint64_t v63 = v22;
    uint64_t v64 = v8;
    os_log_type_t v66 = v1;
    sub_10002A150();
    uint64_t v25 = v78;
    uint64_t v26 = v76;
    (*(void (**)(char *, void, uint64_t))(v78 + 104))(v19, enum case for MessageDetails.EventSource.screenTime(_:), v76);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v19, 0, 1, v26);
    uint64_t v27 = (uint64_t)&v12[*(int *)(v74 + 48)];
    sub_1000123DC((uint64_t)v21, (uint64_t)v12, &qword_1000399C0);
    sub_1000123DC((uint64_t)v19, v27, &qword_1000399C0);
    uint64_t v28 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v25 + 48);
    uint64_t v29 = (uint64_t)v12;
    if (v28((uint64_t)v12, 1, v26) == 1)
    {
      sub_10000714C((uint64_t)v19, &qword_1000399C0);
      sub_10000714C((uint64_t)v21, &qword_1000399C0);
      int v30 = v28(v27, 1, v26);
      uint64_t v31 = v77;
      uint64_t v32 = v73;
      if (v30 == 1)
      {
        sub_10000714C((uint64_t)v12, &qword_1000399C0);
LABEL_9:
        uint64_t v40 = v66;
        if (v66[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_isBubbleActive] == 1)
        {
          uint64_t v42 = *(void *)&v66[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID];
          unint64_t v41 = *(void *)&v66[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID + 8];
          swift_bridgeObjectRetain();
          uint64_t v43 = sub_10002A270();
          uint64_t v45 = v44;
          uint64_t v46 = v70;
          uint64_t v47 = (uint64_t)v64;
          uint64_t v48 = v69;
          (*(void (**)(char *, void, uint64_t))(v70 + 104))(v64, enum case for StatusType.screenTimeRequest(_:), v69);
          sub_100008B50(v42, v41, v43, v45, v47, (uint64_t)v40, (uint64_t)&off_100035938, v80);
          (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v47, v48);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v61 = v63;
          swift_beginAccess();
          sub_100019B74((uint64_t)v80, v61);
          return swift_endAccess();
        }
        char v49 = v71;
        sub_10002A010();
        uint64_t v55 = v40;
        uint64_t v56 = sub_100029FA0();
        os_log_type_t v57 = sub_10002AA30();
        if (os_log_type_enabled(v56, v57))
        {
          uint64_t v58 = swift_slowAlloc();
          v80[0] = swift_slowAlloc();
          *(_DWORD *)uint64_t v58 = 136315394;
          uint64_t v59 = *(void *)&v55[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID];
          unint64_t v60 = *(void *)&v55[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID + 8];
          swift_bridgeObjectRetain();
          uint64_t v79 = sub_100006348(v59, v60, v80);
          sub_10002AAD0();

          swift_bridgeObjectRelease();
          *(_WORD *)(v58 + 12) = 2080;
          uint64_t v79 = sub_100006348(0xD00000000000001ELL, 0x800000010002C790, v80);
          sub_10002AAD0();
          _os_log_impl((void *)&_mh_execute_header, v56, v57, "%s has been deactivated prior to %s!", (uint8_t *)v58, 0x16u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          uint64_t v53 = *(uint64_t (**)(char *, uint64_t))(v32 + 8);
          uint64_t v54 = v71;
          return v53(v54, v31);
        }

LABEL_14:
        uint64_t v53 = *(uint64_t (**)(char *, uint64_t))(v32 + 8);
        uint64_t v54 = v49;
        return v53(v54, v31);
      }
    }
    else
    {
      uint64_t v33 = v78;
      uint64_t v34 = (uint64_t)v67;
      sub_1000123DC(v29, (uint64_t)v67, &qword_1000399C0);
      if (v28(v27, 1, v26) != 1)
      {
        uint64_t v35 = v33;
        uint64_t v36 = *(void (**)(char *, uint64_t, uint64_t))(v33 + 32);
        uint64_t v37 = v65;
        v36(v65, v27, v26);
        sub_100019BDC();
        char v38 = sub_10002A850();
        uint64_t v39 = *(void (**)(char *, uint64_t))(v35 + 8);
        v39(v37, v26);
        sub_10000714C((uint64_t)v19, &qword_1000399C0);
        sub_10000714C((uint64_t)v21, &qword_1000399C0);
        v39((char *)v34, v26);
        sub_10000714C(v29, &qword_1000399C0);
        uint64_t v31 = v77;
        uint64_t v32 = v73;
        if (v38) {
          goto LABEL_9;
        }
LABEL_11:
        char v49 = v72;
        sub_10002A010();
        char v50 = sub_100029FA0();
        os_log_type_t v51 = sub_10002AA40();
        if (os_log_type_enabled(v50, v51))
        {
          uint64_t v52 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)uint64_t v52 = 0;
          _os_log_impl((void *)&_mh_execute_header, v50, v51, "Misconfigured screenTime details", v52, 2u);
          swift_slowDealloc();
        }

        goto LABEL_14;
      }
      sub_10000714C((uint64_t)v19, &qword_1000399C0);
      sub_10000714C((uint64_t)v21, &qword_1000399C0);
      (*(void (**)(uint64_t, uint64_t))(v33 + 8))(v34, v26);
      uint64_t v31 = v77;
      uint64_t v32 = v73;
    }
    sub_10000714C(v29, &qword_100039FF0);
    goto LABEL_11;
  }
  return result;
}

uint64_t sub_100017B28()
{
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for ScreenTimeMessageViewController();
  [super viewDidLoad];
  *(void *)&v0[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_bubbleDelegate + 8] = &off_100035890;
  swift_unknownObjectWeakAssign();
  uint64_t v1 = *(void *)&v0[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_messageDetailsLoader];
  *(void *)(v1 + 40) = &off_100035858;
  swift_unknownObjectWeakAssign();
  *(void *)(v1 + 24) = &off_100035868;
  return swift_unknownObjectWeakAssign();
}

id sub_100017C14(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = &v3[OBJC_IVAR____TtC24PeopleMessagesScreenTime31ScreenTimeMessageViewController_fallbackThumbnail];
  uint64_t v7 = enum case for FirstPartyApps.screentime(_:);
  uint64_t v8 = sub_10002A0F0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v8 - 8) + 104))(v6, v7, v8);
  uint64_t v9 = OBJC_IVAR____TtC24PeopleMessagesScreenTime31ScreenTimeMessageViewController_backgroundColor;
  uint64_t v10 = qword_100039358;
  uint64_t v11 = v3;
  if (v10 != -1) {
    swift_once();
  }
  uint64_t v12 = (void *)qword_10003AB48;
  *(void *)&v3[v9] = qword_10003AB48;
  id v13 = v12;

  if (a2)
  {
    NSString v14 = sub_10002A860();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v14 = 0;
  }
  v17.receiver = v11;
  v17.super_class = (Class)type metadata accessor for ScreenTimeMessageViewController();
  id v15 = [super initWithNibName:v14 bundle:a3];

  return v15;
}

void sub_100017FC8()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC24PeopleMessagesScreenTime31ScreenTimeMessageViewController_fallbackThumbnail;
  uint64_t v2 = sub_10002A0F0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(v1, v2);
  objc_super v3 = *(void **)(v0 + OBJC_IVAR____TtC24PeopleMessagesScreenTime31ScreenTimeMessageViewController_backgroundColor);
}

id sub_100018044()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for ScreenTimeMessageViewController();
  [super dealloc];
}

uint64_t sub_1000180FC()
{
  return type metadata accessor for ScreenTimeMessageViewController();
}

uint64_t type metadata accessor for ScreenTimeMessageViewController()
{
  uint64_t result = qword_100039F50;
  if (!qword_100039F50) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_100018150()
{
  uint64_t result = sub_10002A0F0();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_1000181EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = v1 + OBJC_IVAR____TtC24PeopleMessagesScreenTime31ScreenTimeMessageViewController_fallbackThumbnail;
  uint64_t v4 = sub_10002A0F0();
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16);

  return v5(a1, v3, v4);
}

id sub_100018260()
{
  return objc_retain(*(id *)(v0
                           + OBJC_IVAR____TtC24PeopleMessagesScreenTime31ScreenTimeMessageViewController_backgroundColor));
}

uint64_t sub_100018270(uint64_t a1)
{
  uint64_t v3 = sub_10002A280();
  __chkstk_darwin(v3);
  uint64_t v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t))(v6 + 16))(v5, a1);
  return sub_1000195B8((uint64_t)v5, (uint64_t)v1);
}

uint64_t sub_100018370(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  sub_10002A9A0();
  v3[5] = sub_10002A990();
  uint64_t v5 = sub_10002A970();
  v3[6] = v5;
  v3[7] = v4;
  return _swift_task_switch(sub_10001840C, v5, v4);
}

uint64_t sub_10001840C()
{
  uint64_t v1 = (uint64_t *)(v0[4] + OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID);
  uint64_t v3 = *v1;
  uint64_t v2 = v1[1];
  v0[8] = v2;
  swift_bridgeObjectRetain();
  uint64_t v4 = (void *)swift_task_alloc();
  v0[9] = v4;
  *uint64_t v4 = v0;
  v4[1] = sub_1000184DC;
  uint64_t v5 = v0[2];
  uint64_t v6 = v0[3];
  return static ScreenTimeSupport.getCurrentStatusDetails(withDetails:forId:)(v5, v6, v3, v2);
}

uint64_t sub_1000184DC()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 80) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 48);
    uint64_t v4 = *(void *)(v2 + 56);
    uint64_t v5 = sub_10001865C;
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v2 + 48);
    uint64_t v4 = *(void *)(v2 + 56);
    uint64_t v5 = sub_1000185F8;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_1000185F8()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10001865C()
{
  swift_bridgeObjectRelease();
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

void sub_1000186CC(int64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v30 = a3;
  uint64_t v7 = sub_10002A030();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v10 = (char *)&v27 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002A060();
  sub_10002A050();
  (*(void (**)(char *, void, uint64_t))(v8 + 104))(v10, enum case for PeopleAnalytics.MessageRequestBubbleSource.screenTime(_:), v7);
  sub_10002A040();
  swift_release();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  sub_10002A020();
  int64_t v11 = a1[2];
  if (v11)
  {
    uint64_t v28 = a2;
    uint64_t v29 = v3;
    aBlock[0] = _swiftEmptyArrayStorage;
    sub_100018AC8(0, v11, 0);
    uint64_t v12 = aBlock[0];
    id v13 = a1 + 5;
    int64_t v14 = v11;
    do
    {
      uint64_t v16 = *(v13 - 1);
      uint64_t v15 = *v13;
      aBlock[0] = v12;
      unint64_t v18 = *(void *)(v12 + 16);
      unint64_t v17 = *(void *)(v12 + 24);
      swift_bridgeObjectRetain();
      if (v18 >= v17 >> 1)
      {
        sub_100018AC8(v17 > 1, v18 + 1, 1);
        uint64_t v12 = aBlock[0];
      }
      v13 += 3;
      *(void *)(v12 + 16) = v18 + 1;
      uint64_t v19 = v12 + 16 * v18;
      *(void *)(v19 + 32) = v16;
      *(void *)(v19 + 40) = v15;
      --v14;
    }
    while (v14);
    a2 = v28;
    uint64_t v4 = v29;
  }
  v20.super.Class isa = sub_10002A940().super.isa;
  swift_bridgeObjectRelease();
  if (v11)
  {
    aBlock[0] = _swiftEmptyArrayStorage;
    sub_10002AB70();
    uint64_t v21 = a1 + 6;
    do
    {
      uint64_t v22 = *v21;
      v21 += 3;
      [objc_allocWithZone((Class)NSNumber) initWithInteger:v22];
      sub_10002AB50();
      sub_10002AB80();
      sub_10002AB90();
      sub_10002AB60();
      --v11;
    }
    while (v11);
  }
  sub_1000090C8(0, &qword_10003A000);
  Class isa = sub_10002A940().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v24 = swift_allocObject();
  uint64_t v25 = v30;
  *(void *)(v24 + 16) = a2;
  *(void *)(v24 + 24) = v25;
  aBlock[4] = sub_100019C6C;
  aBlock[5] = v24;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100018A54;
  aBlock[3] = &unk_100035910;
  uint64_t v26 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  [v4 _presentAlertSheetWith:v20.super.isa styles:isa completion:v26];
  _Block_release(v26);
}

uint64_t sub_100018A54(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

uint64_t sub_100018AA8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100018AE8(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

uint64_t sub_100018AC8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_100018C74(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_100018AE8(char a1, int64_t a2, char a3, void *a4)
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
    sub_100002D88(&qword_1000399D8);
    uint64_t v10 = (void *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    v10[2] = v8;
    v10[3] = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = &_swiftEmptyArrayStorage;
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
    sub_100002D88(&qword_1000399F0);
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  uint64_t result = sub_10002ABD0();
  __break(1u);
  return result;
}

uint64_t sub_100018C74(char a1, int64_t a2, char a3, char *a4)
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
    sub_100002D88(&qword_10003A008);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)_swiftEmptyArrayStorage;
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
  uint64_t result = sub_10002ABD0();
  __break(1u);
  return result;
}

void *sub_100018DE0(void *a1, void *a2, uint64_t a3)
{
  char v100 = a1;
  uint64_t v5 = sub_10002A280();
  uint64_t v98 = *(void *)(v5 - 8);
  uint64_t v99 = v5;
  __chkstk_darwin(v5);
  uint64_t v96 = v6;
  uint64_t v97 = (char *)&v87 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_100002D88(&qword_100039F68);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v87 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_100002D88(&qword_100039F70);
  uint64_t v11 = v10 - 8;
  __chkstk_darwin(v10);
  unint64_t v13 = (char *)&v87 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100002D88(&qword_100039F78);
  uint64_t v15 = v14 - 8;
  __chkstk_darwin(v14);
  unint64_t v17 = (char *)&v87 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100002D88(&qword_100039F80);
  uint64_t v19 = v18 - 8;
  __chkstk_darwin(v18);
  uint64_t v21 = (char *)&v87 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v89 = sub_100002D88(&qword_100039F88) - 8;
  __chkstk_darwin(v89);
  char v87 = (char *)&v87 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v92 = sub_100002D88(&qword_100039F90);
  __chkstk_darwin(v92);
  uint64_t v91 = (uint64_t)&v87 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = sub_100002D88(&qword_100039F98);
  uint64_t v94 = *(void *)(v24 - 8);
  uint64_t v95 = v24;
  uint64_t v25 = __chkstk_darwin(v24);
  uint64_t v90 = (char *)&v87 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v25);
  uint64_t v93 = (char *)&v87 - v27;
  v101[3] = type metadata accessor for ScreenTimeMessageViewController();
  v101[4] = &off_100035880;
  v101[0] = a2;
  id v28 = a2;
  LOBYTE(a2) = sub_1000094D0();
  uint64_t v29 = a3 + OBJC_IVAR____TtC24PeopleMessagesScreenTime22BubbleContentContainer_details;
  *(void *)uint64_t v9 = sub_10002A4E0();
  *((void *)v9 + 1) = 0;
  v9[16] = 0;
  uint64_t v30 = (uint64_t)&v9[*(int *)(sub_100002D88(&qword_100039FA0) + 44)];
  uint64_t v31 = v100;
  char v100 = (void *)a3;
  uint64_t v88 = v29;
  sub_100014B84(v31, a3, a2 & 1, (uint64_t)v101, v30);
  uint64_t v32 = sub_10002A6D0();
  LOBYTE(a3) = sub_10002A550();
  sub_1000123DC((uint64_t)v9, (uint64_t)v13, &qword_100039F68);
  uint64_t v33 = &v13[*(int *)(v11 + 44)];
  *(void *)uint64_t v33 = v32;
  v33[8] = a3;
  sub_10000714C((uint64_t)v9, &qword_100039F68);
  LOBYTE(v32) = sub_10002A560();
  sub_10002A3A0();
  uint64_t v35 = v34;
  uint64_t v37 = v36;
  uint64_t v39 = v38;
  uint64_t v41 = v40;
  sub_1000123DC((uint64_t)v13, (uint64_t)v17, &qword_100039F70);
  uint64_t v42 = &v17[*(int *)(v15 + 44)];
  *uint64_t v42 = v32;
  *((void *)v42 + 1) = v35;
  *((void *)v42 + 2) = v37;
  *((void *)v42 + 3) = v39;
  *((void *)v42 + 4) = v41;
  v42[40] = 0;
  sub_10000714C((uint64_t)v13, &qword_100039F70);
  LOBYTE(v32) = sub_10002A590();
  sub_10002A3A0();
  uint64_t v44 = v43;
  uint64_t v46 = v45;
  uint64_t v48 = v47;
  uint64_t v50 = v49;
  sub_1000123DC((uint64_t)v17, (uint64_t)v21, &qword_100039F78);
  os_log_type_t v51 = &v21[*(int *)(v19 + 44)];
  *os_log_type_t v51 = v32;
  *((void *)v51 + 1) = v44;
  *((void *)v51 + 2) = v46;
  *((void *)v51 + 3) = v48;
  *((void *)v51 + 4) = v50;
  v51[40] = 0;
  uint64_t v52 = (uint64_t)v17;
  uint64_t v53 = (uint64_t)v87;
  sub_10000714C(v52, &qword_100039F78);
  LOBYTE(v32) = sub_10002A580();
  sub_10002A3A0();
  uint64_t v55 = v54;
  uint64_t v57 = v56;
  uint64_t v59 = v58;
  uint64_t v61 = v60;
  sub_1000123DC((uint64_t)v21, v53, &qword_100039F80);
  uint64_t v62 = v53 + *(int *)(v89 + 44);
  *(unsigned char *)uint64_t v62 = v32;
  *(void *)(v62 + 8) = v55;
  *(void *)(v62 + 16) = v57;
  *(void *)(v62 + 24) = v59;
  *(void *)(v62 + 32) = v61;
  *(unsigned char *)(v62 + 40) = 0;
  sub_10000714C((uint64_t)v21, &qword_100039F80);
  char v63 = sub_10002A570();
  if (qword_1000392D8 != -1) {
    swift_once();
  }
  sub_10002A3A0();
  uint64_t v65 = v64;
  uint64_t v67 = v66;
  uint64_t v69 = v68;
  uint64_t v71 = v70;
  uint64_t v72 = v91;
  sub_1000123DC(v53, v91, &qword_100039F88);
  uint64_t v73 = v72 + *(int *)(v92 + 36);
  *(unsigned char *)uint64_t v73 = v63;
  *(void *)(v73 + 8) = v65;
  *(void *)(v73 + 16) = v67;
  *(void *)(v73 + 24) = v69;
  *(void *)(v73 + 32) = v71;
  *(unsigned char *)(v73 + 40) = 0;
  sub_10000714C(v53, &qword_100039F88);
  uint64_t v75 = v97;
  uint64_t v74 = v98;
  uint64_t v76 = v99;
  (*(void (**)(char *, uint64_t, uint64_t))(v98 + 16))(v97, v88, v99);
  unint64_t v77 = (*(unsigned __int8 *)(v74 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v74 + 80);
  uint64_t v78 = swift_allocObject();
  *(void *)(v78 + 16) = v100;
  (*(void (**)(unint64_t, char *, uint64_t))(v74 + 32))(v78 + v77, v75, v76);
  sub_1000199E0(&qword_100039FA8, &qword_100039F90, (void (*)(void))sub_1000199B8);
  swift_retain();
  uint64_t v79 = v93;
  sub_10002A680();
  swift_release();
  sub_10000714C(v72, &qword_100039F90);
  uint64_t v81 = v94;
  uint64_t v80 = v95;
  (*(void (**)(char *, char *, uint64_t))(v94 + 16))(v90, v79, v95);
  id v82 = objc_allocWithZone((Class)sub_100002D88(&qword_100039FD8));
  char v83 = (void *)sub_10002A500();
  sub_10002A4F0();
  id v84 = [v83 view];
  if (v84)
  {
    char v85 = v84;
    sub_100002D88(&qword_100039FE0);
    if (swift_dynamicCastClass()) {
      sub_10002A3D0();
    }
  }
  (*(void (**)(char *, uint64_t))(v81 + 8))(v79, v80);
  sub_100007454((uint64_t)v101);
  return v83;
}

uint64_t sub_1000195B8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10002A280();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for ScreenTimeMessageViewController();
  void v24[3] = v8;
  v24[4] = &off_100035880;
  v24[0] = a2;
  type metadata accessor for ScreenTimeBubble();
  swift_allocObject();
  uint64_t v9 = sub_100019838((uint64_t)v24, v8);
  __chkstk_darwin(v9);
  uint64_t v11 = (void *)((char *)v21 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v12 + 16))(v11);
  uint64_t v13 = *v11;
  uint64_t v22 = v8;
  uint64_t v23 = &off_100035880;
  v21[0] = v13;
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  uint64_t v14 = sub_100009F80((uint64_t)v7);
  uint64_t v15 = *(void **)(v14 + OBJC_IVAR____TtC24PeopleMessagesScreenTime22BubbleContentContainer_image);
  uint64_t v16 = (void *)*sub_100008F24(v21, v22);
  swift_retain();
  id v17 = v15;
  uint64_t v18 = sub_100018DE0(v17, v16, v14);

  sub_100007454((uint64_t)v21);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  uint64_t v19 = *(void **)(v14 + OBJC_IVAR____TtC24PeopleMessagesScreenTime22BubbleContentContainer_contentViewController);
  *(void *)(v14 + OBJC_IVAR____TtC24PeopleMessagesScreenTime22BubbleContentContainer_contentViewController) = v18;
  swift_release();

  sub_100007454((uint64_t)v24);
  return v14;
}

uint64_t sub_100019838(uint64_t a1, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t sub_100019888()
{
  uint64_t v1 = sub_10002A280();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 24) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100019954()
{
  uint64_t v1 = *(void *)(sub_10002A280() - 8);
  uint64_t v2 = *(void *)(v0 + 16);
  uint64_t v3 = v0 + ((*(unsigned __int8 *)(v1 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v1 + 80));

  return sub_100015DA8(v2, v3);
}

uint64_t sub_1000199B8()
{
  return sub_1000199E0(&qword_100039FB0, &qword_100039F88, (void (*)(void))sub_100019A60);
}

uint64_t sub_1000199E0(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100016460(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_100019A60()
{
  return sub_1000199E0(&qword_100039FB8, &qword_100039F80, (void (*)(void))sub_100019A88);
}

uint64_t sub_100019A88()
{
  return sub_1000199E0(&qword_100039FC0, &qword_100039F78, (void (*)(void))sub_100019AB0);
}

unint64_t sub_100019AB0()
{
  unint64_t result = qword_100039FC8;
  if (!qword_100039FC8)
  {
    sub_100016460(&qword_100039F70);
    sub_100016A50(&qword_100039FD0, &qword_100039F68);
    sub_100016A50(&qword_100039E18, &qword_100039E20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100039FC8);
  }
  return result;
}

uint64_t sub_100019B74(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100002D88(&qword_100039FF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

unint64_t sub_100019BDC()
{
  unint64_t result = qword_1000399E8;
  if (!qword_1000399E8)
  {
    sub_10002A110();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000399E8);
  }
  return result;
}

uint64_t sub_100019C34()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100019C6C()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100019C94(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100019CA4()
{
  return swift_release();
}

id sub_100019CAC()
{
  uint64_t v1 = sub_100029FB0();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002A010();
  uint64_t v5 = v0;
  uint64_t v6 = sub_100029FA0();
  os_log_type_t v7 = sub_10002AA30();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v13 = v1;
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v15 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315138;
    uint64_t v12 = v8 + 4;
    uint64_t v10 = *(void *)&v5[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID];
    unint64_t v9 = *(void *)&v5[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID + 8];
    swift_bridgeObjectRetain();
    uint64_t v14 = sub_100006348(v10, v9, &v15);
    sub_10002AAD0();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "Failure balloon %s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v13);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  }
  v5[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_initialLoadError] = 1;
  return [v5 requestResize];
}

uint64_t sub_100019EE0()
{
  uint64_t v1 = v0 + OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_eventNotifier;
  swift_beginAccess();
  sub_1000123DC(v1, (uint64_t)&v8, &qword_100039FF8);
  if (*((void *)&v9 + 1))
  {
    sub_100016C44((uint64_t)&v8, (uint64_t)v5);
    sub_10000714C((uint64_t)&v8, &qword_100039FF8);
    uint64_t v2 = v6;
    uint64_t v3 = v7;
    sub_100008F24(v5, v6);
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
    sub_100007454((uint64_t)v5);
  }
  else
  {
    sub_10000714C((uint64_t)&v8, &qword_100039FF8);
  }
  uint64_t v10 = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  swift_beginAccess();
  sub_100019B74((uint64_t)&v8, v1);
  return swift_endAccess();
}

uint64_t sub_100019FE4(uint64_t a1)
{
  v2[6] = a1;
  v2[7] = v1;
  uint64_t v3 = sub_10002A980();
  v2[8] = v3;
  v2[9] = *(void *)(v3 - 8);
  v2[10] = swift_task_alloc();
  uint64_t v4 = sub_100029FB0();
  v2[11] = v4;
  v2[12] = *(void *)(v4 - 8);
  v2[13] = swift_task_alloc();
  v2[14] = swift_task_alloc();
  v2[15] = swift_task_alloc();
  v2[16] = swift_task_alloc();
  v2[17] = swift_task_alloc();
  uint64_t v5 = sub_10002A280();
  v2[18] = v5;
  v2[19] = *(void *)(v5 - 8);
  v2[20] = swift_task_alloc();
  v2[21] = swift_task_alloc();
  sub_100002D88(&qword_100039460);
  v2[22] = swift_task_alloc();
  v2[23] = swift_task_alloc();
  uint64_t v6 = sub_100029EB0();
  v2[24] = v6;
  v2[25] = *(void *)(v6 - 8);
  v2[26] = swift_task_alloc();
  uint64_t v7 = sub_100029FE0();
  v2[27] = v7;
  v2[28] = *(void *)(v7 - 8);
  v2[29] = swift_task_alloc();
  sub_10002A9A0();
  v2[30] = sub_10002A990();
  uint64_t v9 = sub_10002A970();
  v2[31] = v9;
  v2[32] = v8;
  return _swift_task_switch(sub_10001A2CC, v9, v8);
}

uint64_t sub_10001A2CC()
{
  uint64_t v2 = *(void *)(v0 + 224);
  uint64_t v1 = *(void *)(v0 + 232);
  uint64_t v3 = *(void *)(v0 + 216);
  (*(void (**)(uint64_t, void, uint64_t))(v2 + 104))(v1, enum case for PeopleURL.Parameter.requestID(_:), v3);
  uint64_t v4 = sub_10000C320(v1);
  uint64_t v6 = v5;
  *(void *)(v0 + 264) = v4;
  *(void *)(v0 + 272) = v5;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  if (!v6)
  {
    swift_release();
    sub_10002A010();
    uint64_t v11 = sub_100029FA0();
    os_log_type_t v12 = sub_10002AA40();
    if (os_log_type_enabled(v11, v12))
    {
      uint64_t v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "conversation.requestID is nil", v13, 2u);
      swift_slowDealloc();
    }
    uint64_t v14 = *(void *)(v0 + 128);
    goto LABEL_14;
  }
  id v7 = [*(id *)(v0 + 48) selectedMessage];
  if (!v7)
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 200) + 56))(*(void *)(v0 + 184), 1, 1, *(void *)(v0 + 192));
LABEL_11:
    uint64_t v19 = *(void *)(v0 + 184);
    swift_bridgeObjectRelease();
    swift_release();
    sub_10000714C(v19, &qword_100039460);
    sub_10002A010();
    uint64_t v11 = sub_100029FA0();
    os_log_type_t v20 = sub_10002AA40();
    if (os_log_type_enabled(v11, v20))
    {
      uint64_t v21 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, v20, "message url is nil", v21, 2u);
      swift_slowDealloc();
    }
    uint64_t v14 = *(void *)(v0 + 136);
LABEL_14:
    uint64_t v22 = *(void *)(v0 + 88);
    uint64_t v23 = *(void *)(v0 + 96);

    (*(void (**)(uint64_t, uint64_t))(v23 + 8))(v14, v22);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v24 = *(uint64_t (**)(void))(v0 + 8);
    return v24();
  }
  uint64_t v8 = v7;
  id v9 = [v7 URL];

  if (v9)
  {
    sub_100029E90();

    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = 1;
  }
  uint64_t v16 = *(void *)(v0 + 192);
  uint64_t v15 = *(void *)(v0 + 200);
  uint64_t v18 = *(void *)(v0 + 176);
  uint64_t v17 = *(void *)(v0 + 184);
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56))(v18, v10, 1, v16);
  sub_1000072CC(v18, v17);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v17, 1, v16) == 1) {
    goto LABEL_11;
  }
  uint64_t v26 = *(void *)(v0 + 208);
  uint64_t v27 = *(void *)(v0 + 56);
  (*(void (**)(uint64_t, void, void))(*(void *)(v0 + 200) + 32))(v26, *(void *)(v0 + 184), *(void *)(v0 + 192));
  *(void *)(v0 + 280) = *(void *)(v27
                                    + OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_messageDetailsLoader);
  uint64_t v28 = sub_10000E2FC(v26, v4, v6);
  *(void *)(v0 + 288) = v28;
  uint64_t v29 = (void *)swift_task_alloc();
  *(void *)(v0 + 296) = v29;
  uint64_t v30 = sub_100002D88(&qword_100039AF8);
  *(void *)(v0 + 304) = v30;
  *uint64_t v29 = v0;
  v29[1] = sub_10001A734;
  uint64_t v31 = *(void *)(v0 + 168);
  uint64_t v32 = *(void *)(v0 + 144);
  return Task.value.getter(v31, v28, v32, v30, &protocol self-conformance witness table for Error);
}

uint64_t sub_10001A734()
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 312) = v0;
  swift_task_dealloc();
  if (v0)
  {
    uint64_t v3 = *(void *)(v2 + 248);
    uint64_t v4 = *(void *)(v2 + 256);
    uint64_t v5 = sub_10001A9CC;
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    uint64_t v3 = *(void *)(v2 + 248);
    uint64_t v4 = *(void *)(v2 + 256);
    uint64_t v5 = sub_10001A85C;
  }
  return _swift_task_switch(v5, v3, v4);
}

uint64_t sub_10001A85C()
{
  uint64_t v1 = v0[21];
  uint64_t v2 = v0[18];
  uint64_t v3 = v0[19];
  swift_release();
  sub_10001DAB0(v1);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v1, v2);
  uint64_t v5 = v0[25];
  uint64_t v4 = v0[26];
  uint64_t v6 = v0[24];
  uint64_t v7 = (void *)v0[7];
  [v7 setReadyForDisplay];
  [v7 requestResize];
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_10001A9CC()
{
  uint64_t v40 = v0;
  uint64_t v1 = v0[39];
  swift_release();
  swift_release();
  v0[2] = v1;
  swift_errorRetain();
  if (swift_dynamicCast())
  {
    uint64_t v3 = v0[9];
    uint64_t v2 = v0[10];
    uint64_t v4 = v0[8];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
    sub_10002A010();
    uint64_t v5 = sub_100029FA0();
    os_log_type_t v6 = sub_10002AA30();
    if (os_log_type_enabled(v5, v6))
    {
      uint64_t v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "loadAndRenderBubbleIgnoringCache cancelled, no render", v7, 2u);
      swift_slowDealloc();
    }
    uint64_t v9 = v0[25];
    uint64_t v8 = v0[26];
    uint64_t v10 = v0[24];
    uint64_t v11 = v0[15];
    uint64_t v12 = v0[11];
    uint64_t v13 = v0[12];

    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v11, v12);
    (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v8, v10);
  }
  else
  {
    uint64_t v14 = (void *)v0[7];
    sub_10002A010();
    swift_errorRetain();
    swift_errorRetain();
    id v15 = v14;
    uint64_t v16 = sub_100029FA0();
    os_log_type_t v17 = sub_10002AA30();
    BOOL v18 = os_log_type_enabled(v16, v17);
    uint64_t v19 = v0[12];
    os_log_type_t v20 = (char *)v0[7];
    if (v18)
    {
      uint64_t v37 = v0[14];
      uint64_t v38 = v0[11];
      uint64_t v21 = swift_slowAlloc();
      uint64_t v36 = (void *)swift_slowAlloc();
      uint64_t v39 = swift_slowAlloc();
      *(_DWORD *)uint64_t v21 = 136315650;
      uint64_t v22 = *(void *)&v20[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID];
      unint64_t v23 = *(void *)&v20[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID + 8];
      swift_bridgeObjectRetain();
      v0[3] = sub_100006348(v22, v23, &v39);
      sub_10002AAD0();
      swift_bridgeObjectRelease();

      *(_WORD *)(v21 + 12) = 2080;
      v0[4] = sub_100006348(0xD000000000000027, 0x800000010002CA60, &v39);
      sub_10002AAD0();
      *(_WORD *)(v21 + 22) = 2112;
      swift_errorRetain();
      uint64_t v24 = _swift_stdlib_bridgeErrorToNSError();
      v0[5] = v24;
      sub_10002AAD0();
      *uint64_t v36 = v24;
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "%s  %s error loading full bubble: %@", (uint8_t *)v21, 0x20u);
      sub_100002D88(&qword_100039AE8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v37, v38);
    }
    else
    {
      uint64_t v25 = v0[14];
      uint64_t v26 = v0[11];

      swift_errorRelease();
      swift_errorRelease();

      (*(void (**)(uint64_t, uint64_t))(v19 + 8))(v25, v26);
    }
    sub_10000DC18(1, v0[20]);
    uint64_t v28 = v0[19];
    uint64_t v27 = v0[20];
    uint64_t v29 = v0[18];
    swift_bridgeObjectRelease();
    sub_10001DAB0(v27);
    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v27, v29);
    uint64_t v31 = v0[25];
    uint64_t v30 = v0[26];
    uint64_t v32 = v0[24];
    uint64_t v33 = (void *)v0[7];
    [v33 setReadyForDisplay];
    [v33 requestResize];
    (*(void (**)(uint64_t, uint64_t))(v31 + 8))(v30, v32);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v34 = (uint64_t (*)(void))v0[1];
  return v34();
}

uint64_t sub_10001B028@<X0>(void *a1@<X0>, char *a2@<X8>)
{
  uint64_t v43 = a2;
  uint64_t v3 = sub_100029FB0();
  uint64_t v41 = *(void *)(v3 - 8);
  uint64_t v42 = v3;
  uint64_t v4 = __chkstk_darwin(v3);
  os_log_type_t v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v4);
  uint64_t v40 = (char *)&v37 - v7;
  uint64_t v8 = sub_100002D88(&qword_100039460);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)&v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  uint64_t v13 = (char *)&v37 - v12;
  uint64_t v14 = sub_100029EB0();
  uint64_t v15 = *(void *)(v14 - 8);
  __chkstk_darwin(v14);
  uint64_t v39 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100029FE0();
  uint64_t v18 = *(void *)(v17 - 8);
  __chkstk_darwin(v17);
  os_log_type_t v20 = (char *)&v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, void, uint64_t))(v18 + 104))(v20, enum case for PeopleURL.Parameter.requestID(_:), v17);
  uint64_t v38 = sub_10000C320((uint64_t)v20);
  unint64_t v22 = v21;
  (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
  if (!v22)
  {
    sub_10002A010();
    uint64_t v27 = sub_100029FA0();
    os_log_type_t v28 = sub_10002AA40();
    if (os_log_type_enabled(v27, v28))
    {
      uint64_t v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v29 = 0;
      _os_log_impl((void *)&_mh_execute_header, v27, v28, "conversation.requestID is nil", v29, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v41 + 8))(v6, v42);
    goto LABEL_14;
  }
  id v23 = [a1 selectedMessage];
  if (!v23)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v13, 1, 1, v14);
LABEL_11:
    swift_bridgeObjectRelease();
    sub_10000714C((uint64_t)v13, &qword_100039460);
    uint64_t v30 = v40;
    sub_10002A010();
    uint64_t v31 = sub_100029FA0();
    os_log_type_t v32 = sub_10002AA40();
    if (os_log_type_enabled(v31, v32))
    {
      uint64_t v33 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v33 = 0;
      _os_log_impl((void *)&_mh_execute_header, v31, v32, "message url is nil", v33, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v41 + 8))(v30, v42);
LABEL_14:
    uint64_t v34 = sub_10002A280();
    return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v34 - 8) + 56))(v43, 1, 1, v34);
  }
  uint64_t v24 = v23;
  id v25 = [v23 URL];

  if (v25)
  {
    sub_100029E90();

    uint64_t v26 = 0;
  }
  else
  {
    uint64_t v26 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v15 + 56))(v11, v26, 1, v14);
  sub_1000072CC((uint64_t)v11, (uint64_t)v13);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14) == 1) {
    goto LABEL_11;
  }
  uint64_t v36 = v39;
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(v39, v13, v14);
  sub_10000CBEC(v38, v22, v43);
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(char *, uint64_t))(v15 + 8))(v36, v14);
}

uint64_t sub_10001B578(uint64_t a1, uint64_t a2)
{
  v3[3] = a2;
  v3[4] = v2;
  v3[2] = a1;
  uint64_t v4 = sub_10002A0F0();
  v3[5] = v4;
  v3[6] = *(void *)(v4 - 8);
  v3[7] = swift_task_alloc();
  sub_100002D88(&qword_100039460);
  v3[8] = swift_task_alloc();
  uint64_t v5 = sub_100029EB0();
  v3[9] = v5;
  v3[10] = *(void *)(v5 - 8);
  v3[11] = swift_task_alloc();
  sub_10002A9A0();
  v3[12] = sub_10002A990();
  uint64_t v7 = sub_10002A970();
  v3[13] = v7;
  v3[14] = v6;
  return _swift_task_switch(sub_10001B6FC, v7, v6);
}

uint64_t sub_10001B6FC()
{
  uint64_t v1 = v0[2];
  uint64_t v2 = v0[3];
  uint64_t v3 = sub_10002A280();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v3 - 8) + 16))(v1, v2, v3);
  uint64_t v4 = sub_10002A230();
  if (!v5) {
    uint64_t v4 = sub_10002A270();
  }
  uint64_t v6 = v4;
  unint64_t v7 = v5;
  v0[15] = v4;
  v0[16] = v5;
  uint64_t v8 = sub_10002A180();
  unint64_t v10 = v9;
  sub_1000124F8(v8, v9);
  if (v10 >> 60 == 15)
  {
    if (qword_1000392B8 != -1) {
      swift_once();
    }
    ImageCache.getFromCache(_:)(v6, v7);
    if (v11 >> 60 != 15) {
      sub_10002A190();
    }
  }
  uint64_t v12 = sub_10002A180();
  unint64_t v14 = v13;
  sub_1000124F8(v12, v13);
  if (v14 >> 60 != 15) {
    goto LABEL_12;
  }
  sub_10002A1A0();
  if (!v15) {
    goto LABEL_12;
  }
  uint64_t v16 = v0[9];
  uint64_t v17 = v0[10];
  uint64_t v18 = v0[8];
  sub_100029EA0();
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v17 + 48))(v18, 1, v16) == 1)
  {
    sub_10000714C(v0[8], &qword_100039460);
LABEL_12:
    uint64_t v19 = sub_10002A180();
    unint64_t v21 = v20;
    sub_1000124F8(v19, v20);
    if (v21 >> 60 == 15 && (uint64_t v22 = sub_10002A230(), (v0[20] = v23) != 0))
    {
      uint64_t v24 = v22;
      uint64_t v25 = v23;
      uint64_t v27 = v0[6];
      uint64_t v26 = v0[7];
      uint64_t v28 = v0[5];
      sub_10002A2E0();
      (*(void (**)(uint64_t, void, uint64_t))(v27 + 104))(v26, enum case for FirstPartyApps.none(_:), v28);
      uint64_t v29 = (void *)swift_task_alloc();
      v0[21] = v29;
      *uint64_t v29 = v0;
      v29[1] = sub_10001BDD4;
      uint64_t v30 = v0[7];
      return static AppBundleResolver.resolveThumbnail(_:_:)(v24, v25, v30);
    }
    else
    {
      swift_release();
      swift_bridgeObjectRelease();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      uint64_t v31 = (uint64_t (*)(void))v0[1];
      return v31();
    }
  }
  (*(void (**)(void, void, void))(v0[10] + 32))(v0[11], v0[8], v0[9]);
  os_log_type_t v32 = (void *)swift_task_alloc();
  v0[17] = v32;
  *os_log_type_t v32 = v0;
  v32[1] = sub_10001BA60;
  uint64_t v33 = v0[11];
  return sub_100020854(v33);
}

uint64_t sub_10001BA60(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  *(void *)(v4 + 144) = a1;
  *(void *)(v4 + 152) = a2;
  swift_task_dealloc();
  uint64_t v5 = *(void *)(v3 + 112);
  uint64_t v6 = *(void *)(v3 + 104);
  return _swift_task_switch(sub_10001BB88, v6, v5);
}

uint64_t sub_10001BB88()
{
  if (v0[19] >> 60 == 15)
  {
    (*(void (**)(void, void))(v0[10] + 8))(v0[11], v0[9]);
  }
  else
  {
    sub_100006694(v0[18], v0[19]);
    sub_10002A190();
    if (qword_1000392B8 != -1) {
      swift_once();
    }
    uint64_t v2 = v0[18];
    unint64_t v1 = v0[19];
    uint64_t v4 = v0[10];
    uint64_t v3 = v0[11];
    uint64_t v5 = v0[9];
    ImageCache.addToCache(_:image:)(v0[15], v0[16], v2, v1);
    sub_1000124F8(v2, v1);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  uint64_t v6 = sub_10002A180();
  unint64_t v8 = v7;
  sub_1000124F8(v6, v7);
  if (v8 >> 60 == 15 && (uint64_t v9 = sub_10002A230(), (v0[20] = v10) != 0))
  {
    uint64_t v11 = v9;
    uint64_t v12 = v10;
    uint64_t v14 = v0[6];
    uint64_t v13 = v0[7];
    uint64_t v15 = v0[5];
    sub_10002A2E0();
    (*(void (**)(uint64_t, void, uint64_t))(v14 + 104))(v13, enum case for FirstPartyApps.none(_:), v15);
    uint64_t v16 = (void *)swift_task_alloc();
    v0[21] = v16;
    *uint64_t v16 = v0;
    v16[1] = sub_10001BDD4;
    uint64_t v17 = v0[7];
    return static AppBundleResolver.resolveThumbnail(_:_:)(v11, v12, v17);
  }
  else
  {
    swift_release();
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v18 = (uint64_t (*)(void))v0[1];
    return v18();
  }
}

uint64_t sub_10001BDD4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *v2;
  uint64_t v4 = *v2;
  uint64_t v5 = *(void *)(*v2 + 56);
  uint64_t v6 = *(void *)(*v2 + 48);
  uint64_t v7 = *(void *)(*v2 + 40);
  *(void *)(v4 + 176) = a1;
  *(void *)(v4 + 184) = a2;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  uint64_t v8 = *(void *)(v3 + 112);
  uint64_t v9 = *(void *)(v3 + 104);
  return _swift_task_switch(sub_10001BF7C, v9, v8);
}

uint64_t sub_10001BF7C()
{
  unint64_t v1 = v0[23];
  swift_release();
  if (v1 >> 60 == 15)
  {
    swift_bridgeObjectRelease();
    if (qword_1000392D0 != -1) {
      swift_once();
    }
    sub_10001250C(qword_10003AAC0, *(unint64_t *)algn_10003AAC8);
    sub_10002A190();
  }
  else
  {
    sub_100006694(v0[22], v0[23]);
    if (qword_1000392B8 != -1) {
      swift_once();
    }
    uint64_t v3 = v0[22];
    unint64_t v2 = v0[23];
    ImageCache.addToCache(_:image:)(v0[15], v0[16], v3, v2);
    swift_bridgeObjectRelease();
    sub_10002A190();
    sub_1000124F8(v3, v2);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

id sub_10001C100()
{
  unint64_t v1 = v0;
  uint64_t v2 = sub_100029FB0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = *(void *)&v1[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID];
  unint64_t v6 = *(void *)&v1[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID + 8];
  swift_bridgeObjectRetain();
  sub_10002A010();
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_100029FA0();
  os_log_type_t v9 = sub_10002AA30();
  if (os_log_type_enabled(v8, v9))
  {
    uint64_t v15 = v1;
    uint64_t v10 = swift_slowAlloc();
    uint64_t v14 = v2;
    uint64_t v11 = (uint8_t *)v10;
    uint64_t v17 = swift_slowAlloc();
    *(_DWORD *)uint64_t v11 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v16 = sub_100006348(v7, v6, &v17);
    unint64_t v1 = v15;
    sub_10002AAD0();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "RequestMessageViewController deinit %s", v11, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v14);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  uint64_t v12 = (objc_class *)type metadata accessor for RequestMessageViewController();
  v18.receiver = v1;
  v18.super_class = v12;
  [super dealloc];
}

void sub_10001C3F0()
{
  if (qword_100039390 != -1) {
    swift_once();
  }
  swift_bridgeObjectRetain();
  NSString v0 = sub_10002A860();
  swift_bridgeObjectRelease();
  unint64_t v1 = (UIImage *)[self imageNamed:v0];

  if (!v1) {
    goto LABEL_7;
  }
  uint64_t v2 = UIImagePNGRepresentation(v1);

  if (!v2)
  {
    unint64_t v1 = 0;
LABEL_7:
    unint64_t v4 = 0xF000000000000000;
    goto LABEL_8;
  }
  unint64_t v1 = (UIImage *)sub_100029EE0();
  unint64_t v4 = v3;

LABEL_8:
  qword_10003AAC0 = (uint64_t)v1;
  *(void *)algn_10003AAC8 = v4;
}

double sub_10001C59C(double a1, CGFloat a2)
{
  uint64_t v5 = sub_100029FB0();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  os_log_type_t v9 = (char *)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = __chkstk_darwin(v7);
  uint64_t v12 = (char *)&v65 - v11;
  uint64_t v13 = __chkstk_darwin(v10);
  uint64_t v15 = (char *)&v65 - v14;
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v65 - v16;
  sub_10002A010();
  objc_super v18 = v2;
  uint64_t v19 = sub_100029FA0();
  os_log_type_t v20 = sub_10002AA30();
  BOOL v21 = os_log_type_enabled(v19, v20);
  uint64_t v68 = (uint64_t)v9;
  if (v21)
  {
    uint64_t v22 = swift_slowAlloc();
    uint64_t v66 = v6;
    uint64_t v67 = v5;
    uint64_t v23 = v22;
    uint64_t v70 = swift_slowAlloc();
    *(_DWORD *)uint64_t v23 = 136315906;
    uint64_t v65 = v12;
    uint64_t v24 = v15;
    uint64_t v25 = *(void *)&v18[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID];
    unint64_t v26 = *(void *)&v18[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID + 8];
    swift_bridgeObjectRetain();
    CGFloat v69 = COERCE_DOUBLE(sub_100006348(v25, v26, &v70));
    sub_10002AAD0();

    uint64_t v15 = v24;
    swift_bridgeObjectRelease();
    *(_WORD *)(v23 + 12) = 2080;
    CGFloat v69 = COERCE_DOUBLE(sub_100006348(0xD000000000000017, 0x800000010002CA40, &v70));
    sub_10002AAD0();
    *(_WORD *)(v23 + 22) = 2048;
    CGFloat v69 = a1;
    sub_10002AAD0();
    *(_WORD *)(v23 + 32) = 2048;
    CGFloat v69 = a2;
    uint64_t v12 = v65;
    sub_10002AAD0();
    _os_log_impl((void *)&_mh_execute_header, v19, v20, "%s  %s! size: %f x %f", (uint8_t *)v23, 0x2Au);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v6 = v66;
    uint64_t v5 = v67;
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v27 = *(void (**)(char *, uint64_t))(v6 + 8);
  v27(v17, v5);
  if (v18[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_initialLoadError])
  {
    if (qword_100039318 != -1) {
      swift_once();
    }
  }
  else
  {
    if (a1 <= 300.0) {
      double v28 = a1;
    }
    else {
      double v28 = 300.0;
    }
    uint64_t v29 = (CGFloat *)&v18[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_cachedSizeInfo];
    if ((v18[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_cachedSizeInfo + 32] & 1) != 0
      || (a1 = v29[2], double v30 = v29[3], v71.width = v28, v71.height = a2, !CGSizeEqualToSize(v71, *(CGSize *)v29)))
    {
      uint64_t v38 = *(void *)&v18[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_bubble];
      if (v38
        && (uint64_t v39 = *(void **)(v38
                           + OBJC_IVAR____TtC24PeopleMessagesScreenTime22BubbleContentContainer_contentViewController)) != 0
        && (id v40 = [v39 view]) != 0)
      {
        uint64_t v41 = v40;
        [v40 sizeThatFits:v28 a2];
        a1 = v42;
        double v44 = v43;
        sub_10002A010();
        uint64_t v45 = v18;
        uint64_t v46 = sub_100029FA0();
        os_log_type_t v47 = sub_10002AA30();
        if (os_log_type_enabled(v46, v47))
        {
          uint64_t v48 = swift_slowAlloc();
          uint64_t v66 = v6;
          uint64_t v49 = v48;
          uint64_t v68 = swift_slowAlloc();
          uint64_t v70 = v68;
          *(_DWORD *)uint64_t v49 = 136316162;
          uint64_t v65 = v12;
          uint64_t v67 = v5;
          uint64_t v50 = *(void *)&v45[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID];
          unint64_t v51 = *(void *)&v45[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID + 8];
          swift_bridgeObjectRetain();
          CGFloat v69 = COERCE_DOUBLE(sub_100006348(v50, v51, &v70));
          sub_10002AAD0();

          swift_bridgeObjectRelease();
          *(_WORD *)(v49 + 12) = 2048;
          CGFloat v69 = a1;
          sub_10002AAD0();
          *(_WORD *)(v49 + 22) = 2048;
          CGFloat v69 = v44;
          sub_10002AAD0();
          *(_WORD *)(v49 + 32) = 2048;
          CGFloat v69 = v28;
          sub_10002AAD0();
          *(_WORD *)(v49 + 42) = 2048;
          CGFloat v69 = a2;
          sub_10002AAD0();
          _os_log_impl((void *)&_mh_execute_header, v46, v47, " %s - contentSizeThatFits %f x %f in fitting size %f x %f", (uint8_t *)v49, 0x34u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          uint64_t v52 = v65;
          uint64_t v53 = v67;
        }
        else
        {

          uint64_t v52 = v12;
          uint64_t v53 = v5;
        }
        v27(v52, v53);
        *uint64_t v29 = v28;
        v29[1] = a2;
        v29[2] = a1;
        v29[3] = v44;
        *((unsigned char *)v29 + 32) = 0;
      }
      else
      {
        if (qword_100039320 != -1) {
          swift_once();
        }
        uint64_t v54 = qword_10003AB10;
        uint64_t v55 = v68;
        sub_10002A010();
        uint64_t v56 = v18;
        uint64_t v57 = sub_100029FA0();
        os_log_type_t v58 = sub_10002AA30();
        if (os_log_type_enabled(v57, v58))
        {
          uint64_t v59 = swift_slowAlloc();
          uint64_t v70 = swift_slowAlloc();
          *(_DWORD *)uint64_t v59 = 136315650;
          uint64_t v67 = v5;
          uint64_t v60 = *(void *)&v56[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID];
          unint64_t v61 = *(void *)&v56[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID + 8];
          swift_bridgeObjectRetain();
          CGFloat v69 = COERCE_DOUBLE(sub_100006348(v60, v61, &v70));
          sub_10002AAD0();

          swift_bridgeObjectRelease();
          *(_WORD *)(v59 + 12) = 2048;
          CGFloat v69 = v28;
          sub_10002AAD0();
          *(_WORD *)(v59 + 22) = 2048;
          CGFloat v69 = *(double *)&v54;
          sub_10002AAD0();
          _os_log_impl((void *)&_mh_execute_header, v57, v58, " %s - contentSizeThatFits using constants: %f x %f", (uint8_t *)v59, 0x20u);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();

          uint64_t v63 = v67;
          uint64_t v62 = v68;
        }
        else
        {

          uint64_t v62 = v55;
          uint64_t v63 = v5;
        }
        v27((char *)v62, v63);
        return v28;
      }
    }
    else
    {
      uint64_t v66 = v6;
      sub_10002A010();
      uint64_t v31 = v18;
      os_log_type_t v32 = sub_100029FA0();
      os_log_type_t v33 = sub_10002AA30();
      if (os_log_type_enabled(v32, v33))
      {
        uint64_t v34 = swift_slowAlloc();
        uint64_t v70 = swift_slowAlloc();
        *(_DWORD *)uint64_t v34 = 136316162;
        uint64_t v68 = (uint64_t)v15;
        uint64_t v35 = *(void *)&v31[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID];
        unint64_t v36 = *(void *)&v31[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID + 8];
        swift_bridgeObjectRetain();
        CGFloat v69 = COERCE_DOUBLE(sub_100006348(v35, v36, &v70));
        sub_10002AAD0();

        swift_bridgeObjectRelease();
        *(_WORD *)(v34 + 12) = 2048;
        CGFloat v69 = a1;
        sub_10002AAD0();
        *(_WORD *)(v34 + 22) = 2048;
        CGFloat v69 = v30;
        sub_10002AAD0();
        *(_WORD *)(v34 + 32) = 2048;
        CGFloat v69 = v28;
        sub_10002AAD0();
        *(_WORD *)(v34 + 42) = 2048;
        CGFloat v69 = a2;
        sub_10002AAD0();
        _os_log_impl((void *)&_mh_execute_header, v32, v33, " %s - contentSizeThatFits pre-sized %f x %f in fitting size %f x %f", (uint8_t *)v34, 0x34u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        uint64_t v37 = (char *)v68;
      }
      else
      {

        uint64_t v37 = v15;
      }
      v27(v37, v5);
    }
  }
  return a1;
}

void sub_10001CF74(void *a1)
{
  id v92 = a1;
  uint64_t v2 = sub_100002D88(&qword_1000394A0);
  __chkstk_darwin(v2 - 8);
  id v82 = &v78[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v4 = sub_100002D88(&qword_100039AE0);
  __chkstk_darwin(v4 - 8);
  id v84 = &v78[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v6 = sub_10002A280();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  uint64_t v81 = &v78[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v10 = __chkstk_darwin(v8);
  uint64_t v88 = &v78[-v11];
  __chkstk_darwin(v10);
  uint64_t v90 = &v78[-v12];
  uint64_t v13 = sub_100029FB0();
  uint64_t v91 = *(void *)(v13 - 8);
  uint64_t v14 = __chkstk_darwin(v13);
  uint64_t v80 = &v78[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v16 = __chkstk_darwin(v14);
  char v83 = &v78[-v17];
  uint64_t v18 = __chkstk_darwin(v16);
  char v85 = &v78[-v19];
  __chkstk_darwin(v18);
  BOOL v21 = &v78[-v20];
  sub_10002A010();
  uint64_t v22 = v1;
  uint64_t v23 = sub_100029FA0();
  os_log_type_t v24 = sub_10002AA30();
  BOOL v25 = os_log_type_enabled(v23, v24);
  uint64_t v86 = v7;
  uint64_t v87 = v6;
  uint64_t v89 = v13;
  if (v25)
  {
    uint64_t v26 = swift_slowAlloc();
    uint64_t v94 = swift_slowAlloc();
    *(_DWORD *)uint64_t v26 = 136315394;
    uint64_t v27 = *(void *)&v22[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID];
    unint64_t v28 = *(void *)&v22[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID + 8];
    swift_bridgeObjectRetain();
    uint64_t v93 = sub_100006348(v27, v28, &v94);
    sub_10002AAD0();

    uint64_t v13 = v89;
    swift_bridgeObjectRelease();
    *(_WORD *)(v26 + 12) = 2080;
    uint64_t v93 = sub_100006348(0xD000000000000017, 0x800000010002C9F0, &v94);
    uint64_t v7 = v86;
    uint64_t v6 = v87;
    sub_10002AAD0();
    _os_log_impl((void *)&_mh_execute_header, v23, v24, "%s  %s!", (uint8_t *)v26, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  uint64_t v29 = *(unsigned char **)(v91 + 8);
  ((void (*)(unsigned char *, uint64_t))v29)(v21, v13);
  double v30 = (objc_class *)type metadata accessor for RequestMessageViewController();
  v96.receiver = v22;
  v96.super_class = v30;
  id v31 = v92;
  [super willBecomeActiveWithConversation:v92];
  [v22 setNeedsSizeMatchBeforeSnapshotSwap];
  v22[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_isBubbleActive] = 1;
  os_log_type_t v32 = v84;
  sub_10001B028(v31, v84);
  int v33 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48))(v32, 1, v6);
  uint64_t v34 = v85;
  uint64_t v35 = v88;
  if (v33 == 1)
  {
    sub_10000714C((uint64_t)v32, &qword_100039AE0);
    unint64_t v36 = (void *)sub_100029FF0();
    uint64_t v37 = v80;
    sub_10002A010();
    uint64_t v94 = 0;
    unint64_t v95 = 0xE000000000000000;
    id v38 = v36;
    sub_10002AB00(37);
    uint64_t v40 = *(void *)&v22[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID];
    unint64_t v39 = *(void *)&v22[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID + 8];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    uint64_t v94 = v40;
    unint64_t v95 = v39;
    v97._countAndFlagsBits = 32;
    v97._object = (void *)0xE100000000000000;
    sub_10002A910(v97);
    v98._object = (void *)0x800000010002C9F0;
    v98._countAndFlagsBits = 0xD000000000000017;
    sub_10002A910(v98);
    v99._countAndFlagsBits = 0xD000000000000020;
    v99._object = (void *)0x800000010002CA10;
    sub_10002A910(v99);
    sub_100029F90();

    swift_bridgeObjectRelease();
    ((void (*)(unsigned char *, uint64_t))v29)(v37, v13);
    sub_100019CAC();
  }
  else
  {
    uint64_t v80 = v29;
    uint64_t v41 = v90;
    (*(void (**)(unsigned char *, char *, uint64_t))(v7 + 32))(v90, v32, v6);
    sub_10002A010();
    id v84 = *(char **)(v7 + 16);
    ((void (*)(unsigned char *, unsigned char *, uint64_t))v84)(v35, v41, v6);
    double v42 = v22;
    double v43 = sub_100029FA0();
    os_log_type_t v44 = sub_10002AA30();
    int v79 = v44;
    if (os_log_type_enabled(v43, v44))
    {
      uint64_t v45 = swift_slowAlloc();
      uint64_t v94 = swift_slowAlloc();
      *(_DWORD *)uint64_t v45 = 136315650;
      uint64_t v46 = v34;
      uint64_t v47 = *(void *)&v42[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID];
      unint64_t v48 = *(void *)&v42[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID + 8];
      swift_bridgeObjectRetain();
      uint64_t v93 = sub_100006348(v47, v48, &v94);
      sub_10002AAD0();

      swift_bridgeObjectRelease();
      *(_WORD *)(v45 + 12) = 2080;
      uint64_t v93 = sub_100006348(0xD000000000000017, 0x800000010002C9F0, &v94);
      sub_10002AAD0();
      *(_WORD *)(v45 + 22) = 2080;
      uint64_t v49 = v88;
      uint64_t v50 = sub_10002A270();
      uint64_t v93 = sub_100006348(v50, v51, &v94);
      uint64_t v52 = v86;
      uint64_t v6 = v87;
      sub_10002AAD0();
      swift_bridgeObjectRelease();
      uint64_t v53 = *(void (**)(unsigned char *, uint64_t))(v52 + 8);
      v53(v49, v6);
      _os_log_impl((void *)&_mh_execute_header, v43, (os_log_type_t)v79, "%s %s - %s loaded from cache", (uint8_t *)v45, 0x20u);
      swift_arrayDestroy();
      uint64_t v54 = v53;
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v55 = v46;
    }
    else
    {

      uint64_t v56 = v35;
      uint64_t v54 = *(void (**)(unsigned char *, uint64_t))(v7 + 8);
      v54(v56, v6);

      uint64_t v55 = v34;
    }
    uint64_t v57 = v89;
    ((void (*)(unsigned char *, uint64_t))v80)(v55, v89);
    os_log_type_t v58 = v90;
    sub_10001DAB0((uint64_t)v90);
    uint64_t v59 = v83;
    sub_10002A010();
    uint64_t v60 = v81;
    ((void (*)(unsigned char *, unsigned char *, uint64_t))v84)(v81, v58, v6);
    uint64_t v61 = v6;
    uint64_t v62 = v42;
    uint64_t v63 = sub_100029FA0();
    os_log_type_t v64 = sub_10002AA30();
    if (os_log_type_enabled(v63, v64))
    {
      uint64_t v65 = swift_slowAlloc();
      uint64_t v94 = swift_slowAlloc();
      *(_DWORD *)uint64_t v65 = 136315650;
      uint64_t v66 = *(void *)&v62[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID];
      unint64_t v67 = *(void *)&v62[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID + 8];
      swift_bridgeObjectRetain();
      uint64_t v93 = sub_100006348(v66, v67, &v94);
      sub_10002AAD0();

      swift_bridgeObjectRelease();
      *(_WORD *)(v65 + 12) = 2080;
      uint64_t v93 = sub_100006348(0xD000000000000017, 0x800000010002C9F0, &v94);
      sub_10002AAD0();
      *(_WORD *)(v65 + 22) = 2080;
      uint64_t v68 = sub_10002A270();
      uint64_t v93 = sub_100006348(v68, v69, &v94);
      sub_10002AAD0();
      swift_bridgeObjectRelease();
      uint64_t v61 = v87;
      v54(v60, v87);
      _os_log_impl((void *)&_mh_execute_header, v63, v64, "%s %s - %s loadIgnoringCache...", (uint8_t *)v65, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      uint64_t v70 = v83;
      uint64_t v71 = v89;
    }
    else
    {

      v54(v60, v61);
      uint64_t v70 = v59;
      uint64_t v71 = v57;
    }
    ((void (*)(unsigned char *, uint64_t))v80)(v70, v71);
    uint64_t v72 = sub_10002A9D0();
    uint64_t v73 = (uint64_t)v82;
    (*(void (**)(unsigned char *, uint64_t, uint64_t, uint64_t))(*(void *)(v72 - 8) + 56))(v82, 1, 1, v72);
    sub_10002A9A0();
    uint64_t v74 = v62;
    id v75 = v92;
    uint64_t v76 = sub_10002A990();
    unint64_t v77 = (void *)swift_allocObject();
    v77[2] = v76;
    v77[3] = &protocol witness table for MainActor;
    v77[4] = v74;
    v77[5] = v75;
    sub_100003CDC(v73, (uint64_t)&unk_10003A0E0, (uint64_t)v77);
    swift_release();
    v54(v90, v61);
  }
}

id sub_10001DAB0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v62 = a1;
  uint64_t v3 = sub_100029FB0();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v63 = v3;
  uint64_t v64 = v4;
  uint64_t v5 = __chkstk_darwin(v3);
  uint64_t v7 = (char *)&v59 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v5);
  uint64_t v10 = (char *)&v59 - v9;
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v59 - v11;
  uint64_t v13 = sub_100002D88(&qword_1000399C0);
  __chkstk_darwin(v13 - 8);
  uint64_t v15 = (char *)&v59 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_10002A110();
  uint64_t v17 = *(void *)(v16 - 8);
  __chkstk_darwin(v16);
  uint64_t v19 = (char *)&v59 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = sub_100002D88(&qword_100039AE0);
  __chkstk_darwin(v20 - 8);
  uint64_t v22 = (char *)&v59 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v23 = &v2[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_bubbleDelegate];
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    int v25 = v2[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_isBubbleActive];
    uint64_t v61 = Strong;
    if (v25 == 1)
    {
      uint64_t v59 = v17;
      uint64_t v26 = *((void *)v23 + 1);
      uint64_t ObjectType = swift_getObjectType();
      uint64_t v28 = v62;
      uint64_t v60 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, CGFloat, CGFloat, CGFloat, CGFloat))(v26 + 24))(v62, ObjectType, v26, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
      uint64_t v29 = *(void **)(v60 + OBJC_IVAR____TtC24PeopleMessagesScreenTime22BubbleContentContainer_contentViewController);
      if (v29)
      {
        uint64_t v30 = sub_10002A280();
        uint64_t v31 = *(void *)(v30 - 8);
        (*(void (**)(char *, uint64_t, uint64_t))(v31 + 16))(v22, v28, v30);
        (*(void (**)(char *, void, uint64_t, uint64_t))(v31 + 56))(v22, 0, 1, v30);
        id v32 = v29;
        LOBYTE(v30) = sub_1000222F8((uint64_t)v22);
        sub_10000714C((uint64_t)v22, &qword_100039AE0);
        if (v30)
        {
          sub_100019EE0();
        }
        else
        {
          uint64_t v52 = swift_unknownObjectWeakLoadStrong();
          uint64_t v53 = v62;
          if (v52)
          {
            uint64_t v54 = *((void *)v23 + 1);
            uint64_t v55 = swift_getObjectType();
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v54 + 32))(v53, v55, v54);
            swift_unknownObjectRelease();
          }
        }
        id result = [v32 view];
        if (result)
        {
          uint64_t v56 = result;
          id v57 = [self clearColor];
          [v56 setBackgroundColor:v57];

          sub_10002A150();
          uint64_t v58 = v59;
          if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v59 + 48))(v15, 1, v16) == 1)
          {
            (*(void (**)(char *, void, uint64_t))(v58 + 104))(v19, enum case for MessageDetails.EventSource.unknown(_:), v16);
            sub_10000714C((uint64_t)v15, &qword_1000399C0);
          }
          else
          {
            (*(void (**)(char *, char *, uint64_t))(v58 + 32))(v19, v15, v16);
          }
          sub_10002149C(v32);
          (*(void (**)(char *, uint64_t))(v58 + 8))(v19, v16);
          *(void *)&v2[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_bubble] = v60;
          swift_unknownObjectRelease();

          return (id)swift_release();
        }
        else
        {
          __break(1u);
        }
      }
      else
      {
        sub_10002A010();
        uint64_t v46 = v2;
        uint64_t v47 = sub_100029FA0();
        os_log_type_t v48 = sub_10002AA40();
        if (os_log_type_enabled(v47, v48))
        {
          uint64_t v49 = (uint8_t *)swift_slowAlloc();
          uint64_t v66 = swift_slowAlloc();
          *(_DWORD *)uint64_t v49 = 136315138;
          uint64_t v50 = *(void *)&v46[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID];
          unint64_t v51 = *(void *)&v46[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID + 8];
          swift_bridgeObjectRetain();
          uint64_t v65 = sub_100006348(v50, v51, &v66);
          sub_10002AAD0();

          swift_bridgeObjectRelease();
          _os_log_impl((void *)&_mh_execute_header, v47, v48, "%s - No bubble view controller!", v49, 0xCu);
          swift_arrayDestroy();
          swift_slowDealloc();
          swift_slowDealloc();
          swift_release();
          swift_unknownObjectRelease();
        }
        else
        {

          swift_unknownObjectRelease();
          swift_release();
        }
        return (id)(*(uint64_t (**)(char *, uint64_t))(v64 + 8))(v12, v63);
      }
    }
    else
    {
      sub_10002A010();
      unint64_t v39 = v2;
      uint64_t v40 = sub_100029FA0();
      os_log_type_t v41 = sub_10002AA30();
      if (os_log_type_enabled(v40, v41))
      {
        double v42 = (uint8_t *)swift_slowAlloc();
        uint64_t v66 = swift_slowAlloc();
        *(_DWORD *)double v42 = 136315138;
        uint64_t v44 = *(void *)&v39[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID];
        unint64_t v43 = *(void *)&v39[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID + 8];
        swift_bridgeObjectRetain();
        uint64_t v65 = sub_100006348(v44, v43, &v66);
        sub_10002AAD0();

        swift_bridgeObjectRelease();
        _os_log_impl((void *)&_mh_execute_header, v40, v41, "%s has been deactivated prior to render!", v42, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
        swift_unknownObjectRelease();
      }
      else
      {

        swift_unknownObjectRelease();
      }
      return (id)(*(uint64_t (**)(char *, uint64_t))(v64 + 8))(v10, v63);
    }
  }
  else
  {
    sub_10002A010();
    int v33 = v2;
    uint64_t v34 = sub_100029FA0();
    os_log_type_t v35 = sub_10002AA40();
    if (os_log_type_enabled(v34, v35))
    {
      unint64_t v36 = (uint8_t *)swift_slowAlloc();
      uint64_t v66 = swift_slowAlloc();
      *(_DWORD *)unint64_t v36 = 136315138;
      uint64_t v37 = *(void *)&v33[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID];
      unint64_t v38 = *(void *)&v33[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID + 8];
      swift_bridgeObjectRetain();
      uint64_t v65 = sub_100006348(v37, v38, &v66);
      sub_10002AAD0();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v34, v35, "%s - Missing bubble creator!", v36, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    return (id)(*(uint64_t (**)(char *, uint64_t))(v64 + 8))(v7, v63);
  }
  return result;
}

uint64_t sub_10001E398(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = sub_10002A9A0();
  void v5[3] = sub_10002A990();
  uint64_t v7 = (void *)swift_task_alloc();
  v5[4] = v7;
  void *v7 = v5;
  v7[1] = sub_10001E454;
  return sub_100019FE4(a5);
}

uint64_t sub_10001E454()
{
  swift_task_dealloc();
  uint64_t v1 = sub_10002A970();
  return _swift_task_switch(sub_10001E590, v1, v0);
}

uint64_t sub_10001E590()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_10001E658(void *a1)
{
  uint64_t v3 = sub_100029FB0();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v22 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002A010();
  id v7 = a1;
  id v8 = v1;
  id v9 = v7;
  uint64_t v10 = (char *)v8;
  uint64_t v11 = sub_100029FA0();
  os_log_type_t v12 = sub_10002AA30();
  if (os_log_type_enabled(v11, v12))
  {
    uint64_t v13 = swift_slowAlloc();
    uint64_t v23 = swift_slowAlloc();
    uint64_t v27 = v23;
    *(_DWORD *)uint64_t v13 = 136315650;
    uint64_t v24 = v3;
    uint64_t v25 = (uint64_t)a1;
    uint64_t v15 = *(void *)&v10[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID];
    unint64_t v14 = *(void *)&v10[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID + 8];
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_100006348(v15, v14, &v27);
    sub_10002AAD0();

    swift_bridgeObjectRelease();
    *(_WORD *)(v13 + 12) = 2080;
    uint64_t v26 = sub_100006348(0xD000000000000013, 0x800000010002C9B0, &v27);
    sub_10002AAD0();
    *(_WORD *)(v13 + 22) = 2080;
    uint64_t v26 = v25;
    id v16 = v9;
    sub_100002D88(&qword_10003A0D0);
    uint64_t v17 = sub_10002A8B0();
    uint64_t v26 = sub_100006348(v17, v18, &v27);
    sub_10002AAD0();

    uint64_t v19 = v25;
    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "%s  %s %s", (uint8_t *)v13, 0x20u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v24);
    if (v19) {
      return result;
    }
  }
  else
  {

    uint64_t result = (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    if (a1) {
      return result;
    }
  }
  v10[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_isBubbleActive] = 0;
  uint64_t v21 = *(void *)&v10[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_messageDetailsLoader];
  if (*(void *)(v21 + 128))
  {
    sub_10002A280();
    swift_retain();
    sub_100002D88(&qword_100039AF8);
    sub_10002A9F0();
    swift_release();
  }
  *(void *)(v21 + 128) = 0;
  swift_release();
  sub_100019EE0();
  *(void *)&v10[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_bubble] = 0;
  return swift_release();
}

uint64_t sub_10001EA54(uint64_t a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for RequestMessageViewController();
  [super willResignActiveWithConversation:a1];
  v1[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_isBubbleActive] = 0;
  uint64_t v3 = *(void *)&v1[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_messageDetailsLoader];
  if (*(void *)(v3 + 128))
  {
    sub_10002A280();
    swift_retain();
    sub_100002D88(&qword_100039AF8);
    sub_10002A9F0();
    swift_release();
  }
  *(void *)(v3 + 128) = 0;
  swift_release();
  return sub_100019EE0();
}

void sub_10001EB80(uint64_t a1)
{
  uint64_t v3 = sub_100029FB0();
  uint64_t v54 = *(void *)(v3 - 8);
  uint64_t v55 = v3;
  uint64_t v4 = __chkstk_darwin(v3);
  uint64_t v6 = &v49[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = __chkstk_darwin(v4);
  id v9 = &v49[-v8];
  __chkstk_darwin(v7);
  uint64_t v11 = &v49[-v10];
  uint64_t v12 = sub_100002D88(&qword_100039AE0);
  __chkstk_darwin(v12 - 8);
  unint64_t v14 = &v49[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v15 = sub_10002A280();
  uint64_t v16 = *(void *)(v15 - 8);
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v19 = &v49[-((v18 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v17);
  uint64_t v21 = &v49[-v20];
  uint64_t v22 = (objc_class *)type metadata accessor for RequestMessageViewController();
  v58.receiver = v1;
  v58.super_class = v22;
  [super didTransitionToPresentationStyle:a1];
  id v23 = [v1 activeConversation];
  if (v23)
  {
    uint64_t v24 = v23;
    sub_10001B028(v23, v14);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
    {
      sub_10000714C((uint64_t)v14, &qword_100039AE0);
      sub_10002A010();
      uint64_t v25 = v1;
      uint64_t v26 = sub_100029FA0();
      os_log_type_t v27 = sub_10002AA30();
      if (os_log_type_enabled(v26, v27))
      {
        uint64_t v28 = swift_slowAlloc();
        uint64_t v57 = swift_slowAlloc();
        *(_DWORD *)uint64_t v28 = 136315394;
        uint64_t v29 = *(void *)&v25[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID];
        unint64_t v30 = *(void *)&v25[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID + 8];
        swift_bridgeObjectRetain();
        uint64_t v56 = sub_100006348(v29, v30, &v57);
        sub_10002AAD0();

        swift_bridgeObjectRelease();
        *(_WORD *)(v28 + 12) = 2080;
        uint64_t v56 = sub_100006348(0xD000000000000012, 0x800000010002C990, &v57);
        sub_10002AAD0();
        _os_log_impl((void *)&_mh_execute_header, v26, v27, "%s %s - failed to load from cache", (uint8_t *)v28, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {
      }
      (*(void (**)(unsigned char *, uint64_t))(v54 + 8))(v9, v55);
      sub_100019CAC();
    }
    else
    {
      (*(void (**)(unsigned char *, char *, uint64_t))(v16 + 32))(v21, v14, v15);
      uint64_t v37 = v11;
      sub_10002A010();
      (*(void (**)(unsigned char *, unsigned char *, uint64_t))(v16 + 16))(v19, v21, v15);
      unint64_t v38 = v1;
      uint64_t v52 = v37;
      unint64_t v39 = sub_100029FA0();
      os_log_type_t v40 = sub_10002AA30();
      int v41 = v40;
      if (os_log_type_enabled(v39, v40))
      {
        uint64_t v42 = swift_slowAlloc();
        uint64_t v53 = v38;
        uint64_t v43 = v42;
        uint64_t v51 = swift_slowAlloc();
        uint64_t v57 = v51;
        *(_DWORD *)uint64_t v43 = 136315650;
        int v50 = v41;
        uint64_t v45 = *(void *)&v53[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID];
        unint64_t v44 = *(void *)&v53[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID + 8];
        swift_bridgeObjectRetain();
        uint64_t v56 = sub_100006348(v45, v44, &v57);
        sub_10002AAD0();

        swift_bridgeObjectRelease();
        *(_WORD *)(v43 + 12) = 2080;
        uint64_t v56 = sub_100006348(0xD000000000000012, 0x800000010002C990, &v57);
        sub_10002AAD0();
        *(_WORD *)(v43 + 22) = 2080;
        uint64_t v46 = sub_10002A270();
        uint64_t v56 = sub_100006348(v46, v47, &v57);
        sub_10002AAD0();
        swift_bridgeObjectRelease();
        os_log_type_t v48 = *(void (**)(unsigned char *, uint64_t))(v16 + 8);
        v48(v19, v15);
        _os_log_impl((void *)&_mh_execute_header, v39, (os_log_type_t)v50, "%s %s - %s loaded from cache", (uint8_t *)v43, 0x20u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }
      else
      {

        os_log_type_t v48 = *(void (**)(unsigned char *, uint64_t))(v16 + 8);
        v48(v19, v15);
      }

      (*(void (**)(unsigned char *, uint64_t))(v54 + 8))(v52, v55);
      sub_10001DAB0((uint64_t)v21);

      v48(v21, v15);
    }
  }
  else
  {
    sub_10002A010();
    uint64_t v31 = v1;
    id v32 = sub_100029FA0();
    os_log_type_t v33 = sub_10002AA40();
    if (os_log_type_enabled(v32, v33))
    {
      uint64_t v34 = (uint8_t *)swift_slowAlloc();
      uint64_t v57 = swift_slowAlloc();
      *(_DWORD *)uint64_t v34 = 136315138;
      uint64_t v35 = *(void *)&v31[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID];
      unint64_t v36 = *(void *)&v31[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID + 8];
      swift_bridgeObjectRetain();
      uint64_t v56 = sub_100006348(v35, v36, &v57);
      sub_10002AAD0();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v32, v33, "%s expected an active converstation, confused!", v34, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
    }
    (*(void (**)(unsigned char *, uint64_t))(v54 + 8))(v6, v55);
  }
}

id sub_10001F384(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6 = sub_100029F60();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  id v9 = (char *)&v25 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = (uint64_t *)&v3[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID];
  uint64_t v11 = v3;
  sub_100029F50();
  uint64_t v12 = sub_100029F40();
  uint64_t v14 = v13;
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  *uint64_t v10 = v12;
  v10[1] = v14;
  v11[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_isBubbleActive] = 0;
  *(void *)&v11[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_bubble] = 0;
  uint64_t v15 = &v11[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_eventNotifier];
  *(_OWORD *)uint64_t v15 = 0u;
  *((_OWORD *)v15 + 1) = 0u;
  *((void *)v15 + 4) = 0;
  *(void *)&v11[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_bubbleDelegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v11[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_initialLoadError] = 0;
  uint64_t v16 = &v11[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_cachedSizeInfo];
  *(_OWORD *)uint64_t v16 = 0u;
  *((_OWORD *)v16 + 1) = 0u;
  v16[32] = 1;
  uint64_t v17 = OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_messageDetailsLoader;
  if (qword_1000392C8 != -1) {
    swift_once();
  }
  uint64_t v19 = *(void *)(qword_10003AAA8 + 16);
  uint64_t v18 = *(void *)(qword_10003AAA8 + 24);
  uint64_t v30 = sub_10002A330();
  uint64_t v31 = &protocol witness table for MessageDetailsCache;
  *(void *)&long long v29 = v19;
  uint64_t v27 = sub_10002A350();
  uint64_t v28 = &protocol witness table for ResolvedFamilyCache;
  *(void *)&long long v26 = v18;
  type metadata accessor for MessageDetailsLoader();
  uint64_t v20 = (void *)swift_allocObject();
  v20[3] = 0;
  swift_unknownObjectWeakInit();
  v20[5] = 0;
  swift_unknownObjectWeakInit();
  v20[16] = 0;
  sub_100016D7C(&v29, (uint64_t)(v20 + 6));
  sub_100016D7C(&v26, (uint64_t)(v20 + 11));
  *(void *)&v11[v17] = v20;
  swift_retain();
  swift_retain();

  if (a2)
  {
    NSString v21 = sub_10002A860();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v21 = 0;
  }
  uint64_t v22 = (objc_class *)type metadata accessor for RequestMessageViewController();
  v25.receiver = v11;
  v25.super_class = v22;
  id v23 = [super initWithNibName:v21 bundle:a3];

  return v23;
}

id sub_10001F698(void *a1)
{
  uint64_t v3 = sub_100029F60();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (uint64_t *)&v1[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID];
  uint64_t v8 = v1;
  sub_100029F50();
  uint64_t v9 = sub_100029F40();
  uint64_t v11 = v10;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t *v7 = v9;
  v7[1] = v11;
  v8[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_isBubbleActive] = 0;
  *(void *)&v8[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_bubble] = 0;
  uint64_t v12 = &v8[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_eventNotifier];
  *(_OWORD *)uint64_t v12 = 0u;
  *((_OWORD *)v12 + 1) = 0u;
  *((void *)v12 + 4) = 0;
  *(void *)&v8[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_bubbleDelegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v8[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_initialLoadError] = 0;
  uint64_t v13 = &v8[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_cachedSizeInfo];
  *(_OWORD *)uint64_t v13 = 0u;
  *((_OWORD *)v13 + 1) = 0u;
  v13[32] = 1;
  uint64_t v14 = OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_messageDetailsLoader;
  if (qword_1000392C8 != -1) {
    swift_once();
  }
  uint64_t v16 = *(void *)(qword_10003AAA8 + 16);
  uint64_t v15 = *(void *)(qword_10003AAA8 + 24);
  uint64_t v26 = sub_10002A330();
  uint64_t v27 = &protocol witness table for MessageDetailsCache;
  *(void *)&long long v25 = v16;
  uint64_t v23 = sub_10002A350();
  uint64_t v24 = &protocol witness table for ResolvedFamilyCache;
  *(void *)&long long v22 = v15;
  type metadata accessor for MessageDetailsLoader();
  uint64_t v17 = (void *)swift_allocObject();
  v17[3] = 0;
  swift_unknownObjectWeakInit();
  v17[5] = 0;
  swift_unknownObjectWeakInit();
  v17[16] = 0;
  sub_100016D7C(&v25, (uint64_t)(v17 + 6));
  sub_100016D7C(&v22, (uint64_t)(v17 + 11));
  *(void *)&v8[v14] = v17;
  swift_retain();
  swift_retain();

  uint64_t v18 = (objc_class *)type metadata accessor for RequestMessageViewController();
  v21.receiver = v8;
  v21.super_class = v18;
  [super initWithCoder:a1];

  return v19;
}

id sub_10001F938(char a1)
{
  uint64_t v3 = sub_100029F60();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = (uint64_t *)&v1[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID];
  uint64_t v8 = v1;
  sub_100029F50();
  uint64_t v9 = sub_100029F40();
  uint64_t v11 = v10;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  uint64_t *v7 = v9;
  v7[1] = v11;
  v8[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_isBubbleActive] = 0;
  *(void *)&v8[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_bubble] = 0;
  uint64_t v12 = &v8[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_eventNotifier];
  *(_OWORD *)uint64_t v12 = 0u;
  *((_OWORD *)v12 + 1) = 0u;
  *((void *)v12 + 4) = 0;
  *(void *)&v8[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_bubbleDelegate + 8] = 0;
  swift_unknownObjectWeakInit();
  v8[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_initialLoadError] = 0;
  uint64_t v13 = &v8[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_cachedSizeInfo];
  *(_OWORD *)uint64_t v13 = 0u;
  *((_OWORD *)v13 + 1) = 0u;
  v13[32] = 1;
  uint64_t v14 = OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_messageDetailsLoader;
  if (qword_1000392C8 != -1) {
    swift_once();
  }
  uint64_t v16 = *(void *)(qword_10003AAA8 + 16);
  uint64_t v15 = *(void *)(qword_10003AAA8 + 24);
  uint64_t v25 = sub_10002A330();
  uint64_t v26 = &protocol witness table for MessageDetailsCache;
  *(void *)&long long v24 = v16;
  uint64_t v22 = sub_10002A350();
  uint64_t v23 = &protocol witness table for ResolvedFamilyCache;
  *(void *)&long long v21 = v15;
  type metadata accessor for MessageDetailsLoader();
  uint64_t v17 = (void *)swift_allocObject();
  v17[3] = 0;
  swift_unknownObjectWeakInit();
  v17[5] = 0;
  swift_unknownObjectWeakInit();
  v17[16] = 0;
  sub_100016D7C(&v24, (uint64_t)(v17 + 6));
  sub_100016D7C(&v21, (uint64_t)(v17 + 11));
  *(void *)&v8[v14] = v17;
  swift_retain();
  swift_retain();

  uint64_t v18 = (objc_class *)type metadata accessor for RequestMessageViewController();
  v20.receiver = v8;
  v20.super_class = v18;
  return [super initWithShouldBeSheetPresentationControllerDelegate:a1 & 1];
}

uint64_t type metadata accessor for RequestMessageViewController()
{
  return self;
}

uint64_t sub_10001FBF0()
{
  v1[4] = v0;
  uint64_t v2 = sub_100029FB0();
  v1[5] = v2;
  v1[6] = *(void *)(v2 - 8);
  v1[7] = swift_task_alloc();
  v1[8] = swift_task_alloc();
  sub_10002A9A0();
  v1[9] = sub_10002A990();
  uint64_t v4 = sub_10002A970();
  v1[10] = v4;
  v1[11] = v3;
  return _swift_task_switch(sub_10001FCF4, v4, v3);
}

uint64_t sub_10001FCF4()
{
  uint64_t v29 = v0;
  uint64_t v1 = *(unsigned char **)(v0 + 32);
  if (v1[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_isBubbleActive] == 1)
  {
    id v2 = [*(id *)(v0 + 32) activeConversation];
    *(void *)(v0 + 96) = v2;
    if (v2)
    {
      uint64_t v3 = (uint64_t)v2;
      uint64_t v4 = (void *)swift_task_alloc();
      *(void *)(v0 + 104) = v4;
      *uint64_t v4 = v0;
      v4[1] = sub_1000200F0;
      return sub_100019FE4(v3);
    }
    uint64_t v17 = *(void **)(v0 + 32);
    swift_release();
    sub_10002A010();
    id v18 = v17;
    uint64_t v7 = sub_100029FA0();
    os_log_type_t v19 = sub_10002AA40();
    BOOL v20 = os_log_type_enabled(v7, v19);
    uint64_t v11 = *(void *)(v0 + 64);
    uint64_t v12 = *(void *)(v0 + 40);
    uint64_t v10 = *(void *)(v0 + 48);
    long long v21 = *(char **)(v0 + 32);
    if (v20)
    {
      uint64_t v27 = *(void *)(v0 + 64);
      uint64_t v26 = *(void *)(v0 + 40);
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      uint64_t v28 = swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 136315138;
      uint64_t v24 = *(void *)&v21[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID];
      unint64_t v23 = *(void *)&v21[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID + 8];
      swift_bridgeObjectRetain();
      *(void *)(v0 + 24) = sub_100006348(v24, v23, &v28);
      sub_10002AAD0();
      swift_bridgeObjectRelease();

      _os_log_impl((void *)&_mh_execute_header, v7, v19, "%s conversation is nil", v22, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      goto LABEL_11;
    }

LABEL_13:
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v11, v12);
    goto LABEL_14;
  }
  swift_release();
  sub_10002A010();
  uint64_t v6 = v1;
  uint64_t v7 = sub_100029FA0();
  os_log_type_t v8 = sub_10002AA30();
  BOOL v9 = os_log_type_enabled(v7, v8);
  uint64_t v10 = *(void *)(v0 + 48);
  uint64_t v11 = *(void *)(v0 + 56);
  uint64_t v13 = *(char **)(v0 + 32);
  uint64_t v12 = *(void *)(v0 + 40);
  if (!v9)
  {

    goto LABEL_13;
  }
  uint64_t v27 = *(void *)(v0 + 56);
  uint64_t v14 = (uint8_t *)swift_slowAlloc();
  uint64_t v28 = swift_slowAlloc();
  *(_DWORD *)uint64_t v14 = 136315138;
  uint64_t v26 = v12;
  uint64_t v15 = *(void *)&v13[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID];
  unint64_t v16 = *(void *)&v13[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID + 8];
  swift_bridgeObjectRetain();
  *(void *)(v0 + 16) = sub_100006348(v15, v16, &v28);
  sub_10002AAD0();
  swift_bridgeObjectRelease();

  _os_log_impl((void *)&_mh_execute_header, v7, v8, "%s has been deactivated prior to notify!", v14, 0xCu);
  swift_arrayDestroy();
  swift_slowDealloc();
LABEL_11:
  swift_slowDealloc();

  (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v27, v26);
LABEL_14:
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v25 = *(uint64_t (**)(void))(v0 + 8);
  return v25();
}

uint64_t sub_1000200F0()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 88);
  uint64_t v3 = *(void *)(v1 + 80);
  return _swift_task_switch(sub_100020210, v3, v2);
}

uint64_t sub_100020210()
{
  uint64_t v1 = *(void **)(v0 + 96);
  swift_release();

  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v2 = *(uint64_t (**)(void))(v0 + 8);
  return v2();
}

uint64_t sub_100020288(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[3] = a4;
  uint64_t v5 = sub_100029FB0();
  v4[4] = v5;
  v4[5] = *(void *)(v5 - 8);
  v4[6] = swift_task_alloc();
  sub_10002A9A0();
  v4[7] = sub_10002A990();
  uint64_t v7 = sub_10002A970();
  v4[8] = v7;
  v4[9] = v6;
  return _swift_task_switch(sub_10002037C, v7, v6);
}

uint64_t sub_10002037C()
{
  uint64_t v19 = v0;
  uint64_t v1 = *(void **)(v0 + 24);
  sub_10002A010();
  id v2 = v1;
  uint64_t v3 = sub_100029FA0();
  os_log_type_t v4 = sub_10002AA30();
  if (os_log_type_enabled(v3, v4))
  {
    uint64_t v5 = *(char **)(v0 + 24);
    uint64_t v16 = *(void *)(v0 + 32);
    uint64_t v17 = *(void *)(v0 + 48);
    uint64_t v14 = v5;
    uint64_t v15 = *(void *)(v0 + 40);
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    uint64_t v7 = *(void *)&v5[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID];
    unint64_t v8 = *(void *)&v5[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID + 8];
    swift_bridgeObjectRetain();
    *(void *)(v0 + 16) = sub_100006348(v7, v8, &v18);
    sub_10002AAD0();
    swift_bridgeObjectRelease();

    _os_log_impl((void *)&_mh_execute_header, v3, v4, "%s responding to event notify)", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v17, v16);
  }
  else
  {
    uint64_t v10 = *(void *)(v0 + 40);
    uint64_t v9 = *(void *)(v0 + 48);
    uint64_t v11 = *(void *)(v0 + 32);

    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v11);
  }
  uint64_t v12 = (void *)swift_task_alloc();
  *(void *)(v0 + 80) = v12;
  *uint64_t v12 = v0;
  v12[1] = sub_1000205AC;
  return sub_10001FBF0();
}

uint64_t sub_1000205AC()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 72);
  uint64_t v3 = *(void *)(v1 + 64);
  return _swift_task_switch(sub_1000206CC, v3, v2);
}

uint64_t sub_1000206CC()
{
  swift_release();
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100020734()
{
  uint64_t v1 = sub_100002D88(&qword_1000394A0);
  __chkstk_darwin(v1 - 8);
  uint64_t v3 = (char *)&v9 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10002A9B0();
  uint64_t v4 = sub_10002A9D0();
  (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56))(v3, 0, 1, v4);
  sub_10002A9A0();
  id v5 = v0;
  uint64_t v6 = sub_10002A990();
  uint64_t v7 = (void *)swift_allocObject();
  v7[2] = v6;
  v7[3] = &protocol witness table for MainActor;
  v7[4] = v5;
  sub_100003CDC((uint64_t)v3, (uint64_t)&unk_10003A088, (uint64_t)v7);
  return swift_release();
}

uint64_t sub_100020854(uint64_t a1)
{
  v2[6] = a1;
  v2[7] = v1;
  uint64_t v3 = sub_100029FB0();
  v2[8] = v3;
  v2[9] = *(void *)(v3 - 8);
  v2[10] = swift_task_alloc();
  uint64_t v4 = sub_100029EB0();
  v2[11] = v4;
  uint64_t v5 = *(void *)(v4 - 8);
  v2[12] = v5;
  v2[13] = *(void *)(v5 + 64);
  v2[14] = swift_task_alloc();
  v2[15] = swift_task_alloc();
  sub_100002D88(&qword_1000394A0);
  v2[16] = swift_task_alloc();
  v2[17] = sub_10002A9A0();
  v2[18] = sub_10002A990();
  uint64_t v7 = sub_10002A970();
  v2[19] = v7;
  v2[20] = v6;
  return _swift_task_switch(sub_1000209F0, v7, v6);
}

uint64_t sub_1000209F0()
{
  uint64_t v43 = v0;
  if (sub_10002A090())
  {
    uint64_t v1 = v0[16];
    uint64_t v2 = v0[15];
    uint64_t v3 = v0[12];
    uint64_t v4 = v0[11];
    uint64_t v5 = v0[6];
    uint64_t v6 = (void *)v0[7];
    sub_10002A9B0();
    uint64_t v7 = sub_10002A9D0();
    (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v1, 0, 1, v7);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 16))(v2, v5, v4);
    id v8 = v6;
    uint64_t v9 = sub_10002A990();
    unint64_t v10 = (*(unsigned __int8 *)(v3 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
    uint64_t v11 = (char *)swift_allocObject();
    *((void *)v11 + 2) = v9;
    *((void *)v11 + 3) = &protocol witness table for MainActor;
    *((void *)v11 + 4) = v8;
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 32))(&v11[v10], v2, v4);
    uint64_t v12 = sub_100003E88(v1, (uint64_t)&unk_10003A100, (uint64_t)v11);
    v0[21] = v12;
    uint64_t v13 = (void *)swift_task_alloc();
    v0[22] = v13;
    uint64_t v14 = sub_100002D88(&qword_100039600);
    *uint64_t v13 = v0;
    v13[1] = sub_100020EA4;
    return Task<>.value.getter(v0 + 2, v12, v14);
  }
  else
  {
    uint64_t v15 = v0[14];
    uint64_t v16 = v0[11];
    uint64_t v17 = v0[12];
    uint64_t v18 = v0[6];
    uint64_t v19 = (void *)v0[7];
    swift_release();
    sub_10002A010();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v17 + 16))(v15, v18, v16);
    id v20 = v19;
    long long v21 = sub_100029FA0();
    os_log_type_t v22 = sub_10002AA40();
    BOOL v23 = os_log_type_enabled(v21, v22);
    uint64_t v24 = v0[14];
    uint64_t v25 = v0[12];
    uint64_t v41 = v0[11];
    uint64_t v27 = v0[9];
    uint64_t v26 = v0[10];
    uint64_t v28 = (char *)v0[7];
    uint64_t v29 = v0[8];
    if (v23)
    {
      uint64_t v40 = v0[10];
      os_log_type_t type = v22;
      uint64_t v30 = swift_slowAlloc();
      uint64_t v42 = swift_slowAlloc();
      *(_DWORD *)uint64_t v30 = 136315394;
      log = v21;
      uint64_t v39 = v29;
      uint64_t v32 = *(void *)&v28[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID];
      unint64_t v31 = *(void *)&v28[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID + 8];
      swift_bridgeObjectRetain();
      v0[4] = sub_100006348(v32, v31, &v42);
      sub_10002AAD0();
      swift_bridgeObjectRelease();

      *(_WORD *)(v30 + 12) = 2080;
      sub_100022CCC(&qword_100039630, (void (*)(uint64_t))&type metadata accessor for URL);
      uint64_t v33 = sub_10002ABF0();
      v0[5] = sub_100006348(v33, v34, &v42);
      sub_10002AAD0();
      swift_bridgeObjectRelease();
      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v41);
      _os_log_impl((void *)&_mh_execute_header, log, type, "%s - %s not in trusted list", (uint8_t *)v30, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v40, v39);
    }
    else
    {

      (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v41);
      (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v26, v29);
    }
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v35 = (uint64_t (*)(void, unint64_t))v0[1];
    return v35(0, 0xF000000000000000);
  }
}

uint64_t sub_100020EA4()
{
  uint64_t v1 = *v0;
  swift_task_dealloc();
  uint64_t v2 = *(void *)(v1 + 160);
  uint64_t v3 = *(void *)(v1 + 152);
  return _swift_task_switch(sub_100020FC4, v3, v2);
}

uint64_t sub_100020FC4()
{
  swift_release();
  swift_release();
  uint64_t v2 = v0[2];
  uint64_t v1 = v0[3];
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v3 = (uint64_t (*)(uint64_t, uint64_t))v0[1];
  return v3(v2, v1);
}

uint64_t sub_100021074(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[5] = a4;
  v5[6] = a5;
  v5[4] = a1;
  uint64_t v6 = sub_100029EB0();
  v5[7] = v6;
  v5[8] = *(void *)(v6 - 8);
  v5[9] = swift_task_alloc();
  uint64_t v7 = sub_100029FB0();
  v5[10] = v7;
  v5[11] = *(void *)(v7 - 8);
  v5[12] = swift_task_alloc();
  sub_10002A9A0();
  v5[13] = sub_10002A990();
  uint64_t v9 = sub_10002A970();
  return _swift_task_switch(sub_1000211C8, v9, v8);
}

uint64_t sub_1000211C8()
{
  uint64_t v33 = v0;
  uint64_t v2 = *(void *)(v0 + 64);
  uint64_t v1 = *(void *)(v0 + 72);
  uint64_t v4 = *(void *)(v0 + 48);
  uint64_t v3 = *(void *)(v0 + 56);
  uint64_t v5 = *(void **)(v0 + 40);
  swift_release();
  sub_10002A010();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  id v6 = v5;
  uint64_t v7 = sub_100029FA0();
  os_log_type_t v8 = sub_10002AA30();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = *(void *)(v0 + 72);
    uint64_t v30 = *(void *)(v0 + 80);
    uint64_t v31 = *(void *)(v0 + 96);
    uint64_t v10 = *(void *)(v0 + 64);
    uint64_t v28 = *(void *)(v0 + 56);
    uint64_t v29 = *(void *)(v0 + 88);
    uint64_t v11 = *(char **)(v0 + 40);
    uint64_t v12 = swift_slowAlloc();
    v32[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v12 = 136315394;
    uint64_t v14 = *(void *)&v11[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID];
    unint64_t v13 = *(void *)&v11[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID + 8];
    swift_bridgeObjectRetain();
    *(void *)(v0 + 16) = sub_100006348(v14, v13, v32);
    sub_10002AAD0();
    swift_bridgeObjectRelease();

    *(_WORD *)(v12 + 12) = 2080;
    uint64_t v15 = sub_100029E50();
    *(void *)(v0 + 24) = sub_100006348(v15, v16, v32);
    sub_10002AAD0();
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v10 + 8))(v9, v28);
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "%s - Fetching %s", (uint8_t *)v12, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v31, v30);
  }
  else
  {
    uint64_t v18 = *(void *)(v0 + 88);
    uint64_t v17 = *(void *)(v0 + 96);
    uint64_t v20 = *(void *)(v0 + 72);
    uint64_t v19 = *(void *)(v0 + 80);
    uint64_t v21 = *(void *)(v0 + 56);
    uint64_t v22 = *(void *)(v0 + 64);

    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v20, v21);
    (*(void (**)(uint64_t, uint64_t))(v18 + 8))(v17, v19);
  }
  uint64_t v23 = sub_100029EC0();
  uint64_t v24 = *(uint64_t **)(v0 + 32);
  *uint64_t v24 = v23;
  v24[1] = v25;
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v26 = *(uint64_t (**)(void))(v0 + 8);
  return v26();
}

void sub_10002149C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = (void *)sub_100029FB0();
  uint64_t v5 = (void (**)(void, void))*(v4 - 1);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v56 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = [a1 view];
  if (!v8) {
    goto LABEL_7;
  }
  uint64_t v9 = v8;
  id v10 = [v2 view];
  if (!v10)
  {

LABEL_7:
    sub_10002A010();
    uint64_t v20 = v2;
    uint64_t v21 = sub_100029FA0();
    os_log_type_t v22 = sub_10002AA40();
    if (os_log_type_enabled(v21, v22))
    {
      uint64_t v23 = swift_slowAlloc();
      id v65 = v4;
      uint64_t v24 = (uint8_t *)v23;
      unint64_t v67 = (void *)swift_slowAlloc();
      *(_DWORD *)uint64_t v24 = 136315138;
      uint64_t v63 = v24 + 4;
      uint64_t v64 = v5;
      uint64_t v25 = *(void *)&v20[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID];
      unint64_t v26 = *(void *)&v20[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID + 8];
      swift_bridgeObjectRetain();
      uint64_t v66 = sub_100006348(v25, v26, (uint64_t *)&v67);
      sub_10002AAD0();

      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v21, v22, "%s missing views", v24, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      ((void (**)(char *, id))v64)[1](v7, v65);
    }
    else
    {

      ((void (**)(char *, void *))v5)[1](v7, v4);
    }
    return;
  }
  uint64_t v11 = (void (**)(void, void))v10;
  id v12 = [v2 childViewControllers];
  sub_1000090C8(0, &qword_10003A098);
  unint64_t v13 = sub_10002A950();

  sub_1000228C0(v13);
  swift_bridgeObjectRelease();
  [v2 addChildViewController:a1];
  id v14 = [v2 view];
  if (v14)
  {
    uint64_t v15 = v14;
    unint64_t v16 = &v2[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_bubbleDelegate];
    if (swift_unknownObjectWeakLoadStrong())
    {
      uint64_t v17 = *((void *)v16 + 1);
      uint64_t ObjectType = swift_getObjectType();
      id v19 = (id)(*(uint64_t (**)(uint64_t, uint64_t))(v17 + 16))(ObjectType, v17);
      swift_unknownObjectRelease();
    }
    else
    {
      id v19 = [self redColor];
    }
    uint64_t v64 = v11;
    id v65 = a1;
    [v15 setBackgroundColor:v19];

    [v2 _balloonMaskEdgeInsets];
    uint64_t v28 = v27;
    uint64_t v30 = v29;
    uint64_t v32 = v31;
    uint64_t v34 = v33;
    id v35 = [v2 view];
    uint64_t v63 = (uint8_t *)v2;
    if (v35)
    {
      unint64_t v36 = v35;
      [v35 insertSubview:v9 atIndex:0];

      [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
      id v61 = (id)sub_100002D88(&qword_10003A0A0);
      uint64_t inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_10002BAA0;
      *(void *)(inited + 32) = 1952867692;
      *(void *)(inited + 40) = 0xE400000000000000;
      *(void *)(inited + 48) = v30;
      *(void *)(inited + 72) = &type metadata for CGFloat;
      *(void *)(inited + 80) = 0x7468676972;
      *(void *)(inited + 88) = 0xE500000000000000;
      *(void *)(inited + 96) = v34;
      *(void *)(inited + 120) = &type metadata for CGFloat;
      *(void *)(inited + 128) = 7368564;
      *(void *)(inited + 136) = 0xE300000000000000;
      *(void *)(inited + 144) = v28;
      *(void *)(inited + 168) = &type metadata for CGFloat;
      *(void *)(inited + 176) = 0x6D6F74746F62;
      *(void *)(inited + 184) = 0xE600000000000000;
      *(void *)(inited + 216) = &type metadata for CGFloat;
      *(void *)(inited + 192) = v32;
      unint64_t v62 = sub_100001FE8(inited);
      unint64_t v67 = _swiftEmptyArrayStorage;
      unint64_t v38 = self;
      id v58 = v38;
      swift_bridgeObjectRetain();
      NSString v39 = sub_10002A860();
      Class isa = sub_10002A820().super.isa;
      uint64_t v41 = swift_initStackObject();
      long long v60 = xmmword_10002B690;
      *(_OWORD *)(v41 + 16) = xmmword_10002B690;
      *(void *)(v41 + 32) = 2003134838;
      *(void *)(v41 + 40) = 0xE400000000000000;
      uint64_t v59 = sub_1000090C8(0, &qword_10003A0A8);
      *(void *)(v41 + 72) = v59;
      *(void *)(v41 + 48) = v9;
      id v57 = v9;
      sub_100001FE8(v41);
      Class v42 = sub_10002A820().super.isa;
      swift_bridgeObjectRelease();
      id v43 = [v38 constraintsWithVisualFormat:v39 options:0 metrics:isa views:v42];

      uint64_t v56 = sub_1000090C8(0, &qword_10003A0B0);
      unint64_t v44 = sub_10002A950();
      swift_bridgeObjectRelease();

      sub_100021DE0(v44);
      swift_bridgeObjectRetain();
      NSString v45 = sub_10002A860();
      Class v46 = sub_10002A820().super.isa;
      uint64_t v47 = swift_initStackObject();
      *(_OWORD *)(v47 + 16) = v60;
      *(void *)(v47 + 32) = 2003134838;
      *(void *)(v47 + 72) = v59;
      os_log_type_t v48 = v57;
      *(void *)(v47 + 40) = 0xE400000000000000;
      *(void *)(v47 + 48) = v48;
      id v61 = v48;
      sub_100001FE8(v47);
      Class v49 = sub_10002A820().super.isa;
      swift_bridgeObjectRelease();
      id v50 = [v58 constraintsWithVisualFormat:v45 options:0 metrics:v46 views:v49];

      unint64_t v51 = sub_10002A950();
      swift_bridgeObjectRelease();

      sub_100021DE0(v51);
      swift_bridgeObjectRelease();
      Class v52 = sub_10002A940().super.isa;
      swift_bridgeObjectRelease();
      id v53 = v64;
      [v64 addConstraints:v52];

      uint64_t v54 = v63;
      [v65 didMoveToParentViewController:v63];
      id v55 = v61;
      [v61 setMinimumContentSizeCategory:UIContentSizeCategorySmall];
      [v55 setMaximumContentSizeCategory:UIContentSizeCategoryAccessibilityExtraLarge];
      [(uint8_t *)v54 requestResize];

      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_100021CEC()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100021D2C(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_100007504;
  return sub_100020288(a1, v4, v5, v6);
}

uint64_t sub_100021DE0(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_10002ABB0();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!((unint64_t)*v1 >> 62))
  {
    uint64_t v4 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t v5 = v4 + v3;
    if (!__OFADD__(v4, v3)) {
      goto LABEL_5;
    }
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  swift_bridgeObjectRetain();
  uint64_t v15 = sub_10002ABB0();
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
      if (v5 <= *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
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
    uint64_t v9 = sub_10002AB30();
    swift_bridgeObjectRelease();
    *uint64_t v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_100021FAC(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_10002ABB0();
    swift_bridgeObjectRelease();
  }
  if (v11 >= 1)
  {
    uint64_t v12 = *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    BOOL v13 = __OFADD__(v12, v11);
    uint64_t v14 = v12 + v11;
    if (v13)
    {
      __break(1u);
      return result;
    }
    *(void *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
  }
  swift_bridgeObjectRelease();

  return sub_10002A960();
}

uint64_t sub_100021FAC(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_10002ABB0();
    swift_bridgeObjectRelease();
    if (!v7) {
      return a3;
    }
  }
  else
  {
    uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
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
    uint64_t v10 = sub_10002ABB0();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1000229EC();
        swift_bridgeObjectRetain();
        for (unint64_t i = 0; i != v7; ++i)
        {
          sub_100002D88(&qword_10003A0B8);
          uint64_t v12 = sub_1000221C0(v16, i, a3);
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
  uint64_t v9 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_1000090C8(0, &qword_10003A0B0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  uint64_t result = sub_10002ABD0();
  __break(1u);
  return result;
}

void (*sub_1000221C0(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(void *a1)
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_100022270(v6, a2, a3);
  return sub_100022228;
}

void sub_100022228(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_100022270(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_10002AB20();
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    id v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(void *)uint64_t v3 = v4;
    return sub_1000222F0;
  }
  __break(1u);
  return result;
}

void sub_1000222F0(id *a1)
{
}

uint64_t sub_1000222F8(uint64_t a1)
{
  uint64_t v2 = sub_100002D88(&qword_10003A0C8);
  __chkstk_darwin(v2 - 8);
  NSString v45 = (char *)&v39 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v46 = sub_100002D88(&qword_100039620);
  uint64_t v44 = *(void *)(v46 - 8);
  __chkstk_darwin(v46);
  uint64_t v41 = (char *)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_100029F30();
  uint64_t v47 = *(void *)(v5 - 8);
  uint64_t v48 = v5;
  uint64_t v6 = __chkstk_darwin(v5);
  uint64_t v40 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  id v43 = (char *)&v39 - v9;
  __chkstk_darwin(v8);
  Class v42 = (char *)&v39 - v10;
  uint64_t v11 = sub_10002A130();
  uint64_t v12 = *(void *)(v11 - 8);
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v15 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v13);
  uint64_t v17 = (char *)&v39 - v16;
  uint64_t v18 = sub_100002D88(&qword_100039AE0);
  __chkstk_darwin(v18 - 8);
  uint64_t v20 = (char *)&v39 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v21 = sub_10002A280();
  uint64_t v22 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v24 = (char *)&v39 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000123DC(a1, (uint64_t)v20, &qword_100039AE0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v20, 1, v21) == 1)
  {
    sub_10000714C((uint64_t)v20, &qword_100039AE0);
LABEL_5:
    char v27 = 1;
    return v27 & 1;
  }
  (*(void (**)(char *, char *, uint64_t))(v22 + 32))(v24, v20, v21);
  sub_10002A210();
  (*(void (**)(char *, void, uint64_t))(v12 + 104))(v15, enum case for MessageDetails.EventStatus.purged(_:), v11);
  sub_100022CCC(&qword_1000399D0, (void (*)(uint64_t))&type metadata accessor for MessageDetails.EventStatus);
  char v25 = sub_10002A850();
  unint64_t v26 = *(void (**)(char *, uint64_t))(v12 + 8);
  v26(v15, v11);
  v26(v17, v11);
  if (v25)
  {
    (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);
    goto LABEL_5;
  }
  uint64_t v28 = v42;
  sub_100029F20();
  uint64_t v29 = v43;
  sub_10002A1C0();
  uint64_t v30 = (uint64_t)v45;
  sub_10002A1E0();
  uint64_t v31 = v44;
  uint64_t v32 = v46;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v44 + 48))(v30, 1, v46) == 1)
  {
    sub_10000714C(v30, &qword_10003A0C8);
    uint64_t v34 = v47;
    uint64_t v33 = v48;
  }
  else
  {
    id v35 = v41;
    (*(void (**)(char *, uint64_t, uint64_t))(v31 + 32))(v41, v30, v32);
    unint64_t v36 = v40;
    sub_100029F10();
    (*(void (**)(char *, uint64_t))(v31 + 8))(v35, v32);
    uint64_t v34 = v47;
    uint64_t v33 = v48;
    (*(void (**)(char *, uint64_t))(v47 + 8))(v29, v48);
    (*(void (**)(char *, char *, uint64_t))(v34 + 32))(v29, v36, v33);
  }
  char v27 = sub_100029F00();
  uint64_t v37 = *(void (**)(char *, uint64_t))(v34 + 8);
  v37(v29, v33);
  v37(v28, v33);
  (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);
  return v27 & 1;
}

uint64_t sub_1000228C0(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t result = sub_10002ABB0();
    uint64_t v2 = result;
    if (!result) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    uint64_t result = swift_bridgeObjectRetain();
    if (!v2) {
      goto LABEL_10;
    }
  }
  if (v2 < 1)
  {
    __break(1u);
    return result;
  }
  uint64_t v4 = 0;
  do
  {
    if ((a1 & 0xC000000000000001) != 0) {
      id v5 = (id)sub_10002AB20();
    }
    else {
      id v5 = *(id *)(a1 + 8 * v4 + 32);
    }
    uint64_t v6 = v5;
    ++v4;
    [v5 willMoveToParentViewController:0];
    id v7 = [v6 view];
    [v7 removeFromSuperview];

    [v6 removeFromParentViewController];
  }
  while (v2 != v4);
LABEL_10:

  return swift_bridgeObjectRelease();
}

unint64_t sub_1000229EC()
{
  unint64_t result = qword_10003A0C0;
  if (!qword_10003A0C0)
  {
    sub_100016460(&qword_10003A0B8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003A0C0);
  }
  return result;
}

uint64_t sub_100022A48()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100022A90(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_100007504;
  return sub_10001E398(a1, v4, v5, v7, v6);
}

uint64_t sub_100022B50(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100029FE0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = (objc_class *)type metadata accessor for RequestMessageViewController();
  v16.receiver = v2;
  v16.super_class = v8;
  [super setActiveConversation:a1];
  id v9 = [v2 activeConversation];
  if (!v9
    || (uint64_t v10 = v9,
        (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for PeopleURL.Parameter.requestID(_:), v4), v11 = sub_10000C320((uint64_t)v7), unint64_t v13 = v12, (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4), v10, !v13))
  {
    swift_bridgeObjectRelease();
    uint64_t v11 = 0;
    unint64_t v13 = 0xE000000000000000;
  }
  uint64_t v14 = (uint64_t *)&v2[OBJC_IVAR____TtC24PeopleMessagesScreenTime28RequestMessageViewController_uniqueID];
  uint64_t *v14 = v11;
  v14[1] = v13;
  return swift_bridgeObjectRelease();
}

uint64_t sub_100022CCC(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100022D14()
{
  uint64_t v1 = sub_100029EB0();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  swift_unknownObjectRelease();

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100022DE8(uint64_t a1)
{
  uint64_t v4 = *(void *)(sub_100029EB0() - 8);
  uint64_t v5 = v1[2];
  uint64_t v6 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v8 = (uint64_t)v1 + ((*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80));
  id v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *id v9 = v2;
  v9[1] = sub_1000065A0;
  return sub_100021074(a1, v5, v6, v7, v8);
}

ValueMetadata *type metadata accessor for SharedConstants()
{
  return &type metadata for SharedConstants;
}

void sub_100022EF4()
{
  id v0 = [self currentDevice];
  id v1 = [v0 userInterfaceIdiom];

  byte_10003A108 = v1 == (id)5;
}

void sub_100022F58()
{
  qword_10003AAD0 = 0x4010000000000000;
}

void sub_100022F68()
{
  qword_10003AAD8 = 0x4034000000000000;
}

void sub_100022F78()
{
  qword_10003AAE0 = 0x4014000000000000;
}

void sub_100022F88()
{
  qword_10003AAE8 = 0x4018000000000000;
}

uint64_t sub_100022F98()
{
  uint64_t result = sub_10002A5A0();
  qword_10003AAF0 = result;
  return result;
}

void sub_100022FB8()
{
  qword_10003AAF8 = 0x4028000000000000;
}

uint64_t sub_100022FC8()
{
  if (qword_1000392D8 != -1) {
    uint64_t result = swift_once();
  }
  double v0 = 28.0;
  if (byte_10003A108) {
    double v0 = 22.0;
  }
  qword_10003AB00 = *(void *)&v0;
  return result;
}

void sub_10002302C()
{
  qword_10003AB08 = 0x4049000000000000;
}

void sub_10002303C()
{
  qword_10003AB10 = 0x4062C00000000000;
}

uint64_t sub_100023050(uint64_t a1)
{
  return sub_100023190(a1, (SEL *)&selRef_labelColor, &qword_10003AB18);
}

uint64_t sub_100023064(uint64_t a1)
{
  return sub_100023190(a1, (SEL *)&selRef_secondaryLabelColor, &qword_10003AB20);
}

uint64_t sub_100023078(uint64_t a1)
{
  return sub_100023190(a1, (SEL *)&selRef_opaqueSeparatorColor, &qword_10003AB28);
}

uint64_t sub_10002308C()
{
  qword_10003AB30 = sub_10002A800();
  uint64_t result = sub_10002A810();
  qword_10003AB38 = result;
  return result;
}

void sub_1000230C0()
{
  qword_10003A110 = 0x4046800000000000;
}

uint64_t sub_1000230D4()
{
  if (qword_1000392D8 != -1) {
    uint64_t result = swift_once();
  }
  double v0 = 60.0;
  if (byte_10003A108) {
    double v0 = 48.0;
  }
  qword_10003AB40 = *(void *)&v0;
  return result;
}

id sub_100023140()
{
  id result = [self systemGray5Color];
  qword_10003AB48 = (uint64_t)result;
  return result;
}

uint64_t sub_10002317C(uint64_t a1)
{
  return sub_100023190(a1, (SEL *)&selRef_systemGray5Color, &qword_10003AB50);
}

uint64_t sub_100023190(uint64_t a1, SEL *a2, uint64_t *a3)
{
  id v4 = [self *a2];
  uint64_t result = sub_10002A6B0();
  *a3 = result;
  return result;
}

void sub_1000231D8()
{
  qword_10003AB58 = 0x65726F7473707061;
  unk_10003AB60 = 0xE800000000000000;
}

void sub_1000231FC()
{
  qword_10003AB68 = 0x6C69662E6B6F6F62;
  unk_10003AB70 = 0xE90000000000006CLL;
}

void sub_100023224()
{
  qword_10003AB78 = 0x6C69662E72617473;
  unk_10003AB80 = 0xE90000000000006CLL;
}

void sub_10002324C()
{
  qword_10003AB88 = 0x73616C6772756F68;
  unk_10003AB90 = 0xE900000000000073;
}

void sub_100023274()
{
  unk_10003ABA5 = 0;
  unk_10003ABA6 = -5120;
}

void sub_1000232A0()
{
  unk_10003ABB6 = -4864;
}

uint64_t sub_1000232D0()
{
  sub_100002D88(&qword_10003A008);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_10002BB20;
  if (qword_100039368 != -1) {
    swift_once();
  }
  uint64_t v1 = unk_10003AB60;
  *(void *)(v0 + 32) = qword_10003AB58;
  *(void *)(v0 + 40) = v1;
  uint64_t v2 = qword_100039370;
  swift_bridgeObjectRetain();
  if (v2 != -1) {
    swift_once();
  }
  uint64_t v3 = unk_10003AB70;
  *(void *)(v0 + 48) = qword_10003AB68;
  *(void *)(v0 + 56) = v3;
  uint64_t v4 = qword_100039378;
  swift_bridgeObjectRetain();
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v5 = unk_10003AB80;
  *(void *)(v0 + 64) = qword_10003AB78;
  *(void *)(v0 + 72) = v5;
  qword_10003ABB8 = v0;

  return swift_bridgeObjectRetain();
}

uint64_t sub_1000233F4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = a3[2];
  if (!v3) {
    return 0;
  }
  if (a3[4] == a1 && a3[5] == a2) {
    return 1;
  }
  uint64_t result = sub_10002AC00();
  if (result) {
    return 1;
  }
  if (v3 == 1) {
    return 0;
  }
  id v9 = a3 + 7;
  for (uint64_t i = 1; ; ++i)
  {
    uint64_t v11 = i + 1;
    if (__OFADD__(i, 1)) {
      break;
    }
    BOOL v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_10002AC00() & 1) != 0) {
      return 1;
    }
    uint64_t result = 0;
    v9 += 2;
    if (v11 == v3) {
      return result;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1000234BC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X6>, uint64_t a6@<X7>, uint64_t a7@<X8>, uint64_t a8)
{
  uint64_t v68 = a4;
  uint64_t v71 = a7;
  uint64_t v72 = sub_10002A740();
  uint64_t v70 = *(void *)(v72 - 8);
  __chkstk_darwin(v72);
  unint64_t v69 = (char *)&v60 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v65 = sub_100002D88(&qword_100039E30);
  __chkstk_darwin(v65);
  uint64_t v66 = (uint64_t)&v60 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v63 = sub_10002A3E0();
  __chkstk_darwin(v63);
  objc_super v16 = (_OWORD *)((char *)&v60 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v64 = sub_100002D88(&qword_100039DC0);
  __chkstk_darwin(v64);
  unint64_t v67 = (char *)&v60 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_10002A4B0();
  sub_100023A1C(a1, a2, a3, a5, a6, a8, v84);
  int v61 = sub_10002A560();
  if (qword_1000392D8 != -1) {
    swift_once();
  }
  sub_10002A3A0();
  uint64_t v19 = v18;
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  int v60 = sub_10002A570();
  v73[632] = 0;
  memcpy(&v73[7], v84, 0x270uLL);
  char v74 = 0;
  sub_10002A3A0();
  uint64_t v27 = v26;
  uint64_t v29 = v28;
  uint64_t v31 = v30;
  uint64_t v33 = v32;
  char v34 = v74;
  char v75 = 0;
  sub_10002A7B0();
  sub_10002A3B0();
  uint64_t v35 = v78[101];
  uint64_t v36 = v80;
  uint64_t v37 = v82;
  uint64_t v38 = v83;
  char v39 = v75;
  char v77 = v79;
  char v76 = v81;
  char v40 = sub_10002A550();
  v78[0] = v62;
  v78[1] = 0;
  LOBYTE(v78[2]) = 0;
  memcpy((char *)&v78[2] + 1, v73, 0x277uLL);
  LOBYTE(v78[81]) = v61;
  v78[82] = v19;
  v78[83] = v21;
  v78[84] = v23;
  v78[85] = v25;
  LOBYTE(v78[86]) = v34;
  LOBYTE(v78[87]) = v60;
  v78[88] = v27;
  v78[89] = v29;
  v78[90] = v31;
  v78[91] = v33;
  LOBYTE(v78[92]) = v39;
  v78[93] = v35;
  LOBYTE(v78[94]) = v77;
  v78[95] = v36;
  LOBYTE(v78[96]) = v76;
  v78[97] = v37;
  v78[98] = v38;
  v78[99] = v68;
  LOBYTE(v78[100]) = v40;
  uint64_t v41 = (char *)v16 + *(int *)(v63 + 20);
  uint64_t v42 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v43 = sub_10002A4C0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v43 - 8) + 104))(v41, v42, v43);
  __asm { FMOV            V0.2D, #10.0 }
  *objc_super v16 = _Q0;
  uint64_t v49 = v66;
  sub_100024130((uint64_t)v16, v66);
  *(_WORD *)(v49 + *(int *)(v65 + 36)) = 256;
  id v50 = v67;
  sub_1000123DC(v49, (uint64_t)&v67[*(int *)(v64 + 36)], &qword_100039E30);
  memcpy(v50, v78, 0x321uLL);
  swift_retain();
  sub_100024194((uint64_t)v78);
  sub_10000714C(v49, &qword_100039E30);
  sub_10002436C((uint64_t)v16);
  sub_1000243C8((uint64_t)v78);
  Class v52 = v69;
  uint64_t v51 = v70;
  uint64_t v53 = v72;
  (*(void (**)(char *, void, uint64_t))(v70 + 104))(v69, enum case for Image.Scale.small(_:), v72);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v55 = sub_100002D88(&qword_100039DA0);
  uint64_t v56 = v71;
  id v57 = (uint64_t *)(v71 + *(int *)(v55 + 36));
  uint64_t v58 = sub_100002D88(&qword_100039E40);
  (*(void (**)(char *, char *, uint64_t))(v51 + 16))((char *)v57 + *(int *)(v58 + 28), v52, v53);
  *id v57 = KeyPath;
  sub_1000123DC((uint64_t)v50, v56, &qword_100039DC0);
  (*(void (**)(char *, uint64_t))(v51 + 8))(v52, v53);
  return sub_10000714C((uint64_t)v50, &qword_100039DC0);
}

uint64_t sub_100023A1C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X5>, uint64_t a5@<X6>, uint64_t a6@<X7>, void *a7@<X8>)
{
  if (qword_100039308 != -1) {
    swift_once();
  }
  uint64_t v43 = a4;
  double v11 = *(double *)&qword_10003AAF8;
  uint64_t v12 = sub_10002A7B0();
  sub_1000135E8(0.0, 1, 0.0, 1, v11, 0, 0.0, 1, (uint64_t)v97, 0.0, 1, 0.0, 1, v12, v13, 0, 1);
  *(void *)&__src[0] = a1;
  *((void *)&__src[0] + 1) = a2;
  sub_100016BD8();
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_10002A640();
  uint64_t v16 = v15;
  char v18 = v17;
  uint64_t v48 = v19;
  uint64_t KeyPath = swift_getKeyPath();
  if (qword_100039300 != -1) {
    swift_once();
  }
  uint64_t v21 = qword_10003AAF0;
  uint64_t v46 = swift_getKeyPath();
  uint64_t v22 = swift_getKeyPath();
  swift_retain();
  swift_retain();
  uint64_t v83 = v14;
  uint64_t v84 = v16;
  char v23 = v18 & 1;
  char v85 = v23;
  uint64_t v86 = v48;
  uint64_t v87 = KeyPath;
  uint64_t v88 = 1;
  char v89 = 0;
  uint64_t v90 = v46;
  uint64_t v91 = v21;
  uint64_t v92 = v22;
  uint64_t v93 = a3;
  uint64_t v94 = sub_10002A6D0();
  char v95 = sub_10002A550();
  sub_100013794(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)__src, 0.0, 1, 0.0, 1);
  sub_100024504(v14, v16, v23);
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  long long v108 = __src[10];
  long long v109 = __src[11];
  long long v110 = __src[12];
  long long v104 = __src[6];
  long long v105 = __src[7];
  long long v106 = __src[8];
  long long v107 = __src[9];
  long long v100 = __src[2];
  long long v101 = __src[3];
  long long v102 = __src[4];
  long long v103 = __src[5];
  long long v98 = __src[0];
  uint64_t v111 = *(void *)&__src[13];
  long long v99 = __src[1];
  if (a5 && a6)
  {
    uint64_t v24 = qword_100039398;
    swift_retain();
    if (v24 != -1) {
      swift_once();
    }
    char v25 = sub_1000233F4(v43, a5, (void *)qword_10003ABB8);
    swift_bridgeObjectRetain();
    if (v25) {
      sub_10002A730();
    }
    else {
      sub_10002A710();
    }
    uint64_t v26 = sub_10002A650();
    uint64_t v51 = v27;
    uint64_t v53 = v26;
    char v47 = v28;
    uint64_t v50 = v29;
    uint64_t v49 = swift_getKeyPath();
    uint64_t v30 = qword_10003AAF0;
    uint64_t v45 = swift_getKeyPath();
    uint64_t v44 = swift_getKeyPath();
    swift_retain();
    swift_retain();
    uint64_t v42 = sub_10002A6D0();
    char v31 = sub_10002A550();
    sub_10002A7D0();
    sub_10002A3B0();
    uint64_t v32 = v77;
    char v33 = v78;
    uint64_t v34 = v79;
    char v35 = v80;
    uint64_t v36 = v81;
    uint64_t v37 = v82;
    swift_release();
    LOBYTE(v75[0]) = v47 & 1;
    LOBYTE(v57) = 0;
    LOBYTE(v74[0]) = v33;
    LOBYTE(v71[0]) = v35;
    *(void *)&__src[0] = v53;
    *((void *)&__src[0] + 1) = v51;
    LOBYTE(__src[1]) = v47 & 1;
    *((void *)&__src[1] + 1) = v50;
    *(void *)&void __src[2] = v49;
    *((void *)&__src[2] + 1) = 1;
    LOBYTE(__src[3]) = 0;
    *((void *)&__src[3] + 1) = v45;
    *(void *)&__src[4] = v30;
    *((void *)&__src[4] + 1) = v44;
    *(void *)&__src[5] = a6;
    *((void *)&__src[5] + 1) = v42;
    LOBYTE(__src[6]) = v31;
    *((void *)&__src[6] + 1) = v32;
    LOBYTE(__src[7]) = v33;
    *((void *)&__src[7] + 1) = v34;
    LOBYTE(__src[8]) = v35;
    *((void *)&__src[8] + 1) = v36;
    *(void *)&__src[9] = v37;
    nullsub_1(__src);
  }
  else
  {
    sub_100027600((uint64_t)__src);
  }
  sub_100012440((uint64_t)__src, (uint64_t)v96, &qword_10003A118);
  double v38 = *(double *)&qword_10003AAF8;
  uint64_t v39 = sub_10002A7B0();
  sub_1000135E8(0.0, 1, 0.0, 1, v38, 0, 0.0, 1, (uint64_t)v72, 0.0, 1, 0.0, 1, v39, v40, 0, 1);
  sub_100012440((uint64_t)v96, (uint64_t)v56, &qword_10003A118);
  long long v67 = v108;
  long long v68 = v109;
  long long v69 = v110;
  uint64_t v70 = v111;
  long long v63 = v104;
  long long v64 = v105;
  long long v65 = v106;
  long long v66 = v107;
  long long v59 = v100;
  long long v60 = v101;
  long long v61 = v102;
  long long v62 = v103;
  long long v57 = v98;
  long long v58 = v99;
  sub_100012440((uint64_t)v56, (uint64_t)v71, &qword_10003A118);
  __src[4] = v97[4];
  __src[5] = v97[5];
  __src[6] = v97[6];
  __src[7] = v97[7];
  __src[0] = v97[0];
  __src[1] = v97[1];
  void __src[2] = v97[2];
  __src[3] = v97[3];
  __src[18] = v67;
  __src[19] = v68;
  __src[20] = v69;
  *(void *)&__src[21] = v70;
  __src[14] = v63;
  __src[15] = v64;
  __src[16] = v65;
  __src[17] = v66;
  __src[10] = v59;
  __src[11] = v60;
  __src[12] = v61;
  __src[13] = v62;
  __src[8] = v57;
  __src[9] = v58;
  sub_100012440((uint64_t)v71, (uint64_t)&__src[21] + 8, &qword_10003A118);
  __src[35] = v72[4];
  __src[36] = v72[5];
  __src[37] = v72[6];
  __src[38] = v72[7];
  __src[31] = v72[0];
  __src[32] = v72[1];
  __src[33] = v72[2];
  __src[34] = v72[3];
  memcpy(a7, __src, 0x270uLL);
  sub_100012440((uint64_t)v56, (uint64_t)v74, &qword_10003A118);
  sub_100016A94((uint64_t)&v57);
  sub_100027620(v71, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_1000242D0);
  sub_100027620(v74, (void (*)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))sub_100024514);
  v75[10] = v108;
  v75[11] = v109;
  v75[12] = v110;
  uint64_t v76 = v111;
  v75[6] = v104;
  v75[7] = v105;
  v75[8] = v106;
  v75[9] = v107;
  v75[2] = v100;
  v75[3] = v101;
  v75[4] = v102;
  v75[5] = v103;
  v75[0] = v98;
  v75[1] = v99;
  return sub_10002768C((uint64_t)v75);
}

uint64_t sub_100024130(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_10002A3E0();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100024194(uint64_t a1)
{
  uint64_t v5 = *(void *)(a1 + 376);
  uint64_t v6 = *(void *)(a1 + 368);
  uint64_t v3 = *(void *)(a1 + 392);
  uint64_t v4 = *(void *)(a1 + 384);
  sub_100016B28(*(void *)(a1 + 152), *(void *)(a1 + 160), *(unsigned char *)(a1 + 168));
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_1000242D0(v6, v5, v4, v3);
  swift_retain();
  return a1;
}

uint64_t sub_1000242D0(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_100016B28(result, a2, a3 & 1);
    swift_retain();
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    swift_retain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_10002436C(uint64_t a1)
{
  uint64_t v2 = sub_10002A3E0();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000243C8(uint64_t a1)
{
  uint64_t v5 = *(void *)(a1 + 376);
  uint64_t v6 = *(void *)(a1 + 368);
  uint64_t v3 = *(void *)(a1 + 392);
  uint64_t v4 = *(void *)(a1 + 384);
  sub_100024504(*(void *)(a1 + 152), *(void *)(a1 + 160), *(unsigned char *)(a1 + 168));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_100024514(v6, v5, v4, v3);
  swift_release();
  return a1;
}

uint64_t sub_100024504(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_100024514(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_100024504(result, a2, a3 & 1);
    swift_release();
    swift_release();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    swift_release();
    return swift_release();
  }
  return result;
}

void sub_1000245B0(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void))(a1 + 32);
  id v3 = a2;
  v2();
}

uint64_t sub_1000245FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_10002A6C0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v24[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1000392D8 != -1) {
    swift_once();
  }
  int v8 = byte_10003A108;
  int v9 = byte_10003A108;
  if (qword_1000392F0 != -1)
  {
    swift_once();
    int v9 = byte_10003A108;
  }
  double v10 = *(double *)&qword_10003AAE0;
  if (*(unsigned char *)(v2 + 64))
  {
    if (v9) {
      double v12 = 8.0;
    }
    else {
      double v12 = 15.0;
    }
    if (v9) {
      double v11 = 24.0;
    }
    else {
      double v11 = 30.0;
    }
  }
  else
  {
    if (v9) {
      double v11 = 36.0;
    }
    else {
      double v11 = 45.0;
    }
    if (qword_1000392E0 != -1) {
      swift_once();
    }
    double v12 = *(double *)&qword_10003AAD0;
  }
  double v13 = v11 - v10;
  double v14 = 30.0;
  if (v8) {
    double v14 = 24.0;
  }
  double v15 = v14 - v10;
  (*(void (**)(char *, void, uint64_t))(v5 + 104))(v7, enum case for Color.RGBColorSpace.sRGBLinear(_:), v4);
  uint64_t v16 = sub_10002A6F0();
  sub_100002D88(&qword_10003A208);
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_10002B7B0;
  uint64_t v18 = *(void *)(v2 + 40);
  *(void *)(v17 + 32) = *(void *)(v2 + 32);
  *(void *)(v17 + 40) = v18;
  v24[0] = v17;
  sub_10002A960();
  swift_retain();
  swift_retain();
  sub_10002A770();
  sub_10002A7F0();
  sub_10002A7E0();
  sub_10002A3C0();
  *(void *)a1 = sub_10002A4B0();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  uint64_t v19 = (uint64_t *)(a1 + *(int *)(sub_100002D88(&qword_10003A210) + 44));
  uint64_t *v19 = sub_10002A7B0();
  v19[1] = v20;
  uint64_t v21 = sub_100002D88(&qword_10003A218);
  sub_100024908((id *)v2, v24, v16, (char *)v19 + *(int *)(v21 + 44), v12, v15, v13);
  sub_1000288EC((uint64_t)v24);
  return swift_release();
}

uint64_t sub_100024908@<X0>(id *a1@<X0>, uint64_t *a2@<X1>, uint64_t a3@<X2>, char *a4@<X8>, double a5@<D0>, double a6@<D1>, double a7@<D2>)
{
  uint64_t v80 = a3;
  uint64_t v79 = a2;
  long long v100 = a4;
  uint64_t v11 = sub_100002D88(&qword_10003A220);
  __chkstk_darwin(v11 - 8);
  uint64_t v81 = (uint64_t *)((char *)&v78 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v98 = sub_100002D88(&qword_10003A228);
  uint64_t v96 = *(void *)(v98 - 8);
  __chkstk_darwin(v98);
  uint64_t v78 = (uint64_t)&v78 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_100002D88(&qword_10003A230);
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  uint64_t v99 = (uint64_t)&v78 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  uint64_t v97 = (uint64_t)&v78 - v17;
  uint64_t v88 = sub_100002D88(&qword_100039E30);
  __chkstk_darwin(v88);
  uint64_t v89 = (uint64_t)&v78 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = sub_10002A3E0();
  __chkstk_darwin(v19);
  char v85 = (double *)((char *)&v78 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v21 = sub_10002A720();
  uint64_t v22 = *(void *)(v21 - 8);
  __chkstk_darwin(v21);
  uint64_t v24 = (char *)&v78 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v84 = sub_100002D88(&qword_10003A238);
  __chkstk_darwin(v84);
  uint64_t v26 = (char *)&v78 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v91 = sub_100002D88(&qword_10003A240);
  __chkstk_darwin(v91);
  uint64_t v90 = (uint64_t)&v78 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v28 = sub_100002D88(&qword_10003A248);
  uint64_t v92 = *(void *)(v28 - 8);
  uint64_t v93 = v28;
  uint64_t v29 = __chkstk_darwin(v28);
  uint64_t v94 = (char *)&v78 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v31 = __chkstk_darwin(v29);
  uint64_t v86 = (char *)&v78 - v32;
  __chkstk_darwin(v31);
  uint64_t v87 = (char *)&v78 - v33;
  id v34 = *a1;
  sub_10002A700();
  (*(void (**)(char *, void, uint64_t))(v22 + 104))(v24, enum case for Image.ResizingMode.stretch(_:), v21);
  uint64_t v83 = sub_10002A750();
  swift_release();
  (*(void (**)(char *, uint64_t))(v22 + 8))(v24, v21);
  if (qword_1000392D8 != -1) {
    swift_once();
  }
  sub_10002A7B0();
  sub_10002A3B0();
  uint64_t v35 = v101;
  char v36 = v102;
  uint64_t v82 = v103;
  char v37 = v104;
  char v95 = a1;
  uint64_t v39 = v105;
  uint64_t v38 = v106;
  uint64_t v40 = *(int *)(v19 + 20);
  uint64_t v41 = v85;
  uint64_t v42 = (char *)v85 + v40;
  uint64_t v43 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v44 = sub_10002A4C0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v44 - 8) + 104))(v42, v43, v44);
  double *v41 = a5;
  v41[1] = a5;
  uint64_t v45 = v89;
  sub_100024130((uint64_t)v41, v89);
  *(_WORD *)(v45 + *(int *)(v88 + 36)) = 256;
  sub_1000123DC(v45, (uint64_t)&v26[*(int *)(v84 + 36)], &qword_100039E30);
  *(void *)uint64_t v26 = v83;
  *((void *)v26 + 1) = 0;
  *((_WORD *)v26 + 8) = 1;
  *((void *)v26 + 3) = v35;
  v26[32] = v36;
  *((void *)v26 + 5) = v82;
  v26[48] = v37;
  *((void *)v26 + 7) = v39;
  *((void *)v26 + 8) = v38;
  swift_retain();
  sub_10000714C(v45, &qword_100039E30);
  sub_10002436C((uint64_t)v41);
  swift_release();
  uint64_t v46 = sub_10002A6D0();
  LOBYTE(v35) = sub_10002A550();
  uint64_t v47 = v90;
  sub_1000123DC((uint64_t)v26, v90, &qword_10003A238);
  uint64_t v48 = v47 + *(int *)(v91 + 36);
  *(void *)uint64_t v48 = v46;
  *(unsigned char *)(v48 + 8) = v35;
  uint64_t v49 = (uint64_t)v26;
  uint64_t v50 = (uint64_t)v95;
  sub_10000714C(v49, &qword_10003A238);
  uint64_t v51 = swift_allocObject();
  long long v52 = *(_OWORD *)(v50 + 48);
  *(_OWORD *)(v51 + 48) = *(_OWORD *)(v50 + 32);
  *(_OWORD *)(v51 + 64) = v52;
  *(unsigned char *)(v51 + 80) = *(unsigned char *)(v50 + 64);
  long long v53 = *(_OWORD *)(v50 + 16);
  *(_OWORD *)(v51 + 16) = *(_OWORD *)v50;
  *(_OWORD *)(v51 + 32) = v53;
  sub_1000289B0(v50);
  sub_100028A2C();
  uint64_t v54 = v86;
  sub_10002A680();
  swift_release();
  sub_10000714C(v47, &qword_10003A240);
  uint64_t v56 = v92;
  uint64_t v55 = v93;
  long long v57 = v87;
  (*(void (**)(char *, char *, uint64_t))(v92 + 32))(v87, v54, v93);
  uint64_t v58 = sub_10002A900();
  if (v59)
  {
    uint64_t v60 = v58;
    uint64_t v61 = v59;
    uint64_t v62 = sub_10002A7B0();
    uint64_t v63 = (uint64_t)v81;
    uint64_t *v81 = v62;
    *(void *)(v63 + 8) = v64;
    uint64_t v65 = sub_100002D88(&qword_10003A288);
    sub_100025244(v79, v80, v60, v61, v50, v63 + *(int *)(v65 + 44));
    swift_bridgeObjectRelease();
    uint64_t v66 = v78;
    sub_1000123DC(v63, v78, &qword_10003A220);
    uint64_t v67 = v98;
    long long v68 = (double *)(v66 + *(int *)(v98 + 36));
    *long long v68 = a6;
    v68[1] = a7;
    sub_10000714C(v63, &qword_10003A220);
    uint64_t v69 = v97;
    sub_100012440(v66, v97, &qword_10003A228);
    uint64_t v70 = 0;
  }
  else
  {
    uint64_t v69 = v97;
    uint64_t v67 = v98;
    uint64_t v70 = 1;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v96 + 56))(v69, v70, 1, v67);
  uint64_t v71 = *(void (**)(char *, char *, uint64_t))(v56 + 16);
  uint64_t v72 = v94;
  v71(v94, v57, v55);
  uint64_t v73 = v99;
  sub_1000123DC(v69, v99, &qword_10003A230);
  char v74 = v100;
  v71(v100, v72, v55);
  uint64_t v75 = sub_100002D88(&qword_10003A280);
  sub_1000123DC(v73, (uint64_t)&v74[*(int *)(v75 + 48)], &qword_10003A230);
  sub_10000714C(v69, &qword_10003A230);
  uint64_t v76 = *(void (**)(char *, uint64_t))(v56 + 8);
  v76(v57, v55);
  sub_10000714C(v73, &qword_10003A230);
  return ((uint64_t (*)(char *, uint64_t))v76)(v72, v55);
}

uint64_t sub_100025244@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v69 = a5;
  uint64_t v64 = a4;
  uint64_t v63 = a3;
  long long v68 = (char *)a2;
  uint64_t v70 = a6;
  uint64_t v7 = *a1;
  uint64_t v8 = a1[1];
  uint64_t v9 = a1[2];
  uint64_t v10 = a1[3];
  uint64_t v11 = a1[4];
  uint64_t v12 = sub_10002A720();
  uint64_t v66 = *(void *)(v12 - 8);
  uint64_t v67 = v12;
  __chkstk_darwin(v12);
  uint64_t v65 = (char *)&v54 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v61 = sub_100002D88(&qword_100039E30);
  __chkstk_darwin(v61);
  uint64_t v15 = (char *)&v54 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_10002A3E0();
  __chkstk_darwin(v16);
  uint64_t v18 = (_OWORD *)((char *)&v54 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v19 = sub_100002D88(&qword_10003A290);
  __chkstk_darwin(v19);
  uint64_t v21 = (char *)&v54 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v59 = sub_100002D88(&qword_10003A298);
  uint64_t v22 = __chkstk_darwin(v59);
  uint64_t v24 = (char *)&v54 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  uint64_t v60 = (uint64_t)&v54 - v25;
  uint64_t v26 = qword_1000392E8;
  uint64_t v62 = v7;
  swift_bridgeObjectRetain();
  if (v26 != -1) {
    swift_once();
  }
  sub_10002A7B0();
  sub_10002A3B0();
  uint64_t v58 = v71;
  char v27 = v72;
  uint64_t v28 = v73;
  int v57 = v74;
  uint64_t v56 = v75;
  uint64_t v55 = v76;
  uint64_t v29 = (char *)v18 + *(int *)(v16 + 20);
  uint64_t v30 = enum case for RoundedCornerStyle.continuous(_:);
  uint64_t v31 = sub_10002A4C0();
  (*(void (**)(char *, uint64_t, uint64_t))(*(void *)(v31 - 8) + 104))(v29, v30, v31);
  __asm { FMOV            V0.2D, #4.5 }
  *uint64_t v18 = _Q0;
  sub_100024130((uint64_t)v18, (uint64_t)v15);
  *(_WORD *)&v15[*(int *)(v61 + 36)] = 256;
  sub_1000123DC((uint64_t)v15, (uint64_t)&v21[*(int *)(v19 + 36)], &qword_100039E30);
  *(void *)uint64_t v21 = v62;
  *((void *)v21 + 1) = v8;
  *((void *)v21 + 2) = v9;
  *((void *)v21 + 3) = v10;
  *((void *)v21 + 4) = v11;
  *((_WORD *)v21 + 20) = 256;
  *((void *)v21 + 6) = v58;
  v21[56] = v27;
  *((void *)v21 + 8) = v28;
  v21[72] = v57;
  uint64_t v37 = v55;
  *((void *)v21 + 10) = v56;
  *((void *)v21 + 11) = v37;
  swift_bridgeObjectRetain();
  sub_10000714C((uint64_t)v15, &qword_100039E30);
  sub_10002436C((uint64_t)v18);
  sub_1000288EC((uint64_t)a1);
  sub_1000123DC((uint64_t)v21, (uint64_t)v24, &qword_10003A290);
  uint64_t v38 = &v24[*(int *)(v59 + 36)];
  *(void *)uint64_t v38 = v68;
  *(_OWORD *)(v38 + 8) = xmmword_10002BB60;
  *((void *)v38 + 3) = 0x4000000000000000;
  swift_retain();
  sub_10000714C((uint64_t)v21, &qword_10003A290);
  uint64_t v39 = v60;
  sub_100012440((uint64_t)v24, v60, &qword_10003A298);
  if (qword_100039398 != -1) {
    swift_once();
  }
  long long v68 = v24;
  char v40 = sub_1000233F4(v63, v64, (void *)qword_10003ABB8);
  swift_bridgeObjectRetain();
  if (v40) {
    sub_10002A730();
  }
  else {
    sub_10002A710();
  }
  uint64_t v42 = v66;
  uint64_t v41 = v67;
  uint64_t v43 = v65;
  (*(void (**)(char *, void, uint64_t))(v66 + 104))(v65, enum case for Image.ResizingMode.stretch(_:), v67);
  uint64_t v64 = sub_10002A750();
  swift_release();
  (*(void (**)(char *, uint64_t))(v42 + 8))(v43, v41);
  if (qword_1000392F8 != -1) {
    swift_once();
  }
  sub_10002A7B0();
  sub_10002A3B0();
  uint64_t v67 = v77;
  LODWORD(v66) = v78;
  uint64_t v44 = v79;
  char v45 = v80;
  uint64_t v46 = v81;
  uint64_t v47 = v82;
  uint64_t v48 = *(void *)(v69 + 24);
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v50 = (uint64_t)v68;
  sub_1000123DC(v39, (uint64_t)v68, &qword_10003A298);
  uint64_t v51 = v70;
  sub_1000123DC(v50, v70, &qword_10003A298);
  uint64_t v52 = v51 + *(int *)(sub_100002D88(&qword_10003A2A0) + 48);
  *(void *)uint64_t v52 = v64;
  *(void *)(v52 + 8) = 0;
  *(_WORD *)(v52 + 16) = 1;
  *(void *)(v52 + 24) = v67;
  *(unsigned char *)(v52 + 32) = v66;
  *(void *)(v52 + 40) = v44;
  *(unsigned char *)(v52 + 48) = v45;
  *(void *)(v52 + 56) = v46;
  *(void *)(v52 + 64) = v47;
  *(void *)(v52 + 72) = KeyPath;
  *(void *)(v52 + 80) = v48;
  swift_retain();
  swift_retain();
  swift_retain_n();
  sub_10000714C(v39, &qword_10003A298);
  swift_release();
  swift_release();
  swift_release();
  return sub_10000714C(v50, &qword_10003A298);
}

uint64_t sub_100025934@<X0>(uint64_t a1@<X8>)
{
  return sub_1000245FC(a1);
}

__n128 sub_100025978@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_10002A5D0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v38 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(void *)&v41[0] = a1;
  *((void *)&v41[0] + 1) = a2;
  sub_100016BD8();
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_10002A640();
  uint64_t v12 = v11;
  int v39 = v13;
  uint64_t v40 = v14;
  if (qword_1000392D8 != -1) {
    swift_once();
  }
  if (byte_10003A108 == 1) {
    sub_10002A5B0();
  }
  else {
    sub_10002A5A0();
  }
  sub_10002A5C0();
  swift_release();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for Font.Leading.tight(_:), v6);
  sub_10002A5E0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  char v15 = v39 & 1;
  uint64_t v16 = sub_10002A630();
  uint64_t v18 = v17;
  int v39 = v19;
  swift_release();
  sub_100024504(v10, v12, v15);
  swift_bridgeObjectRelease();
  if (qword_100039328 != -1) {
    swift_once();
  }
  char v20 = v39 & 1;
  uint64_t v21 = sub_10002A620();
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v40 = v24;
  char v27 = v26 & 1;
  sub_100024504(v16, v18, v20);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  uint64_t v29 = sub_10002A6D0();
  char v30 = sub_10002A550();
  uint64_t v31 = swift_getKeyPath();
  uint64_t v43 = v21;
  uint64_t v44 = v23;
  char v45 = v27;
  uint64_t v46 = v25;
  uint64_t v47 = KeyPath;
  uint64_t v48 = 2;
  char v49 = 0;
  uint64_t v50 = v29;
  char v51 = v30;
  uint64_t v52 = v31;
  char v53 = 1;
  sub_10002A780();
  sub_100013B34(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v41, 0.0, 1, 0.0, 1);
  sub_100024504(v21, v23, v27);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  long long v32 = v41[11];
  *(_OWORD *)(a3 + 160) = v41[10];
  *(_OWORD *)(a3 + 176) = v32;
  *(void *)(a3 + 192) = v42;
  long long v33 = v41[7];
  *(_OWORD *)(a3 + 96) = v41[6];
  *(_OWORD *)(a3 + 112) = v33;
  long long v34 = v41[9];
  *(_OWORD *)(a3 + 128) = v41[8];
  *(_OWORD *)(a3 + 144) = v34;
  long long v35 = v41[3];
  *(_OWORD *)(a3 + 32) = v41[2];
  *(_OWORD *)(a3 + 48) = v35;
  long long v36 = v41[5];
  *(_OWORD *)(a3 + 64) = v41[4];
  *(_OWORD *)(a3 + 80) = v36;
  __n128 result = (__n128)v41[1];
  *(_OWORD *)a3 = v41[0];
  *(__n128 *)(a3 + 16) = result;
  return result;
}

uint64_t sub_100025D38()
{
  return sub_10002A690();
}

double sub_100025D54@<D0>(uint64_t a1@<X8>)
{
  *(void *)&double result = sub_100025978(*v1, v1[1], a1).n128_u64[0];
  return result;
}

uint64_t sub_100025D5C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6 = sub_10002A5D0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v32[2] = a1;
  v32[3] = a2;
  sub_100016BD8();
  swift_bridgeObjectRetain();
  uint64_t v10 = sub_10002A640();
  uint64_t v12 = v11;
  char v14 = v13;
  if (qword_1000392D8 != -1) {
    swift_once();
  }
  if (byte_10003A108 == 1) {
    sub_10002A5B0();
  }
  else {
    sub_10002A600();
  }
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, enum case for Font.Leading.tight(_:), v6);
  sub_10002A5E0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  char v15 = v14 & 1;
  uint64_t v16 = sub_10002A630();
  uint64_t v18 = v17;
  char v20 = v19;
  swift_release();
  sub_100024504(v10, v12, v15);
  swift_bridgeObjectRelease();
  if (qword_100039328 != -1) {
    swift_once();
  }
  char v21 = v20 & 1;
  uint64_t v22 = sub_10002A620();
  uint64_t v24 = v23;
  char v26 = v25;
  uint64_t v28 = v27;
  sub_100024504(v16, v18, v21);
  swift_bridgeObjectRelease();
  uint64_t v29 = sub_10002A6D0();
  char v30 = sub_10002A550();
  uint64_t result = swift_getKeyPath();
  *(void *)a3 = v22;
  *(void *)(a3 + 8) = v24;
  *(unsigned char *)(a3 + 16) = v26 & 1;
  *(void *)(a3 + 24) = v28;
  *(void *)(a3 + 32) = v29;
  *(unsigned char *)(a3 + 40) = v30;
  *(void *)(a3 + 48) = result;
  *(void *)(a3 + 56) = 0;
  *(unsigned char *)(a3 + 64) = 1;
  return result;
}

double sub_100026004@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, _OWORD *a4@<X8>)
{
  if (a3)
  {
    sub_100025D5C(a1, a2, (uint64_t)&v29);
    long long v5 = v29;
    char v6 = v30;
    long long v14 = v29;
    LOBYTE(v15) = v30;
    *((void *)&v15 + 1) = *((void *)&v30 + 1);
    *(void *)&long long v16 = v31;
    BYTE8(v16) = BYTE8(v31);
    long long v17 = v32;
    LOBYTE(v18) = v33;
    *(_WORD *)((char *)&v18 + 1) = 256;
    sub_10002A780();
    sub_100013D08(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)v26, 0.0, 1, 0.0, 1);
    sub_100024504(v5, *((uint64_t *)&v5 + 1), v6);
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    sub_10002888C((uint64_t)v26);
  }
  else
  {
    sub_100025D5C(a1, a2, (uint64_t)v28);
    sub_10002A780();
    sub_100013EC8(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)&v14, 0.0, 1, 0.0, 1);
    sub_1000286B4((uint64_t)v28);
    v26[8] = v22;
    v26[9] = v23;
    v26[10] = v24;
    uint64_t v27 = v25;
    v26[4] = v18;
    v26[5] = v19;
    v26[6] = v20;
    v26[7] = v21;
    v26[0] = v14;
    v26[1] = v15;
    v26[2] = v16;
    v26[3] = v17;
    sub_100028710((uint64_t)v26);
  }
  sub_100012440((uint64_t)v26, (uint64_t)&v13, &qword_10003A1A0);
  sub_100002D88(&qword_10003A1A8);
  sub_100002D88(&qword_10003A1B0);
  sub_100028CC8(&qword_10003A1B8, &qword_10003A1A8, (void (*)(void))sub_10002871C);
  sub_100028CC8(&qword_10003A200, &qword_10003A1B0, (void (*)(void))sub_10002874C);
  sub_10002A510();
  long long v7 = v38;
  a4[8] = v37;
  a4[9] = v7;
  a4[10] = v39[0];
  *(_OWORD *)((char *)a4 + 169) = *(_OWORD *)((char *)v39 + 9);
  long long v8 = v34;
  a4[4] = v33;
  a4[5] = v8;
  long long v9 = v36;
  a4[6] = v35;
  a4[7] = v9;
  long long v10 = v30;
  *a4 = v29;
  a4[1] = v10;
  double result = *(double *)&v31;
  long long v12 = v32;
  a4[2] = v31;
  a4[3] = v12;
  return result;
}

double sub_1000262EC@<D0>(uint64_t a1@<X8>)
{
  uint64_t v3 = *(void *)v1;
  uint64_t v4 = *(void *)(v1 + 8);
  char v5 = *(unsigned char *)(v1 + 16);
  uint64_t v6 = sub_10002A4B0();
  sub_100026004(v3, v4, v5, v14);
  *(_OWORD *)&v16[135] = v14[8];
  *(_OWORD *)&v16[151] = v14[9];
  *(_OWORD *)&v16[167] = v15[0];
  *(_OWORD *)&v16[176] = *(_OWORD *)((char *)v15 + 9);
  *(_OWORD *)&v16[71] = v14[4];
  *(_OWORD *)&v16[87] = v14[5];
  *(_OWORD *)&v16[103] = v14[6];
  *(_OWORD *)&v16[119] = v14[7];
  *(_OWORD *)&v16[7] = v14[0];
  *(_OWORD *)&v16[23] = v14[1];
  *(_OWORD *)&v16[39] = v14[2];
  *(_OWORD *)&v16[55] = v14[3];
  long long v7 = *(_OWORD *)&v16[144];
  *(_OWORD *)(a1 + 145) = *(_OWORD *)&v16[128];
  *(_OWORD *)(a1 + 161) = v7;
  long long v8 = *(_OWORD *)&v16[176];
  *(_OWORD *)(a1 + 177) = *(_OWORD *)&v16[160];
  *(_OWORD *)(a1 + 193) = v8;
  long long v9 = *(_OWORD *)&v16[80];
  *(_OWORD *)(a1 + 81) = *(_OWORD *)&v16[64];
  *(_OWORD *)(a1 + 97) = v9;
  long long v10 = *(_OWORD *)&v16[112];
  *(_OWORD *)(a1 + 113) = *(_OWORD *)&v16[96];
  *(_OWORD *)(a1 + 129) = v10;
  long long v11 = *(_OWORD *)&v16[16];
  *(_OWORD *)(a1 + 17) = *(_OWORD *)v16;
  *(_OWORD *)(a1 + 33) = v11;
  double result = *(double *)&v16[32];
  long long v13 = *(_OWORD *)&v16[48];
  *(_OWORD *)(a1 + 49) = *(_OWORD *)&v16[32];
  *(void *)a1 = v6;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(_OWORD *)(a1 + 65) = v13;
  return result;
}

uint64_t sub_10002644C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X6>, uint64_t a7@<X8>)
{
  uint64_t v14 = sub_100002D88(&qword_10003A160);
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  long long v17 = (char *)&v47 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v15);
  long long v19 = (char *)&v47 - v18;
  *(void *)long long v19 = sub_10002A4B0();
  *((void *)v19 + 1) = 0x4000000000000000;
  v19[16] = 0;
  uint64_t v20 = sub_100002D88(&qword_10003A168);
  sub_100026750(a1, a2, a3, a4, a5, (uint64_t *)&v19[*(int *)(v20 + 44)]);
  uint64_t v52 = a7;
  char v53 = v17;
  uint64_t v21 = (uint64_t)v19;
  if (a6 && (uint64_t v22 = sub_10002A900(), v23))
  {
    uint64_t v54 = v22;
    uint64_t v55 = v23;
    sub_100016BD8();
    uint64_t v24 = sub_10002A640();
    uint64_t v26 = v25;
    char v28 = v27 & 1;
    sub_10002A5F0();
    uint64_t v29 = sub_10002A630();
    uint64_t v48 = v31;
    uint64_t v49 = v30;
    char v33 = v32;
    swift_release();
    uint64_t v34 = v33 & 1;
    sub_100024504(v24, v26, v28);
    swift_bridgeObjectRelease();
    uint64_t KeyPath = swift_getKeyPath();
    if (qword_100039330 != -1) {
      swift_once();
    }
    uint64_t v36 = qword_10003AB20;
    uint64_t v51 = swift_getKeyPath();
    swift_retain();
    uint64_t v50 = 2;
    uint64_t v38 = v48;
    uint64_t v37 = v49;
    uint64_t v39 = v34;
  }
  else
  {
    uint64_t v29 = 0;
    uint64_t v37 = 0;
    uint64_t v39 = 0;
    uint64_t v38 = 0;
    uint64_t KeyPath = 0;
    uint64_t v50 = 0;
    uint64_t v51 = 0;
    uint64_t v36 = 0;
  }
  uint64_t v40 = v21;
  uint64_t v41 = (uint64_t)v53;
  sub_1000123DC(v21, (uint64_t)v53, &qword_10003A160);
  uint64_t v42 = v52;
  sub_1000123DC(v41, v52, &qword_10003A160);
  uint64_t v43 = (uint64_t *)(v42 + *(int *)(sub_100002D88(&qword_10003A170) + 48));
  *uint64_t v43 = v29;
  v43[1] = v37;
  v43[2] = v39;
  v43[3] = v38;
  uint64_t v44 = v50;
  uint64_t v45 = v51;
  v43[4] = KeyPath;
  v43[5] = v44;
  v43[6] = 0;
  v43[7] = v45;
  v43[8] = v36;
  sub_10002854C(v29, v37, v39, v38);
  sub_10000714C(v40, &qword_10003A160);
  sub_1000285BC(v29, v37, v39, v38);
  return sub_10000714C(v41, &qword_10003A160);
}

uint64_t sub_100026750@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X8>)
{
  uint64_t v72 = a3;
  uint64_t v11 = sub_100002D88(&qword_100039E40);
  __chkstk_darwin(v11);
  long long v13 = (uint64_t *)((char *)&v68 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v81 = sub_10002A740();
  uint64_t v79 = *(void *)(v81 - 8);
  __chkstk_darwin(v81);
  uint64_t v77 = (char *)&v68 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v73 = sub_100002D88(&qword_10003A178);
  __chkstk_darwin(v73);
  unsigned __int8 v78 = (char *)&v68 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v76 = sub_100002D88(&qword_10003A180);
  __chkstk_darwin(v76);
  uint64_t v80 = (uint64_t)&v68 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = sub_100002D88(&qword_10003A188);
  uint64_t v83 = *(void *)(v17 - 8);
  uint64_t v18 = __chkstk_darwin(v17);
  uint64_t v75 = (uint64_t)&v68 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v18);
  uint64_t v74 = (uint64_t)&v68 - v20;
  uint64_t v21 = sub_100002D88(&qword_10003A190);
  uint64_t v22 = __chkstk_darwin(v21 - 8);
  uint64_t v84 = (uint64_t)&v68 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v22);
  uint64_t v25 = (char *)&v68 - v24;
  uint64_t v85 = v17;
  uint64_t v86 = a5;
  if (a2)
  {
    uint64_t v68 = a4;
    uint64_t v69 = v11;
    uint64_t v70 = v13;
    uint64_t v71 = a6;
    uint64_t v87 = a1;
    uint64_t v88 = a2;
    sub_100016BD8();
    swift_bridgeObjectRetain();
    uint64_t v26 = sub_10002A640();
    uint64_t v28 = v27;
    char v30 = v29 & 1;
    sub_10002A600();
    uint64_t v31 = sub_10002A630();
    uint64_t v33 = v32;
    char v35 = v34;
    swift_release();
    sub_100024504(v26, v28, v30);
    swift_bridgeObjectRelease();
    if (qword_100039328 != -1) {
      swift_once();
    }
    char v36 = v35 & 1;
    a2 = sub_10002A620();
    uint64_t v38 = v37;
    uint64_t v82 = v39;
    uint64_t v41 = v40 & 1;
    sub_100024504(v31, v33, v36);
    swift_bridgeObjectRelease();
    long long v13 = v70;
    a6 = v71;
    uint64_t v17 = v85;
    a5 = v86;
    uint64_t v11 = v69;
    a4 = v68;
    if (!v68) {
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v38 = 0;
    uint64_t v41 = 0;
    uint64_t v82 = 0;
    if (!a4)
    {
LABEL_12:
      uint64_t v46 = 1;
      goto LABEL_20;
    }
  }
  if (!a5) {
    goto LABEL_12;
  }
  uint64_t v70 = (uint64_t *)v25;
  uint64_t v71 = (uint64_t *)v41;
  uint64_t v42 = a4;
  uint64_t v43 = qword_100039398;
  swift_retain();
  if (v43 != -1) {
    swift_once();
  }
  char v44 = sub_1000233F4(v72, v42, (void *)qword_10003ABB8);
  swift_bridgeObjectRetain();
  if (v44) {
    uint64_t v45 = sub_10002A730();
  }
  else {
    uint64_t v45 = sub_10002A710();
  }
  uint64_t v47 = v45;
  uint64_t v25 = (char *)v70;
  uint64_t v41 = (uint64_t)v71;
  uint64_t v71 = (uint64_t *)v38;
  uint64_t v72 = a2;
  if (qword_1000392D8 != -1) {
    swift_once();
  }
  uint64_t v48 = v79;
  if (byte_10003A108) {
    uint64_t v49 = (unsigned int *)&enum case for Image.Scale.medium(_:);
  }
  else {
    uint64_t v49 = (unsigned int *)&enum case for Image.Scale.small(_:);
  }
  uint64_t v50 = v77;
  uint64_t v51 = v81;
  (*(void (**)(char *, void, uint64_t))(v79 + 104))(v77, *v49, v81);
  uint64_t KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v48 + 16))((char *)v13 + *(int *)(v11 + 28), v50, v51);
  *long long v13 = KeyPath;
  char v53 = (uint64_t *)v78;
  sub_1000123DC((uint64_t)v13, (uint64_t)&v78[*(int *)(v73 + 36)], &qword_100039E40);
  *char v53 = v47;
  swift_retain();
  sub_10000714C((uint64_t)v13, &qword_100039E40);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v50, v51);
  swift_release();
  uint64_t v54 = sub_10002A5F0();
  uint64_t v55 = swift_getKeyPath();
  uint64_t v56 = v80;
  sub_1000123DC((uint64_t)v53, v80, &qword_10003A178);
  int v57 = (uint64_t *)(v56 + *(int *)(v76 + 36));
  *int v57 = v55;
  v57[1] = v54;
  sub_10000714C((uint64_t)v53, &qword_10003A178);
  uint64_t v58 = swift_getKeyPath();
  uint64_t v59 = v75;
  sub_1000123DC(v56, v75, &qword_10003A180);
  uint64_t v17 = v85;
  uint64_t v60 = v86;
  uint64_t v61 = (uint64_t *)(v59 + *(int *)(v85 + 36));
  *uint64_t v61 = v58;
  v61[1] = v60;
  sub_10000714C(v56, &qword_10003A180);
  uint64_t v62 = v59;
  uint64_t v63 = v74;
  sub_100012440(v62, v74, &qword_10003A188);
  sub_100012440(v63, (uint64_t)v25, &qword_10003A188);
  uint64_t v46 = 0;
  uint64_t v38 = (uint64_t)v71;
  a2 = v72;
LABEL_20:
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v83 + 56))(v25, v46, 1, v17);
  uint64_t v64 = v84;
  sub_1000123DC((uint64_t)v25, v84, &qword_10003A190);
  *a6 = a2;
  a6[1] = v38;
  uint64_t v65 = v82;
  a6[2] = v41;
  a6[3] = v65;
  uint64_t v66 = sub_100002D88(&qword_10003A198);
  sub_1000123DC(v64, (uint64_t)a6 + *(int *)(v66 + 48), &qword_10003A190);
  sub_10002862C(a2, v38, v41, v65);
  sub_10000714C((uint64_t)v25, &qword_10003A190);
  sub_10000714C(v64, &qword_10003A190);
  return sub_100028670(a2, v38, v41, v65);
}

uint64_t sub_100026E90@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_100002D88(&qword_10003A128);
  uint64_t v5 = __chkstk_darwin(v4 - 8);
  uint64_t v55 = (uint64_t)&v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v54 = (uint64_t *)((char *)&v44 - v7);
  uint64_t v8 = sub_100002D88(&qword_10003A130);
  __chkstk_darwin(v8 - 8);
  long long v10 = (char *)&v44 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v53 = sub_100002D88(&qword_10003A138);
  uint64_t v11 = __chkstk_darwin(v53);
  uint64_t v57 = (uint64_t)&v44 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v11);
  uint64_t v56 = (uint64_t)&v44 - v13;
  if (qword_100039338 != -1) {
    swift_once();
  }
  uint64_t v14 = qword_10003AB28;
  swift_retain();
  uint64_t v15 = sub_10002A7B0();
  sub_100013968(0.0, 1, 0.0, 1, INFINITY, 0, 0.0, 1, (uint64_t)&v66, 0.0, 1, 0.5, 0, v15, v16, v14, 0, 1);
  swift_release();
  if (qword_1000392D8 != -1) {
    swift_once();
  }
  sub_10002A7B0();
  sub_10002A3B0();
  uint64_t v52 = v60;
  int v51 = v61;
  uint64_t v50 = v62;
  int v49 = v63;
  uint64_t v47 = v65;
  uint64_t v48 = v64;
  *(void *)long long v10 = sub_10002A4B0();
  *((void *)v10 + 1) = 0;
  v10[16] = 1;
  uint64_t v45 = &v10[*(int *)(sub_100002D88(&qword_10003A140) + 44)];
  uint64_t v46 = v10;
  uint64_t v18 = *a1;
  uint64_t v17 = a1[1];
  uint64_t v19 = a1[3];
  uint64_t v20 = a1[4];
  uint64_t v21 = a1[5];
  uint64_t v22 = a1[6];
  uint64_t v23 = sub_10002A4E0();
  uint64_t v24 = (uint64_t)v54;
  *uint64_t v54 = v23;
  *(void *)(v24 + 8) = 0;
  *(unsigned char *)(v24 + 16) = 0;
  uint64_t v25 = sub_100002D88(&qword_10003A148);
  sub_10002644C(v18, v17, v20, v21, v22, v19, v24 + *(int *)(v25 + 44));
  uint64_t v26 = v55;
  sub_1000123DC(v24, v55, &qword_10003A128);
  uint64_t v27 = (uint64_t)v45;
  sub_1000123DC(v26, (uint64_t)v45, &qword_10003A128);
  uint64_t v28 = v27 + *(int *)(sub_100002D88(&qword_10003A150) + 48);
  *(void *)uint64_t v28 = 0;
  *(unsigned char *)(v28 + 8) = 1;
  sub_10000714C(v24, &qword_10003A128);
  sub_10000714C(v26, &qword_10003A128);
  uint64_t v29 = sub_10002A6D0();
  LOBYTE(v26) = sub_10002A550();
  uint64_t v30 = (uint64_t)v46;
  uint64_t v31 = v57;
  sub_1000123DC((uint64_t)v46, v57, &qword_10003A130);
  uint64_t v32 = v31 + *(int *)(v53 + 36);
  *(void *)uint64_t v32 = v29;
  *(unsigned char *)(v32 + 8) = v26;
  sub_10000714C(v30, &qword_10003A130);
  uint64_t v33 = v56;
  sub_100012440(v31, v56, &qword_10003A138);
  sub_1000123DC(v33, v31, &qword_10003A138);
  long long v34 = v70;
  long long v35 = v71;
  v58[4] = v70;
  v58[5] = v71;
  long long v36 = v73;
  v58[6] = v72;
  v58[7] = v73;
  long long v37 = v66;
  long long v38 = v67;
  v58[0] = v66;
  v58[1] = v67;
  long long v39 = v68;
  long long v40 = v69;
  v58[2] = v68;
  v58[3] = v69;
  *(_OWORD *)(a2 + 96) = v72;
  *(_OWORD *)(a2 + 112) = v36;
  *(_OWORD *)(a2 + 64) = v34;
  *(_OWORD *)(a2 + 80) = v35;
  *(_OWORD *)(a2 + 32) = v39;
  *(_OWORD *)(a2 + 48) = v40;
  *(_OWORD *)a2 = v37;
  *(_OWORD *)(a2 + 16) = v38;
  *(void *)(a2 + 128) = 0;
  *(unsigned char *)(a2 + 136) = 1;
  *(void *)(a2 + 144) = v52;
  *(unsigned char *)(a2 + 152) = v51;
  *(void *)(a2 + 160) = v50;
  *(unsigned char *)(a2 + 168) = v49;
  uint64_t v41 = v47;
  *(void *)(a2 + 176) = v48;
  *(void *)(a2 + 184) = v41;
  uint64_t v42 = sub_100002D88(&qword_10003A158);
  sub_1000123DC(v31, a2 + *(int *)(v42 + 64), &qword_10003A138);
  sub_1000284F4((uint64_t)v58);
  sub_10000714C(v33, &qword_10003A138);
  sub_10000714C(v31, &qword_10003A138);
  v59[4] = v70;
  v59[5] = v71;
  v59[6] = v72;
  v59[7] = v73;
  v59[0] = v66;
  v59[1] = v67;
  v59[2] = v68;
  v59[3] = v69;
  return sub_100028520((uint64_t)v59);
}

uint64_t sub_100027394@<X0>(uint64_t a1@<X8>)
{
  long long v3 = *(_OWORD *)(v1 + 16);
  v6[0] = *(_OWORD *)v1;
  v6[1] = v3;
  v6[2] = *(_OWORD *)(v1 + 32);
  uint64_t v7 = *(void *)(v1 + 48);
  *(void *)a1 = sub_10002A4D0();
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 0;
  uint64_t v4 = sub_100002D88(&qword_10003A120);
  return sub_100026E90((uint64_t *)v6, a1 + *(int *)(v4 + 44));
}

uint64_t sub_1000273FC()
{
  return sub_10002A400();
}

uint64_t sub_100027420(uint64_t a1)
{
  uint64_t v2 = sub_10002A740();
  __chkstk_darwin(v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_10002A410();
}

uint64_t sub_1000274EC@<X0>(uint64_t a1@<X8>)
{
  uint64_t result = sub_10002A480();
  *(void *)a1 = result;
  *(unsigned char *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_100027520()
{
  return sub_10002A490();
}

uint64_t sub_100027550@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10002A460();
  *a1 = result;
  return result;
}

uint64_t sub_10002757C()
{
  return sub_10002A470();
}

uint64_t sub_1000275A8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_10002A420();
  *a1 = result;
  return result;
}

uint64_t sub_1000275D4()
{
  return sub_10002A430();
}

double sub_100027600(uint64_t a1)
{
  *(void *)(a1 + 144) = 0;
  double result = 0.0;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

void *sub_100027620(void *a1, void (*a2)(void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))
{
  return a1;
}

uint64_t sub_10002768C(uint64_t a1)
{
  return a1;
}

uint64_t sub_100027720@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t a7@<X6>, uint64_t a8@<X7>, uint64_t a9@<X8>)
{
  swift_retain();
  uint64_t v44 = a7;
  uint64_t v45 = a8;
  sub_100016C34(a7);
  [a1 size];
  double v15 = v14;
  [a1 size];
  double v17 = v16;
  if (qword_1000392D8 != -1) {
    swift_once();
  }
  if (byte_10003A108) {
    double v18 = 48.0;
  }
  else {
    double v18 = 60.0;
  }
  double v19 = 90.0;
  if (byte_10003A108) {
    double v19 = 72.0;
  }
  if (v15 == v17) {
    double v20 = v18;
  }
  else {
    double v20 = v19;
  }
  uint64_t v21 = self;
  id v22 = [v21 mainScreen];
  [v22 scale];
  double v24 = v23;

  CGFloat v25 = v18 * v24;
  id v26 = [v21 mainScreen];
  [v26 scale];
  double v28 = v27;

  [a1 size];
  v49.origin.x = 0.0;
  v49.origin.y = 0.0;
  v49.size.double width = v25;
  v49.size.double height = v20 * v28;
  CGRect v48 = AVMakeRectWithAspectRatioInsideRect(v47, v49);
  double width = v48.size.width;
  double height = v48.size.height;
  id v31 = [objc_allocWithZone((Class)UIGraphicsImageRendererFormat) init];
  [v31 setScale:1.0];
  id v32 = [objc_allocWithZone((Class)UIGraphicsImageRenderer) initWithSize:v31 format:width, height];
  uint64_t v33 = (double *)swift_allocObject();
  *((void *)v33 + 2) = a1;
  v33[3] = width;
  v33[4] = height;
  uint64_t v34 = swift_allocObject();
  *(void *)(v34 + 16) = sub_100027AE4;
  *(void *)(v34 + 24) = v33;
  aBlock[4] = sub_100027B10;
  aBlock[5] = v34;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000245B0;
  aBlock[3] = &unk_100035A30;
  long long v35 = _Block_copy(aBlock);
  id v36 = a1;
  swift_retain();
  swift_release();
  id v37 = [v32 imageWithActions:v35];
  sub_10001654C(v44);

  swift_release();
  _Block_release(v35);
  char isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  swift_release();
  uint64_t result = swift_release();
  if (isEscapingClosureAtFileLocation)
  {
    __break(1u);
  }
  else
  {
    *(void *)a9 = v37;
    *(void *)(a9 + 8) = a2;
    *(void *)(a9 + 16) = a3;
    *(void *)(a9 + 24) = a4;
    *(void *)(a9 + 32) = a5;
    *(void *)(a9 + 40) = a6;
    *(void *)(a9 + 48) = v44;
    *(void *)(a9 + 56) = v45;
    *(unsigned char *)(a9 + 64) = v15 == v17;
  }
  return result;
}

uint64_t sub_100027AAC()
{
  return _swift_deallocObject(v0, 40, 7);
}

id sub_100027AE4()
{
  return [*(id *)(v0 + 16) drawInRect:0.0, 0.0, *(double *)(v0 + 24), *(double *)(v0 + 32)];
}

uint64_t sub_100027B00()
{
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100027B10()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_100027B38(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100027B48()
{
  return swift_release();
}

uint64_t destroy for RequestStatusView()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_release();
}

void *initializeWithCopy for RequestStatusView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  return a1;
}

void *assignWithCopy for RequestStatusView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[6] = a2[6];
  swift_retain();
  swift_release();
  return a1;
}

__n128 initializeWithTake for RequestStatusView(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 16);
  long long v4 = *(_OWORD *)(a2 + 32);
  *(void *)(a1 + 48) = *(void *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for RequestStatusView(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v5;
  swift_bridgeObjectRelease();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for RequestStatusView(uint64_t a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 >= 0x7FFFFFFF && *(unsigned char *)(a1 + 56)) {
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  }
  unint64_t v3 = *(void *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF) {
    LODWORD(v3) = -1;
  }
  int v4 = v3 - 1;
  if (v4 < 0) {
    int v4 = -1;
  }
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for RequestStatusView(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 1;
    }
  }
  else
  {
    if (a3 >= 0x7FFFFFFF) {
      *(unsigned char *)(result + 56) = 0;
    }
    if (a2) {
      *(void *)(result + 8) = a2;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RequestStatusView()
{
  return &type metadata for RequestStatusView;
}

uint64_t sub_100027E00(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v3;
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for RequestDescription(uint64_t a1, uint64_t a2)
{
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

__n128 initializeWithTake for RequestDescription(__n128 *a1, __n128 *a2)
{
  __n128 result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for RequestDescription(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(unsigned char *)(a1 + 16) = *(unsigned char *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for RequestDescription(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 17)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RequestDescription(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(unsigned char *)(result + 16) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 17) = 1;
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
    *(unsigned char *)(result + 17) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RequestDescription()
{
  return &type metadata for RequestDescription;
}

void *initializeBufferWithCopyOfBuffer for RequestName(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for RequestName()
{
  return swift_bridgeObjectRelease();
}

void *assignWithCopy for RequestName(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

void *assignWithTake for RequestName(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for RequestName(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 16)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for RequestName(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)__n128 result = a2 ^ 0x80000000;
    *(void *)(result + 8) = 0;
    if (a3 < 0) {
      *(unsigned char *)(result + 16) = 1;
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
    *(unsigned char *)(result + 16) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for RequestName()
{
  return &type metadata for RequestName;
}

uint64_t destroy for ThumbnailWithBadge(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  uint64_t result = swift_release();
  if (*(void *)(a1 + 48))
  {
    return swift_release();
  }
  return result;
}

uint64_t initializeWithCopy for ThumbnailWithBadge(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void *)(a2 + 8);
  *(void *)a1 = *(void *)a2;
  *(void *)(a1 + 8) = v5;
  uint64_t v6 = *(void *)(a2 + 24);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  *(void *)(a1 + 24) = v6;
  uint64_t v7 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v7;
  uint64_t v9 = (_OWORD *)(a2 + 48);
  uint64_t v8 = *(void *)(a2 + 48);
  id v10 = v4;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  if (v8)
  {
    uint64_t v11 = *(void *)(a2 + 56);
    *(void *)(a1 + 48) = v8;
    *(void *)(a1 + 56) = v11;
    swift_retain();
  }
  else
  {
    *(_OWORD *)(a1 + 48) = *v9;
  }
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  return a1;
}

uint64_t assignWithCopy for ThumbnailWithBadge(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)a2;
  uint64_t v5 = *(void **)a1;
  *(void *)a1 = *(void *)a2;
  id v6 = v4;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  *(void *)(a1 + 16) = *(void *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(void *)(a1 + 24) = *(void *)(a2 + 24);
  swift_retain();
  swift_release();
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  swift_retain();
  swift_release();
  *(void *)(a1 + 40) = *(void *)(a2 + 40);
  swift_retain();
  swift_release();
  uint64_t v7 = *(void *)(a2 + 48);
  if (!*(void *)(a1 + 48))
  {
    if (v7)
    {
      uint64_t v9 = *(void *)(a2 + 56);
      *(void *)(a1 + 48) = v7;
      *(void *)(a1 + 56) = v9;
      swift_retain();
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    goto LABEL_8;
  }
  if (!v7)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v8 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = v7;
  *(void *)(a1 + 56) = v8;
  swift_retain();
  swift_release();
LABEL_8:
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  return a1;
}

__n128 initializeWithTake for ThumbnailWithBadge(uint64_t a1, uint64_t a2)
{
  *(_OWORD *)a1 = *(_OWORD *)a2;
  __n128 result = *(__n128 *)(a2 + 16);
  long long v3 = *(_OWORD *)(a2 + 32);
  long long v4 = *(_OWORD *)(a2 + 48);
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)(a1 + 16) = result;
  return result;
}

uint64_t assignWithTake for ThumbnailWithBadge(uint64_t a1, uint64_t a2)
{
  long long v4 = *(void **)a1;
  *(void *)a1 = *(void *)a2;

  *(void *)(a1 + 8) = *(void *)(a2 + 8);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  swift_release();
  uint64_t v5 = *(void *)(a2 + 48);
  if (!*(void *)(a1 + 48))
  {
    if (v5)
    {
      uint64_t v7 = *(void *)(a2 + 56);
      *(void *)(a1 + 48) = v5;
      *(void *)(a1 + 56) = v7;
      goto LABEL_8;
    }
LABEL_7:
    *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
    goto LABEL_8;
  }
  if (!v5)
  {
    swift_release();
    goto LABEL_7;
  }
  uint64_t v6 = *(void *)(a2 + 56);
  *(void *)(a1 + 48) = v5;
  *(void *)(a1 + 56) = v6;
  swift_release();
LABEL_8:
  *(unsigned char *)(a1 + 64) = *(unsigned char *)(a2 + 64);
  return a1;
}

uint64_t getEnumTagSinglePayload for ThumbnailWithBadge(uint64_t *a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *((unsigned char *)a1 + 65)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  uint64_t v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ThumbnailWithBadge(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(unsigned char *)(result + 64) = 0;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 65) = 1;
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
    *(unsigned char *)(result + 65) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ThumbnailWithBadge()
{
  return &type metadata for ThumbnailWithBadge;
}

uint64_t sub_100028484(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_10002DB74, 1);
}

uint64_t sub_1000284A0(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_10002DB4C, 1);
}

uint64_t sub_1000284BC(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_10002DB24, 1);
}

uint64_t sub_1000284D8(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_10002DAFC, 1);
}

uint64_t sub_1000284F4(uint64_t a1)
{
  return a1;
}

uint64_t sub_100028520(uint64_t a1)
{
  return a1;
}

uint64_t sub_10002854C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_100016B28(result, a2, a3 & 1);
    swift_retain();
    swift_bridgeObjectRetain();
    swift_retain();
    return swift_retain();
  }
  return result;
}

uint64_t sub_1000285BC(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_100024504(result, a2, a3 & 1);
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    return swift_release();
  }
  return result;
}

uint64_t sub_10002862C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_100016B28(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_100028670(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_100024504(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1000286B4(uint64_t a1)
{
  return a1;
}

uint64_t sub_100028710(uint64_t result)
{
  *(unsigned char *)(result + 184) = 1;
  return result;
}

uint64_t sub_10002871C()
{
  return sub_100028CC8(&qword_10003A1C0, &qword_10003A1C8, (void (*)(void))sub_10002874C);
}

unint64_t sub_10002874C()
{
  unint64_t result = qword_10003A1D0;
  if (!qword_10003A1D0)
  {
    sub_100016460(&qword_10003A1D8);
    sub_1000287EC();
    sub_100016A50(&qword_10003A1F0, &qword_10003A1F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003A1D0);
  }
  return result;
}

unint64_t sub_1000287EC()
{
  unint64_t result = qword_10003A1E0;
  if (!qword_10003A1E0)
  {
    sub_100016460(&qword_10003A1E8);
    sub_100016A50(&qword_100039E18, &qword_100039E20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003A1E0);
  }
  return result;
}

uint64_t sub_10002888C(uint64_t result)
{
  *(unsigned char *)(result + 184) = 0;
  return result;
}

uint64_t sub_100028894@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_10002A440();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1000288C4()
{
  return sub_10002A450();
}

uint64_t sub_1000288EC(uint64_t a1)
{
  return a1;
}

uint64_t sub_100028918()
{
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  if (*(void *)(v0 + 64)) {
    swift_release();
  }

  return _swift_deallocObject(v0, 81, 7);
}

uint64_t sub_100028980()
{
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 64);
  if (v1) {
    return v1();
  }
  return result;
}

uint64_t sub_1000289B0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = *(id *)a1;
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  sub_100016C34(v2);
  return a1;
}

unint64_t sub_100028A2C()
{
  unint64_t result = qword_10003A250;
  if (!qword_10003A250)
  {
    sub_100016460(&qword_10003A240);
    sub_100028ACC();
    sub_100016A50(&qword_100039E18, &qword_100039E20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003A250);
  }
  return result;
}

unint64_t sub_100028ACC()
{
  unint64_t result = qword_10003A258;
  if (!qword_10003A258)
  {
    sub_100016460(&qword_10003A238);
    sub_100028CC8(&qword_10003A260, &qword_10003A268, (void (*)(void))sub_100028B98);
    sub_100016A50(&qword_100039E28, &qword_100039E30);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003A258);
  }
  return result;
}

unint64_t sub_100028B98()
{
  unint64_t result = qword_10003A270;
  if (!qword_10003A270)
  {
    sub_100016460(&qword_10003A278);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003A270);
  }
  return result;
}

uint64_t sub_100028C0C()
{
  return sub_100016A50(&qword_10003A2A8, &qword_10003A2B0);
}

uint64_t sub_100028C48()
{
  return sub_100016A50(&qword_10003A2B8, &qword_10003A2C0);
}

uint64_t sub_100028C84()
{
  return sub_100028CC8(&qword_10003A2C8, &qword_10003A2D0, (void (*)(void))sub_100028D44);
}

uint64_t sub_100028CC8(unint64_t *a1, uint64_t *a2, void (*a3)(void))
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_100016460(a2);
    a3();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100028D44()
{
  unint64_t result = qword_10003A2D8;
  if (!qword_10003A2D8)
  {
    sub_100016460(&qword_10003A2E0);
    sub_100028DE4();
    sub_100016A50(&qword_10003A308, &qword_10003A310);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003A2D8);
  }
  return result;
}

unint64_t sub_100028DE4()
{
  unint64_t result = qword_10003A2E8;
  if (!qword_10003A2E8)
  {
    sub_100016460(&qword_10003A2F0);
    sub_100028E84();
    sub_100016A50(&qword_100039E18, &qword_100039E20);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003A2E8);
  }
  return result;
}

unint64_t sub_100028E84()
{
  unint64_t result = qword_10003A2F8;
  if (!qword_10003A2F8)
  {
    sub_100016460(&qword_10003A300);
    sub_100016A50(&qword_10003A1F0, &qword_10003A1F8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10003A2F8);
  }
  return result;
}

uint64_t sub_100028F24()
{
  return sub_100016A50(&qword_10003A318, &qword_10003A320);
}

uint64_t sub_100028F70(uint64_t a1)
{
  uint64_t v2 = sub_100029FB0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100002D88(&qword_100039460);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100029EB0();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v17 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000291F8(a1, (uint64_t)v8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9) == 1) {
    return sub_100002E44((uint64_t)v8);
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
  sub_100002AE0();
  sub_10002A010();
  double v14 = sub_100029FA0();
  os_log_type_t v15 = sub_10002AA30();
  if (os_log_type_enabled(v14, v15))
  {
    double v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)double v16 = 0;
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "pushToSettings", v16, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_1000291F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = sub_10002A280();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_100029FB0();
  uint64_t v38 = *(void *)(v8 - 8);
  uint64_t v39 = v8;
  uint64_t v9 = __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  id v36 = (char *)&v36 - v12;
  uint64_t v13 = sub_100002D88(&qword_100039460);
  __chkstk_darwin(v13 - 8);
  os_log_type_t v15 = (char *)&v36 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v16 = sub_10002A240();
  if ((v17 & 1) != 0
    || (uint64_t v18 = v16,
        sub_10002A270(),
        uint64_t v37 = a2,
        uint64_t v19 = sub_10002A900(),
        uint64_t v21 = v20,
        a2 = v37,
        swift_bridgeObjectRelease(),
        !v21))
  {
    sub_10002A010();
    uint64_t v29 = (char *)v4;
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
    uint64_t v30 = sub_100029FA0();
    os_log_type_t v31 = sub_10002AA40();
    if (os_log_type_enabled(v30, v31))
    {
      id v32 = (uint8_t *)swift_slowAlloc();
      uint64_t v41 = swift_slowAlloc();
      id v36 = v29;
      uint64_t v37 = a2;
      *(_DWORD *)id v32 = 136315138;
      uint64_t v33 = sub_10002A1D0();
      uint64_t v40 = sub_100006348(v33, v34, &v41);
      a2 = v37;
      sub_10002AAD0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, char *))(v5 + 8))(v7, v36);
      _os_log_impl((void *)&_mh_execute_header, v30, v31, "Invalid details %s", v32, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, char *))(v5 + 8))(v7, v29);
    }

    (*(void (**)(char *, uint64_t))(v38 + 8))(v11, v39);
    uint64_t v35 = sub_100029EB0();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v35 - 8) + 56))(a2, 1, 1, v35);
  }
  else
  {
    type metadata accessor for PeopleMessagesURLHandler();
    swift_initStackObject();
    sub_100002114(v18, v19, v21, (uint64_t)v15);
    swift_bridgeObjectRelease();
    uint64_t v22 = sub_100029EB0();
    uint64_t v23 = *(void *)(v22 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v15, 1, v22) == 1)
    {
      sub_100002E44((uint64_t)v15);
      double v24 = v36;
      sub_10002A010();
      CGFloat v25 = sub_100029FA0();
      os_log_type_t v26 = sub_10002AA40();
      if (os_log_type_enabled(v25, v26))
      {
        double v27 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)double v27 = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, v26, "Unable to build punch out url", v27, 2u);
        a2 = v37;
        swift_slowDealloc();
      }

      swift_release();
      (*(void (**)(char *, uint64_t))(v38 + 8))(v24, v39);
      return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v23 + 56))(a2, 1, 1, v22);
    }
    else
    {
      (*(void (**)(uint64_t, char *, uint64_t))(v23 + 32))(a2, v15, v22);
      return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(v23 + 56))(a2, 0, 1, v22);
    }
  }
}

uint64_t sub_100029718(uint64_t a1, void *a2)
{
  uint64_t v42 = a2;
  uint64_t v3 = sub_10002A280();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v39 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_10002A030();
  uint64_t v40 = *(void *)(v7 - 8);
  uint64_t v41 = v7;
  __chkstk_darwin(v7);
  uint64_t v39 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_100029FB0();
  uint64_t v43 = *(void *)(v9 - 8);
  uint64_t v44 = v9;
  uint64_t v10 = __chkstk_darwin(v9);
  uint64_t v12 = (char *)&v39 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v10);
  os_log_type_t v15 = (char *)&v39 - v14;
  __chkstk_darwin(v13);
  char v17 = (char *)&v39 - v16;
  sub_10002A270();
  sub_10002A900();
  uint64_t v19 = v18;
  swift_bridgeObjectRelease();
  if (v19)
  {
    sub_10002A010();
    double v20 = sub_100029FA0();
    os_log_type_t v21 = sub_10002AA30();
    if (os_log_type_enabled(v20, v21))
    {
      uint64_t v22 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)uint64_t v22 = 134217984;
      id v46 = v42;
      sub_10002AAD0();
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "Responding to askForTime %ld", v22, 0xCu);
      swift_slowDealloc();
    }

    uint64_t v23 = v44;
    double v24 = *(void (**)(char *, uint64_t))(v43 + 8);
    v24(v17, v44);
    id v25 = [objc_allocWithZone((Class)STAskClient) init];
    sub_10002A060();
    sub_10002A020();
    NSString v26 = sub_10002A860();
    swift_bridgeObjectRelease();
    id v46 = 0;
    unsigned int v27 = [v25 respondToAskForTimeRequestWithIdentifier:v26 answer:v42 error:&v46];

    if (v27)
    {
      id v34 = v46;
      sub_10002A020();
      swift_bridgeObjectRelease();
      sub_10002A050();
      id v36 = v39;
      uint64_t v35 = v40;
      uint64_t v37 = v41;
      (*(void (**)(char *, void, uint64_t))(v40 + 104))(v39, enum case for PeopleAnalytics.MessageRequestBubbleSource.screenTime(_:), v41);
      sub_10002A040();

      swift_release();
      return (*(uint64_t (**)(char *, uint64_t))(v35 + 8))(v36, v37);
    }
    else
    {
      id v33 = v46;
      sub_100029E30();

      swift_willThrow();
      sub_10002A010();
      swift_errorRetain();
      sub_100029F90();

      swift_errorRelease();
      swift_errorRelease();
      return ((uint64_t (*)(char *, uint64_t))v24)(v12, v23);
    }
  }
  else
  {
    sub_10002A010();
    (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, v3);
    double v28 = sub_100029FA0();
    uint64_t v29 = sub_10002AA40();
    if (os_log_type_enabled(v28, (os_log_type_t)v29))
    {
      uint64_t v30 = (uint8_t *)swift_slowAlloc();
      id v46 = (id)swift_slowAlloc();
      *(_DWORD *)uint64_t v30 = 136315138;
      uint64_t v42 = v30 + 4;
      uint64_t v31 = sub_10002A1D0();
      uint64_t v45 = sub_100006348(v31, v32, (uint64_t *)&v46);
      sub_10002AAD0();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      _os_log_impl((void *)&_mh_execute_header, v28, (os_log_type_t)v29, "Invalid details %s", v30, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    }

    return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v15, v44);
  }
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_100029DA0()
{
  return Measurement.init(value:unit:)();
}

uint64_t sub_100029DB0()
{
  return URLQueryItem.name.getter();
}

uint64_t sub_100029DC0()
{
  return URLQueryItem.value.getter();
}

uint64_t sub_100029DD0()
{
  return type metadata accessor for URLQueryItem();
}

uint64_t sub_100029DE0()
{
  return URLComponents.queryItems.getter();
}

uint64_t sub_100029DF0()
{
  return URLComponents.init(url:resolvingAgainstBaseURL:)();
}

uint64_t sub_100029E00()
{
  return type metadata accessor for URLComponents();
}

uint64_t sub_100029E10()
{
  return URLResourceValues.creationDate.getter();
}

uint64_t sub_100029E20()
{
  return type metadata accessor for URLResourceValues();
}

uint64_t sub_100029E30()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100029E40()
{
  return URL.standardizedFileURL.getter();
}

uint64_t sub_100029E50()
{
  return URL.absoluteString.getter();
}

uint64_t sub_100029E60()
{
  return URL.resourceValues(forKeys:)();
}

void sub_100029E70(NSURL *retstr@<X8>)
{
}

uint64_t sub_100029E80()
{
  return URL.appendingPathComponent(_:)();
}

uint64_t sub_100029E90()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100029EA0()
{
  return URL.init(string:)();
}

uint64_t sub_100029EB0()
{
  return type metadata accessor for URL();
}

uint64_t sub_100029EC0()
{
  return Data.init(contentsOf:options:)();
}

NSData sub_100029ED0()
{
  return Data._bridgeToObjectiveC()();
}

uint64_t sub_100029EE0()
{
  return static Data._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100029EF0()
{
  return Data.write(to:options:)();
}

uint64_t sub_100029F00()
{
  return static Date.> infix(_:_:)();
}

uint64_t sub_100029F10()
{
  return static Date.+ infix(_:_:)();
}

uint64_t sub_100029F20()
{
  return Date.init()();
}

uint64_t sub_100029F30()
{
  return type metadata accessor for Date();
}

uint64_t sub_100029F40()
{
  return UUID.uuidString.getter();
}

uint64_t sub_100029F50()
{
  return UUID.init()();
}

uint64_t sub_100029F60()
{
  return type metadata accessor for UUID();
}

uint64_t sub_100029F70()
{
  return Promise.init(startBlock:)();
}

uint64_t sub_100029F80()
{
  return os_log(_:dso:log:_:_:)();
}

uint64_t sub_100029F90()
{
  return Logger.ifError(_:message:)();
}

uint64_t sub_100029FA0()
{
  return Logger.logObject.getter();
}

uint64_t sub_100029FB0()
{
  return type metadata accessor for Logger();
}

uint64_t sub_100029FC0()
{
  return static PeopleSharedDirectory.cacheFolder(create:)();
}

uint64_t sub_100029FD0()
{
  return PeopleURL.Parameter.rawValue.getter();
}

uint64_t sub_100029FE0()
{
  return type metadata accessor for PeopleURL.Parameter();
}

uint64_t sub_100029FF0()
{
  return static PeopleErrors.createError(_:code:)();
}

uint64_t sub_10002A000()
{
  return static PeopleLogger.common.getter();
}

uint64_t sub_10002A010()
{
  return static PeopleLogger.messages.getter();
}

uint64_t sub_10002A020()
{
  return static PeopleAnalytics.trackAction(_:extensionBundleID:isNotification:)();
}

uint64_t sub_10002A030()
{
  return type metadata accessor for PeopleAnalytics.MessageRequestBubbleSource();
}

uint64_t sub_10002A040()
{
  return dispatch thunk of PeopleAnalytics.logRequestBubbleInteraction(_:isPreview:didAct:)();
}

uint64_t sub_10002A050()
{
  return static PeopleAnalytics.shared.getter();
}

uint64_t sub_10002A060()
{
  return type metadata accessor for PeopleAnalytics();
}

uint64_t sub_10002A070()
{
  return StatusType.rawValue.getter();
}

uint64_t sub_10002A080()
{
  return type metadata accessor for StatusType();
}

uint64_t sub_10002A090()
{
  return static AMSBagHelper.isTrustedDomain(for:)();
}

uint64_t sub_10002A0A0()
{
  return static BiomeUtilities.shared.getter();
}

uint64_t sub_10002A0B0()
{
  return dispatch thunk of BiomeUtilities.scheduler(for:isDaemon:)();
}

uint64_t sub_10002A0C0()
{
  return type metadata accessor for BiomeUtilities();
}

uint64_t sub_10002A0D0()
{
  return ContactFetcher.__allocating_init()();
}

uint64_t sub_10002A0E0()
{
  return type metadata accessor for ContactFetcher();
}

uint64_t sub_10002A0F0()
{
  return type metadata accessor for FirstPartyApps();
}

uint64_t sub_10002A100()
{
  return MessageDetails.updateFromDetails(_:)();
}

uint64_t sub_10002A110()
{
  return type metadata accessor for MessageDetails.EventSource();
}

uint64_t sub_10002A120()
{
  return MessageDetails.EventStatus.rawValue.getter();
}

uint64_t sub_10002A130()
{
  return type metadata accessor for MessageDetails.EventStatus();
}

uint64_t sub_10002A140()
{
  return static MessageDetails.detailsFrom(_:)();
}

uint64_t sub_10002A150()
{
  return MessageDetails.eventSource.getter();
}

uint64_t sub_10002A160()
{
  return MessageDetails.approvalTime.getter();
}

uint64_t sub_10002A170()
{
  return MessageDetails.bubbleCaption.getter();
}

uint64_t sub_10002A180()
{
  return MessageDetails.thumbnailData.getter();
}

uint64_t sub_10002A190()
{
  return MessageDetails.thumbnailData.setter();
}

uint64_t sub_10002A1A0()
{
  return MessageDetails.thumbnailPath.getter();
}

uint64_t sub_10002A1B0()
{
  return MessageDetails.actionUserDSID.getter();
}

uint64_t sub_10002A1C0()
{
  return MessageDetails.expirationDate.getter();
}

uint64_t sub_10002A1D0()
{
  return MessageDetails.debugDescription.getter();
}

uint64_t sub_10002A1E0()
{
  return MessageDetails.TTL.getter();
}

uint64_t sub_10002A1F0()
{
  return MessageDetails.family.getter();
}

uint64_t sub_10002A200()
{
  return MessageDetails.family.setter();
}

uint64_t sub_10002A210()
{
  return MessageDetails.status.getter();
}

uint64_t sub_10002A220()
{
  return MessageDetails.status.setter();
}

uint64_t sub_10002A230()
{
  return MessageDetails.bundleId.getter();
}

uint64_t sub_10002A240()
{
  return MessageDetails.userDSID.getter();
}

uint64_t sub_10002A250()
{
  return MessageDetails.childName.setter();
}

uint64_t sub_10002A260()
{
  return MessageDetails.isExpired.getter();
}

uint64_t sub_10002A270()
{
  return MessageDetails.requestID.getter();
}

uint64_t sub_10002A280()
{
  return type metadata accessor for MessageDetails();
}

uint64_t sub_10002A290()
{
  return ResolvedFamily.requestingFamilyMember.getter();
}

uint64_t sub_10002A2A0()
{
  return ResolvedFamily.findMe.getter();
}

uint64_t sub_10002A2B0()
{
  return ResolvedFamily.approvers.getter();
}

uint64_t sub_10002A2C0()
{
  return type metadata accessor for ResolvedFamily();
}

uint64_t sub_10002A2E0()
{
  return type metadata accessor for AppBundleResolver();
}

uint64_t sub_10002A300()
{
  return BiomeStreamListener.init(statusType:biomePublisher:eventHandler:)();
}

uint64_t sub_10002A310()
{
  return dispatch thunk of BiomeStreamListener.cancel()();
}

uint64_t sub_10002A320()
{
  return MessageDetailsCache.init(statusSource:fileManager:)();
}

uint64_t sub_10002A330()
{
  return type metadata accessor for MessageDetailsCache();
}

uint64_t sub_10002A340()
{
  return ResolvedFamilyCache.__allocating_init(usePersistentCache:)();
}

uint64_t sub_10002A350()
{
  return type metadata accessor for ResolvedFamilyCache();
}

uint64_t sub_10002A360()
{
  return dispatch thunk of MessageDetailsCacheProtocol.messageDetails(for:)();
}

uint64_t sub_10002A370()
{
  return dispatch thunk of MessageDetailsCacheProtocol.save(messageDetails:for:)();
}

uint64_t sub_10002A380()
{
  return dispatch thunk of ResolvedFamilyCacheProtocol.familyFromCacheForChild(dsid:)();
}

uint64_t sub_10002A390()
{
  return dispatch thunk of ResolvedFamilyCacheProtocol.addFamilyToCacheByChild(_:)();
}

uint64_t sub_10002A3A0()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_10002A3B0()
{
  return _FrameLayout.init(width:height:alignment:)();
}

uint64_t sub_10002A3C0()
{
  return LinearGradient.init(gradient:startPoint:endPoint:)();
}

uint64_t sub_10002A3D0()
{
  return dispatch thunk of _UIHostingView.safeAreaRegions.setter();
}

uint64_t sub_10002A3E0()
{
  return type metadata accessor for RoundedRectangle();
}

uint64_t sub_10002A3F0()
{
  return _FlexFrameLayout.init(minWidth:idealWidth:maxWidth:minHeight:idealHeight:maxHeight:alignment:)();
}

uint64_t sub_10002A400()
{
  return EnvironmentValues.imageScale.getter();
}

uint64_t sub_10002A410()
{
  return EnvironmentValues.imageScale.setter();
}

uint64_t sub_10002A420()
{
  return EnvironmentValues.foregroundColor.getter();
}

uint64_t sub_10002A430()
{
  return EnvironmentValues.foregroundColor.setter();
}

uint64_t sub_10002A440()
{
  return EnvironmentValues.allowsTightening.getter();
}

uint64_t sub_10002A450()
{
  return EnvironmentValues.allowsTightening.setter();
}

uint64_t sub_10002A460()
{
  return EnvironmentValues.font.getter();
}

uint64_t sub_10002A470()
{
  return EnvironmentValues.font.setter();
}

uint64_t sub_10002A480()
{
  return EnvironmentValues.lineLimit.getter();
}

uint64_t sub_10002A490()
{
  return EnvironmentValues.lineLimit.setter();
}

uint64_t sub_10002A4A0()
{
  return static VerticalAlignment.top.getter();
}

uint64_t sub_10002A4B0()
{
  return static VerticalAlignment.center.getter();
}

uint64_t sub_10002A4C0()
{
  return type metadata accessor for RoundedCornerStyle();
}

uint64_t sub_10002A4D0()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_10002A4E0()
{
  return static HorizontalAlignment.leading.getter();
}

uint64_t sub_10002A4F0()
{
  return UIHostingController.safeAreaRegions.setter();
}

uint64_t sub_10002A500()
{
  return UIHostingController.init(rootView:)();
}

uint64_t sub_10002A510()
{
  return _ConditionalContent<>.init(storage:)();
}

uint64_t sub_10002A520()
{
  return static AccessibilityChildBehavior.combine.getter();
}

uint64_t sub_10002A530()
{
  return type metadata accessor for AccessibilityChildBehavior();
}

uint64_t sub_10002A540()
{
  return static Log.runtimeIssuesLog.getter();
}

uint64_t sub_10002A550()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_10002A560()
{
  return static Edge.Set.top.getter();
}

uint64_t sub_10002A570()
{
  return static Edge.Set.bottom.getter();
}

uint64_t sub_10002A580()
{
  return static Edge.Set.leading.getter();
}

uint64_t sub_10002A590()
{
  return static Edge.Set.trailing.getter();
}

uint64_t sub_10002A5A0()
{
  return static Font.subheadline.getter();
}

uint64_t sub_10002A5B0()
{
  return static Font.body.getter();
}

uint64_t sub_10002A5C0()
{
  return Font.bold()();
}

uint64_t sub_10002A5D0()
{
  return type metadata accessor for Font.Leading();
}

uint64_t sub_10002A5E0()
{
  return Font.leading(_:)();
}

uint64_t sub_10002A5F0()
{
  return static Font.caption2.getter();
}

uint64_t sub_10002A600()
{
  return static Font.footnote.getter();
}

uint64_t sub_10002A610()
{
  return Menu.init(content:label:)();
}

uint64_t sub_10002A620()
{
  return Text.foregroundColor(_:)();
}

uint64_t sub_10002A630()
{
  return Text.font(_:)();
}

uint64_t sub_10002A640()
{
  return Text.init<A>(_:)();
}

uint64_t sub_10002A650()
{
  return Text.init(_:)();
}

uint64_t sub_10002A660()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_10002A670()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_10002A680()
{
  return View.onTapGesture(count:perform:)();
}

uint64_t sub_10002A690()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_10002A6A0()
{
  return View.accessibilityElement(children:)();
}

uint64_t sub_10002A6B0()
{
  return Color.init(uiColor:)();
}

uint64_t sub_10002A6C0()
{
  return type metadata accessor for Color.RGBColorSpace();
}

uint64_t sub_10002A6D0()
{
  return static Color.clear.getter();
}

uint64_t sub_10002A6E0()
{
  return static Color.white.getter();
}

uint64_t sub_10002A6F0()
{
  return Color.init(_:white:opacity:)();
}

uint64_t sub_10002A700()
{
  return Image.init(uiImage:)();
}

uint64_t sub_10002A710()
{
  return Image.init(systemName:)();
}

uint64_t sub_10002A720()
{
  return type metadata accessor for Image.ResizingMode();
}

uint64_t sub_10002A730()
{
  return Image.init(_internalSystemName:)();
}

uint64_t sub_10002A740()
{
  return type metadata accessor for Image.Scale();
}

uint64_t sub_10002A750()
{
  return Image.resizable(capInsets:resizingMode:)();
}

uint64_t sub_10002A760()
{
  return Button.init(action:label:)();
}

uint64_t sub_10002A770()
{
  return Gradient.init(colors:)();
}

uint64_t sub_10002A780()
{
  return static Alignment.topLeading.getter();
}

uint64_t sub_10002A790()
{
  return static Alignment.bottomTrailing.getter();
}

uint64_t sub_10002A7A0()
{
  return static Alignment.top.getter();
}

uint64_t sub_10002A7B0()
{
  return static Alignment.center.getter();
}

uint64_t sub_10002A7C0()
{
  return static Alignment.leading.getter();
}

uint64_t sub_10002A7D0()
{
  return static Alignment.trailing.getter();
}

uint64_t sub_10002A7E0()
{
  return static UnitPoint.top.getter();
}

uint64_t sub_10002A7F0()
{
  return static UnitPoint.bottom.getter();
}

uint64_t sub_10002A800()
{
  return static PeopleWidgetConstants.screenTimeGradientColor1.getter();
}

uint64_t sub_10002A810()
{
  return static PeopleWidgetConstants.screenTimeGradientColor2.getter();
}

NSDictionary sub_10002A820()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_10002A830()
{
  return dispatch thunk of Hashable._rawHashValue(seed:)();
}

uint64_t sub_10002A840()
{
  return dispatch thunk of static Comparable.< infix(_:_:)();
}

uint64_t sub_10002A850()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_10002A860()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_10002A870()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_10002A880()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_10002A890()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10002A8A0()
{
  return String.init(format:_:)();
}

uint64_t sub_10002A8B0()
{
  return String.init<A>(describing:)();
}

uint64_t sub_10002A8C0()
{
  return String.hash(into:)();
}

uint64_t sub_10002A8D0()
{
  return String.rebrand.getter();
}

uint64_t sub_10002A8E0()
{
  return String.localized.getter();
}

uint64_t sub_10002A8F0()
{
  return String.splitWith(_:)();
}

uint64_t sub_10002A900()
{
  return String.trimToNil()().value._countAndFlagsBits;
}

void sub_10002A910(Swift::String a1)
{
}

Swift::Int sub_10002A920()
{
  return String.UTF8View._foreignCount()();
}

uint64_t sub_10002A930()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

NSArray sub_10002A940()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_10002A950()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_10002A960()
{
  return specialized Array._endMutation()();
}

uint64_t sub_10002A970()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_10002A980()
{
  return type metadata accessor for CancellationError();
}

uint64_t sub_10002A990()
{
  return static MainActor.shared.getter();
}

uint64_t sub_10002A9A0()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_10002A9B0()
{
  return static TaskPriority.userInitiated.getter();
}

uint64_t sub_10002A9C0()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_10002A9D0()
{
  return type metadata accessor for TaskPriority();
}

void sub_10002A9F0()
{
}

uint64_t sub_10002AA10()
{
  return static Task<>.checkCancellation()();
}

uint64_t sub_10002AA20()
{
  return static os_log_type_t.info.getter();
}

uint64_t sub_10002AA30()
{
  return static os_log_type_t.debug.getter();
}

uint64_t sub_10002AA40()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_10002AA50()
{
  return static os_log_type_t.fault.getter();
}

uint64_t sub_10002AA70()
{
  return FAFamilyMember.displayNameWithFallback.getter();
}

uint64_t sub_10002AA80()
{
  return BMAskToBuyEvent.statusType.getter();
}

uint64_t sub_10002AA90()
{
  return BMAskToBuyEvent.requestId.getter();
}

uint64_t sub_10002AAA0()
{
  return BMScreenTimeRequestEvent.statusType.getter();
}

uint64_t sub_10002AAB0()
{
  return BMScreenTimeRequestEvent.requestId.getter();
}

uint64_t sub_10002AAC0()
{
  return type metadata accessor for Optional();
}

uint64_t sub_10002AAD0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t sub_10002AAE0()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t sub_10002AAF0()
{
  return static _SetStorage.allocate(capacity:)();
}

void sub_10002AB00(Swift::Int a1)
{
}

uint64_t sub_10002AB10()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t sub_10002AB20()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_10002AB30()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_10002AB40()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t sub_10002AB50()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_10002AB60()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_10002AB70()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t sub_10002AB80()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_10002AB90()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_10002ABA0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_10002ABB0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_10002ABC0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_10002ABD0()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t sub_10002ABF0()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t sub_10002AC00()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_10002AC10()
{
  return Error.localizedDescription.getter();
}

uint64_t sub_10002AC20()
{
  return Error._getEmbeddedNSError()();
}

uint64_t sub_10002AC30()
{
  return Error._code.getter();
}

uint64_t sub_10002AC40()
{
  return Error._domain.getter();
}

uint64_t sub_10002AC50()
{
  return Error._userInfo.getter();
}

uint64_t sub_10002AC60()
{
  return Hasher.init(_seed:)();
}

void sub_10002AC70(Swift::UInt a1)
{
}

Swift::Int sub_10002AC80()
{
  return Hasher._finalize()();
}

CGRect AVMakeRectWithAspectRatioInsideRect(CGSize aspectRatio, CGRect boundingRect)
{
  return _AVMakeRectWithAspectRatioInsideRect(aspectRatio, boundingRect);
}

BOOL CGSizeEqualToSize(CGSize size1, CGSize size2)
{
  return _CGSizeEqualToSize(size1, size2);
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
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
  return [super a2];
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

uint64_t swift_allocError()
{
  return _swift_allocError();
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return _swift_allocateGenericClassMetadata();
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

uint64_t swift_deallocClassInstance()
{
  return _swift_deallocClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastClass()
{
  return _swift_dynamicCastClass();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
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

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
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

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_initClassMetadata2()
{
  return _swift_initClassMetadata2();
}

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_makeBoxUnique()
{
  return _swift_makeBoxUnique();
}

uint64_t swift_once()
{
  return _swift_once();
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

uint64_t swift_retain_n()
{
  return _swift_retain_n();
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

uint64_t swift_storeEnumTagMultiPayload()
{
  return _swift_storeEnumTagMultiPayload();
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

uint64_t swift_unknownObjectWeakAssign()
{
  return _swift_unknownObjectWeakAssign();
}

uint64_t swift_unknownObjectWeakCopyAssign()
{
  return _swift_unknownObjectWeakCopyAssign();
}

uint64_t swift_unknownObjectWeakCopyInit()
{
  return _swift_unknownObjectWeakCopyInit();
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

uint64_t swift_unknownObjectWeakTakeAssign()
{
  return _swift_unknownObjectWeakTakeAssign();
}

uint64_t swift_unknownObjectWeakTakeInit()
{
  return _swift_unknownObjectWeakTakeInit();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}