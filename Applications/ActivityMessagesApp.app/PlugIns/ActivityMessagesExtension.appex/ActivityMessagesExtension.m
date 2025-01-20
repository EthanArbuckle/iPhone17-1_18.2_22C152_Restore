int main(int argc, const char **argv, const char **envp)
{
  return 1;
}

uint64_t sub_100004F74()
{
  sub_100005360();
  uint64_t result = sub_100015158();
  qword_10001CBC8 = result;
  return result;
}

uint64_t variable initialization expression of AppViewController.bubbleView()
{
  return 0;
}

void sub_100004FDC(void *a1@<X8>)
{
  *a1 = *v1;
}

uint64_t sub_100004FE8(uint64_t a1, uint64_t a2)
{
  return sub_100005154(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100005000(uint64_t a1, id *a2)
{
  uint64_t result = sub_100014F98();
  *a2 = 0;
  return result;
}

uint64_t sub_100005078(uint64_t a1, id *a2)
{
  char v3 = sub_100014FA8();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1000050F8@<X0>(void *a1@<X8>)
{
  sub_100014FB8();
  NSString v2 = sub_100014F88();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_10000513C(uint64_t a1, uint64_t a2)
{
  return sub_100005154(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100005154(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_100014FB8();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100005198()
{
  sub_100014FB8();
  sub_100014FD8();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000051EC()
{
  sub_100014FB8();
  sub_100015308();
  sub_100014FD8();
  Swift::Int v0 = sub_100015328();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100005260()
{
  uint64_t v0 = sub_100014FB8();
  uint64_t v2 = v1;
  if (v0 == sub_100014FB8() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_1000152E8();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1000052EC@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_100014F88();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100005334@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_100014FB8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_100005360()
{
  unint64_t result = qword_10001CBD0;
  if (!qword_10001CBD0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_10001CBD0);
  }
  return result;
}

void type metadata accessor for OpenExternalURLOptionsKey()
{
  if (!qword_10001CBD8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_10001CBD8);
    }
  }
}

uint64_t sub_1000053F8(uint64_t a1)
{
  uint64_t v2 = sub_10000552C((unint64_t *)&qword_10001CBF8);
  uint64_t v3 = sub_10000552C((unint64_t *)&unk_10001CC00);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100005490()
{
  return sub_10000552C(&qword_10001CBE0);
}

uint64_t sub_1000054C4()
{
  return sub_10000552C(&qword_10001CBE8);
}

uint64_t sub_1000054F8()
{
  return sub_10000552C(&qword_10001CBF0);
}

uint64_t sub_10000552C(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for OpenExternalURLOptionsKey();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void *sub_100005570()
{
  uint64_t v1 = OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource____lazy_storage___defaultStickers;
  if (*(void *)&v0[OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource____lazy_storage___defaultStickers])
  {
    uint64_t v2 = *(void **)&v0[OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource____lazy_storage___defaultStickers];
  }
  else
  {
    uint64_t v2 = sub_1000055D8(v0);
    *(void *)&v0[v1] = v2;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  return v2;
}

void *sub_1000055D8(void *a1)
{
  sub_1000150E8();
  if (qword_10001CBC0 != -1) {
    swift_once();
  }
  sub_1000114A8(&qword_10001CCF8);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100016550;
  *(void *)(v2 + 56) = sub_1000114A8(&qword_10001CD00);
  *(void *)(v2 + 64) = sub_100011710((unint64_t *)&qword_10001CD08, &qword_10001CD00);
  uint64_t v3 = _swiftEmptyArrayStorage;
  *(void *)(v2 + 32) = _swiftEmptyArrayStorage;
  sub_100014ED8();
  swift_bridgeObjectRelease();
  id v4 = objc_allocWithZone((Class)NSBundle);
  NSString v5 = sub_100014F88();
  id v6 = [v4 initWithPath:v5];

  if (v6)
  {
    id v7 = v6;
    sub_10000F830((uint64_t)&off_1000188E0, v7);
    v9 = v8;

    swift_arrayDestroy();
    v14 = v9;
    swift_bridgeObjectRetain();
    sub_100009B78(&v14);
    swift_bridgeObjectRelease();
    v10 = v14;
    id v11 = v7;
    id v12 = a1;
    uint64_t v3 = (void *)sub_10000FED4((uint64_t)v10, v11);
    swift_release();
  }
  return v3;
}

void sub_1000057E4(uint64_t a1)
{
  *(void *)(v1 + OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource_stickers) = a1;
  swift_bridgeObjectRelease();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    uint64_t v3 = (void *)Strong;
    sub_1000150E8();
    if (qword_10001CBC0 != -1) {
      swift_once();
    }
    sub_1000114A8(&qword_10001CCF8);
    uint64_t v4 = swift_allocObject();
    *(_OWORD *)(v4 + 16) = xmmword_100016550;
    *(void *)(v4 + 56) = sub_1000114A8(&qword_10001CD00);
    *(void *)(v4 + 64) = sub_100011710((unint64_t *)&qword_10001CD08, &qword_10001CD00);
    *(void *)(v4 + 32) = _swiftEmptyArrayStorage;
    sub_100014ED8();
    swift_bridgeObjectRelease();
    id v5 = [v3 stickerBrowserView];
    [v5 reloadData];
    swift_unknownObjectRelease();
  }
}

id sub_100005984()
{
  *(void *)&v0[OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource_delegate + 8] = 0;
  swift_unknownObjectWeakInit();
  *(void *)&v0[OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource_query] = 0;
  *(void *)&v0[OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource_awardQuery] = 0;
  *(void *)&v0[OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource____lazy_storage___defaultStickers] = 0;
  id v1 = objc_allocWithZone((Class)HKHealthStore);
  uint64_t v2 = v0;
  id v3 = [v1 init];
  *(void *)&v2[OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource_healthStore] = v3;
  id v4 = [objc_allocWithZone((Class)AAUIAchievementResourceProvider) init];
  *(void *)&v2[OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource_resourceProvider] = v4;
  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && sub_100015298()) {
    sub_100010498((unint64_t)_swiftEmptyArrayStorage);
  }
  else {
    id v5 = &_swiftEmptySetSingleton;
  }
  *(void *)&v2[OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource_achievements] = v5;
  *(void *)&v2[OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource_stickers] = _swiftEmptyArrayStorage;
  *(void *)&v2[OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource_queryRetryCount] = 0;
  *(void *)&v2[OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource_queryRetryDelayIncrement] = 10000;
  *(void *)&v2[OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource_queryRetryMaxmiumDelay] = 300000;

  v10.receiver = v2;
  v10.super_class = (Class)type metadata accessor for StickerDataSource();
  [super init];
  if (((unint64_t)_swiftEmptyArrayStorage & 0xC000000000000000) != 0 && sub_100015298())
  {
    sub_100010498((unint64_t)_swiftEmptyArrayStorage);
    v8 = v7;
  }
  else
  {
    v8 = &_swiftEmptySetSingleton;
  }
  sub_100007D48((uint64_t)v8, (uint64_t)nullsub_1, 0);
  swift_bridgeObjectRelease();
  sub_100005B6C();

  return v6;
}

void sub_100005B6C()
{
  id v1 = v0;
  uint64_t v2 = sub_100014EE8();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (char *)v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_100014F38();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  objc_super v10 = (char *)v39 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  id v12 = (char *)v39 - v11;
  uint64_t v13 = sub_100014EF8();
  __chkstk_darwin(v13);
  v15 = (char *)v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (ACHShouldUseNewAwardsSystem())
  {
    v39[6] = v15;
    v39[7] = v10;
    v39[8] = v12;
    v39[9] = v5;
    v39[10] = v3;
    uint64_t v40 = OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource_awardQuery;
    v16 = *(void **)&v1[OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource_awardQuery];
    if (v16)
    {
      id v17 = v16;
      sub_1000150E8();
      if (qword_10001CBC0 != -1) {
        swift_once();
      }
      sub_1000114A8(&qword_10001CCF8);
      uint64_t v18 = swift_allocObject();
      *(_OWORD *)(v18 + 16) = xmmword_100016550;
      *(void *)(v18 + 56) = sub_1000114A8(&qword_10001CD00);
      *(void *)(v18 + 64) = sub_100011710((unint64_t *)&qword_10001CD08, &qword_10001CD00);
      *(void *)(v18 + 32) = _swiftEmptyArrayStorage;
      sub_100014ED8();
      swift_bridgeObjectRelease();
      sub_100014EA8();
    }
    v39[11] = v7;
    v39[5] = v13;
    *(void *)(swift_allocObject() + 16) = v1;
    *(void *)(swift_allocObject() + 16) = v1;
    *(void *)(swift_allocObject() + 16) = v1;
    *(void *)(swift_allocObject() + 16) = v1;
    objc_allocWithZone((Class)sub_100014EC8());
    v41 = v1;
    uint64_t v19 = sub_100014E98();
    sub_1000150E8();
    if (qword_10001CBC0 != -1) {
      swift_once();
    }
    sub_1000114A8(&qword_10001CCF8);
    uint64_t v20 = swift_allocObject();
    long long v42 = xmmword_100016550;
    *(_OWORD *)(v20 + 16) = xmmword_100016550;
    *(void *)(v20 + 56) = sub_1000114A8(&qword_10001CD00);
    *(void *)(v20 + 64) = sub_100011710((unint64_t *)&qword_10001CD08, &qword_10001CD00);
    *(void *)(v20 + 32) = _swiftEmptyArrayStorage;
    sub_100014ED8();
    swift_bridgeObjectRelease();
    sub_100014EB8();
    uint64_t v21 = v19;
    id v22 = *(id *)&v1[v40];
    *(void *)&v1[v40] = v21;
LABEL_17:

    return;
  }
  uint64_t v23 = OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource_query;
  v24 = *(void **)&v1[OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource_query];
  if (v24)
  {
    id v25 = v24;
    sub_1000150E8();
    if (qword_10001CBC0 != -1) {
      swift_once();
    }
    sub_1000114A8(&qword_10001CCF8);
    uint64_t v26 = swift_allocObject();
    *(_OWORD *)(v26 + 16) = xmmword_100016550;
    *(void *)(v26 + 56) = sub_1000114A8(&qword_10001CD00);
    *(void *)(v26 + 64) = sub_100011710((unint64_t *)&qword_10001CD08, &qword_10001CD00);
    *(void *)(v26 + 32) = _swiftEmptyArrayStorage;
    sub_100014ED8();
    swift_bridgeObjectRelease();
    [*(id *)&v1[OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource_healthStore] stopQuery:v25];
  }
  uint64_t v27 = swift_allocObject();
  *(void *)(v27 + 16) = v1;
  uint64_t v28 = swift_allocObject();
  *(void *)(v28 + 16) = v1;
  uint64_t v29 = swift_allocObject();
  *(void *)(v29 + 16) = v1;
  uint64_t v30 = swift_allocObject();
  *(void *)(v30 + 16) = v1;
  objc_allocWithZone((Class)ACHQuery);
  v31 = v1;
  id v32 = sub_100009738((uint64_t)sub_1000117BC, v27, (uint64_t)sub_1000117C4, v28, (uint64_t)sub_1000117CC, v29, (uint64_t)sub_1000117D4, v30);
  v33 = *(void **)&v1[v23];
  *(void *)&v1[v23] = v32;

  v34 = *(void **)&v1[v23];
  if (v34)
  {
    uint64_t v35 = swift_allocObject();
    *(void *)(v35 + 16) = v31;
    aBlock[4] = sub_1000117DC;
    aBlock[5] = v35;
    aBlock[0] = _NSConcreteStackBlock;
    aBlock[1] = 1107296256;
    aBlock[2] = sub_100007CD8;
    aBlock[3] = &unk_100018A80;
    v36 = _Block_copy(aBlock);
    v37 = v31;
    id v22 = v34;
    swift_release();
    [v22 setErrorHandler:v36];
    _Block_release(v36);
    sub_1000150E8();
    if (qword_10001CBC0 != -1) {
      swift_once();
    }
    sub_1000114A8(&qword_10001CCF8);
    uint64_t v38 = swift_allocObject();
    *(_OWORD *)(v38 + 16) = xmmword_100016550;
    *(void *)(v38 + 56) = sub_1000114A8(&qword_10001CD00);
    *(void *)(v38 + 64) = sub_100011710((unint64_t *)&qword_10001CD08, &qword_10001CD00);
    *(void *)(v38 + 32) = _swiftEmptyArrayStorage;
    sub_100014ED8();
    swift_bridgeObjectRelease();
    [*(id *)&v37[OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource_healthStore] executeQuery:v22];
    goto LABEL_17;
  }
}

uint64_t sub_100006898(uint64_t a1, char *a2)
{
  sub_1000150E8();
  if (qword_10001CBC0 != -1) {
    swift_once();
  }
  sub_1000114A8(&qword_10001CCF8);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100016550;
  *(void *)(v3 + 56) = sub_1000114A8(&qword_10001CD00);
  *(void *)(v3 + 64) = sub_100011710((unint64_t *)&qword_10001CD08, &qword_10001CD00);
  *(void *)(v3 + 32) = _swiftEmptyArrayStorage;
  sub_100014ED8();
  swift_bridgeObjectRelease();
  *(void *)&a2[OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource_queryRetryCount] = 0;
  unint64_t v4 = swift_bridgeObjectRetain();
  uint64_t v5 = sub_1000107F4(v4);
  swift_bridgeObjectRelease();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  uint64_t v7 = a2;
  sub_100007D48(v5, (uint64_t)sub_100011AFC, v6);
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t sub_100006A30(uint64_t a1, void *a2)
{
  sub_1000150E8();
  if (qword_10001CBC0 != -1) {
    swift_once();
  }
  sub_1000114A8(&qword_10001CCF8);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100016550;
  *(void *)(v3 + 56) = sub_1000114A8(&qword_10001CD00);
  *(void *)(v3 + 64) = sub_100011710((unint64_t *)&qword_10001CD08, &qword_10001CD00);
  *(void *)(v3 + 32) = _swiftEmptyArrayStorage;
  sub_100014ED8();
  swift_bridgeObjectRelease();
  unint64_t v4 = swift_bridgeObjectRetain();
  uint64_t v5 = sub_1000107F4(v4);
  swift_bridgeObjectRelease();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  id v7 = a2;
  sub_100007D48(v5, (uint64_t)sub_100011890, v6);
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t sub_100006BBC(uint64_t a1, void *a2)
{
  sub_1000150E8();
  if (qword_10001CBC0 != -1) {
    swift_once();
  }
  sub_1000114A8(&qword_10001CCF8);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100016550;
  *(void *)(v3 + 56) = sub_1000114A8(&qword_10001CD00);
  *(void *)(v3 + 64) = sub_100011710((unint64_t *)&qword_10001CD08, &qword_10001CD00);
  *(void *)(v3 + 32) = _swiftEmptyArrayStorage;
  sub_100014ED8();
  swift_bridgeObjectRelease();
  unint64_t v4 = swift_bridgeObjectRetain();
  uint64_t v5 = sub_1000107F4(v4);
  swift_bridgeObjectRelease();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  id v7 = a2;
  sub_100007D48(v5, (uint64_t)sub_100011874, v6);
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t sub_100006D48(uint64_t a1, void *a2)
{
  sub_1000150E8();
  if (qword_10001CBC0 != -1) {
    swift_once();
  }
  sub_1000114A8(&qword_10001CCF8);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100016550;
  *(void *)(v3 + 56) = sub_1000114A8(&qword_10001CD00);
  *(void *)(v3 + 64) = sub_100011710((unint64_t *)&qword_10001CD08, &qword_10001CD00);
  *(void *)(v3 + 32) = _swiftEmptyArrayStorage;
  sub_100014ED8();
  swift_bridgeObjectRelease();
  unint64_t v4 = swift_bridgeObjectRetain();
  uint64_t v5 = sub_1000107F4(v4);
  swift_bridgeObjectRelease();
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = a2;
  id v7 = a2;
  sub_100007D48(v5, (uint64_t)sub_100011858, v6);
  swift_bridgeObjectRelease();

  return swift_release();
}

uint64_t sub_100006ED4(uint64_t a1)
{
  id v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

uint64_t sub_100006F18(uint64_t a1, char *a2)
{
  sub_1000150E8();
  if (qword_10001CBC0 != -1) {
    swift_once();
  }
  sub_1000114A8(&qword_10001CCF8);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100016550;
  *(void *)(v4 + 56) = sub_1000114A8(&qword_10001CD00);
  *(void *)(v4 + 64) = sub_100011710((unint64_t *)&qword_10001CD08, &qword_10001CD00);
  *(void *)(v4 + 32) = _swiftEmptyArrayStorage;
  sub_100014ED8();
  swift_bridgeObjectRelease();
  *(void *)&a2[OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource_queryRetryCount] = 0;
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a2;
  uint64_t v6 = a2;
  sub_100007D48(a1, (uint64_t)sub_100011AFC, v5);

  return swift_release();
}

uint64_t sub_100007090(uint64_t a1, void *a2)
{
  sub_1000150E8();
  if (qword_10001CBC0 != -1) {
    swift_once();
  }
  sub_1000114A8(&qword_10001CCF8);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100016550;
  *(void *)(v4 + 56) = sub_1000114A8(&qword_10001CD00);
  *(void *)(v4 + 64) = sub_100011710((unint64_t *)&qword_10001CD08, &qword_10001CD00);
  *(void *)(v4 + 32) = _swiftEmptyArrayStorage;
  sub_100014ED8();
  swift_bridgeObjectRelease();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a2;
  id v6 = a2;
  sub_100007D48(a1, (uint64_t)sub_100011AFC, v5);

  return swift_release();
}

void sub_1000071FC(void *a1)
{
  swift_beginAccess();
  sub_10000C7F8(&v3, a1);
  uint64_t v2 = v3;
  swift_endAccess();
}

uint64_t sub_100007264(uint64_t a1, void *a2)
{
  sub_1000150E8();
  if (qword_10001CBC0 != -1) {
    swift_once();
  }
  sub_1000114A8(&qword_10001CCF8);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100016550;
  *(void *)(v4 + 56) = sub_1000114A8(&qword_10001CD00);
  *(void *)(v4 + 64) = sub_100011710((unint64_t *)&qword_10001CD08, &qword_10001CD00);
  *(void *)(v4 + 32) = _swiftEmptyArrayStorage;
  sub_100014ED8();
  swift_bridgeObjectRelease();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a2;
  id v6 = a2;
  sub_100007D48(a1, (uint64_t)sub_100011B04, v5);

  return swift_release();
}

void sub_1000073D0(void *a1)
{
  swift_beginAccess();
  uint64_t v2 = (void *)sub_10000E594((uint64_t)a1);
  swift_endAccess();
}

uint64_t sub_100007430(uint64_t a1, void *a2)
{
  sub_1000150E8();
  if (qword_10001CBC0 != -1) {
    swift_once();
  }
  sub_1000114A8(&qword_10001CCF8);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100016550;
  *(void *)(v4 + 56) = sub_1000114A8(&qword_10001CD00);
  *(void *)(v4 + 64) = sub_100011710((unint64_t *)&qword_10001CD08, &qword_10001CD00);
  *(void *)(v4 + 32) = _swiftEmptyArrayStorage;
  sub_100014ED8();
  swift_bridgeObjectRelease();
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = a2;
  id v6 = a2;
  sub_100007D48(a1, (uint64_t)sub_100011B00, v5);

  return swift_release();
}

void sub_10000759C(void *a1)
{
  swift_beginAccess();
  uint64_t v2 = (void *)sub_10000E07C(a1);
  swift_endAccess();
}

uint64_t sub_1000075FC(uint64_t a1, uint64_t a2)
{
  uint64_t v44 = sub_100014EE8();
  uint64_t v42 = *(void *)(v44 - 8);
  __chkstk_darwin(v44);
  uint64_t v5 = (uint64_t *)((char *)&v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v45 = sub_100014F38();
  uint64_t v43 = *(void *)(v45 - 8);
  uint64_t v6 = __chkstk_darwin(v45);
  uint64_t v40 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v41 = (char *)&v37 - v8;
  uint64_t v38 = sub_100014EF8();
  __chkstk_darwin(v38);
  v39 = (char *)&v37 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1000114A8(&qword_10001CCF0);
  uint64_t v10 = swift_allocObject();
  long long v47 = xmmword_100016550;
  *(_OWORD *)(v10 + 16) = xmmword_100016550;
  aBlock[0] = a1;
  swift_errorRetain();
  sub_1000114A8((uint64_t *)&unk_10001CDD0);
  uint64_t v11 = sub_100014FC8();
  uint64_t v13 = v12;
  *(void *)(v10 + 56) = &type metadata for String;
  *(void *)(v10 + 64) = sub_100011534();
  *(void *)(v10 + 32) = v11;
  *(void *)(v10 + 40) = v13;
  sub_1000150E8();
  if (qword_10001CBC0 != -1) {
    swift_once();
  }
  sub_1000114A8(&qword_10001CCF8);
  uint64_t v14 = swift_allocObject();
  *(_OWORD *)(v14 + 16) = v47;
  uint64_t v15 = sub_1000114A8(&qword_10001CD00);
  *(void *)(v14 + 56) = v15;
  uint64_t v16 = sub_100011710((unint64_t *)&qword_10001CD08, &qword_10001CD00);
  *(void *)(v14 + 64) = v16;
  *(void *)(v14 + 32) = v10;
  swift_bridgeObjectRetain();
  sub_100014ED8();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  uint64_t v18 = *(void *)(a2 + OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource_queryRetryCount);
  uint64_t v19 = *(void *)(a2 + OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource_queryRetryDelayIncrement);
  uint64_t v20 = v18 * v19;
  if ((unsigned __int128)(v18 * (__int128)v19) >> 64 != (v18 * v19) >> 63)
  {
    __break(1u);
    goto LABEL_11;
  }
  BOOL v21 = __OFADD__(v20, 1000);
  uint64_t v22 = v20 + 1000;
  if (v21)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  uint64_t v46 = a2;
  if (v22 >= 300000) {
    uint64_t v23 = 300000;
  }
  else {
    uint64_t v23 = v22;
  }
  uint64_t v24 = OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource_queryRetryCount;
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = v47;
  *(void *)(v25 + 56) = &type metadata for Int;
  *(void *)(v25 + 64) = &protocol witness table for Int;
  *(void *)(v25 + 32) = v23 / 1000;
  sub_1000150E8();
  uint64_t v26 = swift_allocObject();
  *(_OWORD *)(v26 + 16) = v47;
  *(void *)(v26 + 56) = v15;
  *(void *)(v26 + 64) = v16;
  *(void *)(v26 + 32) = v25;
  swift_bridgeObjectRetain();
  sub_100014ED8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v27 = swift_allocObject();
  swift_unknownObjectWeakInit();
  aBlock[4] = sub_10001183C;
  aBlock[5] = v27;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006ED4;
  aBlock[3] = &unk_100018C38;
  _Block_copy(aBlock);
  v48 = _swiftEmptyArrayStorage;
  sub_1000116C8(&qword_10001CDA0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  swift_retain();
  sub_1000114A8(&qword_10001CDA8);
  sub_100011710(&qword_10001CDB0, &qword_10001CDA8);
  sub_100015168();
  sub_100014F58();
  swift_allocObject();
  sub_100014F48();
  swift_release();
  swift_release();
  sub_100011620(0, &qword_10001CD98);
  uint64_t v28 = (void *)sub_100015108();
  uint64_t v29 = v40;
  sub_100014F28();
  *uint64_t v5 = v23;
  uint64_t v30 = v42;
  uint64_t v31 = v44;
  (*(void (**)(uint64_t *, void, uint64_t))(v42 + 104))(v5, enum case for DispatchTimeInterval.milliseconds(_:), v44);
  id v32 = v41;
  sub_100014F68();
  (*(void (**)(uint64_t *, uint64_t))(v30 + 8))(v5, v31);
  v33 = *(void (**)(char *, uint64_t))(v43 + 8);
  uint64_t v34 = v45;
  v33(v29, v45);
  sub_1000150F8();

  uint64_t result = ((uint64_t (*)(char *, uint64_t))v33)(v32, v34);
  uint64_t v35 = *(void *)(v46 + v24);
  BOOL v21 = __OFADD__(v35, 1);
  uint64_t v36 = v35 + 1;
  if (!v21)
  {
    *(void *)(v46 + v24) = v36;
    return swift_release();
  }
LABEL_12:
  __break(1u);
  return result;
}

void sub_100007C84()
{
  swift_beginAccess();
  uint64_t Strong = swift_unknownObjectWeakLoadStrong();
  if (Strong)
  {
    id v1 = (void *)Strong;
    sub_100005B6C();
  }
}

void sub_100007CD8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

uint64_t sub_100007D48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v7 = sub_100014EF8();
  uint64_t v19 = *(void *)(v7 - 8);
  __chkstk_darwin(v7);
  uint64_t v9 = (char *)&v18 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = sub_100014F18();
  uint64_t v10 = *(void *)(v18 - 8);
  __chkstk_darwin(v18);
  uint64_t v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100011620(0, &qword_10001CD98);
  uint64_t v13 = (void *)sub_100015108();
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = a1;
  v14[3] = a2;
  v14[4] = a3;
  v14[5] = v3;
  aBlock[4] = sub_1000116A4;
  aBlock[5] = v14;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_100006ED4;
  aBlock[3] = &unk_100018990;
  uint64_t v15 = _Block_copy(aBlock);
  swift_bridgeObjectRetain();
  swift_retain();
  id v16 = v3;
  swift_release();
  sub_100014F08();
  aBlock[0] = _swiftEmptyArrayStorage;
  sub_1000116C8(&qword_10001CDA0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_1000114A8(&qword_10001CDA8);
  sub_100011710(&qword_10001CDB0, &qword_10001CDA8);
  sub_100015168();
  sub_100015118();
  _Block_release(v15);

  (*(void (**)(char *, uint64_t))(v19 + 8))(v9, v7);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v18);
}

void sub_10000804C(uint64_t a1, void (*a2)(id))
{
  if (a1)
  {
    uint64_t v3 = a1;
    if ((a1 & 0xC000000000000001) != 0)
    {
      swift_bridgeObjectRetain();
      sub_100015198();
      sub_100011620(0, &qword_10001CD40);
      sub_100011754();
      sub_1000150C8();
      uint64_t v3 = v24;
      uint64_t v22 = v25;
      uint64_t v4 = v26;
      uint64_t v5 = v27;
      unint64_t v6 = v28;
    }
    else
    {
      uint64_t v7 = -1 << *(unsigned char *)(a1 + 32);
      uint64_t v22 = a1 + 56;
      uint64_t v4 = ~v7;
      uint64_t v8 = -v7;
      if (v8 < 64) {
        uint64_t v9 = ~(-1 << v8);
      }
      else {
        uint64_t v9 = -1;
      }
      unint64_t v6 = v9 & *(void *)(a1 + 56);
      swift_bridgeObjectRetain();
      uint64_t v5 = 0;
    }
    int64_t v10 = (unint64_t)(v4 + 64) >> 6;
    if (v3 < 0) {
      goto LABEL_11;
    }
    while (1)
    {
      if (v6)
      {
        uint64_t v11 = (v6 - 1) & v6;
        unint64_t v12 = __clz(__rbit64(v6)) | (v5 << 6);
        uint64_t v13 = v5;
      }
      else
      {
        int64_t v15 = v5 + 1;
        if (__OFADD__(v5, 1))
        {
          __break(1u);
          return;
        }
        if (v15 >= v10) {
          goto LABEL_31;
        }
        unint64_t v16 = *(void *)(v22 + 8 * v15);
        uint64_t v13 = v5 + 1;
        if (!v16)
        {
          uint64_t v13 = v5 + 2;
          if (v5 + 2 >= v10) {
            goto LABEL_31;
          }
          unint64_t v16 = *(void *)(v22 + 8 * v13);
          if (!v16)
          {
            uint64_t v13 = v5 + 3;
            if (v5 + 3 >= v10) {
              goto LABEL_31;
            }
            unint64_t v16 = *(void *)(v22 + 8 * v13);
            if (!v16)
            {
              uint64_t v13 = v5 + 4;
              if (v5 + 4 >= v10) {
                goto LABEL_31;
              }
              unint64_t v16 = *(void *)(v22 + 8 * v13);
              if (!v16)
              {
                uint64_t v17 = v5 + 5;
                while (v10 != v17)
                {
                  unint64_t v16 = *(void *)(v22 + 8 * v17++);
                  if (v16)
                  {
                    uint64_t v13 = v17 - 1;
                    goto LABEL_27;
                  }
                }
LABEL_31:
                sub_100011588();
                swift_beginAccess();
                uint64_t v18 = swift_bridgeObjectRetain();
                uint64_t v19 = sub_100009D94(v18);
                swift_bridgeObjectRelease();
                uint64_t v20 = sub_10000841C((unint64_t)v19);
                swift_release();
                BOOL v21 = sub_100005570();
                sub_10000C62C((unint64_t)v21);
                sub_1000057E4(v20);
                return;
              }
            }
          }
        }
LABEL_27:
        uint64_t v11 = (v16 - 1) & v16;
        unint64_t v12 = __clz(__rbit64(v16)) + (v13 << 6);
      }
      id v14 = *(id *)(*(void *)(v3 + 48) + 8 * v12);
      if (!v14) {
        goto LABEL_31;
      }
      while (1)
      {
        a2(v14);

        uint64_t v5 = v13;
        unint64_t v6 = v11;
        if ((v3 & 0x8000000000000000) == 0) {
          break;
        }
LABEL_11:
        if (sub_1000151C8())
        {
          sub_100011620(0, &qword_10001CD40);
          swift_unknownObjectRetain();
          swift_dynamicCast();
          id v14 = v23;
          swift_unknownObjectRelease();
          uint64_t v13 = v5;
          uint64_t v11 = v6;
          if (v23) {
            continue;
          }
        }
        goto LABEL_31;
      }
    }
  }
}

uint64_t sub_10000841C(unint64_t a1)
{
  sub_1000150E8();
  if (qword_10001CBC0 != -1) {
    swift_once();
  }
  sub_1000114A8(&qword_10001CCF8);
  uint64_t v2 = swift_allocObject();
  *(_OWORD *)(v2 + 16) = xmmword_100016550;
  uint64_t v3 = sub_1000114A8(&qword_10001CD00);
  *(void *)(v2 + 56) = v3;
  uint64_t v4 = sub_100011710((unint64_t *)&qword_10001CD08, &qword_10001CD00);
  *(void *)(v2 + 64) = v4;
  *(void *)(v2 + 32) = _swiftEmptyArrayStorage;
  sub_100014ED8();
  swift_bridgeObjectRelease();
  unint64_t v5 = sub_1000088C0(a1);
  sub_1000150E8();
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_100016550;
  *(void *)(v6 + 56) = v3;
  *(void *)(v6 + 64) = v4;
  *(void *)(v6 + 32) = _swiftEmptyArrayStorage;
  sub_100014ED8();
  swift_bridgeObjectRelease();
  uint64_t v22 = _swiftEmptyArrayStorage;
  if (v5 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100015298();
    swift_bridgeObjectRelease();
    if (v7) {
      goto LABEL_5;
    }
LABEL_16:
    swift_bridgeObjectRelease();
    unint64_t v11 = (unint64_t)_swiftEmptyArrayStorage;
    goto LABEL_17;
  }
  uint64_t v7 = *(void *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v7) {
    goto LABEL_16;
  }
LABEL_5:
  if (v7 < 1)
  {
    __break(1u);
    uint64_t result = swift_release();
    __break(1u);
    return result;
  }
  for (uint64_t i = 0; i != v7; ++i)
  {
    if ((v5 & 0xC000000000000001) != 0) {
      id v9 = (id)sub_100015228();
    }
    else {
      id v9 = *(id *)(v5 + 8 * i + 32);
    }
    int64_t v10 = v9;
    if ([v9 unearned])
    {
    }
    else
    {
      sub_100015248();
      sub_100015268();
      sub_100015278();
      sub_100015258();
    }
  }
  swift_bridgeObjectRelease();
  unint64_t v11 = (unint64_t)v22;
LABEL_17:
  sub_1000150E8();
  uint64_t v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_100016550;
  *(void *)(v12 + 56) = v3;
  *(void *)(v12 + 64) = v4;
  *(void *)(v12 + 32) = _swiftEmptyArrayStorage;
  sub_100014ED8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  if ((v11 & 0x8000000000000000) != 0 || (uint64_t v13 = (void *)v11, (v11 & 0x4000000000000000) != 0))
  {
    uint64_t v13 = sub_100009C9C(v11);
    swift_release();
  }
  uint64_t v22 = v13;
  sub_100009C20((uint64_t *)&v22);
  swift_release();
  unint64_t v14 = (unint64_t)v22;
  int64_t v15 = v21;
  unint64_t v16 = sub_100010948(v14, v15);
  swift_release();

  sub_1000150E8();
  uint64_t v17 = swift_allocObject();
  *(_OWORD *)(v17 + 16) = xmmword_100016550;
  *(void *)(v17 + 56) = v3;
  *(void *)(v17 + 64) = v4;
  *(void *)(v17 + 32) = _swiftEmptyArrayStorage;
  sub_100014ED8();
  swift_bridgeObjectRelease();
  uint64_t v18 = v15;
  unint64_t v19 = sub_100011174((unint64_t)_swiftEmptyArrayStorage, (unint64_t)v16, v18);
  swift_bridgeObjectRelease();

  return v19;
}

void sub_100008838(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3 = [*a1 template];
  id v4 = [v3 uniqueName];

  if (v4)
  {
    uint64_t v5 = sub_100014FB8();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

uint64_t sub_1000088C0(unint64_t a1)
{
  uint64_t v2 = sub_10000909C((uint64_t)&_swiftEmptySetSingleton, a1);
  sub_1000114A8(&qword_10001CCF0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100016550;
  *(void *)(v3 + 56) = sub_1000114A8(&qword_10001CD70);
  *(void *)(v3 + 64) = sub_100011710(&qword_10001CD78, &qword_10001CD70);
  *(void *)(v3 + 32) = v2;
  swift_bridgeObjectRetain();
  sub_1000150E8();
  if (qword_10001CBC0 != -1) {
    swift_once();
  }
  sub_1000114A8(&qword_10001CCF8);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100016550;
  uint64_t v5 = sub_1000114A8(&qword_10001CD00);
  *(void *)(v4 + 56) = v5;
  uint64_t v6 = sub_100011710((unint64_t *)&qword_10001CD08, &qword_10001CD00);
  *(void *)(v4 + 64) = v6;
  *(void *)(v4 + 32) = v3;
  swift_bridgeObjectRetain();
  sub_100014ED8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRetain();
  uint64_t v7 = sub_100010198(v2, a1, (uint64_t)sub_100008838, 0);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_100016550;
  *(void *)(v8 + 56) = sub_1000114A8(&qword_10001CD48);
  *(void *)(v8 + 64) = sub_100011710(&qword_10001CD80, &qword_10001CD48);
  *(void *)(v8 + 32) = v7;
  swift_bridgeObjectRetain();
  sub_1000150E8();
  uint64_t v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_100016550;
  *(void *)(v9 + 56) = v5;
  *(void *)(v9 + 64) = v6;
  *(void *)(v9 + 32) = v8;
  swift_bridgeObjectRetain();
  sub_100014ED8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7;
}

void *sub_100008BA0(uint64_t (*a1)(id *), void *a2, unint64_t a3)
{
  unint64_t v4 = a3;
  unint64_t v19 = _swiftEmptyArrayStorage;
  if (a3 >> 62) {
    goto LABEL_18;
  }
  uint64_t v7 = *(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v7)
  {
    while (1)
    {
      unint64_t v8 = 0;
      uint64_t v16 = v4 & 0xFFFFFFFFFFFFFF8;
      unint64_t v17 = v4 & 0xC000000000000001;
      unint64_t v15 = v4;
      while (v17)
      {
        id v9 = (id)sub_100015228();
LABEL_9:
        int64_t v10 = v9;
        unint64_t v11 = v8 + 1;
        if (__OFADD__(v8, 1)) {
          goto LABEL_17;
        }
        id v18 = v9;
        uint64_t v12 = a2;
        char v13 = a1(&v18);
        if (v3)
        {
          swift_bridgeObjectRelease();

          swift_release();
          return v12;
        }
        if (v13)
        {
          sub_100015248();
          sub_100015268();
          unint64_t v4 = v15;
          sub_100015278();
          sub_100015258();
        }
        else
        {
        }
        ++v8;
        if (v11 == v7)
        {
          uint64_t v12 = v19;
          goto LABEL_20;
        }
      }
      if (v8 < *(void *)(v16 + 16)) {
        break;
      }
      __break(1u);
LABEL_17:
      __break(1u);
LABEL_18:
      uint64_t v7 = sub_100015298();
      if (!v7) {
        goto LABEL_19;
      }
    }
    id v9 = *(id *)(v4 + 8 * v8 + 32);
    goto LABEL_9;
  }
LABEL_19:
  uint64_t v12 = _swiftEmptyArrayStorage;
LABEL_20:
  swift_bridgeObjectRelease();
  return v12;
}

uint64_t sub_100008D4C@<X0>(unint64_t *a1@<X0>, id *a2@<X1>, void *a3@<X2>, unint64_t *a4@<X8>)
{
  id v26 = a3;
  unint64_t v28 = a4;
  uint64_t v6 = sub_100014E18();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = __chkstk_darwin(v6);
  int64_t v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v25 - v11;
  unint64_t v13 = *a1;
  id v14 = *a2;
  id v15 = [*a2 imageFileURL];
  sub_100014E08();

  sub_100014DF8();
  uint64_t v16 = sub_100014DD8();
  uint64_t v18 = v17;
  unint64_t v19 = *(void (**)(char *, uint64_t))(v7 + 8);
  v19(v10, v6);
  v19(v12, v6);
  id v20 = v26;
  swift_bridgeObjectRetain();
  LOBYTE(v15) = sub_100010EB8(v13, v16, v18);

  swift_bridgeObjectRelease();
  if (v15)
  {
    sub_1000114A8(&qword_10001CCF0);
    uint64_t v21 = swift_allocObject();
    long long v27 = xmmword_100016550;
    *(_OWORD *)(v21 + 16) = xmmword_100016550;
    *(void *)(v21 + 56) = &type metadata for String;
    *(void *)(v21 + 64) = sub_100011534();
    *(void *)(v21 + 32) = v16;
    *(void *)(v21 + 40) = v18;
    sub_1000150E8();
    if (qword_10001CBC0 != -1) {
      swift_once();
    }
    sub_1000114A8(&qword_10001CCF8);
    uint64_t v22 = swift_allocObject();
    *(_OWORD *)(v22 + 16) = v27;
    *(void *)(v22 + 56) = sub_1000114A8(&qword_10001CD00);
    *(void *)(v22 + 64) = sub_100011710((unint64_t *)&qword_10001CD08, &qword_10001CD00);
    *(void *)(v22 + 32) = v21;
    swift_bridgeObjectRetain();
    sub_100014ED8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    *unint64_t v28 = v13;
    return swift_bridgeObjectRetain();
  }
  else
  {
    swift_bridgeObjectRelease();
    unint64_t v29 = v13;
    swift_bridgeObjectRetain();
    id v24 = v14;
    sub_100014FE8();
    if (*(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v29 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
      sub_100015028();
    }
    sub_100015048();
    uint64_t result = sub_100015018();
    *unint64_t v28 = v29;
  }
  return result;
}

uint64_t sub_10000909C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    goto LABEL_14;
  }
  uint64_t v4 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  for (; v4; uint64_t v4 = sub_100015298())
  {
    for (uint64_t i = 4; ; ++i)
    {
      id v10 = (a2 & 0xC000000000000001) != 0 ? (id)sub_100015228() : *(id *)(a2 + 8 * i);
      uint64_t v11 = v10;
      uint64_t v12 = i - 3;
      if (__OFADD__(i - 4, 1)) {
        break;
      }
      swift_bridgeObjectRetain();
      id v13 = [v11 template];
      id v14 = [v13 uniqueName];

      if (v14)
      {
        Swift::Int v6 = sub_100014FB8();
        Swift::Int v8 = v7;
      }
      else
      {
        Swift::Int v6 = 0;
        Swift::Int v8 = 0;
      }
      v16[6] = v6;
      v16[7] = v8;
      uint64_t v17 = a1;
      swift_bridgeObjectRetain();
      sub_10000CA98(v16, v6, v8);
      swift_bridgeObjectRelease();
      uint64_t v9 = v17;
      sub_1000114A8(&qword_10001CD88);
      swift_arrayDestroy();
      swift_bridgeObjectRelease();

      a1 = v9;
      if (v12 == v4)
      {
        swift_bridgeObjectRelease();
        return v9;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  swift_bridgeObjectRelease();
  return a1;
}

void *sub_100009334(uint64_t a1)
{
  uint64_t v3 = *(void **)&v1[OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource_resourceProvider];
  id v4 = [v3 stickersBundlePathForAchievement:a1];
  if (!v4) {
    return _swiftEmptyArrayStorage;
  }
  uint64_t v5 = v4;
  sub_100014FB8();

  id v6 = objc_allocWithZone((Class)NSBundle);
  NSString v7 = sub_100014F88();
  swift_bridgeObjectRelease();
  id v8 = [v6 initWithPath:v7];

  if (!v8) {
    return _swiftEmptyArrayStorage;
  }
  id v9 = [v3 stickerURLsForAchievement:a1];
  sub_100014E18();
  sub_1000116C8(&qword_10001CD10, (void (*)(uint64_t))&type metadata accessor for URL);
  sub_1000150A8();

  uint64_t v10 = swift_bridgeObjectRetain();
  uint64_t v11 = sub_100009E90(v10);
  swift_bridgeObjectRelease();
  uint64_t v17 = v11;
  sub_100009B78(&v17);
  swift_bridgeObjectRelease();
  uint64_t v12 = v17;
  id v13 = v1;
  id v14 = v8;
  unint64_t v15 = sub_10000FED4((uint64_t)v12, v14);
  swift_release();

  return (void *)v15;
}

id sub_100009584()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StickerDataSource();
  return [super dealloc];
}

uint64_t type metadata accessor for StickerDataSource()
{
  return self;
}

uint64_t sub_100009688(uint64_t a1, void (*a2)(uint64_t *__return_ptr, uint64_t *), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v12 = a1;
  a2(&v10, &v12);
  char v7 = a5 == 0;
  if (v11)
  {
    if (a5)
    {
      if (v10 == a4 && v11 == a5) {
        char v7 = 1;
      }
      else {
        char v7 = sub_1000152E8();
      }
    }
    else
    {
      char v7 = 0;
    }
    swift_bridgeObjectRelease();
  }
  return v7 & 1;
}

id sub_100009738(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  if (a1)
  {
    uint64_t v25 = a1;
    uint64_t v26 = a2;
    uint64_t v21 = _NSConcreteStackBlock;
    uint64_t v22 = 1107296256;
    uint64_t v23 = sub_100009970;
    id v24 = &unk_100018CD8;
    unint64_t v15 = _Block_copy(&v21);
    swift_release();
    if (a3) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v15 = 0;
    if (a3)
    {
LABEL_3:
      uint64_t v25 = a3;
      uint64_t v26 = a4;
      uint64_t v21 = _NSConcreteStackBlock;
      uint64_t v22 = 1107296256;
      uint64_t v23 = sub_100009970;
      id v24 = &unk_100018CB0;
      uint64_t v16 = _Block_copy(&v21);
      swift_release();
      if (a5) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v17 = 0;
      if (a7) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v18 = 0;
      goto LABEL_10;
    }
  }
  uint64_t v16 = 0;
  if (!a5) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v25 = a5;
  uint64_t v26 = a6;
  uint64_t v21 = _NSConcreteStackBlock;
  uint64_t v22 = 1107296256;
  uint64_t v23 = sub_100009970;
  id v24 = &unk_100018C88;
  uint64_t v17 = _Block_copy(&v21);
  swift_release();
  if (!a7) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v25 = a7;
  uint64_t v26 = a8;
  uint64_t v21 = _NSConcreteStackBlock;
  uint64_t v22 = 1107296256;
  uint64_t v23 = sub_100009970;
  id v24 = &unk_100018C60;
  uint64_t v18 = _Block_copy(&v21);
  swift_release();
LABEL_10:
  id v19 = [v8 initWithInitialAchievementsHandler:v15 newAchievementsHandler:v16 updatedAchievementsHandler:v17 removedAchievementsHandler:v18];
  _Block_release(v18);
  _Block_release(v17);
  _Block_release(v16);
  _Block_release(v15);
  return v19;
}

uint64_t sub_100009970(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  if (a2)
  {
    sub_100011620(0, &qword_10001CD40);
    sub_100011754();
    uint64_t v2 = sub_1000150A8();
  }
  swift_retain();
  v3(v2);
  swift_release();

  return swift_bridgeObjectRelease();
}

id sub_100009A04(uint64_t a1)
{
  uint64_t v2 = v1;
  sub_100014DE8(__stack_chk_guard);
  uint64_t v5 = v4;
  NSString v6 = sub_100014F88();
  swift_bridgeObjectRelease();
  id v15 = 0;
  id v7 = [v2 initWithContentsOfFileURL:v5 localizedDescription:v6 error:&v15];

  id v8 = v15;
  if (v7)
  {
    uint64_t v9 = sub_100014E18();
    uint64_t v10 = *(void (**)(uint64_t, uint64_t))(*(void *)(v9 - 8) + 8);
    id v11 = v8;
    v10(a1, v9);
  }
  else
  {
    id v12 = v15;
    sub_100014DB8();

    swift_willThrow();
    uint64_t v13 = sub_100014E18();
    (*(void (**)(uint64_t, uint64_t))(*(void *)(v13 - 8) + 8))(a1, v13);
  }
  return v7;
}

uint64_t sub_100009B78(void **a1)
{
  uint64_t v2 = *(void *)(sub_100014E18() - 8);
  uint64_t v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v3 = (void *)sub_10000F110(v3);
  }
  uint64_t v4 = v3[2];
  v6[0] = (uint64_t)v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  uint64_t result = sub_10000A198(v6);
  *a1 = v3;
  return result;
}

uint64_t sub_100009C20(uint64_t *a1)
{
  uint64_t v2 = *a1;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v2 = sub_10000F124(v2);
    *a1 = v2;
  }
  uint64_t v4 = *(void *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_10000AE60(v6);
  return sub_100015258();
}

void *sub_100009C9C(unint64_t a1)
{
  unint64_t v1 = a1;
  if (a1 >> 62) {
    goto LABEL_10;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
  while (1)
  {
    if (v2 <= 0)
    {
      uint64_t v3 = _swiftEmptyArrayStorage;
    }
    else
    {
      sub_1000114A8(&qword_10001CD38);
      uint64_t v3 = (void *)swift_allocObject();
      int64_t v4 = j__malloc_size(v3);
      uint64_t v5 = v4 - 32;
      if (v4 < 32) {
        uint64_t v5 = v4 - 25;
      }
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_10000ED1C((uint64_t)(v3 + 4), v2, v1);
    unint64_t v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2) {
      break;
    }
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    uint64_t v2 = sub_100015298();
    swift_bridgeObjectRelease();
    if (!v2) {
      return _swiftEmptyArrayStorage;
    }
  }
  return v3;
}

void *sub_100009D94(uint64_t a1)
{
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v2 = sub_1000151A8();
    if (v2) {
      goto LABEL_3;
    }
    return _swiftEmptyArrayStorage;
  }
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return _swiftEmptyArrayStorage;
  }
LABEL_3:
  if (v2 <= 0)
  {
    uint64_t v3 = _swiftEmptyArrayStorage;
  }
  else
  {
    sub_1000114A8(&qword_10001CD38);
    uint64_t v3 = (void *)swift_allocObject();
    int64_t v4 = j__malloc_size(v3);
    uint64_t v5 = v4 - 32;
    if (v4 < 32) {
      uint64_t v5 = v4 - 25;
    }
    v3[2] = v2;
    v3[3] = (2 * (v5 >> 3)) | 1;
  }
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_10000F138(&v8, v3 + 4, v2, a1);
  uint64_t result = (void *)sub_100011588();
  if (v6 == (void *)v2) {
    return v3;
  }
  __break(1u);
  return result;
}

void *sub_100009E90(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (!v1) {
    return _swiftEmptyArrayStorage;
  }
  sub_1000114A8(&qword_10001CD28);
  uint64_t v3 = *(void *)(sub_100014E18() - 8);
  uint64_t v4 = *(void *)(v3 + 72);
  unint64_t v5 = (*(unsigned __int8 *)(v3 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  unint64_t v6 = (void *)swift_allocObject();
  uint64_t result = (void *)j__malloc_size(v6);
  if (v4)
  {
    if ((void *)((char *)result - v5) != (void *)0x8000000000000000 || v4 != -1)
    {
      uint64_t v6[2] = v1;
      v6[3] = 2 * ((uint64_t)((uint64_t)result - v5) / v4);
      swift_bridgeObjectRetain();
      uint64_t v9 = sub_10000F444(&v10, (char *)v6 + v5, v1, a1);
      sub_100011588();
      if (v9 == v1) {
        return v6;
      }
      __break(1u);
      return _swiftEmptyArrayStorage;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

size_t sub_100009FC4(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  if (!v9)
  {
    uint64_t v13 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_1000114A8(&qword_10001CD28);
  uint64_t v10 = *(void *)(sub_100014E18() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  uint64_t result = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_100014E18() - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

uint64_t sub_10000A198(uint64_t *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_100014E18();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  v151 = (char *)&v143 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  v163 = (char *)&v143 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  v166 = (char *)&v143 - v11;
  uint64_t v12 = __chkstk_darwin(v10);
  v165 = (char *)&v143 - v13;
  uint64_t v14 = __chkstk_darwin(v12);
  v146 = (char *)&v143 - v15;
  uint64_t v16 = __chkstk_darwin(v14);
  v153 = (char *)&v143 - v17;
  uint64_t v18 = __chkstk_darwin(v16);
  v149 = (char *)&v143 - v19;
  __chkstk_darwin(v18);
  v148 = (char *)&v143 - v20;
  v168 = a1;
  Swift::Int v21 = a1[1];
  uint64_t result = sub_1000152D8(v21);
  if (result >= v21)
  {
    if (v21 < 0) {
      goto LABEL_152;
    }
    if (v21) {
      return sub_10000B604(0, v21, 1, v168);
    }
    return result;
  }
  if (v21 >= 0) {
    uint64_t v23 = v21;
  }
  else {
    uint64_t v23 = v21 + 1;
  }
  if (v21 < -1) {
    goto LABEL_151;
  }
  uint64_t v144 = result;
  if (v21 > 1)
  {
    uint64_t v24 = v23 >> 1;
    uint64_t result = sub_100015038();
    *(void *)(result + 16) = v24;
    uint64_t v25 = v5;
    unint64_t v26 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    v143 = (void *)result;
    unint64_t v154 = result + v26;
LABEL_12:
    Swift::Int v28 = 0;
    v159 = (void (**)(char *, uint64_t))(v25 + 8);
    uint64_t v160 = v25 + 16;
    v164 = (char **)(v25 + 32);
    long long v27 = _swiftEmptyArrayStorage;
    uint64_t v155 = v25;
    uint64_t v162 = v4;
    while (1)
    {
      Swift::Int v30 = v28;
      Swift::Int v31 = v28 + 1;
      Swift::Int v152 = v28;
      if (v28 + 1 >= v21)
      {
        Swift::Int v39 = v28 + 1;
        goto LABEL_69;
      }
      Swift::Int v161 = v21;
      v147 = v27;
      uint64_t v32 = *v168;
      uint64_t v33 = *(void *)(v25 + 72);
      uint64_t v34 = *(void (**)(char *, uint64_t, uint64_t))(v25 + 16);
      v34(v148, *v168 + v33 * v31, v4);
      v156 = (char *)v32;
      uint64_t v167 = v33;
      v34(v149, v32 + v33 * v30, v4);
      uint64_t v35 = sub_100014DC8();
      uint64_t v37 = v36;
      if (v35 == sub_100014DC8() && v37 == v38) {
        LODWORD(v158) = 0;
      }
      else {
        LODWORD(v158) = sub_1000152E8();
      }
      uint64_t v40 = v146;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v41 = *v159;
      uint64_t v42 = v162;
      (*v159)(v149, v162);
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v41)(v148, v42);
      Swift::Int v39 = v152 + 2;
      if (v152 + 2 >= v161)
      {
        uint64_t v54 = v155;
      }
      else
      {
        uint64_t v145 = v2;
        uint64_t v157 = v167 * v31;
        uint64_t v43 = v156;
        uint64_t v44 = v167 * v39;
        while (1)
        {
          Swift::Int v45 = v39;
          uint64_t v46 = v162;
          v34(v153, (uint64_t)&v43[v44], v162);
          v34(v40, (uint64_t)&v43[v157], v46);
          uint64_t v47 = sub_100014DC8();
          uint64_t v49 = v48;
          if (v47 == sub_100014DC8() && v49 == v50) {
            int v51 = 0;
          }
          else {
            int v51 = sub_1000152E8();
          }
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          uint64_t v52 = v162;
          v41(v40, v162);
          uint64_t result = ((uint64_t (*)(char *, uint64_t))v41)(v153, v52);
          if ((v158 ^ v51)) {
            break;
          }
          Swift::Int v39 = v45 + 1;
          v43 += v167;
          if (v161 == v45 + 1)
          {
            Swift::Int v53 = v161;
            Swift::Int v39 = v161;
            uint64_t v2 = v145;
            uint64_t v54 = v155;
            goto LABEL_33;
          }
        }
        uint64_t v2 = v145;
        uint64_t v54 = v155;
        Swift::Int v39 = v45;
      }
      Swift::Int v53 = v161;
LABEL_33:
      long long v27 = v147;
      Swift::Int v30 = v152;
      v55 = v156;
      if ((v158 & 1) == 0) {
        goto LABEL_46;
      }
      if (v39 < v152) {
        goto LABEL_153;
      }
      if (v152 < v39)
      {
        uint64_t v145 = v2;
        uint64_t v56 = 0;
        uint64_t v57 = v167 * (v39 - 1);
        uint64_t v58 = v39 * v167;
        Swift::Int v59 = v152;
        uint64_t v60 = v152 * v167;
        do
        {
          if (v59 != v39 + v56 - 1)
          {
            if (!v55) {
              goto LABEL_158;
            }
            v62 = &v55[v57];
            v158 = *v164;
            ((void (*)(char *, char *, uint64_t))v158)(v151, &v55[v60], v162);
            if (v60 < v57 || &v55[v60] >= &v55[v58])
            {
              uint64_t v61 = v162;
              swift_arrayInitWithTakeFrontToBack();
            }
            else
            {
              uint64_t v61 = v162;
              if (v60 != v57) {
                swift_arrayInitWithTakeBackToFront();
              }
            }
            uint64_t result = ((uint64_t (*)(char *, char *, uint64_t))v158)(v62, v151, v61);
            uint64_t v54 = v155;
            v55 = v156;
          }
          ++v59;
          --v56;
          v57 -= v167;
          v58 -= v167;
          v60 += v167;
        }
        while (v59 < v39 + v56);
        uint64_t v2 = v145;
        Swift::Int v53 = v161;
        uint64_t v63 = v162;
        long long v27 = v147;
        Swift::Int v30 = v152;
        if (v39 >= v161) {
          goto LABEL_69;
        }
      }
      else
      {
LABEL_46:
        uint64_t v63 = v162;
        if (v39 >= v53) {
          goto LABEL_69;
        }
      }
      if (__OFSUB__(v39, v30)) {
        goto LABEL_150;
      }
      if (v39 - v30 < v144)
      {
        if (__OFADD__(v30, v144)) {
          goto LABEL_154;
        }
        if (v30 + v144 >= v53) {
          Swift::Int v64 = v53;
        }
        else {
          Swift::Int v64 = v30 + v144;
        }
        if (v64 < v30)
        {
LABEL_155:
          __break(1u);
LABEL_156:
          __break(1u);
LABEL_157:
          __break(1u);
LABEL_158:
          __break(1u);
LABEL_159:
          __break(1u);
          return result;
        }
        if (v39 != v64)
        {
          v147 = v27;
          uint64_t v145 = v2;
          uint64_t v65 = *(void *)(v54 + 72);
          v156 = *(char **)(v54 + 16);
          uint64_t v157 = v65;
          uint64_t v167 = v65 * (v39 - 1);
          Swift::Int v66 = v39 * v65;
          Swift::Int v150 = v64;
          do
          {
            uint64_t v69 = 0;
            Swift::Int v70 = v30;
            Swift::Int v161 = v39;
            v158 = (char *)v66;
            while (1)
            {
              uint64_t v71 = *v168;
              uint64_t v72 = v66 + v69 + *v168;
              v73 = v156;
              ((void (*)(char *, uint64_t, uint64_t))v156)(v165, v72, v63);
              ((void (*)(char *, uint64_t, uint64_t))v73)(v166, v167 + v69 + v71, v63);
              uint64_t v74 = sub_100014DC8();
              uint64_t v76 = v75;
              if (v74 == sub_100014DC8() && v76 == v77) {
                break;
              }
              char v78 = sub_1000152E8();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v79 = *v159;
              uint64_t v63 = v162;
              (*v159)(v166, v162);
              uint64_t result = ((uint64_t (*)(char *, uint64_t))v79)(v165, v63);
              if ((v78 & 1) == 0) {
                goto LABEL_59;
              }
              uint64_t v80 = *v168;
              Swift::Int v66 = (Swift::Int)v158;
              if (!*v168) {
                goto LABEL_156;
              }
              uint64_t v81 = v80 + v167 + v69;
              v82 = *v164;
              ((void (*)(char *, char *, uint64_t))*v164)(v163, &v158[v80 + v69], v63);
              swift_arrayInitWithTakeFrontToBack();
              uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v82)(v81, v163, v63);
              v69 -= v157;
              ++v70;
              Swift::Int v68 = v161;
              if (v161 == v70) {
                goto LABEL_60;
              }
            }
            swift_bridgeObjectRelease_n();
            v67 = *v159;
            uint64_t v63 = v162;
            (*v159)(v166, v162);
            uint64_t result = ((uint64_t (*)(char *, uint64_t))v67)(v165, v63);
LABEL_59:
            Swift::Int v68 = v161;
            Swift::Int v66 = (Swift::Int)v158;
LABEL_60:
            Swift::Int v39 = v68 + 1;
            v167 += v157;
            v66 += v157;
            Swift::Int v30 = v152;
          }
          while (v39 != v150);
          Swift::Int v39 = v150;
          uint64_t v2 = v145;
          long long v27 = v147;
        }
      }
LABEL_69:
      if (v39 < v30) {
        goto LABEL_145;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_10000C438(0, v27[2] + 1, 1, (char *)v27);
        long long v27 = (void *)result;
      }
      unint64_t v84 = v27[2];
      unint64_t v83 = v27[3];
      unint64_t v29 = v84 + 1;
      uint64_t v25 = v155;
      Swift::Int v161 = v39;
      if (v84 >= v83 >> 1)
      {
        uint64_t result = (uint64_t)sub_10000C438((char *)(v83 > 1), v84 + 1, 1, (char *)v27);
        uint64_t v25 = v155;
        long long v27 = (void *)result;
      }
      v27[2] = v29;
      v85 = (char *)(v27 + 4);
      v86 = &v27[2 * v84 + 4];
      Swift::Int v87 = v161;
      Swift::Int *v86 = v30;
      v86[1] = v87;
      if (v84)
      {
        while (1)
        {
          unint64_t v88 = v29 - 1;
          if (v29 >= 4)
          {
            v93 = &v85[16 * v29];
            uint64_t v94 = *((void *)v93 - 8);
            uint64_t v95 = *((void *)v93 - 7);
            BOOL v99 = __OFSUB__(v95, v94);
            uint64_t v96 = v95 - v94;
            if (v99) {
              goto LABEL_134;
            }
            uint64_t v98 = *((void *)v93 - 6);
            uint64_t v97 = *((void *)v93 - 5);
            BOOL v99 = __OFSUB__(v97, v98);
            uint64_t v91 = v97 - v98;
            char v92 = v99;
            if (v99) {
              goto LABEL_135;
            }
            unint64_t v100 = v29 - 2;
            v101 = &v85[16 * v29 - 32];
            uint64_t v103 = *(void *)v101;
            uint64_t v102 = *((void *)v101 + 1);
            BOOL v99 = __OFSUB__(v102, v103);
            uint64_t v104 = v102 - v103;
            if (v99) {
              goto LABEL_136;
            }
            BOOL v99 = __OFADD__(v91, v104);
            uint64_t v105 = v91 + v104;
            if (v99) {
              goto LABEL_138;
            }
            if (v105 >= v96)
            {
              v123 = &v85[16 * v88];
              uint64_t v125 = *(void *)v123;
              uint64_t v124 = *((void *)v123 + 1);
              BOOL v99 = __OFSUB__(v124, v125);
              uint64_t v126 = v124 - v125;
              if (v99) {
                goto LABEL_144;
              }
              BOOL v116 = v91 < v126;
              goto LABEL_106;
            }
          }
          else
          {
            if (v29 != 3)
            {
              uint64_t v117 = v27[4];
              uint64_t v118 = v27[5];
              BOOL v99 = __OFSUB__(v118, v117);
              uint64_t v110 = v118 - v117;
              char v111 = v99;
              goto LABEL_100;
            }
            uint64_t v90 = v27[4];
            uint64_t v89 = v27[5];
            BOOL v99 = __OFSUB__(v89, v90);
            uint64_t v91 = v89 - v90;
            char v92 = v99;
          }
          if (v92) {
            goto LABEL_137;
          }
          unint64_t v100 = v29 - 2;
          v106 = &v85[16 * v29 - 32];
          uint64_t v108 = *(void *)v106;
          uint64_t v107 = *((void *)v106 + 1);
          BOOL v109 = __OFSUB__(v107, v108);
          uint64_t v110 = v107 - v108;
          char v111 = v109;
          if (v109) {
            goto LABEL_139;
          }
          v112 = &v85[16 * v88];
          uint64_t v114 = *(void *)v112;
          uint64_t v113 = *((void *)v112 + 1);
          BOOL v99 = __OFSUB__(v113, v114);
          uint64_t v115 = v113 - v114;
          if (v99) {
            goto LABEL_141;
          }
          if (__OFADD__(v110, v115)) {
            goto LABEL_143;
          }
          if (v110 + v115 >= v91)
          {
            BOOL v116 = v91 < v115;
LABEL_106:
            if (v116) {
              unint64_t v88 = v100;
            }
            goto LABEL_108;
          }
LABEL_100:
          if (v111) {
            goto LABEL_140;
          }
          v119 = &v85[16 * v88];
          uint64_t v121 = *(void *)v119;
          uint64_t v120 = *((void *)v119 + 1);
          BOOL v99 = __OFSUB__(v120, v121);
          uint64_t v122 = v120 - v121;
          if (v99) {
            goto LABEL_142;
          }
          if (v122 < v110) {
            goto LABEL_14;
          }
LABEL_108:
          unint64_t v127 = v88 - 1;
          if (v88 - 1 >= v29)
          {
            __break(1u);
LABEL_131:
            __break(1u);
LABEL_132:
            __break(1u);
LABEL_133:
            __break(1u);
LABEL_134:
            __break(1u);
LABEL_135:
            __break(1u);
LABEL_136:
            __break(1u);
LABEL_137:
            __break(1u);
LABEL_138:
            __break(1u);
LABEL_139:
            __break(1u);
LABEL_140:
            __break(1u);
LABEL_141:
            __break(1u);
LABEL_142:
            __break(1u);
LABEL_143:
            __break(1u);
LABEL_144:
            __break(1u);
LABEL_145:
            __break(1u);
LABEL_146:
            __break(1u);
LABEL_147:
            __break(1u);
LABEL_148:
            __break(1u);
LABEL_149:
            __break(1u);
LABEL_150:
            __break(1u);
LABEL_151:
            __break(1u);
LABEL_152:
            __break(1u);
LABEL_153:
            __break(1u);
LABEL_154:
            __break(1u);
            goto LABEL_155;
          }
          if (!*v168) {
            goto LABEL_157;
          }
          v128 = v27;
          v129 = &v85[16 * v127];
          uint64_t v130 = *(void *)v129;
          v131 = &v85[16 * v88];
          uint64_t v132 = *((void *)v131 + 1);
          uint64_t result = sub_10000BA88(*v168 + *(void *)(v25 + 72) * *(void *)v129, *v168 + *(void *)(v25 + 72) * *(void *)v131, *v168 + *(void *)(v25 + 72) * v132, v154);
          if (v2) {
            goto LABEL_128;
          }
          if (v132 < v130) {
            goto LABEL_131;
          }
          if (v88 > v128[2]) {
            goto LABEL_132;
          }
          *(void *)v129 = v130;
          *(void *)&v85[16 * v127 + 8] = v132;
          unint64_t v133 = v128[2];
          if (v88 >= v133) {
            goto LABEL_133;
          }
          long long v27 = v128;
          unint64_t v29 = v133 - 1;
          uint64_t result = (uint64_t)memmove(&v85[16 * v88], v131 + 16, 16 * (v133 - 1 - v88));
          v128[2] = v133 - 1;
          uint64_t v25 = v155;
          if (v133 <= 2) {
            goto LABEL_14;
          }
        }
      }
      unint64_t v29 = 1;
LABEL_14:
      Swift::Int v21 = v168[1];
      Swift::Int v28 = v161;
      uint64_t v4 = v162;
      if (v161 >= v21) {
        goto LABEL_117;
      }
    }
  }
  uint64_t v25 = v5;
  long long v27 = _swiftEmptyArrayStorage;
  unint64_t v154 = (unint64_t)_swiftEmptyArrayStorage
       + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
  v143 = _swiftEmptyArrayStorage;
  if (v21 == 1) {
    goto LABEL_12;
  }
  unint64_t v29 = _swiftEmptyArrayStorage[2];
LABEL_117:
  if (v29 >= 2)
  {
    uint64_t v134 = *v168;
    do
    {
      unint64_t v135 = v29 - 2;
      if (v29 < 2) {
        goto LABEL_146;
      }
      if (!v134) {
        goto LABEL_159;
      }
      uint64_t v136 = (uint64_t)v27;
      v137 = (char *)(v27 + 4);
      uint64_t v138 = v27[2 * v135 + 4];
      uint64_t v139 = v27[2 * v29 + 3];
      uint64_t v140 = v25;
      uint64_t result = sub_10000BA88(v134 + *(void *)(v25 + 72) * v138, v134 + *(void *)(v25 + 72) * *(void *)&v137[16 * v29 - 16], v134 + *(void *)(v25 + 72) * v139, v154);
      if (v2) {
        break;
      }
      if (v139 < v138) {
        goto LABEL_147;
      }
      uint64_t result = swift_isUniquelyReferenced_nonNull_native();
      if ((result & 1) == 0)
      {
        uint64_t result = (uint64_t)sub_10000C618(v136);
        uint64_t v136 = result;
      }
      if (v135 >= *(void *)(v136 + 16)) {
        goto LABEL_148;
      }
      v141 = (void *)(v136 + 32 + 16 * v135);
      void *v141 = v138;
      v141[1] = v139;
      unint64_t v142 = *(void *)(v136 + 16);
      if (v29 > v142) {
        goto LABEL_149;
      }
      long long v27 = (void *)v136;
      uint64_t result = (uint64_t)memmove((void *)(v136 + 32 + 16 * (v29 - 1)), (const void *)(v136 + 32 + 16 * v29), 16 * (v142 - v29));
      *(void *)(v136 + 16) = v142 - 1;
      unint64_t v29 = v142 - 1;
      uint64_t v25 = v140;
    }
    while (v142 > 2);
  }
LABEL_128:
  swift_bridgeObjectRelease();
  v143[2] = 0;
  return swift_bridgeObjectRelease();
}

void sub_10000AE60(uint64_t *a1)
{
  Swift::Int v3 = a1[1];
  Swift::Int v4 = sub_1000152D8(v3);
  if (v4 >= v3)
  {
    if (v3 < 0) {
      goto LABEL_132;
    }
    if (v3) {
      sub_10000B950(0, v3, 1, a1);
    }
    return;
  }
  if (v3 >= 0) {
    uint64_t v5 = v3;
  }
  else {
    uint64_t v5 = v3 + 1;
  }
  if (v3 < -1) {
    goto LABEL_131;
  }
  Swift::Int v102 = v4;
  BOOL v99 = a1;
  if (v3 > 1)
  {
    uint64_t v6 = v5 >> 1;
    sub_100011620(0, &qword_10001CD40);
    uint64_t v7 = sub_100015038();
    *(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) = v6;
    char v111 = (void **)((v7 & 0xFFFFFFFFFFFFFF8) + 32);
    uint64_t v113 = v7;
LABEL_12:
    Swift::Int v9 = 0;
    uint64_t v10 = *a1;
    uint64_t v100 = *a1 - 8;
    uint64_t v101 = *a1 + 16;
    uint64_t v8 = (char *)_swiftEmptyArrayStorage;
    Swift::Int v107 = v3;
    uint64_t v112 = *a1;
    while (1)
    {
      Swift::Int v12 = v9++;
      Swift::Int v108 = v12;
      if (v9 < v3)
      {
        uint64_t v103 = v8;
        uint64_t v13 = *(void **)(v10 + 8 * v12);
        id v14 = *(id *)(v10 + 8 * v9);
        id v15 = v13;
        id v16 = [v14 template];
        id v109 = [v16 displayOrder];

        id v17 = [v15 template];
        id v105 = [v17 displayOrder];

        Swift::Int v9 = v12 + 2;
        if (v12 + 2 < v3)
        {
          uint64_t v18 = (id *)(v101 + 8 * v12);
          while (1)
          {
            uint64_t v19 = *(v18 - 1);
            id v20 = *v18;
            id v21 = v19;
            id v22 = [v20 template];
            id v23 = [v22 displayOrder];

            id v24 = [v21 template];
            id v25 = [v24 displayOrder];

            if (v105 < v109 == v25 >= v23) {
              break;
            }
            ++v9;
            ++v18;
            Swift::Int v3 = v107;
            if (v107 == v9)
            {
              Swift::Int v9 = v107;
              goto LABEL_22;
            }
          }
          Swift::Int v3 = v107;
LABEL_22:
          Swift::Int v12 = v108;
        }
        uint64_t v8 = v103;
        uint64_t v10 = v112;
        if (v105 < v109)
        {
          if (v9 < v12) {
            goto LABEL_133;
          }
          if (v12 < v9)
          {
            unint64_t v26 = (uint64_t *)(v100 + 8 * v9);
            Swift::Int v27 = v9;
            Swift::Int v28 = v12;
            unint64_t v29 = (uint64_t *)(v112 + 8 * v12);
            do
            {
              if (v28 != --v27)
              {
                if (!v112) {
                  goto LABEL_138;
                }
                uint64_t v30 = *v29;
                *unint64_t v29 = *v26;
                *unint64_t v26 = v30;
              }
              ++v28;
              --v26;
              ++v29;
            }
            while (v28 < v27);
          }
        }
      }
      if (v9 < v3)
      {
        if (__OFSUB__(v9, v12)) {
          goto LABEL_130;
        }
        if (v9 - v12 < v102)
        {
          if (__OFADD__(v12, v102)) {
            goto LABEL_134;
          }
          if (v12 + v102 >= v3) {
            Swift::Int v31 = v3;
          }
          else {
            Swift::Int v31 = v12 + v102;
          }
          if (v31 < v12)
          {
LABEL_135:
            __break(1u);
LABEL_136:
            __break(1u);
LABEL_137:
            __break(1u);
LABEL_138:
            __break(1u);
LABEL_139:
            __break(1u);
            return;
          }
          if (v9 != v31)
          {
            uint64_t v104 = v8;
            Swift::Int v106 = v31;
            uint64_t v32 = v100 + 8 * v9;
            do
            {
              uint64_t v33 = *(void **)(v10 + 8 * v9);
              Swift::Int v34 = v12;
              uint64_t v110 = v32;
              while (1)
              {
                uint64_t v35 = *(void **)v32;
                id v36 = v33;
                id v37 = v35;
                id v38 = [v36 template];
                id v39 = [v38 displayOrder];

                id v40 = [v37 template];
                id v41 = [v40 displayOrder];

                if (v41 >= v39) {
                  break;
                }
                uint64_t v10 = v112;
                if (!v112) {
                  goto LABEL_136;
                }
                uint64_t v42 = *(void **)v32;
                uint64_t v33 = *(void **)(v32 + 8);
                *(void *)uint64_t v32 = v33;
                *(void *)(v32 + 8) = v42;
                v32 -= 8;
                if (v9 == ++v34) {
                  goto LABEL_42;
                }
              }
              uint64_t v10 = v112;
LABEL_42:
              ++v9;
              Swift::Int v12 = v108;
              uint64_t v32 = v110 + 8;
            }
            while (v9 != v106);
            Swift::Int v9 = v106;
            uint64_t v8 = v104;
          }
        }
      }
      if (v9 < v12) {
        goto LABEL_125;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v8 = sub_10000C438(0, *((void *)v8 + 2) + 1, 1, v8);
      }
      unint64_t v44 = *((void *)v8 + 2);
      unint64_t v43 = *((void *)v8 + 3);
      unint64_t v11 = v44 + 1;
      uint64_t v10 = v112;
      if (v44 >= v43 >> 1)
      {
        char v92 = sub_10000C438((char *)(v43 > 1), v44 + 1, 1, v8);
        uint64_t v10 = v112;
        uint64_t v8 = v92;
      }
      *((void *)v8 + 2) = v11;
      Swift::Int v45 = v8 + 32;
      uint64_t v46 = &v8[16 * v44 + 32];
      *(void *)uint64_t v46 = v12;
      *((void *)v46 + 1) = v9;
      if (v44)
      {
        while (1)
        {
          unint64_t v47 = v11 - 1;
          if (v11 >= 4)
          {
            uint64_t v52 = &v45[16 * v11];
            uint64_t v53 = *((void *)v52 - 8);
            uint64_t v54 = *((void *)v52 - 7);
            BOOL v58 = __OFSUB__(v54, v53);
            uint64_t v55 = v54 - v53;
            if (v58) {
              goto LABEL_114;
            }
            uint64_t v57 = *((void *)v52 - 6);
            uint64_t v56 = *((void *)v52 - 5);
            BOOL v58 = __OFSUB__(v56, v57);
            uint64_t v50 = v56 - v57;
            char v51 = v58;
            if (v58) {
              goto LABEL_115;
            }
            unint64_t v59 = v11 - 2;
            uint64_t v60 = &v45[16 * v11 - 32];
            uint64_t v62 = *(void *)v60;
            uint64_t v61 = *((void *)v60 + 1);
            BOOL v58 = __OFSUB__(v61, v62);
            uint64_t v63 = v61 - v62;
            if (v58) {
              goto LABEL_116;
            }
            BOOL v58 = __OFADD__(v50, v63);
            uint64_t v64 = v50 + v63;
            if (v58) {
              goto LABEL_118;
            }
            if (v64 >= v55)
            {
              v82 = &v45[16 * v47];
              uint64_t v84 = *(void *)v82;
              uint64_t v83 = *((void *)v82 + 1);
              BOOL v58 = __OFSUB__(v83, v84);
              uint64_t v85 = v83 - v84;
              if (v58) {
                goto LABEL_124;
              }
              BOOL v75 = v50 < v85;
              goto LABEL_86;
            }
          }
          else
          {
            if (v11 != 3)
            {
              uint64_t v76 = *((void *)v8 + 4);
              uint64_t v77 = *((void *)v8 + 5);
              BOOL v58 = __OFSUB__(v77, v76);
              uint64_t v69 = v77 - v76;
              char v70 = v58;
              goto LABEL_80;
            }
            uint64_t v49 = *((void *)v8 + 4);
            uint64_t v48 = *((void *)v8 + 5);
            BOOL v58 = __OFSUB__(v48, v49);
            uint64_t v50 = v48 - v49;
            char v51 = v58;
          }
          if (v51) {
            goto LABEL_117;
          }
          unint64_t v59 = v11 - 2;
          uint64_t v65 = &v45[16 * v11 - 32];
          uint64_t v67 = *(void *)v65;
          uint64_t v66 = *((void *)v65 + 1);
          BOOL v68 = __OFSUB__(v66, v67);
          uint64_t v69 = v66 - v67;
          char v70 = v68;
          if (v68) {
            goto LABEL_119;
          }
          uint64_t v71 = &v45[16 * v47];
          uint64_t v73 = *(void *)v71;
          uint64_t v72 = *((void *)v71 + 1);
          BOOL v58 = __OFSUB__(v72, v73);
          uint64_t v74 = v72 - v73;
          if (v58) {
            goto LABEL_121;
          }
          if (__OFADD__(v69, v74)) {
            goto LABEL_123;
          }
          if (v69 + v74 >= v50)
          {
            BOOL v75 = v50 < v74;
LABEL_86:
            if (v75) {
              unint64_t v47 = v59;
            }
            goto LABEL_88;
          }
LABEL_80:
          if (v70) {
            goto LABEL_120;
          }
          char v78 = &v45[16 * v47];
          uint64_t v80 = *(void *)v78;
          uint64_t v79 = *((void *)v78 + 1);
          BOOL v58 = __OFSUB__(v79, v80);
          uint64_t v81 = v79 - v80;
          if (v58) {
            goto LABEL_122;
          }
          if (v81 < v69) {
            goto LABEL_14;
          }
LABEL_88:
          unint64_t v86 = v47 - 1;
          if (v47 - 1 >= v11)
          {
            __break(1u);
LABEL_111:
            __break(1u);
LABEL_112:
            __break(1u);
LABEL_113:
            __break(1u);
LABEL_114:
            __break(1u);
LABEL_115:
            __break(1u);
LABEL_116:
            __break(1u);
LABEL_117:
            __break(1u);
LABEL_118:
            __break(1u);
LABEL_119:
            __break(1u);
LABEL_120:
            __break(1u);
LABEL_121:
            __break(1u);
LABEL_122:
            __break(1u);
LABEL_123:
            __break(1u);
LABEL_124:
            __break(1u);
LABEL_125:
            __break(1u);
LABEL_126:
            __break(1u);
LABEL_127:
            __break(1u);
LABEL_128:
            __break(1u);
LABEL_129:
            __break(1u);
LABEL_130:
            __break(1u);
LABEL_131:
            __break(1u);
LABEL_132:
            __break(1u);
LABEL_133:
            __break(1u);
LABEL_134:
            __break(1u);
            goto LABEL_135;
          }
          if (!v10) {
            goto LABEL_137;
          }
          Swift::Int v87 = &v45[16 * v86];
          uint64_t v88 = *(void *)v87;
          uint64_t v89 = &v45[16 * v47];
          uint64_t v90 = *((void *)v89 + 1);
          sub_10000C0E4((void **)(v10 + 8 * *(void *)v87), (id *)(v10 + 8 * *(void *)v89), v10 + 8 * v90, v111);
          if (v1) {
            goto LABEL_108;
          }
          if (v90 < v88) {
            goto LABEL_111;
          }
          if (v47 > *((void *)v8 + 2)) {
            goto LABEL_112;
          }
          *(void *)Swift::Int v87 = v88;
          *(void *)&v45[16 * v86 + 8] = v90;
          unint64_t v91 = *((void *)v8 + 2);
          if (v47 >= v91) {
            goto LABEL_113;
          }
          unint64_t v11 = v91 - 1;
          memmove(&v45[16 * v47], v89 + 16, 16 * (v91 - 1 - v47));
          *((void *)v8 + 2) = v91 - 1;
          uint64_t v10 = v112;
          if (v91 <= 2) {
            goto LABEL_14;
          }
        }
      }
      unint64_t v11 = 1;
LABEL_14:
      Swift::Int v3 = v107;
      if (v9 >= v107) {
        goto LABEL_97;
      }
    }
  }
  uint64_t v8 = (char *)_swiftEmptyArrayStorage;
  uint64_t v113 = (uint64_t)_swiftEmptyArrayStorage;
  char v111 = (void **)(((unint64_t)_swiftEmptyArrayStorage & 0xFFFFFFFFFFFFFF8) + 32);
  if (v3 == 1) {
    goto LABEL_12;
  }
  unint64_t v11 = _swiftEmptyArrayStorage[2];
LABEL_97:
  if (v11 >= 2)
  {
    uint64_t v93 = *v99;
    do
    {
      unint64_t v94 = v11 - 2;
      if (v11 < 2) {
        goto LABEL_126;
      }
      if (!v93) {
        goto LABEL_139;
      }
      uint64_t v95 = *(void *)&v8[16 * v94 + 32];
      uint64_t v96 = *(void *)&v8[16 * v11 + 24];
      sub_10000C0E4((void **)(v93 + 8 * v95), (id *)(v93 + 8 * *(void *)&v8[16 * v11 + 16]), v93 + 8 * v96, v111);
      if (v1) {
        break;
      }
      if (v96 < v95) {
        goto LABEL_127;
      }
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v8 = sub_10000C618((uint64_t)v8);
      }
      if (v94 >= *((void *)v8 + 2)) {
        goto LABEL_128;
      }
      uint64_t v97 = &v8[16 * v94 + 32];
      *(void *)uint64_t v97 = v95;
      *((void *)v97 + 1) = v96;
      unint64_t v98 = *((void *)v8 + 2);
      if (v11 > v98) {
        goto LABEL_129;
      }
      memmove(&v8[16 * v11 + 16], &v8[16 * v11 + 32], 16 * (v98 - v11));
      *((void *)v8 + 2) = v98 - 1;
      unint64_t v11 = v98 - 1;
    }
    while (v98 > 2);
  }
LABEL_108:
  swift_bridgeObjectRelease();
  *(void *)((v113 & 0xFFFFFFFFFFFFFF8) + 0x10) = 0;
  sub_100015018();
  swift_bridgeObjectRelease();
}

uint64_t sub_10000B604(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v46 = a4;
  uint64_t v34 = a1;
  uint64_t v6 = sub_100014E18();
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  unint64_t v44 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __chkstk_darwin(v7);
  uint64_t v48 = (char *)&v32 - v10;
  uint64_t result = __chkstk_darwin(v9);
  unint64_t v47 = (char *)&v32 - v13;
  uint64_t v42 = a3;
  uint64_t v33 = a2;
  if (a3 != a2)
  {
    id v37 = *(void (**)(char *, uint64_t, uint64_t))(v12 + 16);
    uint64_t v38 = v12 + 16;
    uint64_t v14 = *(void *)(v12 + 72);
    uint64_t v35 = (void (**)(char *, uint64_t))(v12 + 8);
    uint64_t v36 = v6;
    unint64_t v43 = (void (**)(char *, uint64_t, uint64_t))(v12 + 32);
    uint64_t v15 = v14 * (v42 - 1);
    uint64_t v39 = v14;
    uint64_t v16 = v14 * v42;
LABEL_6:
    uint64_t v18 = 0;
    uint64_t v19 = v34;
    uint64_t v40 = v16;
    uint64_t v41 = v15;
    while (1)
    {
      uint64_t v20 = *v46;
      uint64_t v45 = v16 + v18;
      uint64_t v21 = v16 + v18 + v20;
      id v22 = v37;
      v37(v47, v21, v6);
      v22(v48, v15 + v18 + v20, v6);
      uint64_t v23 = sub_100014DC8();
      uint64_t v25 = v24;
      if (v23 == sub_100014DC8() && v25 == v26)
      {
        swift_bridgeObjectRelease_n();
        uint64_t v6 = v36;
        id v17 = *v35;
        (*v35)(v48, v36);
        uint64_t result = ((uint64_t (*)(char *, uint64_t))v17)(v47, v6);
        uint64_t v16 = v40;
        uint64_t v15 = v41;
LABEL_5:
        v15 += v39;
        v16 += v39;
        if (++v42 == v33) {
          return result;
        }
        goto LABEL_6;
      }
      char v27 = sub_1000152E8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v6 = v36;
      Swift::Int v28 = *v35;
      (*v35)(v48, v36);
      uint64_t result = ((uint64_t (*)(char *, uint64_t))v28)(v47, v6);
      uint64_t v16 = v40;
      uint64_t v15 = v41;
      if ((v27 & 1) == 0) {
        goto LABEL_5;
      }
      uint64_t v29 = *v46;
      if (!*v46) {
        break;
      }
      uint64_t v30 = v29 + v41 + v18;
      Swift::Int v31 = *v43;
      (*v43)(v44, v29 + v40 + v18, v6);
      swift_arrayInitWithTakeFrontToBack();
      uint64_t result = ((uint64_t (*)(uint64_t, char *, uint64_t))v31)(v30, v44, v6);
      v18 -= v39;
      if (v42 == ++v19) {
        goto LABEL_5;
      }
    }
    __break(1u);
  }
  return result;
}

void sub_10000B950(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  if (a3 != a2)
  {
    uint64_t v4 = a3;
    uint64_t v19 = *a4;
    uint64_t v5 = *a4 + 8 * a3 - 8;
LABEL_5:
    uint64_t v6 = *(void **)(v19 + 8 * v4);
    uint64_t v7 = a1;
    uint64_t v18 = v5;
    while (1)
    {
      uint64_t v8 = *(void **)v5;
      id v9 = v6;
      id v10 = v8;
      id v11 = [v9 template];
      id v12 = [v11 displayOrder];

      id v13 = [v10 template];
      id v14 = [v13 displayOrder];

      if (v14 >= v12)
      {
LABEL_4:
        ++v4;
        uint64_t v5 = v18 + 8;
        if (v4 == a2) {
          return;
        }
        goto LABEL_5;
      }
      if (!v19) {
        break;
      }
      uint64_t v15 = *(void **)v5;
      uint64_t v6 = *(void **)(v5 + 8);
      *(void *)uint64_t v5 = v6;
      *(void *)(v5 + 8) = v15;
      v5 -= 8;
      if (v4 == ++v7) {
        goto LABEL_4;
      }
    }
    __break(1u);
  }
}

uint64_t sub_10000BA88(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v66 = sub_100014E18();
  uint64_t v8 = *(void *)(v66 - 8);
  uint64_t v9 = __chkstk_darwin(v66);
  uint64_t v65 = (char *)&v58 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = __chkstk_darwin(v9);
  uint64_t v64 = (char *)&v58 - v12;
  uint64_t v13 = __chkstk_darwin(v11);
  uint64_t v63 = (char *)&v58 - v14;
  uint64_t result = __chkstk_darwin(v13);
  id v17 = (char *)&v58 - v16;
  uint64_t v61 = *(void *)(v18 + 72);
  if (!v61)
  {
    __break(1u);
LABEL_67:
    __break(1u);
LABEL_68:
    __break(1u);
    return result;
  }
  if (a2 - a1 == 0x8000000000000000 && v61 == -1) {
    goto LABEL_67;
  }
  int64_t v19 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v61 == -1) {
    goto LABEL_68;
  }
  uint64_t v20 = (uint64_t)(a2 - a1) / v61;
  unint64_t v69 = a1;
  unint64_t v68 = a4;
  if (v20 >= v19 / v61)
  {
    uint64_t v22 = v19 / v61 * v61;
    if (a4 < a2 || a2 + v22 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a2)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    unint64_t v41 = a4 + v22;
    unint64_t v67 = a4 + v22;
    unint64_t v69 = a2;
    uint64_t v63 = (char *)a1;
    if (v22 >= 1 && a1 < a2)
    {
      uint64_t v43 = -v61;
      uint64_t v61 = *(void *)(v8 + 16);
      uint64_t v62 = v8 + 16;
      unint64_t v59 = (void (**)(char *, uint64_t))(v8 + 8);
      unint64_t v60 = a4;
      do
      {
        unint64_t v44 = a3;
        uint64_t v45 = v66;
        uint64_t v46 = (void (*)(char *, unint64_t, uint64_t))v61;
        ((void (*)(char *, unint64_t, uint64_t))v61)(v64, v41 + v43, v66);
        unint64_t v47 = a2 + v43;
        v46(v65, a2 + v43, v45);
        uint64_t v48 = sub_100014DC8();
        uint64_t v50 = v49;
        if (v48 == sub_100014DC8() && v50 == v51) {
          char v52 = 0;
        }
        else {
          char v52 = sub_1000152E8();
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        unint64_t v53 = v44 + v43;
        uint64_t v54 = *v59;
        uint64_t v55 = v66;
        (*v59)(v65, v66);
        v54(v64, v55);
        unint64_t v56 = v60;
        if (v52)
        {
          if (v44 < a2 || v53 >= a2)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v44 != a2)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v69 += v43;
        }
        else
        {
          unint64_t v57 = v67;
          v67 += v43;
          if (v44 < v57 || v53 >= v57)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v44 != v57)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          unint64_t v47 = a2;
        }
        unint64_t v41 = v67;
        if (v67 <= v56) {
          break;
        }
        a2 = v47;
        a3 = v44 + v43;
      }
      while (v47 > (unint64_t)v63);
    }
  }
  else
  {
    uint64_t v21 = v20 * v61;
    if (a4 < a1 || a1 + v21 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    uint64_t v65 = (char *)(a4 + v21);
    unint64_t v67 = a4 + v21;
    if (v21 >= 1 && a2 < a3)
    {
      uint64_t v64 = *(char **)(v8 + 16);
      uint64_t v62 = v8 + 16;
      uint64_t v24 = (void (**)(char *, uint64_t))(v8 + 8);
      while (1)
      {
        unint64_t v25 = a3;
        uint64_t v26 = v66;
        char v27 = (void (*)(char *, unint64_t, uint64_t))v64;
        ((void (*)(char *, unint64_t, uint64_t))v64)(v17, a2, v66);
        v27(v63, a4, v26);
        uint64_t v28 = sub_100014DC8();
        uint64_t v30 = v29;
        if (v28 == sub_100014DC8() && v30 == v31) {
          break;
        }
        char v34 = sub_1000152E8();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        uint64_t v35 = *v24;
        uint64_t v36 = v66;
        (*v24)(v63, v66);
        v35(v17, v36);
        if ((v34 & 1) == 0) {
          goto LABEL_29;
        }
        unint64_t v37 = v69;
        uint64_t v38 = v61;
        unint64_t v39 = a2 + v61;
        if (v69 < a2 || v69 >= v39)
        {
          swift_arrayInitWithTakeFrontToBack();
          a3 = v25;
        }
        else
        {
          a3 = v25;
          if (v69 == a2) {
            unint64_t v37 = a2;
          }
          else {
            swift_arrayInitWithTakeBackToFront();
          }
        }
LABEL_35:
        unint64_t v69 = v37 + v38;
        a4 = v68;
        if (v68 < (unint64_t)v65)
        {
          a2 = v39;
          if (v39 < a3) {
            continue;
          }
        }
        goto LABEL_65;
      }
      swift_bridgeObjectRelease_n();
      uint64_t v32 = *v24;
      uint64_t v33 = v66;
      (*v24)(v63, v66);
      v32(v17, v33);
LABEL_29:
      unint64_t v37 = v69;
      uint64_t v38 = v61;
      unint64_t v40 = v68 + v61;
      if (v69 < v68 || v69 >= v40)
      {
        swift_arrayInitWithTakeFrontToBack();
        a3 = v25;
      }
      else
      {
        a3 = v25;
        if (v69 != v68) {
          swift_arrayInitWithTakeBackToFront();
        }
      }
      unint64_t v68 = v40;
      unint64_t v39 = a2;
      goto LABEL_35;
    }
  }
LABEL_65:
  sub_10000C534(&v69, &v68, (uint64_t *)&v67);
  return 1;
}

uint64_t sub_10000C0E4(void **__dst, id *__src, unint64_t a3, void **a4)
{
  uint64_t v5 = __src;
  uint64_t v6 = __dst;
  int64_t v7 = (char *)__src - (char *)__dst;
  int64_t v8 = (char *)__src - (char *)__dst + 7;
  if ((char *)__src - (char *)__dst >= 0) {
    int64_t v8 = (char *)__src - (char *)__dst;
  }
  uint64_t v9 = v8 >> 3;
  uint64_t v10 = a3 - (void)__src;
  uint64_t v11 = a3 - (void)__src + 7;
  if ((uint64_t)(a3 - (void)__src) >= 0) {
    uint64_t v11 = a3 - (void)__src;
  }
  uint64_t v12 = v11 >> 3;
  if (v9 >= v11 >> 3)
  {
    uint64_t v14 = a4;
    if (a4 != __src || &__src[v12] <= a4) {
      memmove(a4, __src, 8 * v12);
    }
    uint64_t v13 = (char *)&a4[v12];
    if (v6 >= v5 || v10 < 8) {
      goto LABEL_40;
    }
    unint64_t v25 = (id *)(a3 - 8);
    unint64_t v40 = v6;
    unint64_t v41 = a4;
    while (1)
    {
      uint64_t v45 = v13;
      uint64_t v43 = v25 + 1;
      uint64_t v26 = v13 - 8;
      char v27 = v5 - 1;
      uint64_t v28 = *(v5 - 1);
      id v29 = *((id *)v13 - 1);
      id v30 = v28;
      id v31 = [v29 template];
      id v32 = [v31 displayOrder];

      id v33 = [v30 template];
      id v34 = [v33 displayOrder];

      if (v34 >= v32) {
        break;
      }
      uint64_t v13 = v45;
      unint64_t v35 = (unint64_t)v40;
      if (v43 != v5)
      {
        --v5;
        goto LABEL_36;
      }
      BOOL v36 = v25 >= v5--;
      uint64_t v14 = v41;
      if (v36) {
        goto LABEL_37;
      }
LABEL_38:
      if ((unint64_t)v5 > v35)
      {
        --v25;
        if (v13 > (char *)v14) {
          continue;
        }
      }
      goto LABEL_40;
    }
    unint64_t v35 = (unint64_t)v40;
    if (v43 == (id *)v45)
    {
      char v27 = (id *)v26;
      uint64_t v13 = v26;
      uint64_t v14 = v41;
      if (v25 < (id *)v45) {
        goto LABEL_38;
      }
    }
    else
    {
      char v27 = (id *)v26;
      uint64_t v13 = v26;
LABEL_36:
      uint64_t v14 = v41;
    }
LABEL_37:
    *unint64_t v25 = *v27;
    goto LABEL_38;
  }
  if (a4 != __dst || &__dst[v9] <= a4) {
    memmove(a4, __dst, 8 * v9);
  }
  uint64_t v13 = (char *)&a4[v9];
  uint64_t v14 = a4;
  if ((unint64_t)v5 < a3 && v7 >= 8)
  {
    unint64_t v44 = v13;
    while (1)
    {
      uint64_t v15 = *v14;
      id v16 = *v5;
      id v17 = v5;
      id v18 = v15;
      id v19 = [v16 template];
      id v20 = [v19 displayOrder];

      id v21 = [v18 template];
      id v22 = [v21 displayOrder];

      if (v22 >= v20) {
        break;
      }
      uint64_t v23 = v17;
      uint64_t v5 = v17 + 1;
      if (v6 != v17) {
        goto LABEL_16;
      }
LABEL_17:
      ++v6;
      uint64_t v13 = v44;
      if (v14 >= (void **)v44 || (unint64_t)v5 >= a3) {
        goto LABEL_19;
      }
    }
    uint64_t v23 = v14;
    BOOL v24 = v6 == v14++;
    uint64_t v5 = v17;
    if (v24) {
      goto LABEL_17;
    }
LABEL_16:
    *uint64_t v6 = *v23;
    goto LABEL_17;
  }
LABEL_19:
  uint64_t v5 = v6;
LABEL_40:
  uint64_t v37 = v13 - (char *)v14;
  uint64_t v38 = v13 - (char *)v14 + 7;
  if (v37 < 0) {
    uint64_t v37 = v38;
  }
  if (v5 != v14 || v5 >= (void **)((char *)v14 + (v37 & 0xFFFFFFFFFFFFFFF8))) {
    memmove(v5, v14, 8 * (v37 >> 3));
  }
  return 1;
}

char *sub_10000C438(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
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
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_1000114A8(&qword_10001CD30);
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
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_10000C534(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3 = *a1;
  unint64_t v4 = *a2;
  uint64_t v5 = *a3;
  uint64_t result = sub_100014E18();
  uint64_t v7 = *(void *)(*(void *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_17:
    __break(1u);
    return result;
  }
  if (v5 - v4 == 0x8000000000000000 && v7 == -1) {
    goto LABEL_17;
  }
  if (v3 < v4 || v3 >= v4 + (uint64_t)(v5 - v4) / v7 * v7)
  {
    return swift_arrayInitWithTakeFrontToBack();
  }
  else if (v3 != v4)
  {
    return swift_arrayInitWithTakeBackToFront();
  }
  return result;
}

char *sub_10000C618(uint64_t a1)
{
  return sub_10000C438(0, *(void *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_10000C62C(unint64_t a1)
{
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v3 = sub_100015298();
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
  uint64_t v15 = sub_100015298();
  swift_bridgeObjectRelease();
  uint64_t v5 = v15 + v3;
  if (__OFADD__(v15, v3)) {
    goto LABEL_21;
  }
LABEL_5:
  unint64_t v6 = *v1;
  int isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  uint64_t *v1 = v6;
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
    uint64_t v9 = sub_100015238();
    swift_bridgeObjectRelease();
    uint64_t *v1 = v9;
    uint64_t v8 = v9 & 0xFFFFFFFFFFFFFF8;
LABEL_11:
    uint64_t result = sub_10000EB4C(v8 + 8 * *(void *)(v8 + 16) + 32, (*(void *)(v8 + 24) >> 1) - *(void *)(v8 + 16), a1);
    if (v11 >= v3) {
      break;
    }
LABEL_22:
    __break(1u);
LABEL_23:
    swift_bridgeObjectRetain();
    sub_100015298();
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

  return sub_100015018();
}

uint64_t sub_10000C7F8(void *a1, void *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  if ((*v2 & 0xC000000000000001) != 0)
  {
    if (v6 < 0) {
      uint64_t v7 = *v2;
    }
    else {
      uint64_t v7 = v6 & 0xFFFFFFFFFFFFFF8;
    }
    swift_bridgeObjectRetain();
    id v8 = a2;
    uint64_t v9 = sub_1000151B8();

    if (v9)
    {
      swift_bridgeObjectRelease();

      sub_100011620(0, &qword_10001CD40);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      *a1 = v27;
      swift_unknownObjectRelease();
      return 0;
    }
    uint64_t result = sub_1000151A8();
    if (__OFADD__(result, 1))
    {
      __break(1u);
      return result;
    }
    Swift::Int v22 = sub_10000CC64(v7, result + 1);
    uint64_t v28 = (void *)v22;
    if (*(void *)(v22 + 24) <= *(void *)(v22 + 16))
    {
      id v26 = v8;
      sub_10000CE5C();
      uint64_t v23 = v28;
    }
    else
    {
      uint64_t v23 = (void *)v22;
      id v24 = v8;
    }
    sub_10000D408((uint64_t)v8, v23);
    *uint64_t v3 = (uint64_t)v23;
  }
  else
  {
    Swift::Int v11 = *(void *)(v6 + 40);
    swift_bridgeObjectRetain();
    Swift::Int v12 = sub_100015138(v11);
    uint64_t v13 = -1 << *(unsigned char *)(v6 + 32);
    unint64_t v14 = v12 & ~v13;
    if ((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14))
    {
      sub_100011620(0, &qword_10001CD40);
      id v15 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
      char v16 = sub_100015148();

      if (v16)
      {
LABEL_12:

        swift_bridgeObjectRelease();
        id v20 = *(void **)(*(void *)(*v3 + 48) + 8 * v14);
        *a1 = v20;
        id v21 = v20;
        return 0;
      }
      uint64_t v17 = ~v13;
      while (1)
      {
        unint64_t v14 = (v14 + 1) & v17;
        if (((*(void *)(v6 + 56 + ((v14 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v14) & 1) == 0) {
          break;
        }
        id v18 = *(id *)(*(void *)(v6 + 48) + 8 * v14);
        char v19 = sub_100015148();

        if (v19) {
          goto LABEL_12;
        }
      }
    }
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v29 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    id v8 = a2;
    sub_10000D48C((uint64_t)v8, v14, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v29;
  }
  swift_bridgeObjectRelease();
  *a1 = v8;
  return 1;
}

uint64_t sub_10000CA98(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  sub_100015308();
  if (a3)
  {
    sub_100015318(1u);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_100014FD8();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_100015318(0);
    swift_bridgeObjectRetain();
  }
  Swift::Int v8 = sub_100015328();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
  {
LABEL_17:
    swift_bridgeObjectRelease();
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    uint64_t v20 = *v3;
    *uint64_t v3 = 0x8000000000000000;
    swift_bridgeObjectRetain();
    sub_10000D614(a2, a3, v10, isUniquelyReferenced_nonNull_native);
    *uint64_t v3 = v20;
    swift_bridgeObjectRelease();
    *a1 = a2;
    a1[1] = a3;
    return 1;
  }
  uint64_t v11 = ~v9;
  uint64_t v12 = *(void *)(v7 + 48);
  while (1)
  {
    uint64_t v13 = (void *)(v12 + 16 * v10);
    uint64_t v14 = v13[1];
    if (v14) {
      break;
    }
    if (!a3) {
      goto LABEL_16;
    }
LABEL_7:
    unint64_t v10 = (v10 + 1) & v11;
    if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
      goto LABEL_17;
    }
  }
  if (!a3) {
    goto LABEL_7;
  }
  BOOL v15 = *v13 == a2 && v14 == a3;
  if (!v15 && (sub_1000152E8() & 1) == 0) {
    goto LABEL_7;
  }
  swift_bridgeObjectRelease();
LABEL_16:
  swift_bridgeObjectRelease();
  char v16 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
  Swift::Int v17 = v16[1];
  *a1 = *v16;
  a1[1] = v17;
  swift_bridgeObjectRetain();
  return 0;
}

Swift::Int sub_10000CC64(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    sub_1000114A8(&qword_10001CDC8);
    uint64_t v2 = sub_100015208();
    uint64_t v14 = v2;
    sub_100015198();
    if (sub_1000151C8())
    {
      sub_100011620(0, &qword_10001CD40);
      do
      {
        swift_dynamicCast();
        uint64_t v2 = v14;
        if (*(void *)(v14 + 24) <= *(void *)(v14 + 16))
        {
          sub_10000CE5C();
          uint64_t v2 = v14;
        }
        Swift::Int result = sub_100015138(*(void *)(v2 + 40));
        uint64_t v4 = v2 + 56;
        uint64_t v5 = -1 << *(unsigned char *)(v2 + 32);
        unint64_t v6 = result & ~v5;
        unint64_t v7 = v6 >> 6;
        if (((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6))) != 0)
        {
          unint64_t v8 = __clz(__rbit64((-1 << v6) & ~*(void *)(v2 + 56 + 8 * (v6 >> 6)))) | v6 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          char v9 = 0;
          unint64_t v10 = (unint64_t)(63 - v5) >> 6;
          do
          {
            if (++v7 == v10 && (v9 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            BOOL v11 = v7 == v10;
            if (v7 == v10) {
              unint64_t v7 = 0;
            }
            v9 |= v11;
            uint64_t v12 = *(void *)(v4 + 8 * v7);
          }
          while (v12 == -1);
          unint64_t v8 = __clz(__rbit64(~v12)) + (v7 << 6);
        }
        *(void *)(v4 + ((v8 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v8;
        *(void *)(*(void *)(v2 + 48) + 8 * v8) = v13;
        ++*(void *)(v2 + 16);
      }
      while (sub_1000151C8());
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return (Swift::Int)&_swiftEmptySetSingleton;
  }
  return v2;
}

uint64_t sub_10000CE5C()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000114A8(&qword_10001CDC8);
  uint64_t v3 = sub_1000151F8();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v28 = v0;
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    unint64_t v6 = (void *)(v2 + 56);
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
        unint64_t v14 = __clz(__rbit64(v8));
        v8 &= v8 - 1;
        unint64_t v15 = v14 | (v12 << 6);
      }
      else
      {
        int64_t v16 = v12 + 1;
        if (__OFADD__(v12, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = v6[v16];
        ++v12;
        if (!v17)
        {
          int64_t v12 = v16 + 1;
          if (v16 + 1 >= v9) {
            goto LABEL_33;
          }
          unint64_t v17 = v6[v12];
          if (!v17)
          {
            int64_t v12 = v16 + 2;
            if (v16 + 2 >= v9) {
              goto LABEL_33;
            }
            unint64_t v17 = v6[v12];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v9)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v28;
                uint64_t v27 = 1 << *(unsigned char *)(v2 + 32);
                if (v27 > 63) {
                  bzero((void *)(v2 + 56), ((unint64_t)(v27 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *unint64_t v6 = -1 << v27;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v6[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v12 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_39;
                  }
                  if (v12 >= v9) {
                    goto LABEL_33;
                  }
                  unint64_t v17 = v6[v12];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v12 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v8 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
      }
      uint64_t v19 = *(void *)(*(void *)(v2 + 48) + 8 * v15);
      uint64_t result = sub_100015138(*(void *)(v4 + 40));
      uint64_t v20 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v21 = result & ~v20;
      unint64_t v22 = v21 >> 6;
      if (((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6))) != 0)
      {
        unint64_t v13 = __clz(__rbit64((-1 << v21) & ~*(void *)(v10 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        char v23 = 0;
        unint64_t v24 = (unint64_t)(63 - v20) >> 6;
        do
        {
          if (++v22 == v24 && (v23 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          BOOL v25 = v22 == v24;
          if (v22 == v24) {
            unint64_t v22 = 0;
          }
          v23 |= v25;
          uint64_t v26 = *(void *)(v10 + 8 * v22);
        }
        while (v26 == -1);
        unint64_t v13 = __clz(__rbit64(~v26)) + (v22 << 6);
      }
      *(void *)(v10 + ((v13 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v13;
      *(void *)(*(void *)(v4 + 48) + 8 * v13) = v19;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

uint64_t sub_10000D0FC()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000114A8(&qword_10001CD90);
  uint64_t v3 = sub_1000151F8();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    id v30 = (void *)(v2 + 56);
    if (v5 < 64) {
      uint64_t v6 = ~(-1 << v5);
    }
    else {
      uint64_t v6 = -1;
    }
    unint64_t v7 = v6 & *(void *)(v2 + 56);
    int64_t v8 = (unint64_t)(v5 + 63) >> 6;
    uint64_t v9 = v3 + 56;
    uint64_t result = swift_retain();
    int64_t v11 = 0;
    while (1)
    {
      if (v7)
      {
        unint64_t v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        unint64_t v15 = v14 | (v11 << 6);
      }
      else
      {
        int64_t v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_41:
          __break(1u);
LABEL_42:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_36;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_36;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_36;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_36:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *id v30 = -1 << v29;
                }
                *(void *)(v2 + 16) = 0;
                break;
              }
              unint64_t v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  int64_t v11 = v18 + 1;
                  if (__OFADD__(v18, 1)) {
                    goto LABEL_42;
                  }
                  if (v11 >= v8) {
                    goto LABEL_36;
                  }
                  unint64_t v17 = v30[v11];
                  ++v18;
                  if (v17) {
                    goto LABEL_23;
                  }
                }
              }
              int64_t v11 = v18;
            }
          }
        }
LABEL_23:
        unint64_t v7 = (v17 - 1) & v17;
        unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      uint64_t v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v21 = *v19;
      uint64_t v20 = v19[1];
      sub_100015308();
      if (v20)
      {
        sub_100015318(1u);
        swift_bridgeObjectRetain();
        sub_100014FD8();
        swift_bridgeObjectRelease();
      }
      else
      {
        sub_100015318(0);
      }
      uint64_t result = sub_100015328();
      uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
      unint64_t v23 = result & ~v22;
      unint64_t v24 = v23 >> 6;
      if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
            goto LABEL_41;
          }
          BOOL v27 = v24 == v26;
          if (v24 == v26) {
            unint64_t v24 = 0;
          }
          v25 |= v27;
          uint64_t v28 = *(void *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *unint64_t v13 = v21;
      v13[1] = v20;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  uint64_t *v1 = v4;
  return result;
}

unint64_t sub_10000D408(uint64_t a1, void *a2)
{
  sub_100015138(a2[5]);
  unint64_t result = sub_100015188();
  *(void *)((char *)a2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 56) |= 1 << result;
  *(void *)(a2[6] + 8 * result) = a1;
  ++a2[2];
  return result;
}

void sub_10000D48C(uint64_t a1, unint64_t a2, char a3)
{
  unint64_t v6 = *(void *)(*v3 + 16);
  unint64_t v7 = *(void *)(*v3 + 24);
  if (v7 > v6 && (a3 & 1) != 0) {
    goto LABEL_14;
  }
  if (a3)
  {
    sub_10000CE5C();
  }
  else
  {
    if (v7 > v6)
    {
      sub_10000D7CC();
      goto LABEL_14;
    }
    sub_10000DB28();
  }
  uint64_t v8 = *v3;
  Swift::Int v9 = sub_100015138(*(void *)(*v3 + 40));
  uint64_t v10 = -1 << *(unsigned char *)(v8 + 32);
  a2 = v9 & ~v10;
  if ((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2))
  {
    sub_100011620(0, &qword_10001CD40);
    id v11 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
    char v12 = sub_100015148();

    if (v12)
    {
LABEL_13:
      sub_1000152F8();
      __break(1u);
    }
    else
    {
      uint64_t v13 = ~v10;
      while (1)
      {
        a2 = (a2 + 1) & v13;
        if (((*(void *)(v8 + 56 + ((a2 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a2) & 1) == 0) {
          break;
        }
        id v14 = *(id *)(*(void *)(v8 + 48) + 8 * a2);
        char v15 = sub_100015148();

        if (v15) {
          goto LABEL_13;
        }
      }
    }
  }
LABEL_14:
  uint64_t v16 = *v3;
  *(void *)(*v3 + 8 * (a2 >> 6) + 56) |= 1 << a2;
  *(void *)(*(void *)(v16 + 48) + 8 * a2) = a1;
  uint64_t v17 = *(void *)(v16 + 16);
  BOOL v18 = __OFADD__(v17, 1);
  uint64_t v19 = v17 + 1;
  if (v18) {
    __break(1u);
  }
  else {
    *(void *)(v16 + 16) = v19;
  }
}

Swift::Int sub_10000D614(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_23;
  }
  if (a4)
  {
    sub_10000D0FC();
  }
  else
  {
    if (v10 > v9)
    {
      unint64_t result = (Swift::Int)sub_10000D978();
      goto LABEL_23;
    }
    sub_10000DDA4();
  }
  uint64_t v11 = *v4;
  sub_100015308();
  if (a2)
  {
    sub_100015318(1u);
    swift_bridgeObjectRetain();
    sub_100014FD8();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_100015318(0);
  }
  unint64_t result = sub_100015328();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = ~v12;
    uint64_t v15 = *(void *)(v11 + 48);
    do
    {
      uint64_t v16 = (void *)(v15 + 16 * a3);
      uint64_t v17 = v16[1];
      if (v17)
      {
        if (a2)
        {
          BOOL v18 = *v16 == v8 && v17 == a2;
          if (v18 || (unint64_t result = sub_1000152E8(), (result & 1) != 0))
          {
LABEL_22:
            sub_1000114A8(&qword_10001CD88);
            unint64_t result = sub_1000152F8();
            __break(1u);
            break;
          }
        }
      }
      else if (!a2)
      {
        goto LABEL_22;
      }
      a3 = (a3 + 1) & v14;
    }
    while (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) != 0);
  }
LABEL_23:
  uint64_t v19 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v20 = (Swift::Int *)(*(void *)(v19 + 48) + 16 * a3);
  *uint64_t v20 = v8;
  v20[1] = a2;
  uint64_t v21 = *(void *)(v19 + 16);
  BOOL v22 = __OFADD__(v21, 1);
  uint64_t v23 = v21 + 1;
  if (v22) {
    __break(1u);
  }
  else {
    *(void *)(v19 + 16) = v23;
  }
  return result;
}

id sub_10000D7CC()
{
  uint64_t v1 = v0;
  sub_1000114A8(&qword_10001CDC8);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1000151E8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (id)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (id)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v18 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v18 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v18);
    ++v9;
    if (!v19)
    {
      int64_t v9 = v18 + 1;
      if (v18 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v19 = *(void *)(v6 + 8 * v9);
      if (!v19)
      {
        int64_t v9 = v18 + 2;
        if (v18 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v19 = *(void *)(v6 + 8 * v9);
        if (!v19) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v19 - 1) & v19;
    unint64_t v15 = __clz(__rbit64(v19)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 8 * v15;
    uint64_t v17 = *(void **)(*(void *)(v2 + 48) + v16);
    *(void *)(*(void *)(v4 + 48) + v16) = v17;
    id result = v17;
  }
  int64_t v20 = v18 + 3;
  if (v20 >= v13) {
    goto LABEL_28;
  }
  unint64_t v19 = *(void *)(v6 + 8 * v20);
  if (v19)
  {
    int64_t v9 = v20;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v20 + 1;
    if (__OFADD__(v20, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v19 = *(void *)(v6 + 8 * v9);
    ++v20;
    if (v19) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_10000D978()
{
  uint64_t v1 = v0;
  sub_1000114A8(&qword_10001CD90);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_1000151E8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_28:
    id result = (void *)swift_release();
    uint64_t *v1 = v4;
    return result;
  }
  id result = (void *)(v3 + 56);
  uint64_t v6 = v2 + 56;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7) {
    id result = memmove(result, (const void *)(v2 + 56), 8 * v7);
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
    int64_t v16 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v16 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v9;
    if (!v17)
    {
      int64_t v9 = v16 + 1;
      if (v16 + 1 >= v13) {
        goto LABEL_28;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v9);
      if (!v17)
      {
        int64_t v9 = v16 + 2;
        if (v16 + 2 >= v13) {
          goto LABEL_28;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v9);
        if (!v17) {
          break;
        }
      }
    }
LABEL_27:
    unint64_t v12 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v9 << 6);
LABEL_12:
    *(_OWORD *)(*(void *)(v4 + 48) + 16 * v15) = *(_OWORD *)(*(void *)(v2 + 48) + 16 * v15);
    id result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v13) {
    goto LABEL_28;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v9 = v18;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v9 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_28;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v9);
    ++v18;
    if (v17) {
      goto LABEL_27;
    }
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_10000DB28()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000114A8(&qword_10001CDC8);
  uint64_t v3 = sub_1000151F8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_35:
    uint64_t *v1 = v4;
    return result;
  }
  uint64_t v28 = v0;
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
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v12 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v12 + 1;
    if (__OFADD__(v12, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v12;
    if (!v17)
    {
      int64_t v12 = v16 + 1;
      if (v16 + 1 >= v9) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v12);
      if (!v17)
      {
        int64_t v12 = v16 + 2;
        if (v16 + 2 >= v9) {
          goto LABEL_33;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v12);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v12 << 6);
LABEL_24:
    Swift::Int v19 = *(void *)(v4 + 40);
    id v20 = *(id *)(*(void *)(v2 + 48) + 8 * v15);
    uint64_t result = sub_100015138(v19);
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
          goto LABEL_36;
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
    *(void *)(*(void *)(v4 + 48) + 8 * v13) = v20;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v9)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v28;
    goto LABEL_35;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v12 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v12 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v12 >= v9) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v12);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_10000DDA4()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000114A8(&qword_10001CD90);
  uint64_t v3 = sub_1000151F8();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
    uint64_t result = swift_release();
LABEL_38:
    uint64_t *v1 = v4;
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
  int64_t v29 = (unint64_t)(v5 + 63) >> 6;
  uint64_t v9 = v3 + 56;
  uint64_t result = swift_retain();
  int64_t v11 = 0;
  while (1)
  {
    if (v8)
    {
      unint64_t v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    int64_t v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_39:
      __break(1u);
      goto LABEL_40;
    }
    if (v16 >= v29) {
      goto LABEL_36;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_36;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_36;
        }
        unint64_t v17 = *(void *)(v6 + 8 * v11);
        if (!v17) {
          break;
        }
      }
    }
LABEL_23:
    unint64_t v8 = (v17 - 1) & v17;
    unint64_t v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    Swift::Int v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v21 = *v19;
    uint64_t v20 = v19[1];
    sub_100015308();
    if (v20)
    {
      sub_100015318(1u);
      swift_bridgeObjectRetain_n();
      sub_100014FD8();
      swift_bridgeObjectRelease();
    }
    else
    {
      sub_100015318(0);
    }
    uint64_t result = sub_100015328();
    uint64_t v22 = -1 << *(unsigned char *)(v4 + 32);
    unint64_t v23 = result & ~v22;
    unint64_t v24 = v23 >> 6;
    if (((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      unint64_t v12 = __clz(__rbit64((-1 << v23) & ~*(void *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
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
          goto LABEL_39;
        }
        BOOL v27 = v24 == v26;
        if (v24 == v26) {
          unint64_t v24 = 0;
        }
        v25 |= v27;
        uint64_t v28 = *(void *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      unint64_t v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(void *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    unint64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *unint64_t v13 = v21;
    v13[1] = v20;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_36:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_38;
  }
  unint64_t v17 = *(void *)(v6 + 8 * v18);
  if (v17)
  {
    int64_t v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    int64_t v11 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    if (v11 >= v29) {
      goto LABEL_36;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_40:
  __break(1u);
  return result;
}

uint64_t sub_10000E07C(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = *v1;
  if ((*v1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    id v5 = a1;
    char v6 = sub_1000151D8();

    if (v6)
    {
      uint64_t v7 = sub_10000E254();
      swift_bridgeObjectRelease();
      return v7;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    return 0;
  }
  Swift::Int v8 = *(void *)(v4 + 40);
  swift_bridgeObjectRetain();
  Swift::Int v9 = sub_100015138(v8);
  uint64_t v10 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v11 = v9 & ~v10;
  if (((*(void *)(v4 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
    goto LABEL_12;
  }
  sub_100011620(0, &qword_10001CD40);
  id v12 = *(id *)(*(void *)(v4 + 48) + 8 * v11);
  char v13 = sub_100015148();

  if ((v13 & 1) == 0)
  {
    uint64_t v14 = ~v10;
    do
    {
      unint64_t v11 = (v11 + 1) & v14;
      if (((*(void *)(v4 + 56 + ((v11 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v11) & 1) == 0) {
        goto LABEL_12;
      }
      id v15 = *(id *)(*(void *)(v4 + 48) + 8 * v11);
      char v16 = sub_100015148();
    }
    while ((v16 & 1) == 0);
  }
  swift_bridgeObjectRelease();
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v18 = *v2;
  uint64_t v20 = *v2;
  *uint64_t v2 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_10000D7CC();
    uint64_t v18 = v20;
  }
  uint64_t v7 = *(void *)(*(void *)(v18 + 48) + 8 * v11);
  sub_10000E3F0(v11);
  *uint64_t v2 = v20;
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_10000E254()
{
  uint64_t v1 = v0;
  swift_bridgeObjectRelease();
  uint64_t v2 = sub_1000151A8();
  uint64_t v3 = swift_unknownObjectRetain();
  Swift::Int v4 = sub_10000CC64(v3, v2);
  Swift::Int v16 = v4;
  Swift::Int v5 = *(void *)(v4 + 40);
  swift_retain();
  Swift::Int v6 = sub_100015138(v5);
  uint64_t v7 = -1 << *(unsigned char *)(v4 + 32);
  unint64_t v8 = v6 & ~v7;
  if ((*(void *)(v4 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
  {
    sub_100011620(0, &qword_10001CD40);
    id v9 = *(id *)(*(void *)(v4 + 48) + 8 * v8);
    char v10 = sub_100015148();

    if (v10)
    {
LABEL_6:
      swift_release();
      uint64_t v14 = *(void *)(*(void *)(v4 + 48) + 8 * v8);
      sub_10000E3F0(v8);
      if (sub_100015148())
      {
        Swift::Int *v1 = v16;
        return v14;
      }
      __break(1u);
    }
    else
    {
      uint64_t v11 = ~v7;
      while (1)
      {
        unint64_t v8 = (v8 + 1) & v11;
        if (((*(void *)(v4 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8) & 1) == 0) {
          break;
        }
        id v12 = *(id *)(*(void *)(v4 + 48) + 8 * v8);
        char v13 = sub_100015148();

        if (v13) {
          goto LABEL_6;
        }
      }
    }
    swift_release();
    __break(1u);
  }
  uint64_t result = swift_release();
  __break(1u);
  return result;
}

unint64_t sub_10000E3F0(unint64_t result)
{
  int64_t v2 = result;
  uint64_t v3 = *v1;
  uint64_t v4 = *v1 + 56;
  uint64_t v5 = -1 << *(unsigned char *)(*v1 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(v4 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    swift_retain();
    uint64_t v8 = sub_100015178();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v9 = (v8 + 1) & v7;
      do
      {
        Swift::Int v10 = *(void *)(v3 + 40);
        id v11 = *(id *)(*(void *)(v3 + 48) + 8 * v6);
        Swift::Int v12 = sub_100015138(v10);

        Swift::Int v13 = v12 & v7;
        if (v2 >= (uint64_t)v9)
        {
          if (v13 >= v9 && v2 >= v13)
          {
LABEL_16:
            uint64_t v16 = *(void *)(v3 + 48);
            unint64_t v17 = (void *)(v16 + 8 * v2);
            uint64_t v18 = (void *)(v16 + 8 * v6);
            if (v2 != v6 || (int64_t v2 = v6, v17 >= v18 + 1))
            {
              *unint64_t v17 = *v18;
              int64_t v2 = v6;
            }
          }
        }
        else if (v13 >= v9 || v2 >= v13)
        {
          goto LABEL_16;
        }
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    *(void *)(v4 + (((unint64_t)v2 >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << v2) - 1;
    uint64_t result = swift_release();
  }
  else
  {
    *(void *)(v4 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) &= (-1 << result) - 1;
  }
  uint64_t v19 = *(void *)(v3 + 16);
  BOOL v20 = __OFSUB__(v19, 1);
  uint64_t v21 = v19 - 1;
  if (v20)
  {
    __break(1u);
  }
  else
  {
    *(void *)(v3 + 16) = v21;
    ++*(_DWORD *)(v3 + 36);
  }
  return result;
}

uint64_t sub_10000E594(uint64_t a1)
{
  int64_t v2 = v1;
  uint64_t v4 = *v1;
  if ((v4 & 0xC000000000000001) == 0)
  {
    char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    Swift::Int v13 = *v2;
    *int64_t v2 = 0x8000000000000000;
    sub_10000E67C(a1, isUniquelyReferenced_nonNull_native);
    uint64_t v9 = v11;
    *int64_t v2 = v13;
    swift_bridgeObjectRelease();
    return v9;
  }
  if (v4 < 0) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = v4 & 0xFFFFFFFFFFFFFF8;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_1000151A8();
  uint64_t result = swift_bridgeObjectRelease();
  if (!__OFADD__(v6, 1))
  {
    Swift::Int v12 = sub_10000CC64(v5, v6 + 1);
    sub_10000E67C(a1, 1);
    uint64_t v9 = v8;
    *int64_t v2 = v12;
    return v9;
  }
  __break(1u);
  return result;
}

void sub_10000E67C(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = *v2;
  Swift::Int v7 = sub_100015138(*(void *)(*v2 + 40));
  uint64_t v8 = -1 << *(unsigned char *)(v6 + 32);
  unint64_t v9 = v7 & ~v8;
  uint64_t v10 = v6 + 56;
  if ((*(void *)(v6 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
  {
    sub_100011620(0, &qword_10001CD40);
    id v11 = *(id *)(*(void *)(v6 + 48) + 8 * v9);
    char v12 = sub_100015148();

    if (v12)
    {
      uint64_t v13 = 0;
      char v14 = 1;
    }
    else
    {
      uint64_t v15 = ~v8;
      unint64_t v9 = (v9 + 1) & v15;
      if ((*(void *)(v10 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9))
      {
        uint64_t v13 = 1;
        while (1)
        {
          id v16 = *(id *)(*(void *)(v6 + 48) + 8 * v9);
          char v14 = sub_100015148();

          if (v14) {
            break;
          }
          unint64_t v9 = (v9 + 1) & v15;
          if (((*(void *)(v10 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
            goto LABEL_12;
          }
        }
        uint64_t v13 = 0;
      }
      else
      {
        char v14 = 0;
        uint64_t v13 = 1;
      }
    }
LABEL_12:
    uint64_t v3 = v2;
  }
  else
  {
    char v14 = 0;
    uint64_t v13 = 1;
  }
  uint64_t v17 = *(void *)(v6 + 16);
  uint64_t v18 = v17 + v13;
  if (__OFADD__(v17, v13)) {
    goto LABEL_36;
  }
  uint64_t v19 = *(void *)(v6 + 24);
  if (v19 >= v18 && (a2 & 1) != 0)
  {
    if ((v14 & 1) == 0) {
      goto LABEL_32;
    }
LABEL_30:
    *(void *)(*(void *)(*v3 + 48) + 8 * v9) = a1;
    return;
  }
  if (a2)
  {
    sub_10000CE5C();
  }
  else
  {
    if (v19 >= v18)
    {
      sub_10000D7CC();
      if (v14) {
        goto LABEL_30;
      }
      goto LABEL_32;
    }
    sub_10000DB28();
  }
  uint64_t v20 = *v3;
  Swift::Int v21 = sub_100015138(*(void *)(*v3 + 40));
  uint64_t v22 = -1 << *(unsigned char *)(v20 + 32);
  unint64_t v9 = v21 & ~v22;
  if (((*(void *)(v20 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0)
  {
    if ((v14 & 1) == 0) {
      goto LABEL_32;
    }
    goto LABEL_35;
  }
  unint64_t v23 = v3;
  sub_100011620(0, &qword_10001CD40);
  id v24 = *(id *)(*(void *)(v20 + 48) + 8 * v9);
  char v25 = sub_100015148();

  if (v25)
  {
LABEL_29:
    uint64_t v3 = v23;
    if (v14) {
      goto LABEL_30;
    }
    goto LABEL_35;
  }
  uint64_t v26 = ~v22;
  while (1)
  {
    unint64_t v9 = (v9 + 1) & v26;
    if (((*(void *)(v20 + 56 + ((v9 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v9) & 1) == 0) {
      break;
    }
    id v27 = *(id *)(*(void *)(v20 + 48) + 8 * v9);
    char v28 = sub_100015148();

    if (v28) {
      goto LABEL_29;
    }
  }
  uint64_t v3 = v23;
  if (v14)
  {
LABEL_35:
    sub_100011620(0, &qword_10001CD40);
    sub_1000152F8();
    __break(1u);
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
LABEL_32:
  uint64_t v29 = *v3;
  *(void *)(*v3 + 8 * (v9 >> 6) + 56) |= 1 << v9;
  *(void *)(*(void *)(v29 + 48) + 8 * v9) = a1;
  uint64_t v30 = *(void *)(v29 + 16);
  BOOL v31 = __OFADD__(v30, 1);
  uint64_t v32 = v30 + 1;
  if (!v31)
  {
    *(void *)(v29 + 16) = v32;
    return;
  }
LABEL_37:
  __break(1u);
}

size_t sub_10000E978(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  if (!v9)
  {
    uint64_t v13 = _swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_1000114A8(&qword_10001CD28);
  uint64_t v10 = *(void *)(sub_100014E18() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  uint64_t result = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_100014E18() - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

uint64_t sub_10000EB4C(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100015298();
    uint64_t result = swift_bridgeObjectRelease();
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
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_100015298();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_100011710(&qword_10001CD68, &qword_10001CD60);
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            sub_1000114A8(&qword_10001CD60);
            uint64_t v10 = sub_10000EF58(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void (**)(id *), void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_100011620(0, &qword_10001CD58);
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000ED1C(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v5 = result;
  unint64_t v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v7 = sub_100015298();
    uint64_t result = swift_bridgeObjectRelease();
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
  if (v5)
  {
    if (v6)
    {
      swift_bridgeObjectRetain();
      uint64_t v8 = sub_100015298();
      uint64_t result = swift_bridgeObjectRelease();
      if (v8 <= a2)
      {
        if (v7 >= 1)
        {
          sub_100011710(&qword_10001CD50, &qword_10001CD48);
          swift_bridgeObjectRetain();
          for (unint64_t i = 0; i != v7; ++i)
          {
            sub_1000114A8(&qword_10001CD48);
            uint64_t v10 = sub_10000EEEC(v13, i, a3);
            id v12 = *v11;
            ((void (*)(void (**)(id *), void))v10)(v13, 0);
            *(void *)(v5 + 8 * i) = v12;
          }
          swift_bridgeObjectRelease();
          return a3;
        }
        goto LABEL_16;
      }
    }
    else
    {
      if (*(void *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a2)
      {
        sub_100011620(0, &qword_10001CD40);
        swift_arrayInitWithCopy();
        return a3;
      }
      __break(1u);
    }
    __break(1u);
LABEL_16:
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t (*sub_10000EEEC(void (**a1)(id *a1), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_10000F008(v6, a2, a3);
  return sub_10000EF54;
}

uint64_t (*sub_10000EF58(void (**a1)(id *), unint64_t a2, uint64_t a3))()
{
  unint64_t v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((void *)v6 + 4) = sub_10000F090(v6, a2, a3);
  return sub_10000EF54;
}

void sub_10000EFC0(void *a1)
{
  uint64_t v1 = (void *)*a1;
  (*(void (**)(void))(*a1 + 32))(*a1);

  free(v1);
}

void (*sub_10000F008(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_100015228();
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
    return sub_10000F088;
  }
  __break(1u);
  return result;
}

void sub_10000F088(id *a1)
{
}

void (*sub_10000F090(void (*result)(id *), unint64_t a2, uint64_t a3))(id *)
{
  uint64_t v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    id v4 = (id)sub_100015228();
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
    return sub_100011B80;
  }
  __break(1u);
  return result;
}

size_t sub_10000F110(void *a1)
{
  return sub_10000E978(0, a1[2], 0, a1);
}

uint64_t sub_10000F124(uint64_t a1)
{
  return specialized _ContiguousArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)(0, *(void *)(a1 + 16), 0, a1);
}

void *sub_10000F138(void *result, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4 = a4;
  unint64_t v6 = a2;
  uint64_t v7 = result;
  if ((a4 & 0xC000000000000001) != 0)
  {
    sub_100015198();
    sub_100011620(0, &qword_10001CD40);
    sub_100011754();
    uint64_t result = (void *)sub_1000150C8();
    uint64_t v4 = v27;
    uint64_t v8 = v28;
    uint64_t v9 = v29;
    int64_t v10 = v30;
    unint64_t v11 = v31;
    id v24 = v7;
    if (v6) {
      goto LABEL_3;
    }
LABEL_36:
    uint64_t v12 = 0;
LABEL_46:
    void *v24 = v4;
    v24[1] = v8;
    v24[2] = v9;
    v24[3] = v10;
    v24[4] = v11;
    return (void *)v12;
  }
  int64_t v10 = 0;
  uint64_t v20 = -1 << *(unsigned char *)(a4 + 32);
  uint64_t v8 = a4 + 56;
  uint64_t v9 = ~v20;
  uint64_t v21 = -v20;
  if (v21 < 64) {
    uint64_t v22 = ~(-1 << v21);
  }
  else {
    uint64_t v22 = -1;
  }
  unint64_t v11 = v22 & *(void *)(a4 + 56);
  id v24 = result;
  if (!a2) {
    goto LABEL_36;
  }
LABEL_3:
  if (!a3)
  {
    uint64_t v12 = 0;
    goto LABEL_46;
  }
  if (a3 < 0) {
    goto LABEL_48;
  }
  uint64_t v12 = 0;
  int64_t v25 = (unint64_t)(v9 + 64) >> 6;
  uint64_t v23 = v9;
  while (1)
  {
    if (v4 < 0)
    {
      if (!sub_1000151C8()) {
        goto LABEL_45;
      }
      sub_100011620(0, &qword_10001CD40);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      uint64_t v15 = v26;
      uint64_t result = (void *)swift_unknownObjectRelease();
      if (!v26) {
        goto LABEL_45;
      }
      goto LABEL_8;
    }
    if (v11)
    {
      unint64_t v13 = __clz(__rbit64(v11));
      v11 &= v11 - 1;
      unint64_t v14 = v13 | (v10 << 6);
      goto LABEL_7;
    }
    int64_t v16 = v10 + 1;
    if (__OFADD__(v10, 1)) {
      break;
    }
    if (v16 >= v25)
    {
      unint64_t v11 = 0;
      goto LABEL_45;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v16);
    if (v17) {
      goto LABEL_23;
    }
    int64_t v18 = v10 + 2;
    if (v10 + 2 >= v25)
    {
      unint64_t v11 = 0;
      ++v10;
      goto LABEL_45;
    }
    unint64_t v17 = *(void *)(v8 + 8 * v18);
    if (!v17)
    {
      if (v10 + 3 >= v25) {
        goto LABEL_42;
      }
      unint64_t v17 = *(void *)(v8 + 8 * (v10 + 3));
      if (v17)
      {
        int64_t v16 = v10 + 3;
        goto LABEL_23;
      }
      int64_t v18 = v10 + 4;
      if (v10 + 4 >= v25)
      {
        unint64_t v11 = 0;
        v10 += 3;
        goto LABEL_45;
      }
      unint64_t v17 = *(void *)(v8 + 8 * v18);
      if (!v17)
      {
        int64_t v16 = v10 + 5;
        if (v10 + 5 >= v25)
        {
LABEL_42:
          unint64_t v11 = 0;
          int64_t v10 = v18;
          goto LABEL_45;
        }
        unint64_t v17 = *(void *)(v8 + 8 * v16);
        if (!v17)
        {
          int64_t v19 = v10 + 6;
          while (v25 != v19)
          {
            unint64_t v17 = *(void *)(v8 + 8 * v19++);
            if (v17)
            {
              int64_t v16 = v19 - 1;
              goto LABEL_23;
            }
          }
          unint64_t v11 = 0;
          int64_t v10 = v25 - 1;
          goto LABEL_45;
        }
        goto LABEL_23;
      }
    }
    int64_t v16 = v18;
LABEL_23:
    unint64_t v11 = (v17 - 1) & v17;
    unint64_t v14 = __clz(__rbit64(v17)) + (v16 << 6);
    int64_t v10 = v16;
LABEL_7:
    uint64_t result = *(id *)(*(void *)(v4 + 48) + 8 * v14);
    uint64_t v15 = result;
    if (!result) {
      goto LABEL_45;
    }
LABEL_8:
    ++v12;
    *v6++ = v15;
    if (v12 == a3)
    {
      uint64_t v12 = a3;
LABEL_45:
      uint64_t v9 = v23;
      goto LABEL_46;
    }
  }
  __break(1u);
LABEL_48:
  __break(1u);
  return result;
}

uint64_t sub_10000F444(void *a1, char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8 = sub_1000114A8(&qword_10001CD18);
  __chkstk_darwin(v8 - 8);
  int64_t v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_100014E18();
  uint64_t v41 = *(void *)(v11 - 8);
  uint64_t result = __chkstk_darwin(v11);
  unint64_t v40 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v42 = a4;
  uint64_t v15 = a4 + 56;
  uint64_t v14 = *(void *)(a4 + 56);
  uint64_t v32 = -1 << *(unsigned char *)(a4 + 32);
  if (-v32 < 64) {
    uint64_t v16 = ~(-1 << -(char)v32);
  }
  else {
    uint64_t v16 = -1;
  }
  unint64_t v17 = v16 & v14;
  if (!a2)
  {
    int64_t v18 = 0;
    a3 = 0;
LABEL_39:
    uint64_t v28 = ~v32;
    *a1 = v42;
    a1[1] = v15;
    a1[2] = v28;
    a1[3] = v18;
    a1[4] = v17;
    return a3;
  }
  if (!a3)
  {
    int64_t v18 = 0;
    goto LABEL_39;
  }
  if (a3 < 0) {
    goto LABEL_41;
  }
  uint64_t v36 = a3;
  int64_t v18 = 0;
  a3 = 0;
  int64_t v19 = v40;
  uint64_t v38 = v41 + 16;
  unint64_t v39 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v41 + 56);
  uint64_t v37 = v41 + 48;
  unint64_t v35 = (uint64_t (**)(char *, char *, uint64_t))(v41 + 32);
  uint64_t v33 = v15;
  int64_t v34 = (unint64_t)(63 - v32) >> 6;
  int64_t v30 = v34 - 1;
  unint64_t v31 = a1;
  if (!v17) {
    goto LABEL_9;
  }
LABEL_8:
  unint64_t v20 = __clz(__rbit64(v17));
  v17 &= v17 - 1;
  unint64_t v21 = v20 | (v18 << 6);
  while (1)
  {
    uint64_t v25 = v41;
    uint64_t v26 = *(void *)(v41 + 72);
    (*(void (**)(char *, unint64_t, uint64_t))(v41 + 16))(v10, *(void *)(v42 + 48) + v26 * v21, v11);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v25 + 56))(v10, 0, 1, v11);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v10, 1, v11) == 1)
    {
      uint64_t v15 = v33;
      goto LABEL_38;
    }
    ++a3;
    uint64_t v27 = *v35;
    (*v35)(v19, v10, v11);
    uint64_t result = v27(a2, v19, v11);
    if (a3 == v36)
    {
      a3 = v36;
      a1 = v31;
      uint64_t v15 = v33;
      goto LABEL_39;
    }
    a2 += v26;
    if (v17) {
      goto LABEL_8;
    }
LABEL_9:
    int64_t v22 = v18 + 1;
    if (__OFADD__(v18, 1)) {
      break;
    }
    uint64_t v15 = v33;
    if (v22 >= v34) {
      goto LABEL_37;
    }
    unint64_t v23 = *(void *)(v33 + 8 * v22);
    if (!v23)
    {
      int64_t v24 = v18 + 2;
      ++v18;
      if (v22 + 1 >= v34) {
        goto LABEL_37;
      }
      unint64_t v23 = *(void *)(v33 + 8 * v24);
      if (v23) {
        goto LABEL_14;
      }
      int64_t v18 = v22 + 1;
      if (v22 + 2 >= v34) {
        goto LABEL_37;
      }
      unint64_t v23 = *(void *)(v33 + 8 * (v22 + 2));
      if (v23)
      {
        v22 += 2;
      }
      else
      {
        int64_t v18 = v22 + 2;
        if (v22 + 3 >= v34) {
          goto LABEL_37;
        }
        unint64_t v23 = *(void *)(v33 + 8 * (v22 + 3));
        if (!v23)
        {
          int64_t v24 = v22 + 4;
          int64_t v18 = v22 + 3;
          if (v22 + 4 < v34)
          {
            unint64_t v23 = *(void *)(v33 + 8 * v24);
            if (!v23)
            {
              while (1)
              {
                int64_t v22 = v24 + 1;
                if (__OFADD__(v24, 1)) {
                  goto LABEL_42;
                }
                if (v22 >= v34)
                {
                  int64_t v18 = v30;
                  goto LABEL_37;
                }
                unint64_t v23 = *(void *)(v33 + 8 * v22);
                ++v24;
                if (v23) {
                  goto LABEL_21;
                }
              }
            }
LABEL_14:
            int64_t v22 = v24;
            goto LABEL_21;
          }
LABEL_37:
          (*v39)(v10, 1, 1, v11);
          unint64_t v17 = 0;
LABEL_38:
          sub_100011594((uint64_t)v10);
          a1 = v31;
          goto LABEL_39;
        }
        v22 += 3;
      }
    }
LABEL_21:
    unint64_t v17 = (v23 - 1) & v23;
    unint64_t v21 = __clz(__rbit64(v23)) + (v22 << 6);
    int64_t v18 = v22;
  }
  __break(1u);
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
  return result;
}

void sub_10000F830(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  if (!v2) {
    return;
  }
  uint64_t v4 = swift_bridgeObjectRetain() + 40;
  uint64_t v5 = _swiftEmptyArrayStorage;
  while (1)
  {
    swift_bridgeObjectRetain();
    NSString v6 = sub_100014F88();
    id v7 = [a2 URLsForResourcesWithExtension:v6 subdirectory:0];

    if (v7)
    {
      sub_100014E18();
      uint64_t v8 = (void *)sub_100015008();
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v8 = _swiftEmptyArrayStorage;
    }
    uint64_t v9 = v8[2];
    int64_t v10 = v5[2];
    int64_t v11 = v10 + v9;
    if (__OFADD__(v10, v9)) {
      break;
    }
    size_t isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    if (isUniquelyReferenced_nonNull_native && v11 <= v5[3] >> 1)
    {
      if (v8[2]) {
        goto LABEL_17;
      }
    }
    else
    {
      if (v10 <= v11) {
        int64_t v13 = v10 + v9;
      }
      else {
        int64_t v13 = v10;
      }
      uint64_t v5 = (void *)sub_100009FC4(isUniquelyReferenced_nonNull_native, v13, 1, v5);
      if (v8[2])
      {
LABEL_17:
        uint64_t v14 = (v5[3] >> 1) - v5[2];
        sub_100014E18();
        if (v14 < v9) {
          goto LABEL_25;
        }
        swift_arrayInitWithCopy();
        if (v9)
        {
          uint64_t v15 = v5[2];
          BOOL v16 = __OFADD__(v15, v9);
          uint64_t v17 = v15 + v9;
          if (v16) {
            goto LABEL_26;
          }
          v5[2] = v17;
        }
        goto LABEL_4;
      }
    }
    if (v9) {
      goto LABEL_24;
    }
LABEL_4:
    v4 += 16;
    swift_bridgeObjectRelease();
    if (!--v2)
    {
      swift_bridgeObjectRelease();
      return;
    }
  }
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
}

id sub_10000FA38(uint64_t a1, void *a2)
{
  uint64_t v42 = sub_100014E18();
  uint64_t v4 = *(void *)(v42 - 8);
  uint64_t v5 = __chkstk_darwin(v42);
  uint64_t v41 = (char *)&v33 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v8 = (char *)&v33 - v7;
  sub_1000114A8(&qword_10001CCF0);
  uint64_t v9 = swift_allocObject();
  long long v43 = xmmword_100016550;
  *(_OWORD *)(v9 + 16) = xmmword_100016550;
  uint64_t v10 = sub_100014DC8();
  uint64_t v12 = v11;
  *(void *)(v9 + 56) = &type metadata for String;
  unint64_t v40 = sub_100011534();
  *(void *)(v9 + 64) = v40;
  *(void *)(v9 + 32) = v10;
  *(void *)(v9 + 40) = v12;
  sub_1000150E8();
  if (qword_10001CBC0 != -1) {
    swift_once();
  }
  uint64_t v38 = sub_1000114A8(&qword_10001CCF8);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = v43;
  uint64_t v36 = sub_1000114A8(&qword_10001CD00);
  *(void *)(v13 + 56) = v36;
  uint64_t v35 = sub_100011710((unint64_t *)&qword_10001CD08, &qword_10001CD00);
  *(void *)(v13 + 64) = v35;
  *(void *)(v13 + 32) = v9;
  swift_bridgeObjectRetain();
  sub_100014ED8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_100014DF8();
  uint64_t v14 = sub_100014DD8();
  uint64_t v16 = v15;
  uint64_t v39 = v4;
  (*(void (**)(char *, uint64_t))(v4 + 8))(v8, v42);
  NSString v17 = sub_100014F88();
  NSString v18 = sub_100014F88();
  id v19 = [a2 localizedStringForKey:v17 value:0 table:v18];
  uint64_t v37 = a1;
  id v20 = v19;

  uint64_t v34 = sub_100014FB8();
  uint64_t v22 = v21;

  uint64_t v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = v43;
  unint64_t v24 = v40;
  *(void *)(v23 + 56) = &type metadata for String;
  *(void *)(v23 + 64) = v24;
  *(void *)(v23 + 32) = v14;
  *(void *)(v23 + 40) = v16;
  sub_1000150E8();
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = v43;
  uint64_t v26 = v35;
  uint64_t v27 = v36;
  *(void *)(v25 + 56) = v36;
  *(void *)(v25 + 64) = v26;
  *(void *)(v25 + 32) = v23;
  swift_bridgeObjectRetain();
  sub_100014ED8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v28 = swift_allocObject();
  *(_OWORD *)(v28 + 16) = v43;
  *(void *)(v28 + 56) = &type metadata for String;
  *(void *)(v28 + 64) = v24;
  *(void *)(v28 + 32) = v34;
  *(void *)(v28 + 40) = v22;
  swift_bridgeObjectRetain();
  sub_1000150E8();
  uint64_t v29 = swift_allocObject();
  *(_OWORD *)(v29 + 16) = v43;
  *(void *)(v29 + 56) = v27;
  *(void *)(v29 + 64) = v26;
  *(void *)(v29 + 32) = v28;
  swift_bridgeObjectRetain();
  sub_100014ED8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v30 = (uint64_t)v41;
  (*(void (**)(char *, uint64_t, uint64_t))(v39 + 16))(v41, v37, v42);
  id v31 = objc_allocWithZone((Class)MSSticker);
  return sub_100009A04(v30);
}

unint64_t sub_10000FED4(uint64_t a1, void *a2)
{
  uint64_t v26 = a2;
  uint64_t v3 = sub_100014E18();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v25 = (char *)v18 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1000114A8(&qword_10001CD18);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v27 = (unint64_t)_swiftEmptyArrayStorage;
  uint64_t v9 = *(void *)(a1 + 16);
  v18[2] = a1;
  if (v9)
  {
    uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t))(v4 + 16);
    uint64_t v10 = v4 + 16;
    unint64_t v24 = v11;
    uint64_t v12 = a1 + ((*(unsigned __int8 *)(v10 + 64) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 64));
    uint64_t v21 = *(void *)(v10 + 56);
    uint64_t v22 = (unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 32);
    id v19 = (void (**)(uint64_t, uint64_t))(v10 - 8);
    id v20 = (void (**)(char *, char *, uint64_t))(v10 + 16);
    swift_bridgeObjectRetain();
    uint64_t v23 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 40);
    v18[1] = (v10 + 40) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    while (1)
    {
      v24(v8, v12, v3);
      uint64_t v13 = *v23;
      (*v23)(v8, 0, 1, v3);
      if ((*v22)(v8, 1, v3) == 1) {
        break;
      }
      uint64_t v14 = (uint64_t)v25;
      (*v20)(v25, v8, v3);
      id v15 = sub_10000FA38(v14, v26);
      (*v19)(v14, v3);
      if (v15)
      {
        sub_100014FE8();
        if (*(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v27 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_100015028();
        }
        sub_100015048();
        sub_100015018();
      }
      v12 += v21;
      if (!--v9)
      {
        v13(v8, 1, 1, v3);
        break;
      }
    }
  }
  else
  {
    uint64_t v16 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v4 + 56);
    swift_bridgeObjectRetain();
    v16(v8, 1, 1, v3);
  }
  swift_bridgeObjectRelease();
  return v27;
}

uint64_t sub_100010198(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v26 = a4;
  unint64_t v28 = (unint64_t)_swiftEmptyArrayStorage;
  uint64_t v7 = *(void *)(a1 + 56);
  uint64_t v24 = a1 + 56;
  uint64_t v8 = 1 << *(unsigned char *)(a1 + 32);
  uint64_t v9 = -1;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  unint64_t v10 = v9 & v7;
  int64_t v25 = (unint64_t)(v8 + 63) >> 6;
  uint64_t result = swift_bridgeObjectRetain();
  int64_t v12 = 0;
  if (v10) {
    goto LABEL_6;
  }
LABEL_9:
  if (!__OFADD__(v12++, 1))
  {
    if (v12 >= v25) {
      goto LABEL_36;
    }
    unint64_t v16 = *(void *)(v24 + 8 * v12);
    if (v16)
    {
LABEL_21:
      unint64_t v10 = (v16 - 1) & v16;
      for (unint64_t i = __clz(__rbit64(v16)) + (v12 << 6); ; unint64_t i = v13 | (v12 << 6))
      {
        NSString v18 = (void *)(*(void *)(a1 + 48) + 16 * i);
        uint64_t v19 = v18[1];
        v27[0] = *v18;
        v27[1] = v19;
        __chkstk_darwin(result);
        v23[2] = a3;
        v23[3] = v26;
        v23[4] = v27;
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        unint64_t v20 = (unint64_t)sub_100008BA0((uint64_t (*)(id *))sub_1000115F4, v23, a2);
        unint64_t v21 = v20;
        if (v20 >> 62)
        {
          uint64_t result = sub_100015298();
          if (!result) {
            goto LABEL_5;
          }
        }
        else
        {
          uint64_t result = *(void *)((v20 & 0xFFFFFFFFFFFFFF8) + 0x10);
          if (!result)
          {
LABEL_5:
            swift_bridgeObjectRelease();
            uint64_t result = swift_bridgeObjectRelease();
            if (!v10) {
              goto LABEL_9;
            }
            goto LABEL_6;
          }
        }
        if ((v21 & 0xC000000000000001) != 0)
        {
          sub_100015228();
        }
        else
        {
          if (!*(void *)((v21 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_38;
          }
          id v22 = *(id *)(v21 + 32);
        }
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        sub_100014FE8();
        if (*(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v28 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
          sub_100015028();
        }
        sub_100015048();
        uint64_t result = sub_100015018();
        if (!v10) {
          goto LABEL_9;
        }
LABEL_6:
        unint64_t v13 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
      }
    }
    int64_t v17 = v12 + 1;
    if (v12 + 1 >= v25) {
      goto LABEL_36;
    }
    unint64_t v16 = *(void *)(v24 + 8 * v17);
    if (!v16)
    {
      int64_t v17 = v12 + 2;
      if (v12 + 2 >= v25) {
        goto LABEL_36;
      }
      unint64_t v16 = *(void *)(v24 + 8 * v17);
      if (!v16)
      {
        int64_t v17 = v12 + 3;
        if (v12 + 3 >= v25) {
          goto LABEL_36;
        }
        unint64_t v16 = *(void *)(v24 + 8 * v17);
        if (!v16)
        {
          int64_t v17 = v12 + 4;
          if (v12 + 4 < v25)
          {
            unint64_t v16 = *(void *)(v24 + 8 * v17);
            if (v16) {
              goto LABEL_20;
            }
            while (1)
            {
              int64_t v12 = v17 + 1;
              if (__OFADD__(v17, 1)) {
                goto LABEL_39;
              }
              if (v12 >= v25) {
                break;
              }
              unint64_t v16 = *(void *)(v24 + 8 * v12);
              ++v17;
              if (v16) {
                goto LABEL_21;
              }
            }
          }
LABEL_36:
          swift_release();
          return v28;
        }
      }
    }
LABEL_20:
    int64_t v12 = v17;
    goto LABEL_21;
  }
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
  return result;
}

void sub_100010498(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v6 = sub_100015298();
    swift_bridgeObjectRelease();
    if (v6)
    {
LABEL_3:
      sub_1000114A8(&qword_10001CDC8);
      uint64_t v3 = (void *)sub_100015218();
      uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8;
      if (!v2) {
        goto LABEL_4;
      }
LABEL_8:
      swift_bridgeObjectRetain();
      uint64_t v5 = sub_100015298();
      swift_bridgeObjectRelease();
      if (!v5) {
        return;
      }
      goto LABEL_9;
    }
  }
  else if (*(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
    goto LABEL_3;
  }
  uint64_t v3 = &_swiftEmptySetSingleton;
  uint64_t v4 = a1 & 0xFFFFFFFFFFFFFF8;
  if (v2) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = *(void *)(v4 + 16);
  if (!v5) {
    return;
  }
LABEL_9:
  uint64_t v7 = (char *)(v3 + 7);
  uint64_t v43 = v5;
  if ((a1 & 0xC000000000000001) != 0)
  {
    uint64_t v8 = 0;
    while (1)
    {
      while (1)
      {
        uint64_t v9 = sub_100015228();
        BOOL v10 = __OFADD__(v8++, 1);
        if (v10)
        {
          __break(1u);
          goto LABEL_36;
        }
        uint64_t v11 = v9;
        Swift::Int v12 = sub_100015138(v3[5]);
        uint64_t v13 = -1 << *((unsigned char *)v3 + 32);
        unint64_t v14 = v12 & ~v13;
        unint64_t v15 = v14 >> 6;
        uint64_t v16 = *(void *)&v7[8 * (v14 >> 6)];
        uint64_t v17 = 1 << v14;
        if (((1 << v14) & v16) != 0) {
          break;
        }
LABEL_20:
        *(void *)&v7[8 * v15] = v17 | v16;
        *(void *)(v3[6] + 8 * v14) = v11;
        uint64_t v23 = v3[2];
        BOOL v10 = __OFADD__(v23, 1);
        uint64_t v24 = v23 + 1;
        if (v10) {
          goto LABEL_37;
        }
        v3[2] = v24;
        if (v8 == v5) {
          return;
        }
      }
      sub_100011620(0, &qword_10001CD40);
      id v18 = *(id *)(v3[6] + 8 * v14);
      char v19 = sub_100015148();

      if ((v19 & 1) == 0)
      {
        uint64_t v20 = ~v13;
        while (1)
        {
          unint64_t v14 = (v14 + 1) & v20;
          unint64_t v15 = v14 >> 6;
          uint64_t v16 = *(void *)&v7[8 * (v14 >> 6)];
          uint64_t v17 = 1 << v14;
          if ((v16 & (1 << v14)) == 0) {
            break;
          }
          id v21 = *(id *)(v3[6] + 8 * v14);
          char v22 = sub_100015148();

          if (v22) {
            goto LABEL_11;
          }
        }
        uint64_t v5 = v43;
        goto LABEL_20;
      }
LABEL_11:
      swift_unknownObjectRelease();
      uint64_t v5 = v43;
      if (v8 == v43) {
        return;
      }
    }
  }
  uint64_t v25 = 0;
  unint64_t v41 = a1 + 32;
  uint64_t v42 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (v25 != v42)
  {
    Swift::Int v26 = v3[5];
    id v27 = *(id *)(v41 + 8 * v25);
    Swift::Int v28 = sub_100015138(v26);
    uint64_t v29 = -1 << *((unsigned char *)v3 + 32);
    unint64_t v30 = v28 & ~v29;
    unint64_t v31 = v30 >> 6;
    uint64_t v32 = *(void *)&v7[8 * (v30 >> 6)];
    uint64_t v33 = 1 << v30;
    if (((1 << v30) & v32) != 0)
    {
      sub_100011620(0, &qword_10001CD40);
      id v34 = *(id *)(v3[6] + 8 * v30);
      char v35 = sub_100015148();

      if (v35)
      {
LABEL_24:

        goto LABEL_25;
      }
      uint64_t v36 = ~v29;
      while (1)
      {
        unint64_t v30 = (v30 + 1) & v36;
        unint64_t v31 = v30 >> 6;
        uint64_t v32 = *(void *)&v7[8 * (v30 >> 6)];
        uint64_t v33 = 1 << v30;
        if ((v32 & (1 << v30)) == 0) {
          break;
        }
        id v37 = *(id *)(v3[6] + 8 * v30);
        char v38 = sub_100015148();

        if (v38) {
          goto LABEL_24;
        }
      }
    }
    *(void *)&v7[8 * v31] = v33 | v32;
    *(void *)(v3[6] + 8 * v30) = v27;
    uint64_t v39 = v3[2];
    BOOL v10 = __OFADD__(v39, 1);
    uint64_t v40 = v39 + 1;
    if (v10) {
      goto LABEL_38;
    }
    v3[2] = v40;
LABEL_25:
    if (++v25 == v43) {
      return;
    }
  }
LABEL_36:
  __break(1u);
LABEL_37:
  __break(1u);
LABEL_38:
  __break(1u);
}

uint64_t sub_1000107F4(unint64_t a1)
{
  unint64_t v2 = a1 >> 62;
  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    sub_100015298();
    swift_bridgeObjectRelease();
  }
  sub_100011620(0, &qword_10001CD40);
  sub_100011754();
  uint64_t result = sub_1000150B8();
  uint64_t v10 = result;
  if (v2)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_100015298();
    uint64_t result = swift_bridgeObjectRelease();
    if (!v4) {
      return v10;
    }
  }
  else
  {
    uint64_t v4 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v4) {
      return v10;
    }
  }
  if (v4 >= 1)
  {
    if ((a1 & 0xC000000000000001) != 0)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        uint64_t v6 = (void *)sub_100015228();
        sub_10000C7F8(&v9, v6);
      }
    }
    else
    {
      uint64_t v7 = (void **)(a1 + 32);
      do
      {
        uint64_t v8 = *v7++;
        sub_10000C7F8(&v9, v8);

        --v4;
      }
      while (v4);
    }
    return v10;
  }
  __break(1u);
  return result;
}

void *sub_100010948(unint64_t a1, char *a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_100014E18();
  uint64_t v42 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v58 = (char *)&v41 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000114A8(&qword_10001CD18);
  __chkstk_darwin(v8 - 8);
  uint64_t v10 = (char *)&v41 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v64 = _swiftEmptyArrayStorage;
  if (a1 >> 62)
  {
LABEL_28:
    swift_bridgeObjectRetain();
    uint64_t v11 = sub_100015298();
    if (v11) {
      goto LABEL_3;
    }
LABEL_29:
    swift_bridgeObjectRelease();
    return _swiftEmptyArrayStorage;
  }
  uint64_t v11 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  if (!v11) {
    goto LABEL_29;
  }
LABEL_3:
  uint64_t v12 = 0;
  unint64_t v50 = a1 & 0xC000000000000001;
  id v52 = *(id *)&a2[OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource_resourceProvider];
  unint64_t v44 = a1 + 32;
  unint64_t v59 = (unsigned int (**)(char *, uint64_t, uint64_t))(v42 + 48);
  uint64_t v60 = v42 + 16;
  unint64_t v56 = (void (**)(uint64_t, uint64_t))(v42 + 8);
  unint64_t v57 = (void (**)(char *, char *, uint64_t))(v42 + 32);
  uint64_t v45 = a2;
  unint64_t v46 = a1;
  uint64_t v49 = v11;
  uint64_t v55 = (void (**)(void, void, void, void))(v42 + 56);
  while (1)
  {
    if (v50) {
      id v14 = (id)sub_100015228();
    }
    else {
      id v14 = *(id *)(v44 + 8 * v12);
    }
    BOOL v15 = __OFADD__(v12, 1);
    uint64_t v16 = v12 + 1;
    if (v15)
    {
      __break(1u);
      goto LABEL_28;
    }
    uint64_t v54 = v16;
    uint64_t v17 = v14;
    id v18 = [v52 stickersBundlePathForAchievement:v14];
    if (v18) {
      break;
    }

LABEL_5:
    uint64_t v13 = _swiftEmptyArrayStorage;
LABEL_6:
    sub_10000C62C((unint64_t)v13);
    uint64_t v12 = v54;
    if (v54 == v49)
    {
      swift_bridgeObjectRelease();
      return v64;
    }
  }
  char v19 = v18;
  id v53 = v17;
  sub_100014FB8();

  id v20 = objc_allocWithZone((Class)NSBundle);
  NSString v21 = sub_100014F88();
  swift_bridgeObjectRelease();
  id v22 = [v20 initWithPath:v21];

  id v51 = v22;
  if (!v22)
  {

    goto LABEL_5;
  }
  id v23 = [v52 stickerURLsForAchievement:v53];
  sub_1000116C8(&qword_10001CD10, (void (*)(uint64_t))&type metadata accessor for URL);
  sub_1000150A8();

  uint64_t v24 = swift_bridgeObjectRetain();
  uint64_t v25 = sub_100009E90(v24);
  swift_bridgeObjectRelease();
  unint64_t v63 = (unint64_t)v25;
  sub_100009B78((void **)&v63);
  unint64_t v26 = (unint64_t)v55;
  if (!v3)
  {
    uint64_t v48 = 0;
    swift_bridgeObjectRelease();
    unint64_t v27 = v63;
    unint64_t v63 = (unint64_t)_swiftEmptyArrayStorage;
    uint64_t v28 = *(void *)(v27 + 16);
    unint64_t v47 = v27;
    if (v28)
    {
      unint64_t v43 = v26 & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
      unint64_t v29 = v27 + ((*(unsigned __int8 *)(v42 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v42 + 80));
      unint64_t v30 = *(void (**)(char *, unint64_t, uint64_t))(v42 + 16);
      uint64_t v61 = *(void *)(v42 + 72);
      uint64_t v62 = v30;
      unint64_t v31 = a2;
      id v32 = v51;
      swift_retain();
      while (1)
      {
        v62(v10, v29, v6);
        uint64_t v33 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))v26;
        (*(void (**)(char *, void, uint64_t, uint64_t))v26)(v10, 0, 1, v6);
        if ((*v59)(v10, 1, v6) == 1) {
          break;
        }
        uint64_t v34 = (uint64_t)v58;
        (*v57)(v58, v10, v6);
        id v35 = sub_10000FA38(v34, v32);
        (*v56)(v34, v6);
        if (v35)
        {
          sub_100014FE8();
          if (*(void *)((v63 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(void *)((v63 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1) {
            sub_100015028();
          }
          sub_100015048();
          sub_100015018();
          unint64_t v26 = (unint64_t)v55;
        }
        v29 += v61;
        if (!--v28)
        {
          v33(v10, 1, 1, v6);
          break;
        }
      }
    }
    else
    {
      uint64_t v36 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))v26;
      id v37 = a2;
      id v38 = v51;
      swift_retain();
      v36(v10, 1, 1, v6);
    }
    swift_release();
    uint64_t v13 = (void *)v63;

    swift_release();
    a2 = v45;

    id v39 = v51;
    uint64_t v3 = v48;
    a1 = v46;
    goto LABEL_6;
  }
  uint64_t result = (void *)swift_release();
  __break(1u);
  return result;
}

uint64_t sub_100010EB8(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  uint64_t v37 = sub_100014E18();
  uint64_t v8 = *(char **)(v37 - 8);
  uint64_t v9 = __chkstk_darwin(v37);
  uint64_t v36 = (char *)v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v9);
  id v35 = (char *)v30 - v11;
  if (a1 >> 62)
  {
LABEL_17:
    swift_bridgeObjectRetain();
    uint64_t v12 = sub_100015298();
    if (v12) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v12 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v12)
    {
LABEL_3:
      v30[1] = v4;
      uint64_t v31 = v12;
      uint64_t v13 = (void (**)(char *, uint64_t))(v8 + 8);
      uint64_t v33 = v8 + 8;
      unint64_t v34 = a1 & 0xC000000000000001;
      uint64_t v14 = 4;
      unint64_t v32 = a1;
      uint64_t v8 = v35;
      BOOL v15 = v13;
      do
      {
        uint64_t v4 = v14 - 4;
        if (v34)
        {
          id v16 = (id)sub_100015228();
          uint64_t v17 = v14 - 3;
          if (__OFADD__(v4, 1)) {
            goto LABEL_16;
          }
        }
        else
        {
          id v16 = *(id *)(a1 + 8 * v14);
          uint64_t v17 = v14 - 3;
          if (__OFADD__(v4, 1))
          {
LABEL_16:
            __break(1u);
            goto LABEL_17;
          }
        }
        uint64_t v38 = v17;
        id v39 = v16;
        id v18 = [v16 imageFileURL];
        sub_100014E08();

        char v19 = v36;
        sub_100014DF8();
        uint64_t v20 = sub_100014DD8();
        uint64_t v22 = v21;
        uint64_t v23 = a2;
        uint64_t v24 = a3;
        uint64_t v25 = *v15;
        unint64_t v26 = v19;
        uint64_t v27 = v37;
        (*v15)(v26, v37);
        v25(v8, v27);
        a3 = v24;
        a2 = v23;
        if (v20 == v23 && v22 == a3)
        {
          swift_bridgeObjectRelease();

LABEL_15:
          swift_bridgeObjectRelease();
          return 1;
        }
        char v28 = sub_1000152E8();

        swift_bridgeObjectRelease();
        if (v28) {
          goto LABEL_15;
        }
        ++v14;
        a1 = v32;
      }
      while (v38 != v31);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

unint64_t sub_100011174(unint64_t a1, unint64_t a2, void *a3)
{
  unint64_t v15 = a1;
  unint64_t v6 = a1;
  if (a2 >> 62) {
    goto LABEL_14;
  }
  uint64_t v7 = *(void *)((a2 & 0xFFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  for (; v7; uint64_t v7 = sub_100015298())
  {
    uint64_t v8 = 4;
    while (1)
    {
      id v9 = (a2 & 0xC000000000000001) != 0 ? (id)sub_100015228() : *(id *)(a2 + 8 * v8);
      uint64_t v10 = v9;
      uint64_t v11 = v8 - 3;
      if (__OFADD__(v8 - 4, 1)) {
        break;
      }
      id v14 = v9;
      sub_100008D4C(&v15, &v14, a3, &v13);
      swift_bridgeObjectRelease();
      if (v3)
      {
        swift_bridgeObjectRelease();

        return v6;
      }

      unint64_t v6 = v13;
      unint64_t v15 = v13;
      ++v8;
      if (v11 == v7) {
        goto LABEL_10;
      }
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
LABEL_10:
  swift_bridgeObjectRelease();
  return v6;
}

uint64_t sub_1000112B8()
{
  sub_1000114A8(&qword_10001CCF0);
  uint64_t v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_100016550;
  uint64_t v2 = OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource_stickers;
  unint64_t v3 = *(void *)(v0 + OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource_stickers);
  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v4 = sub_100015298();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v4 = *(void *)((v3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  *(void *)(v1 + 56) = &type metadata for Int;
  *(void *)(v1 + 64) = &protocol witness table for Int;
  *(void *)(v1 + 32) = v4;
  sub_1000150E8();
  if (qword_10001CBC0 != -1) {
    swift_once();
  }
  sub_1000114A8(&qword_10001CCF8);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100016550;
  *(void *)(v5 + 56) = sub_1000114A8(&qword_10001CD00);
  *(void *)(v5 + 64) = sub_100011710((unint64_t *)&qword_10001CD08, &qword_10001CD00);
  *(void *)(v5 + 32) = v1;
  swift_bridgeObjectRetain();
  sub_100014ED8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  unint64_t v6 = *(void *)(v0 + v2);
  if (!(v6 >> 62)) {
    return *(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRetain();
  uint64_t v8 = sub_100015298();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_1000114A8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000114EC(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_100011534()
{
  unint64_t result = qword_10001CD20;
  if (!qword_10001CD20)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CD20);
  }
  return result;
}

uint64_t sub_100011588()
{
  return swift_release();
}

uint64_t sub_100011594(uint64_t a1)
{
  uint64_t v2 = sub_1000114A8(&qword_10001CD18);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1000115F4(uint64_t *a1)
{
  return sub_100009688(*a1, *(void (**)(uint64_t *__return_ptr, uint64_t *))(v1 + 16), *(void *)(v1 + 24), **(void **)(v1 + 32), *(void *)(*(void *)(v1 + 32) + 8)) & 1;
}

uint64_t sub_100011620(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10001165C()
{
  swift_bridgeObjectRelease();
  swift_release();

  return _swift_deallocObject(v0, 48, 7);
}

void sub_1000116A4()
{
  sub_10000804C(*(void *)(v0 + 16), *(void (**)(id))(v0 + 24));
}

uint64_t sub_1000116B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000116C0()
{
  return swift_release();
}

uint64_t sub_1000116C8(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100011710(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_1000114EC(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_100011754()
{
  unint64_t result = qword_10001CDB8;
  if (!qword_10001CDB8)
  {
    sub_100011620(255, &qword_10001CD40);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CDB8);
  }
  return result;
}

uint64_t sub_1000117BC(uint64_t a1)
{
  return sub_100006F18(a1, *(char **)(v1 + 16));
}

uint64_t sub_1000117C4(uint64_t a1)
{
  return sub_100007090(a1, *(void **)(v1 + 16));
}

uint64_t sub_1000117CC(uint64_t a1)
{
  return sub_100007264(a1, *(void **)(v1 + 16));
}

uint64_t sub_1000117D4(uint64_t a1)
{
  return sub_100007430(a1, *(void **)(v1 + 16));
}

uint64_t sub_1000117DC(uint64_t a1)
{
  return sub_1000075FC(a1, *(void *)(v1 + 16));
}

uint64_t sub_1000117E4(uint64_t a1)
{
  return sub_100006898(a1, *(char **)(v1 + 16));
}

uint64_t sub_1000117EC(uint64_t a1)
{
  return sub_100006A30(a1, *(void **)(v1 + 16));
}

uint64_t sub_1000117F4(uint64_t a1)
{
  return sub_100006BBC(a1, *(void **)(v1 + 16));
}

uint64_t sub_1000117FC(uint64_t a1)
{
  return sub_100006D48(a1, *(void **)(v1 + 16));
}

uint64_t sub_100011804()
{
  swift_unknownObjectWeakDestroy();

  return _swift_deallocObject(v0, 24, 7);
}

void sub_10001183C()
{
}

void sub_100011858(void *a1)
{
}

void sub_100011874(void *a1)
{
}

void sub_100011890(void *a1)
{
}

uint64_t sub_1000118AC()
{
  return _swift_deallocObject(v0, 24, 7);
}

id sub_1000118E4(unint64_t a1)
{
  sub_1000114A8(&qword_10001CCF0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100016550;
  *(void *)(v3 + 56) = &type metadata for Int;
  *(void *)(v3 + 64) = &protocol witness table for Int;
  *(void *)(v3 + 32) = a1;
  sub_1000150E8();
  if (qword_10001CBC0 != -1) {
    swift_once();
  }
  sub_1000114A8(&qword_10001CCF8);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100016550;
  *(void *)(v4 + 56) = sub_1000114A8(&qword_10001CD00);
  *(void *)(v4 + 64) = sub_100011710((unint64_t *)&qword_10001CD08, &qword_10001CD00);
  *(void *)(v4 + 32) = v3;
  swift_bridgeObjectRetain();
  sub_100014ED8();
  swift_bridgeObjectRelease();
  id result = (id)swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(v1 + OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource_stickers);
  if ((v6 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v8 = sub_100015228();
    swift_bridgeObjectRelease();
    return (id)v8;
  }
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a1)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  uint64_t v7 = *(void **)(v6 + 8 * a1 + 32);

  return v7;
}

uint64_t sub_100011AD4(uint64_t a1)
{
  return a1;
}

Swift::Void __swiftcall AppViewController.willBecomeActive(with:)(MSConversation with)
{
  uint64_t v3 = sub_1000114A8(&qword_10001CE40);
  __chkstk_darwin(v3 - 8);
  uint64_t v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ([v1 presentationStyle] == (id)2)
  {
    uint64_t v6 = sub_100015098();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
    sub_100015078();
    id v7 = v1;
    uint64_t v8 = with.super.isa;
    uint64_t v9 = sub_100015068();
    uint64_t v10 = (void *)swift_allocObject();
    v10[2] = v9;
    v10[3] = &protocol witness table for MainActor;
    v10[4] = v7;
    v10[5] = v8;
    sub_100011F48((uint64_t)v5, (uint64_t)&unk_10001CE50, (uint64_t)v10);
    swift_release();
  }
  else
  {
    sub_10001214C();
  }
}

uint64_t sub_100011CF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[2] = sub_100015078();
  v5[3] = sub_100015068();
  id v7 = (void *)swift_task_alloc();
  v5[4] = v7;
  *id v7 = v5;
  v7[1] = sub_100011DAC;
  return sub_1000122C4(a5);
}

uint64_t sub_100011DAC()
{
  swift_task_dealloc();
  uint64_t v1 = sub_100015058();
  return _swift_task_switch(sub_100011EE8, v1, v0);
}

uint64_t sub_100011EE8()
{
  swift_release();
  uint64_t v1 = *(uint64_t (**)(void))(v0 + 8);
  return v1();
}

uint64_t sub_100011F48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = sub_100015098();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_100015088();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100014680(a1, &qword_10001CE40);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_100015058();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_10001214C()
{
  id v17 = [objc_allocWithZone((Class)type metadata accessor for StickerBrowserViewController()) init];
  [v0 addChildViewController:v17];
  id v1 = [v17 view];
  if (!v1)
  {
    __break(1u);
    goto LABEL_9;
  }
  uint64_t v2 = v1;
  id v3 = [v0 view];
  if (!v3)
  {
LABEL_9:
    __break(1u);
    goto LABEL_10;
  }
  uint64_t v4 = v3;
  [v3 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  [v2 setFrame:v6, v8, v10, v12];
  id v13 = [v0 view];
  if (!v13)
  {
LABEL_10:
    __break(1u);
    goto LABEL_11;
  }
  id v14 = v13;
  id v15 = [v17 view];
  if (!v15)
  {
LABEL_11:
    __break(1u);
    return;
  }
  id v16 = v15;
  [v14 addSubview:v15];

  [v17 didMoveToParentViewController:v0];
}

uint64_t sub_1000122C4(uint64_t a1)
{
  v2[2] = a1;
  v2[3] = v1;
  sub_1000114A8(&qword_10001CE90);
  v2[4] = swift_task_alloc();
  uint64_t v3 = sub_100014E88();
  v2[5] = v3;
  v2[6] = *(void *)(v3 - 8);
  v2[7] = swift_task_alloc();
  sub_1000114A8(&qword_10001CD18);
  v2[8] = swift_task_alloc();
  uint64_t v4 = sub_100014E18();
  v2[9] = v4;
  v2[10] = *(void *)(v4 - 8);
  v2[11] = swift_task_alloc();
  v2[12] = swift_task_alloc();
  sub_100015078();
  v2[13] = sub_100015068();
  uint64_t v6 = sub_100015058();
  v2[14] = v6;
  v2[15] = v5;
  return _swift_task_switch(sub_100012484, v6, v5);
}

uint64_t sub_100012484()
{
  id v1 = [*(id *)(v0 + 16) selectedMessage];
  *(void *)(v0 + 128) = v1;
  if (!v1)
  {
    swift_release();
    sub_1000150D8();
    if (qword_10001CBC0 != -1) {
      swift_once();
    }
    sub_1000114A8(&qword_10001CCF8);
    uint64_t v19 = swift_allocObject();
    *(_OWORD *)(v19 + 16) = xmmword_100016550;
    *(void *)(v19 + 56) = sub_1000114A8(&qword_10001CD00);
    *(void *)(v19 + 64) = sub_100013CF8();
    *(void *)(v19 + 32) = _swiftEmptyArrayStorage;
    sub_100014ED8();
    goto LABEL_15;
  }
  uint64_t v2 = v1;
  id v3 = [v1 URL];
  if (!v3)
  {
    (*(void (**)(void, uint64_t, uint64_t, void))(*(void *)(v0 + 80) + 56))(*(void *)(v0 + 64), 1, 1, *(void *)(v0 + 72));
    goto LABEL_12;
  }
  uint64_t v4 = v3;
  uint64_t v6 = *(void *)(v0 + 80);
  uint64_t v5 = *(void *)(v0 + 88);
  uint64_t v8 = *(void *)(v0 + 64);
  uint64_t v7 = *(void *)(v0 + 72);
  sub_100014E08();

  double v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 32);
  v9(v8, v5, v7);
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(v6 + 56))(v8, 0, 1, v7);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v8, 1, v7) == 1)
  {
LABEL_12:
    uint64_t v20 = *(void *)(v0 + 64);
    swift_release();
    sub_100014680(v20, &qword_10001CD18);
    sub_1000150D8();
    if (qword_10001CBC0 != -1) {
      swift_once();
    }
    sub_1000114A8(&qword_10001CCF8);
    uint64_t v21 = swift_allocObject();
    *(_OWORD *)(v21 + 16) = xmmword_100016550;
    *(void *)(v21 + 56) = sub_1000114A8(&qword_10001CD00);
    *(void *)(v21 + 64) = sub_100013CF8();
    *(void *)(v21 + 32) = _swiftEmptyArrayStorage;
    sub_100014ED8();

LABEL_15:
    swift_bridgeObjectRelease();
LABEL_16:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v22 = *(uint64_t (**)(void))(v0 + 8);
    return v22();
  }
  uint64_t v10 = *(void *)(v0 + 40);
  uint64_t v11 = *(void *)(v0 + 48);
  uint64_t v12 = *(void *)(v0 + 32);
  v9(*(void *)(v0 + 96), *(void *)(v0 + 64), *(void *)(v0 + 72));
  [v2 isFromMe];
  sub_100014E78();
  int v13 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v11 + 48))(v12, 1, v10);
  uint64_t v14 = *(void *)(v0 + 32);
  if (v13 == 1)
  {
    swift_release();
    sub_100014680(v14, &qword_10001CE90);
    sub_1000150D8();
    if (qword_10001CBC0 != -1) {
      swift_once();
    }
    uint64_t v15 = *(void *)(v0 + 96);
    uint64_t v16 = *(void *)(v0 + 72);
    uint64_t v17 = *(void *)(v0 + 80);
    sub_1000114A8(&qword_10001CCF8);
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = xmmword_100016550;
    *(void *)(v18 + 56) = sub_1000114A8(&qword_10001CD00);
    *(void *)(v18 + 64) = sub_100013CF8();
    *(void *)(v18 + 32) = _swiftEmptyArrayStorage;
    sub_100014ED8();

    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v17 + 8))(v15, v16);
    goto LABEL_16;
  }
  sub_1000144D8(*(void *)(v0 + 32), *(void *)(v0 + 56));
  sub_100014E58();
  id v24 = [v2 isPending];
  uint64_t v25 = (void *)swift_task_alloc();
  *(void *)(v0 + 136) = v25;
  *uint64_t v25 = v0;
  v25[1] = sub_1000129B8;
  uint64_t v26 = *(void *)(v0 + 96);
  uint64_t v27 = *(void *)(v0 + 56);
  return static ReplyBubbleView.bubbleViewFor(reply:payload:isPending:)(v27, v26, v24);
}

uint64_t sub_1000129B8(uint64_t a1)
{
  uint64_t v2 = *v1;
  *(void *)(*v1 + 144) = a1;
  swift_task_dealloc();
  uint64_t v3 = *(void *)(v2 + 120);
  uint64_t v4 = *(void *)(v2 + 112);
  return _swift_task_switch(sub_100012AE0, v4, v3);
}

id sub_100012AE0()
{
  uint64_t v1 = *(void *)(v0 + 144);
  uint64_t v2 = *(void *)(v0 + 24);
  swift_release();
  uint64_t v3 = OBJC_IVAR____TtC25ActivityMessagesExtension17AppViewController_bubbleView;
  uint64_t v4 = *(void **)(v2 + OBJC_IVAR____TtC25ActivityMessagesExtension17AppViewController_bubbleView);
  *(void *)(v2 + OBJC_IVAR____TtC25ActivityMessagesExtension17AppViewController_bubbleView) = v1;

  uint64_t v5 = *(void **)(v2 + v3);
  if (v5)
  {
    uint64_t v6 = v5;
    sub_1000150E8();
    if (qword_10001CBC0 != -1) {
      swift_once();
    }
    uint64_t v7 = *(void **)(v0 + 24);
    sub_1000114A8(&qword_10001CCF8);
    uint64_t v8 = swift_allocObject();
    *(_OWORD *)(v8 + 16) = xmmword_100016550;
    *(void *)(v8 + 56) = sub_1000114A8(&qword_10001CD00);
    *(void *)(v8 + 64) = sub_100013CF8();
    *(void *)(v8 + 32) = _swiftEmptyArrayStorage;
    sub_100014ED8();
    swift_bridgeObjectRelease();
    double v9 = *(void (**)(uint64_t, _UNKNOWN **))((swift_isaMask & *v6) + 0x80);
    uint64_t v10 = swift_unknownObjectRetain();
    v9(v10, &protocol witness table for AppViewController);
    [v6 setFrame:0.0, 0.0, 0.0, 0.0];
    id result = [v7 view];
    if (!result)
    {
      __break(1u);
      return result;
    }
    uint64_t v12 = result;
    int v13 = *(void **)(v0 + 24);
    [result addSubview:v6];

    [v13 requestResize];
  }
  uint64_t v14 = *(void *)(v0 + 96);
  uint64_t v15 = *(void *)(v0 + 72);
  uint64_t v16 = *(void *)(v0 + 80);
  uint64_t v17 = *(void *)(v0 + 56);

  sub_10001453C(v17);
  (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v14, v15);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v18 = *(uint64_t (**)(void))(v0 + 8);
  return (id)v18();
}

Swift::Void __swiftcall AppViewController.viewDidLoad()()
{
  v4.receiver = v0;
  v4.super_class = (Class)type metadata accessor for AppViewController();
  [super viewDidLoad];
  id v1 = [v0 view];
  if (v1)
  {
    uint64_t v2 = v1;
    id v3 = [self clearColor];
    [v2 setBackgroundColor:v3];
  }
  else
  {
    __break(1u);
  }
}

Swift::Void __swiftcall AppViewController.viewDidLayoutSubviews()()
{
  v26.receiver = v0;
  v26.super_class = (Class)type metadata accessor for AppViewController();
  [super viewDidLayoutSubviews];
  id v1 = [self mainScreen];
  [v1 bounds];
  double v3 = v2;
  double v5 = v4;

  id v6 = [v0 view];
  if (!v6)
  {
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v7 = v6;
  [v6 bounds];
  double v9 = v8;
  double v11 = v10;

  if (v3 > v9 || v5 > v11)
  {
    int v13 = *(void **)&v0[OBJC_IVAR____TtC25ActivityMessagesExtension17AppViewController_bubbleView];
    if (!v13) {
      return;
    }
    id v14 = v13;
    id v15 = [v0 view];
    if (v15)
    {
      uint64_t v16 = v15;
      [v15 bounds];
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;

      [v14 setFrame:v18, v20, v22, v24];
      return;
    }
LABEL_15:
    __break(1u);
    return;
  }
  sub_1000150E8();
  if (qword_10001CBC0 != -1) {
    swift_once();
  }
  sub_1000114A8(&qword_10001CCF8);
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_100016550;
  *(void *)(v25 + 56) = sub_1000114A8(&qword_10001CD00);
  *(void *)(v25 + 64) = sub_100013CF8();
  *(void *)(v25 + 32) = _swiftEmptyArrayStorage;
  sub_100014ED8();
  swift_bridgeObjectRelease();
}

CGSize __swiftcall AppViewController.contentSizeThatFits(_:)(CGSize a1)
{
  double width = a1.width;
  double v3 = *(void **)(v1 + OBJC_IVAR____TtC25ActivityMessagesExtension17AppViewController_bubbleView);
  if (v3)
  {
    double height = a1.height;
    double v5 = v3;
    [v5 setFrame:CGRectMake(0.0, 0.0, width, height)];
    [v5 layoutIfNeeded];
    sub_1000114A8(&qword_10001CCF0);
    uint64_t v6 = swift_allocObject();
    *(_OWORD *)(v6 + 16) = xmmword_100016550;
    uint64_t v7 = *(void (**)(void))((swift_isaMask & *v5) + 0x90);
    v7();
    uint64_t v8 = sub_100015128();
    uint64_t v10 = v9;
    *(void *)(v6 + 56) = &type metadata for String;
    *(void *)(v6 + 64) = sub_100011534();
    *(void *)(v6 + 32) = v8;
    *(void *)(v6 + 40) = v10;
    sub_1000150E8();
    if (qword_10001CBC0 != -1) {
      swift_once();
    }
    sub_1000114A8(&qword_10001CCF8);
    uint64_t v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_100016550;
    *(void *)(v11 + 56) = sub_1000114A8(&qword_10001CD00);
    *(void *)(v11 + 64) = sub_100013CF8();
    *(void *)(v11 + 32) = v6;
    swift_bridgeObjectRetain();
    sub_100014ED8();
    swift_bridgeObjectRelease();
    uint64_t v12 = swift_bridgeObjectRelease();
    double width = ((double (*)(uint64_t))v7)(v12);
    uint64_t v14 = v13;
  }
  else
  {
    sub_1000150D8();
    if (qword_10001CBC0 != -1) {
      swift_once();
    }
    sub_1000114A8(&qword_10001CCF8);
    uint64_t v15 = swift_allocObject();
    *(_OWORD *)(v15 + 16) = xmmword_100016550;
    *(void *)(v15 + 56) = sub_1000114A8(&qword_10001CD00);
    *(void *)(v15 + 64) = sub_100013CF8();
    *(void *)(v15 + 32) = _swiftEmptyArrayStorage;
    sub_100014ED8();
    swift_bridgeObjectRelease();
    *(double *)&uint64_t v14 = 114.0;
  }
  double v16 = width;
  double v17 = *(double *)&v14;
  result.double height = v17;
  result.double width = v16;
  return result;
}

uint64_t AppViewController.didTapReply(_:friend:activityDate:behavior:)(uint64_t a1)
{
  return sub_100014134(a1);
}

unint64_t sub_100013424(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    double v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000114A8(&qword_10001CE98);
  uint64_t v2 = sub_1000152A8();
  double v3 = (void *)v2;
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
    sub_100014608(v6, (uint64_t)&v13);
    uint64_t v7 = v13;
    unint64_t result = sub_100013F28(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_100014670(&v14, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_100013540(char a1)
{
  sub_1000114A8(&qword_10001CCF0);
  uint64_t v2 = swift_allocObject();
  uint64_t v3 = v2;
  *(_OWORD *)(v2 + 16) = xmmword_100016550;
  BOOL v4 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v5 = 1702195828;
  }
  else {
    uint64_t v5 = 0x65736C6166;
  }
  if (v4) {
    unint64_t v6 = 0xE500000000000000;
  }
  else {
    unint64_t v6 = 0xE400000000000000;
  }
  *(void *)(v2 + 56) = &type metadata for String;
  *(void *)(v2 + 64) = sub_100011534();
  *(void *)(v3 + 32) = v5;
  *(void *)(v3 + 40) = v6;
  sub_1000150E8();
  if (qword_10001CBC0 != -1) {
    swift_once();
  }
  sub_1000114A8(&qword_10001CCF8);
  uint64_t v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_100016550;
  *(void *)(v7 + 56) = sub_1000114A8(&qword_10001CD00);
  *(void *)(v7 + 64) = sub_100013CF8();
  *(void *)(v7 + 32) = v3;
  swift_bridgeObjectRetain();
  sub_100014ED8();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

uint64_t sub_1000136A8(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

id AppViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v4 = v3;
  if (a2)
  {
    NSString v6 = sub_100014F88();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  id v7 = [objc_allocWithZone(v4) initWithNibName:v6 bundle:a3];

  return v7;
}

id AppViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  *(void *)&v3[OBJC_IVAR____TtC25ActivityMessagesExtension17AppViewController_bubbleView] = 0;
  if (a2)
  {
    NSString v5 = sub_100014F88();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  v8.receiver = v3;
  v8.super_class = (Class)type metadata accessor for AppViewController();
  [super initWithNibName:v5 bundle:a3];

  return v6;
}

id AppViewController.__allocating_init(coder:)(void *a1)
{
  id v3 = [objc_allocWithZone(v1) initWithCoder:a1];

  return v3;
}

id AppViewController.init(coder:)(void *a1)
{
  *(void *)&v1[OBJC_IVAR____TtC25ActivityMessagesExtension17AppViewController_bubbleView] = 0;
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for AppViewController();
  id v3 = [super initWithCoder:a1];

  return v3;
}

id AppViewController.__allocating_init(shouldBeSheetPresentationControllerDelegate:)(char a1)
{
  id v3 = objc_allocWithZone(v1);

  return [v3 initWithShouldBeSheetPresentationControllerDelegate:a1 & 1];
}

id AppViewController.init(shouldBeSheetPresentationControllerDelegate:)(char a1)
{
  *(void *)&v1[OBJC_IVAR____TtC25ActivityMessagesExtension17AppViewController_bubbleView] = 0;
  v4.receiver = v1;
  v4.super_class = (Class)type metadata accessor for AppViewController();
  return [super initWithShouldBeSheetPresentationControllerDelegate:a1 & 1];
}

id AppViewController.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppViewController();
  [super dealloc];
}

uint64_t sub_100013AD8()
{
  swift_unknownObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100013B20(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  objc_super v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  void *v8 = v2;
  v8[1] = sub_100013BE0;
  return sub_100011CF0(a1, v4, v5, v7, v6);
}

uint64_t sub_100013BE0()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t type metadata accessor for AppViewController()
{
  return self;
}

unint64_t sub_100013CF8()
{
  unint64_t result = qword_10001CD08;
  if (!qword_10001CD08)
  {
    sub_1000114EC(&qword_10001CD00);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CD08);
  }
  return result;
}

uint64_t sub_100013D54(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  uint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  *uint64_t v4 = v2;
  v4[1] = sub_100013E30;
  return v6(a1);
}

uint64_t sub_100013E30()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_100013F28(uint64_t a1)
{
  sub_100014FB8();
  sub_100015308();
  sub_100014FD8();
  Swift::Int v2 = sub_100015328();
  swift_bridgeObjectRelease();

  return sub_100013FBC(a1, v2);
}

unint64_t sub_100013FBC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_100014FB8();
    uint64_t v8 = v7;
    if (v6 == sub_100014FB8() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_1000152E8();
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
          uint64_t v13 = sub_100014FB8();
          uint64_t v15 = v14;
          if (v13 == sub_100014FB8() && v15 == v16) {
            break;
          }
          char v18 = sub_1000152E8();
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

uint64_t sub_100014134(uint64_t a1)
{
  uint64_t v2 = sub_100014E18();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  unint64_t v5 = (char *)&aBlock[-2] - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((sub_100014E68() & 1) != 0 && *(unsigned char *)(a1 + 16) != 1)
  {
    v7.super.Class isa = sub_100014E28().super.isa;
    id v8 = (id)ASActivityAppLaunchURLForMeOnDate();
  }
  else
  {
    Class isa = sub_100014E38().super.isa;
    v7.super.Class isa = sub_100014E28().super.isa;
    id v8 = (id)ASActivityAppLaunchURLForFriendOnDate();
  }
  sub_100014E08();

  sub_1000114A8(&qword_10001CCF0);
  uint64_t v9 = swift_allocObject();
  long long v21 = xmmword_100016550;
  *(_OWORD *)(v9 + 16) = xmmword_100016550;
  uint64_t v10 = sub_100014DC8();
  uint64_t v12 = v11;
  *(void *)(v9 + 56) = &type metadata for String;
  *(void *)(v9 + 64) = sub_100011534();
  *(void *)(v9 + 32) = v10;
  *(void *)(v9 + 40) = v12;
  sub_1000150E8();
  if (qword_10001CBC0 != -1) {
    swift_once();
  }
  sub_1000114A8(&qword_10001CCF8);
  uint64_t v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = v21;
  *(void *)(v13 + 56) = sub_1000114A8(&qword_10001CD00);
  *(void *)(v13 + 64) = sub_100013CF8();
  *(void *)(v13 + 32) = v9;
  swift_bridgeObjectRetain();
  sub_100014ED8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v14 = [self sharedApplication];
  sub_100014DE8(v15);
  double v17 = v16;
  sub_100013424((uint64_t)_swiftEmptyArrayStorage);
  type metadata accessor for OpenExternalURLOptionsKey();
  sub_100014598();
  Class v18 = sub_100014F78().super.isa;
  swift_bridgeObjectRelease();
  aBlock[4] = sub_100013540;
  aBlock[5] = 0;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1000136A8;
  aBlock[3] = &unk_100018DD8;
  double v19 = _Block_copy(aBlock);
  [v14 openURL:v17 options:v18 completionHandler:v19];
  _Block_release(v19);

  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

uint64_t sub_1000144D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_100014E88();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_10001453C(uint64_t a1)
{
  uint64_t v2 = sub_100014E88();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_100014598()
{
  unint64_t result = qword_10001CBF8;
  if (!qword_10001CBF8)
  {
    type metadata accessor for OpenExternalURLOptionsKey();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001CBF8);
  }
  return result;
}

uint64_t sub_1000145F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_100014600()
{
  return swift_release();
}

uint64_t sub_100014608(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000114A8(&qword_10001CEA0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_100014670(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100014680(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000114A8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1000146DC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100014714(uint64_t a1)
{
  uint64_t v4 = *(int **)(v1 + 16);
  unint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *unint64_t v5 = v2;
  v5[1] = sub_100013BE0;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_10001CEA8 + dword_10001CEA8);
  return v6(a1, v4);
}

void sub_1000148D8(char a1)
{
  v5.receiver = v1;
  v5.super_class = (Class)type metadata accessor for StickerBrowserViewController();
  [super viewWillAppear:a1 & 1];
  sub_1000150E8();
  if (qword_10001CBC0 != -1) {
    swift_once();
  }
  sub_1000114A8(&qword_10001CCF8);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_100016550;
  *(void *)(v3 + 56) = sub_1000114A8(&qword_10001CD00);
  *(void *)(v3 + 64) = sub_100013CF8();
  *(void *)(v3 + 32) = _swiftEmptyArrayStorage;
  sub_100014ED8();
  swift_bridgeObjectRelease();
  id v4 = [v1 stickerBrowserView];
  [v4 reloadData];
}

id sub_100014B4C()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for StickerBrowserViewController();
  return [super dealloc];
}

uint64_t type metadata accessor for StickerBrowserViewController()
{
  return self;
}

id sub_100014BB4(unint64_t a1)
{
  uint64_t v3 = *(void *)(v1 + OBJC_IVAR____TtC25ActivityMessagesExtension28StickerBrowserViewController_dataSource);
  sub_1000114A8(&qword_10001CCF0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_100016550;
  *(void *)(v4 + 56) = &type metadata for Int;
  *(void *)(v4 + 64) = &protocol witness table for Int;
  *(void *)(v4 + 32) = a1;
  sub_1000150E8();
  if (qword_10001CBC0 != -1) {
    swift_once();
  }
  sub_1000114A8(&qword_10001CCF8);
  uint64_t v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_100016550;
  *(void *)(v5 + 56) = sub_1000114A8(&qword_10001CD00);
  *(void *)(v5 + 64) = sub_100013CF8();
  *(void *)(v5 + 32) = v4;
  swift_bridgeObjectRetain();
  sub_100014ED8();
  swift_bridgeObjectRelease();
  id result = (id)swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(v3 + OBJC_IVAR____TtC25ActivityMessagesExtension17StickerDataSource_stickers);
  if ((v7 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    uint64_t v9 = sub_100015228();
    swift_bridgeObjectRelease();
    return (id)v9;
  }
  if ((a1 & 0x8000000000000000) != 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) <= a1)
  {
LABEL_11:
    __break(1u);
    return result;
  }
  uint64_t v8 = *(void **)(v7 + 8 * a1 + 32);

  return v8;
}

uint64_t sub_100014D84()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t sub_100014DB8()
{
  return _convertNSErrorToError(_:)();
}

uint64_t sub_100014DC8()
{
  return URL.absoluteString.getter();
}

uint64_t sub_100014DD8()
{
  return URL.lastPathComponent.getter();
}

void sub_100014DE8(NSURL *retstr@<X8>)
{
}

uint64_t sub_100014DF8()
{
  return URL.deletingPathExtension()();
}

uint64_t sub_100014E08()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100014E18()
{
  return type metadata accessor for URL();
}

NSDate sub_100014E28()
{
  return Date._bridgeToObjectiveC()();
}

NSUUID sub_100014E38()
{
  return UUID._bridgeToObjectiveC()();
}

uint64_t sub_100014E58()
{
  return type metadata accessor for ReplyBubbleView();
}

uint64_t sub_100014E68()
{
  return static ReplyBubbleViewTapBehavior.__derived_enum_equals(_:_:)();
}

uint64_t sub_100014E78()
{
  return static Reply.reply(from:isFromMe:)();
}

uint64_t sub_100014E88()
{
  return type metadata accessor for Reply();
}

uint64_t sub_100014E98()
{
  return ActivityAwardsQuery.init(initialAwardsHandler:addedAwardsHandler:removedAwardsHandler:updatedAwardsHandler:)();
}

uint64_t sub_100014EA8()
{
  return dispatch thunk of ActivityAwardsQuery.deactivate()();
}

uint64_t sub_100014EB8()
{
  return dispatch thunk of ActivityAwardsQuery.activate()();
}

uint64_t sub_100014EC8()
{
  return type metadata accessor for ActivityAwardsQuery();
}

uint64_t sub_100014ED8()
{
  return os_log(_:dso:log:type:_:)();
}

uint64_t sub_100014EE8()
{
  return type metadata accessor for DispatchTimeInterval();
}

uint64_t sub_100014EF8()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t sub_100014F08()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t sub_100014F18()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t sub_100014F28()
{
  return static DispatchWallTime.now()();
}

uint64_t sub_100014F38()
{
  return type metadata accessor for DispatchWallTime();
}

uint64_t sub_100014F48()
{
  return DispatchWorkItem.init(flags:block:)();
}

uint64_t sub_100014F58()
{
  return type metadata accessor for DispatchWorkItem();
}

uint64_t sub_100014F68()
{
  return + infix(_:_:)();
}

NSDictionary sub_100014F78()
{
  return Dictionary._bridgeToObjectiveC()();
}

NSString sub_100014F88()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_100014F98()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100014FA8()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_100014FB8()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100014FC8()
{
  return String.init<A>(describing:)();
}

uint64_t sub_100014FD8()
{
  return String.hash(into:)();
}

uint64_t sub_100014FE8()
{
  return specialized Array._makeUniqueAndReserveCapacityIfNotUnique()();
}

NSArray sub_100014FF8()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_100015008()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100015018()
{
  return specialized Array._endMutation()();
}

uint64_t sub_100015028()
{
  return specialized Array._createNewBuffer(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100015038()
{
  return static Array._allocateBufferUninitialized(minimumCapacity:)();
}

uint64_t sub_100015048()
{
  return specialized Array._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100015058()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t sub_100015068()
{
  return static MainActor.shared.getter();
}

uint64_t sub_100015078()
{
  return type metadata accessor for MainActor();
}

uint64_t sub_100015088()
{
  return TaskPriority.rawValue.getter();
}

uint64_t sub_100015098()
{
  return type metadata accessor for TaskPriority();
}

uint64_t sub_1000150A8()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_1000150B8()
{
  return Set.init(minimumCapacity:)();
}

uint64_t sub_1000150C8()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t sub_1000150D8()
{
  return static os_log_type_t.error.getter();
}

uint64_t sub_1000150E8()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_1000150F8()
{
  return OS_dispatch_queue.asyncAfter(wallDeadline:execute:)();
}

uint64_t sub_100015108()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t sub_100015118()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t sub_100015128()
{
  return CGSize.debugDescription.getter();
}

Swift::Int sub_100015138(Swift::Int seed)
{
  return NSObject._rawHashValue(seed:)(seed);
}

uint64_t sub_100015148()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t sub_100015158()
{
  return OS_os_log.init(subsystem:category:)();
}

uint64_t sub_100015168()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t sub_100015178()
{
  return _HashTable.previousHole(before:)();
}

uint64_t sub_100015188()
{
  return _HashTable.nextHole(atOrAfter:)();
}

uint64_t sub_100015198()
{
  return __CocoaSet.makeIterator()();
}

uint64_t sub_1000151A8()
{
  return __CocoaSet.count.getter();
}

uint64_t sub_1000151B8()
{
  return __CocoaSet.member(for:)();
}

uint64_t sub_1000151C8()
{
  return __CocoaSet.Iterator.next()();
}

uint64_t sub_1000151D8()
{
  return __CocoaSet.contains(_:)();
}

uint64_t sub_1000151E8()
{
  return static _SetStorage.copy(original:)();
}

uint64_t sub_1000151F8()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

uint64_t sub_100015208()
{
  return static _SetStorage.convert(_:capacity:)();
}

uint64_t sub_100015218()
{
  return static _SetStorage.allocate(capacity:)();
}

uint64_t sub_100015228()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_100015238()
{
  return specialized _ArrayBuffer._consumeAndCreateNew(bufferIsUnique:minimumCapacity:growForAppend:)();
}

uint64_t sub_100015248()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t sub_100015258()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t sub_100015268()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t sub_100015278()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t sub_100015288()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_100015298()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_1000152A8()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_1000152D8(Swift::Int a1)
{
  return _minimumMergeRunLength(_:)(a1);
}

uint64_t sub_1000152E8()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_1000152F8()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_100015308()
{
  return Hasher.init(_seed:)();
}

void sub_100015318(Swift::UInt8 a1)
{
}

Swift::Int sub_100015328()
{
  return Hasher._finalize()();
}

uint64_t ACHShouldUseNewAwardsSystem()
{
  return _ACHShouldUseNewAwardsSystem();
}

uint64_t ASActivityAppLaunchURLForFriendOnDate()
{
  return _ASActivityAppLaunchURLForFriendOnDate();
}

uint64_t ASActivityAppLaunchURLForMeOnDate()
{
  return _ASActivityAppLaunchURLForMeOnDate();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void bzero(void *a1, size_t a2)
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

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
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

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return _swift_isUniquelyReferenced_nonNull_bridgeObject();
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

uint64_t swift_release_n()
{
  return _swift_release_n();
}

uint64_t swift_retain()
{
  return _swift_retain();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}