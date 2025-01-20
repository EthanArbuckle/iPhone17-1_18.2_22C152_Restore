void sub_100004BC4(id a1)
{
  uint64_t vars8;

  qword_100026B80 = (uint64_t)os_log_create("com.apple.people", "IMCoreInterface");

  _objc_release_x1();
}

void sub_100004D28(id a1, NSArray *a2)
{
  if (a2 || [0 count]) {
    IMSPIMarkSPIMessagesAsRead();
  }

  _objc_release_x1();
}

void sub_100004F24(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = dispatch_queue_attr_make_with_autorelease_frequency((dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v5 = dispatch_queue_create("com.apple.people.checkWithWait", v4);

  uint64_t v13 = *(void *)(a1 + 32);
  v6 = +[NSArray arrayWithObjects:&v13 count:1];
  uint64_t v12 = *(void *)(a1 + 40);
  v7 = +[NSArray arrayWithObjects:&v12 count:1];
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 32);
  v11 = v3;
  id v8 = v3;
  IMSPIQueryMessagesWithIDsWithOnlyUnreadAndQOS();
}

void sub_1000050B4(void *a1, void *a2)
{
  id v3 = a2;
  v4 = +[IMCoreInterface logHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = [v3 count];
    uint64_t v6 = a1[4];
    uint64_t v7 = a1[5];
    v9[0] = 67109634;
    v9[1] = v5;
    __int16 v10 = 2112;
    uint64_t v11 = v6;
    __int16 v12 = 2112;
    uint64_t v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "checkWithWait returned %d items for %@ on %@", (uint8_t *)v9, 0x1Cu);
  }

  if (v3) {
    id v8 = v3;
  }
  else {
    id v8 = &__NSArray0__struct;
  }
  (*(void (**)(void, void *, void))(a1[6] + 16))(a1[6], v8, 0);
}

id sub_100005620(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[IMCoreInterface checkWithWait:*(void *)(a1 + 32) service:IMSPIiMessageService];
  unsigned int v5 = [v4 then];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100005724;
  v10[3] = &unk_100020E48;
  id v11 = v3;
  uint64_t v6 = (void (*)(void *, void *))v5[2];
  id v7 = v3;
  id v8 = v6(v5, v10);

  return v8;
}

id sub_100005724(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) arrayByAddingObjectsFromArray:a2];
}

id sub_100005730(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[IMCoreInterface checkWithWait:*(void *)(a1 + 32) service:IMSPISMSService];
  unsigned int v5 = [v4 then];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100005834;
  v10[3] = &unk_100020E48;
  id v11 = v3;
  uint64_t v6 = (void (*)(void *, void *))v5[2];
  id v7 = v3;
  id v8 = v6(v5, v10);

  return v8;
}

id sub_100005834(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) arrayByAddingObjectsFromArray:a2];
}

id sub_100005840(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[IMCoreInterface checkWithWait:*(void *)(a1 + 32) service:@"RCS"];
  unsigned int v5 = [v4 then];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100005940;
  v10[3] = &unk_100020E48;
  id v11 = v3;
  uint64_t v6 = (void (*)(void *, void *))v5[2];
  id v7 = v3;
  id v8 = v6(v5, v10);

  return v8;
}

id sub_100005940(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) arrayByAddingObjectsFromArray:a2];
}

id sub_10000594C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[IMCoreInterface checkWithWait:*(void *)(a1 + 32) service:@"SatelliteSMS"];
  unsigned int v5 = [v4 then];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100005A4C;
  v10[3] = &unk_100020E48;
  id v11 = v3;
  uint64_t v6 = (void (*)(void *, void *))v5[2];
  id v7 = v3;
  id v8 = v6(v5, v10);

  return v8;
}

id sub_100005A4C(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) arrayByAddingObjectsFromArray:a2];
}

id sub_100005A58(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[IMCoreInterface checkWithWait:*(void *)(a1 + 32) service:@"iMessageLite"];
  unsigned int v5 = [v4 then];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100005B58;
  v10[3] = &unk_100020E48;
  id v11 = v3;
  uint64_t v6 = (void (*)(void *, void *))v5[2];
  id v7 = v3;
  id v8 = v6(v5, v10);

  return v8;
}

id sub_100005B58(uint64_t a1, uint64_t a2)
{
  return _[*(id *)(a1 + 32) arrayByAddingObjectsFromArray:a2];
}

id sub_100005B64(id a1, NSArray *a2)
{
  v2 = a2;
  if ([(NSArray *)v2 count])
  {
    id v3 = [objc_alloc((Class)NSSortDescriptor) initWithKey:@"date" ascending:1];
    v4 = +[NSMutableArray arrayWithArray:v2];
    id v10 = v3;
    unsigned int v5 = +[NSArray arrayWithObjects:&v10 count:1];
    [v4 sortUsingDescriptors:v5];

    +[NSMutableArray array];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100005CD8;
    v8[3] = &unk_100020EB0;
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = v6;
    [v4 enumerateObjectsUsingBlock:v8];
  }
  else
  {
    id v6 = &__NSArray0__struct;
  }

  return v6;
}

void sub_100005CD8(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [MinMessageItem alloc];
  id v7 = [v3 date];
  unsigned int v5 = [v3 body];

  id v6 = [(MinMessageItem *)v4 initWith:v7 andText:v5];
  [v2 addObject:v6];
}

uint64_t sub_100005D84(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!a2) {
    a2 = &__NSArray0__struct;
  }
  return (*(uint64_t (**)(uint64_t, void *))(v2 + 16))(v2, a2);
}

uint64_t sub_100005DA4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1000067F8(&qword_100026068);
  __chkstk_darwin();
  id v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for URL();
  uint64_t v10 = *(void *)(v9 - 8);
  __chkstk_darwin();
  __int16 v12 = (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  URL.init(string:)();
  uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9);
  if (result == 1)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 32))(v12, v8, v9);
    uint64_t v14 = QuickAction.handle.getter();
    if (v15)
    {
      URL.appendPathComponent(_:)(*(Swift::String *)&v14);
      swift_bridgeObjectRelease();
    }
    uint64_t v17 = v4[5];
    uint64_t v16 = v4[6];
    sub_10000683C(v4 + 2, v17);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t, uint64_t))(v16 + 8))(v12, a3, a4, v17, v16);
    return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  return result;
}

uint64_t sub_100005F90()
{
  sub_100006880(v0 + 16);

  return _swift_deallocClassInstance(v0, 56, 7);
}

uint64_t type metadata accessor for LocationActionHandler()
{
  return self;
}

uint64_t sub_100005FF0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_100005DA4(a1, a2, a3, a4);
}

uint64_t sub_100006014(uint64_t a1, uint64_t a2)
{
  return sub_100006120(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_100006040(uint64_t a1, uint64_t a2)
{
  return sub_100006120(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_100006058()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  String.hash(into:)();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_1000060AC()
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v0 = Hasher._finalize()();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_100006120(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_100006164(uint64_t a1, id *a2)
{
  uint64_t result = static String._forceBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return result;
}

uint64_t sub_1000061DC(uint64_t a1, id *a2)
{
  char v3 = static String._conditionallyBridgeFromObjectiveC(_:result:)();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_10000625C@<X0>(void *a1@<X8>)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1000062A4()
{
  uint64_t v0 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v2 = v1;
  if (v0 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_100006334(uint64_t a1)
{
  uint64_t v2 = sub_100006988(&qword_1000260B0, type metadata accessor for OpenExternalURLOptionsKey);
  uint64_t v3 = sub_100006988(&qword_1000260B8, type metadata accessor for OpenExternalURLOptionsKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_1000063F0@<X0>(void *a1@<X8>)
{
  NSString v2 = String._bridgeToObjectiveC()();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_100006438@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_100006464(uint64_t a1)
{
  uint64_t v2 = sub_100006988((unint64_t *)&qword_1000260C0, type metadata accessor for LaunchOptionsKey);
  uint64_t v3 = sub_100006988(&qword_1000260C8, type metadata accessor for LaunchOptionsKey);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_100006520(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for QuickAction();
  uint64_t v3 = *(void *)(v2 - 8);
  ((void (*)(void))__chkstk_darwin)();
  char v5 = (char *)&v18 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = type metadata accessor for QuickActionType();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  __int16 v12 = (char *)&v18 - v11;
  uint64_t v19 = a1;
  QuickAction.type.getter();
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v10, enum case for QuickActionType.location(_:), v6);
  sub_100006988((unint64_t *)&qword_100026060, (void (*)(uint64_t))&type metadata accessor for QuickActionType);
  dispatch thunk of RawRepresentable.rawValue.getter();
  dispatch thunk of RawRepresentable.rawValue.getter();
  if (v22 == v20 && v23 == v21) {
    char v13 = 1;
  }
  else {
    char v13 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v14 = *(void (**)(char *, uint64_t))(v7 + 8);
  v14(v10, v6);
  v14(v12, v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v19, v2);
  if (v13)
  {
    QuickAction.handle.getter();
    uint64_t v16 = v15;
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    if (v16)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  return 0;
}

uint64_t sub_1000067F8(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *sub_10000683C(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_100006880(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

void type metadata accessor for OpenExternalURLOptionsKey(uint64_t a1)
{
}

void type metadata accessor for LaunchOptionsKey(uint64_t a1)
{
}

void sub_1000068F8(uint64_t a1, unint64_t *a2)
{
  if (!*a2)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4) {
      atomic_store(ForeignTypeMetadata, a2);
    }
  }
}

uint64_t sub_100006940()
{
  return sub_100006988(&qword_100026080, type metadata accessor for LaunchOptionsKey);
}

uint64_t sub_100006988(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_1000069D0()
{
  return sub_100006988(&qword_100026088, type metadata accessor for LaunchOptionsKey);
}

uint64_t sub_100006A18()
{
  return sub_100006988(&qword_100026090, type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_100006A60()
{
  return sub_100006988(&qword_100026098, type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_100006AA8()
{
  return sub_100006988(&qword_1000260A0, type metadata accessor for OpenExternalURLOptionsKey);
}

uint64_t sub_100006AF0()
{
  return sub_100006988(&qword_1000260A8, type metadata accessor for LaunchOptionsKey);
}

void sub_100006B40(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v8 = *(void *)(v7 + 64);
  __chkstk_darwin(v6);
  URL._bridgeToObjectiveC()(&v16);
  uint64_t v10 = v9;
  sub_100016A40((uint64_t)&_swiftEmptyArrayStorage);
  type metadata accessor for OpenExternalURLOptionsKey(0);
  sub_1000070F0(&qword_1000260B0, type metadata accessor for OpenExternalURLOptionsKey);
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  unint64_t v12 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  uint64_t v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v13 + v12, (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  uint64_t v14 = (void *)(v13 + ((v8 + v12 + 7) & 0xFFFFFFFFFFFFFFF8));
  *uint64_t v14 = a2;
  v14[1] = a3;
  uint64_t v18 = sub_100007038;
  uint64_t v19 = v13;
  v16._baseURL = (NSURL *)_NSConcreteStackBlock;
  v16._clients = (void *)1107296256;
  v16._reserved = sub_100006F18;
  uint64_t v17 = &unk_100021100;
  uint64_t v15 = _Block_copy(&v16._baseURL);
  swift_retain();
  swift_release();
  [(NSString *)v16._urlString openURL:v10 options:isa completionHandler:v15];
  _Block_release(v15);
}

uint64_t sub_100006DA8(char a1, uint64_t a2, void (*a3)(uint64_t))
{
  uint64_t v6 = type metadata accessor for URL();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)&v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = 0;
  if ((a1 & 1) == 0)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a2, v6);
    type metadata accessor for FailedToOpenURLError(0);
    sub_1000070F0(&qword_1000260D0, (void (*)(uint64_t))type metadata accessor for FailedToOpenURLError);
    uint64_t v10 = swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v7 + 32))(v11, v9, v6);
  }
  a3(v10);
  return swift_errorRelease();
}

uint64_t sub_100006F18(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v3(a2);

  return swift_release();
}

void sub_100006F6C(uint64_t a1, uint64_t a2, uint64_t a3)
{
}

uint64_t sub_100006F90()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_100007038(char a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for URL() - 8);
  unint64_t v4 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  uint64_t v5 = *(void (**)(uint64_t))(v1 + ((*(void *)(v3 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8));

  return sub_100006DA8(a1, v1 + v4, v5);
}

uint64_t sub_1000070D8(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000070E8()
{
  return swift_release();
}

uint64_t sub_1000070F0(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000713C(uint64_t a1, void (*a2)(uint64_t), uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v23 = a4;
  uint64_t v24 = a3;
  uint64_t v8 = type metadata accessor for URLComponents();
  uint64_t v9 = *(void *)(v8 - 8);
  __chkstk_darwin(v8);
  uint64_t v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000067F8(&qword_100026068);
  __chkstk_darwin(v12 - 8);
  uint64_t v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = type metadata accessor for URL();
  uint64_t v16 = *(void *)(v15 - 8);
  __chkstk_darwin(v15);
  uint64_t v18 = (char *)&v22 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  URLComponents.url.getter();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v14, 1, v15) == 1)
  {
    sub_1000073E4((uint64_t)v14);
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v11, a1, v8);
    type metadata accessor for InvalidURLComponentsError(0);
    sub_100007464();
    uint64_t v19 = swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v9 + 32))(v20, v11, v8);
    a2(v19);
    return swift_errorRelease();
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v16 + 32))(v18, v14, v15);
    (*(void (**)(char *, void (*)(uint64_t), uint64_t, uint64_t, uint64_t))(a5 + 8))(v18, a2, v24, v23, a5);
    return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  }
}

uint64_t sub_1000073E4(uint64_t a1)
{
  uint64_t v2 = sub_1000067F8(&qword_100026068);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for InvalidURLComponentsError(uint64_t a1)
{
  return sub_1000075C4(a1, qword_1000261C8);
}

unint64_t sub_100007464()
{
  unint64_t result = qword_1000260D8;
  if (!qword_1000260D8)
  {
    type metadata accessor for InvalidURLComponentsError(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000260D8);
  }
  return result;
}

uint64_t sub_1000074BC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000762C(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for URL);
}

uint64_t sub_1000074D4(uint64_t a1, uint64_t a2)
{
  return sub_1000076B4(a1, a2, (uint64_t (*)(void))&type metadata accessor for URL);
}

uint64_t sub_1000074EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100007734(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for URL);
}

uint64_t sub_100007504(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000077B4(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for URL);
}

uint64_t sub_10000751C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100007834(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for URL);
}

uint64_t sub_100007534(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000078B4(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for URL);
}

uint64_t sub_10000754C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100007560);
}

uint64_t sub_100007560(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100007948(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for URL);
}

uint64_t sub_100007578(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000758C);
}

uint64_t sub_10000758C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000079E4(a1, a2, a3, a4, (uint64_t (*)(void))&type metadata accessor for URL);
}

uint64_t type metadata accessor for FailedToOpenURLError(uint64_t a1)
{
  return sub_1000075C4(a1, qword_100026138);
}

uint64_t sub_1000075C4(uint64_t a1, uint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_1000075FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100007A70(a1, a2, a3, (uint64_t (*)(uint64_t))&type metadata accessor for URL);
}

uint64_t sub_100007614(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_10000762C(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for URLComponents);
}

uint64_t sub_10000762C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4(0);
  uint64_t v7 = **(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v6 - 8);

  return v7(a1, a2, v6);
}

uint64_t sub_10000769C(uint64_t a1, uint64_t a2)
{
  return sub_1000076B4(a1, a2, (uint64_t (*)(void))&type metadata accessor for URLComponents);
}

uint64_t sub_1000076B4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4 = a3(0);
  uint64_t v5 = *(uint64_t (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8);

  return v5(a1, v4);
}

uint64_t sub_10000771C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100007734(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for URLComponents);
}

uint64_t sub_100007734(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  return a1;
}

uint64_t sub_10000779C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000077B4(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for URLComponents);
}

uint64_t sub_1000077B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  return a1;
}

uint64_t sub_10000781C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100007834(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for URLComponents);
}

uint64_t sub_100007834(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  return a1;
}

uint64_t sub_10000789C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1000078B4(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for URLComponents);
}

uint64_t sub_1000078B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  return a1;
}

uint64_t sub_10000791C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_100007930);
}

uint64_t sub_100007930(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100007948(a1, a2, a3, (uint64_t (*)(void))&type metadata accessor for URLComponents);
}

uint64_t sub_100007948(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(void))
{
  uint64_t v6 = a4(0);
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 48);

  return v7(a1, a2, v6);
}

uint64_t sub_1000079B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_1000079CC);
}

uint64_t sub_1000079CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1000079E4(a1, a2, a3, a4, (uint64_t (*)(void))&type metadata accessor for URLComponents);
}

uint64_t sub_1000079E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t (*a5)(void))
{
  uint64_t v7 = a5(0);
  uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);

  return v8(a1, a2, a2, v7);
}

uint64_t sub_100007A58(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_100007A70(a1, a2, a3, (uint64_t (*)(uint64_t))&type metadata accessor for URLComponents);
}

uint64_t sub_100007A70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  uint64_t result = a4(319);
  if (v5 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_100007B10(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
  id v8 = a3;
  if (a3)
  {
    swift_bridgeObjectRetain();
    NSString v10 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v8 = [self applicationProxyForIdentifier:v10];
  }
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a4;
  *(void *)(v11 + 24) = a5;
  v13[4] = sub_100008474;
  v13[5] = v11;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 1107296256;
  v13[2] = sub_100007C60;
  v13[3] = &unk_100021188;
  uint64_t v12 = _Block_copy(v13);
  swift_retain();
  swift_release();
  [v5 openUserActivity:a1 withApplicationProxy:v8 completionHandler:v12];
  _Block_release(v12);
}

void sub_100007C60(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  id v6 = a3;
  v5(a2, a3);
  swift_release();
}

void sub_100007CD8(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5)
{
}

uint64_t sub_100007CFC(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v11 = type metadata accessor for Logger();
  uint64_t v12 = __chkstk_darwin(v11);
  uint64_t v14 = (char *)&v44 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = v5;
  uint64_t v55 = a4;
  uint64_t v52 = v15;
  uint64_t v53 = v12;
  if (a3)
  {
    swift_bridgeObjectRetain();
    NSString v16 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v17 = [self applicationProxyForIdentifier:v16];
  }
  else
  {
    id v17 = 0;
  }
  id v18 = [objc_allocWithZone((Class)INInteraction) initWithIntent:a1 response:0];
  swift_getObjectType();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  uint64_t v20 = NSStringFromClass(ObjCClassFromMetadata);
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  id v21 = objc_allocWithZone((Class)NSUserActivity);
  NSString v22 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v23 = [v21 initWithActivityType:v22];

  id v50 = v23;
  id v51 = v18;
  [v23 _setInteraction:v18 donate:0];
  static PeopleLogger.common.getter();
  id v49 = v17;
  id v24 = v17;
  id v25 = a1;
  id v26 = v24;
  id v27 = v25;
  v28 = v14;
  v29 = Logger.logObject.getter();
  os_log_type_t v30 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v29, v30))
  {
    v45 = v28;
    uint64_t v46 = a5;
    uint64_t v47 = a2;
    uint64_t v48 = a3;
    uint64_t v31 = swift_slowAlloc();
    v32 = (void *)swift_slowAlloc();
    uint64_t v44 = swift_slowAlloc();
    uint64_t v56 = (uint64_t)v27;
    uint64_t v57 = v44;
    *(_DWORD *)uint64_t v31 = 138412546;
    id v33 = v27;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    void *v32 = v27;

    *(_WORD *)(v31 + 12) = 2080;
    if (v49)
    {
      id v34 = [v26 description];
      uint64_t v35 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      unint64_t v37 = v36;
    }
    else
    {
      unint64_t v37 = 0xE100000000000000;
      uint64_t v35 = 45;
    }
    a3 = v48;
    uint64_t v56 = sub_100018764(v35, v37, &v57);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v29, v30, "Launching intent: %@ with application proxy: %s", (uint8_t *)v31, 0x16u);
    sub_1000067F8(&qword_1000262A8);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v52 + 8))(v45, v53);
    a5 = v46;
    a2 = v47;
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v52 + 8))(v28, v53);
  }
  uint64_t v38 = v54[5];
  uint64_t v39 = v54[6];
  sub_10000683C(v54 + 2, v38);
  uint64_t v40 = swift_allocObject();
  *(void *)(v40 + 16) = v55;
  *(void *)(v40 + 24) = a5;
  v41 = *(void (**)(id, uint64_t, uint64_t, uint64_t (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v39 + 8);
  swift_retain();
  v42 = v50;
  v41(v50, a2, a3, sub_10000846C, v40, v38, v39);

  return swift_release();
}

uint64_t sub_1000081A8(uint64_t a1, uint64_t (*a2)(void), uint64_t a3)
{
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    swift_errorRetain();
    static PeopleLogger.viewService.getter();
    swift_errorRetain();
    swift_errorRetain();
    NSString v10 = Logger.logObject.getter();
    os_log_type_t v11 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v10, v11))
    {
      uint64_t v12 = swift_slowAlloc();
      id v18 = a2;
      uint64_t v13 = (uint8_t *)v12;
      uint64_t v20 = swift_slowAlloc();
      v17[2] = a3;
      *(_DWORD *)uint64_t v13 = 136315138;
      v17[1] = v13 + 4;
      swift_getErrorValue();
      uint64_t v14 = Error.localizedDescription.getter();
      uint64_t v19 = sub_100018764(v14, v15, &v20);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "Failed to launch activity: %s", v13, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      a2 = v18;
      swift_slowDealloc();

      swift_errorRelease();
    }
    else
    {
      swift_errorRelease();
      swift_errorRelease();
      swift_errorRelease();
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  return a2(a1);
}

uint64_t type metadata accessor for IntentLauncher()
{
  return self;
}

uint64_t sub_100008434()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_10000846C(uint64_t a1)
{
  return sub_1000081A8(a1, *(uint64_t (**)(void))(v1 + 16), *(void *)(v1 + 24));
}

uint64_t sub_100008474(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(v2 + 16))(a2);
}

uint64_t sub_1000084A0(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_1000084B0()
{
  return swift_release();
}

uint64_t sub_1000084BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3 = type metadata accessor for ContactFormatter.Style();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  uint64_t v6 = (char *)&v14[-1] - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000683C((void *)(v1 + 24), *(void *)(v1 + 48));
  QuickAction.contactIdentifier.getter();
  uint64_t v7 = (void *)dispatch thunk of ContactFetcherProtocol.contact(for:includeImages:)();
  swift_bridgeObjectRelease();
  if (v7)
  {
    (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for ContactFormatter.Style.shortName(_:), v3);
    id v8 = v7;
    String.localized.getter();
    v14[3] = type metadata accessor for ContactFormatter();
    v14[4] = (uint64_t)&protocol witness table for ContactFormatter;
    sub_100009C1C(v14);
    ContactFormatter.init(style:fallback:)();
    Person.init(from:statuses:contactFormatter:)();

    uint64_t v9 = type metadata accessor for Person();
    return (*(uint64_t (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(a1, 0, 1, v9);
  }
  else
  {
    uint64_t v11 = type metadata accessor for Person();
    uint64_t v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    return v12(a1, 1, 1, v11);
  }
}

uint64_t sub_100008708(uint64_t a1)
{
  uint64_t v108 = type metadata accessor for QuickAction();
  uint64_t v111 = *(void *)(v108 - 8);
  uint64_t v2 = __chkstk_darwin(v108);
  v103 = (char *)&v94 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = __chkstk_darwin(v2);
  v100 = (char *)&v94 - v5;
  uint64_t v6 = __chkstk_darwin(v4);
  v104 = (char *)&v94 - v7;
  uint64_t v99 = v8;
  __chkstk_darwin(v6);
  NSString v10 = (char *)&v94 - v9;
  uint64_t v110 = type metadata accessor for Logger();
  uint64_t v112 = *(void *)(v110 - 8);
  uint64_t v11 = __chkstk_darwin(v110);
  v98 = (char *)&v94 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v11);
  v105 = (char *)&v94 - v14;
  __chkstk_darwin(v13);
  NSString v16 = (char *)&v94 - v15;
  uint64_t v17 = sub_1000067F8(&qword_100026378);
  uint64_t v18 = __chkstk_darwin(v17 - 8);
  uint64_t v97 = (uint64_t)&v94 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v20 = __chkstk_darwin(v18);
  NSString v22 = (char *)&v94 - v21;
  __chkstk_darwin(v20);
  id v24 = (char *)&v94 - v23;
  uint64_t v25 = type metadata accessor for QuickActionType();
  uint64_t v26 = *(void *)(v25 - 8);
  __chkstk_darwin(v25);
  v28 = (char *)&v94 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PeopleAnalytics();
  static PeopleAnalytics.shared.getter();
  QuickAction.type.getter();
  dispatch thunk of PeopleAnalytics.sendWidgetPerformQuickAction(_:)();
  swift_release();
  v29 = v28;
  uint64_t v30 = v111;
  uint64_t v31 = v25;
  v32 = v16;
  (*(void (**)(char *, uint64_t))(v26 + 8))(v29, v31);
  sub_1000084BC((uint64_t)v24);
  static PeopleLogger.viewService.getter();
  id v33 = *(void (**)(char *, uint64_t, uint64_t))(v30 + 16);
  id v34 = v10;
  uint64_t v35 = v10;
  uint64_t v36 = a1;
  uint64_t v37 = a1;
  uint64_t v38 = v108;
  uint64_t v107 = v30 + 16;
  v106 = v33;
  ((void (*)(char *, uint64_t))v33)(v35, v37);
  v101 = v24;
  uint64_t v39 = (uint64_t)v24;
  uint64_t v40 = (uint64_t)v22;
  uint64_t v41 = v112;
  sub_100009984(v39, v40);
  v42 = Logger.logObject.getter();
  int v43 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v42, (os_log_type_t)v43))
  {
    int v95 = v43;
    v96 = v32;
    uint64_t v44 = v110;
    uint64_t v45 = v30;
    uint64_t v46 = swift_slowAlloc();
    uint64_t v94 = swift_slowAlloc();
    *(void *)&long long v119 = v94;
    *(_DWORD *)uint64_t v46 = 136315394;
    sub_100009AAC();
    uint64_t v47 = dispatch thunk of CustomStringConvertible.description.getter();
    *(void *)&long long v116 = sub_100018764(v47, v48, (uint64_t *)&v119);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    id v49 = *(void (**)(char *, uint64_t))(v45 + 8);
    v49(v34, v38);
    *(_WORD *)(v46 + 12) = 2080;
    uint64_t v50 = v97;
    sub_100009984(v40, v97);
    uint64_t v51 = v40;
    uint64_t v52 = type metadata accessor for Person();
    uint64_t v53 = *(void *)(v52 - 8);
    int v54 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v53 + 48))(v50, 1, v52);
    v102 = v49;
    if (v54 == 1)
    {
      sub_100009A50(v50, &qword_100026378);
      unint64_t v55 = 0xE100000000000000;
      uint64_t v56 = 45;
    }
    else
    {
      uint64_t v56 = Person.description.getter();
      unint64_t v55 = v59;
      (*(void (**)(uint64_t, uint64_t))(v53 + 8))(v50, v52);
    }
    uint64_t v60 = v44;
    uint64_t v61 = v112;
    uint64_t v58 = v36;
    *(void *)&long long v116 = sub_100018764(v56, v55, (uint64_t *)&v119);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_100009A50(v51, &qword_100026378);
    _os_log_impl((void *)&_mh_execute_header, v42, (os_log_type_t)v95, "Attempting to handle action: %s, for person: %s", (uint8_t *)v46, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    uint64_t v57 = *(void (**)(char *, uint64_t))(v61 + 8);
    v57(v96, v60);
  }
  else
  {
    v102 = *(void (**)(char *, uint64_t))(v30 + 8);
    v102(v34, v38);
    sub_100009A50(v40, &qword_100026378);

    uint64_t v57 = *(void (**)(char *, uint64_t))(v41 + 8);
    v57(v32, v110);
    uint64_t v58 = v36;
  }
  uint64_t v62 = *((void *)v109 + 2);
  uint64_t v63 = *(void *)(v62 + 16);
  uint64_t v64 = (uint64_t)v101;
  if (v63)
  {
    uint64_t v65 = v62 + 32;
    swift_bridgeObjectRetain();
    uint64_t v66 = v108;
    while (1)
    {
      sub_1000099EC(v65, (uint64_t)&v119);
      uint64_t v67 = v120;
      uint64_t v68 = v121;
      sub_10000683C(&v119, v120);
      if ((*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v68 + 8))(v58, v64, v67, v68)) {
        break;
      }
      sub_100006880((uint64_t)&v119);
      v65 += 40;
      if (!--v63) {
        goto LABEL_13;
      }
    }
    sub_100009B04(&v119, (uint64_t)&v116);
  }
  else
  {
    swift_bridgeObjectRetain();
    uint64_t v66 = v108;
LABEL_13:
    uint64_t v118 = 0;
    long long v116 = 0u;
    long long v117 = 0u;
  }
  swift_bridgeObjectRelease();
  v69 = v105;
  v70 = v104;
  v71 = v103;
  if (*((void *)&v117 + 1))
  {
    sub_100009B04(&v116, (uint64_t)&v119);
    static PeopleLogger.viewService.getter();
    sub_1000099EC((uint64_t)&v119, (uint64_t)v115);
    v106(v70, v58, v66);
    v72 = Logger.logObject.getter();
    os_log_type_t v73 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v72, v73))
    {
      uint64_t v74 = swift_slowAlloc();
      v103 = (char *)swift_slowAlloc();
      v114 = v103;
      *(_DWORD *)uint64_t v74 = 136315394;
      sub_10000683C(v115, v115[3]);
      swift_getDynamicType();
      uint64_t v75 = _typeName(_:qualified:)();
      uint64_t v113 = sub_100018764(v75, v76, (uint64_t *)&v114);
      v109 = v57;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_100006880((uint64_t)v115);
      *(_WORD *)(v74 + 12) = 2080;
      sub_100009AAC();
      uint64_t v77 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v113 = sub_100018764(v77, v78, (uint64_t *)&v114);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      uint64_t v79 = v111;
      v102(v70, v66);
      _os_log_impl((void *)&_mh_execute_header, v72, v73, "Got handler: %s for action: %s", (uint8_t *)v74, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v109(v105, v110);
    }
    else
    {
      sub_100006880((uint64_t)v115);
      uint64_t v79 = v111;
      v102(v70, v66);

      v57(v69, v110);
    }
    uint64_t v88 = v120;
    uint64_t v89 = v121;
    sub_10000683C(&v119, v120);
    v90 = v100;
    v106(v100, v58, v66);
    unint64_t v91 = (*(unsigned __int8 *)(v79 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v79 + 80);
    uint64_t v92 = swift_allocObject();
    (*(void (**)(unint64_t, char *, uint64_t))(v79 + 32))(v92 + v91, v90, v66);
    (*(void (**)(uint64_t, uint64_t, uint64_t (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v89 + 16))(v58, v64, sub_100009BAC, v92, v88, v89);
    swift_release();
    sub_100009A50(v64, &qword_100026378);
    return sub_100006880((uint64_t)&v119);
  }
  else
  {
    sub_100009A50((uint64_t)&v116, &qword_100026380);
    v80 = v98;
    static PeopleLogger.viewService.getter();
    v106(v71, v58, v66);
    v81 = Logger.logObject.getter();
    os_log_type_t v82 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v81, v82))
    {
      uint64_t v83 = swift_slowAlloc();
      v109 = v57;
      v84 = v71;
      v85 = (uint8_t *)v83;
      *(void *)&long long v119 = swift_slowAlloc();
      *(_DWORD *)v85 = 136315138;
      sub_100009AAC();
      uint64_t v86 = dispatch thunk of CustomStringConvertible.description.getter();
      v115[0] = sub_100018764(v86, v87, (uint64_t *)&v119);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      v102(v84, v66);
      _os_log_impl((void *)&_mh_execute_header, v81, v82, "No available handler for action: %s", v85, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      v109(v98, v110);
    }
    else
    {
      v102(v71, v66);

      v57(v80, v110);
    }
    return sub_100009A50(v64, &qword_100026378);
  }
}

uint64_t sub_1000093F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for QuickAction();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = &v22[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v8 = type metadata accessor for Logger();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t result = __chkstk_darwin(v8);
  uint64_t v12 = &v22[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (a1)
  {
    swift_errorRetain();
    static PeopleLogger.viewService.getter();
    (*(void (**)(unsigned char *, uint64_t, uint64_t))(v5 + 16))(v7, a2, v4);
    swift_errorRetain();
    swift_errorRetain();
    uint64_t v13 = Logger.logObject.getter();
    os_log_type_t v14 = static os_log_type_t.error.getter();
    int v15 = v14;
    if (os_log_type_enabled(v13, v14))
    {
      uint64_t v16 = swift_slowAlloc();
      uint64_t v26 = v9;
      uint64_t v17 = v16;
      uint64_t v24 = swift_slowAlloc();
      uint64_t v28 = v24;
      *(_DWORD *)uint64_t v17 = 136315394;
      sub_100009AAC();
      int v23 = v15;
      uint64_t v18 = dispatch thunk of CustomStringConvertible.description.getter();
      uint64_t v27 = sub_100018764(v18, v19, &v28);
      uint64_t v25 = v8;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
      *(_WORD *)(v17 + 12) = 2080;
      swift_getErrorValue();
      uint64_t v20 = Error.localizedDescription.getter();
      uint64_t v27 = sub_100018764(v20, v21, &v28);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      swift_errorRelease();
      swift_errorRelease();
      _os_log_impl((void *)&_mh_execute_header, v13, (os_log_type_t)v23, "Failed to handle action: %s with error: %s", (uint8_t *)v17, 0x16u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      swift_errorRelease();
      return (*(uint64_t (**)(unsigned char *, uint64_t))(v26 + 8))(v12, v25);
    }
    else
    {
      swift_errorRelease();
      (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
      swift_errorRelease();
      swift_errorRelease();

      return (*(uint64_t (**)(unsigned char *, uint64_t))(v9 + 8))(v12, v8);
    }
  }
  return result;
}

uint64_t sub_100009774()
{
  swift_bridgeObjectRelease();
  sub_100006880(v0 + 24);

  return _swift_deallocClassInstance(v0, 64, 7);
}

uint64_t type metadata accessor for ActionLauncher()
{
  return self;
}

id sub_1000097D8()
{
  sub_1000067F8(&qword_100026368);
  uint64_t v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_10001B160;
  id result = [self defaultWorkspace];
  if (result)
  {
    id v2 = result;
    unint64_t v12 = sub_100009944();
    uint64_t v13 = &off_100021128;
    *(void *)&long long v11 = v2;
    type metadata accessor for IntentLauncher();
    uint64_t v3 = swift_allocObject();
    sub_100009B04(&v11, v3 + 16);
    id v4 = [objc_allocWithZone((Class)CNLaunchServices) init];
    uint64_t v5 = type metadata accessor for MessageActionHandler();
    uint64_t v6 = swift_allocObject();
    *(void *)(v6 + 16) = v3;
    *(void *)(v6 + 24) = v4;
    *(void *)(v0 + 56) = v5;
    *(void *)(v0 + 64) = &off_100021370;
    *(void *)(v0 + 32) = v6;
    id v7 = sub_10000D954();
    *(void *)(v0 + 96) = type metadata accessor for CallActionHandler();
    *(void *)(v0 + 104) = &off_1000211E8;
    *(void *)(v0 + 72) = v7;
    uint64_t v8 = type metadata accessor for ContactFetcher();
    uint64_t v9 = static ContactFetcher.shared.getter();
    unint64_t v12 = v8;
    uint64_t v13 = (_UNKNOWN **)&protocol witness table for ContactFetcher;
    *(void *)&long long v11 = v9;
    type metadata accessor for ActionLauncher();
    uint64_t v10 = swift_allocObject();
    *(void *)(v10 + 16) = v0;
    sub_100009B04(&v11, v10 + 24);
    return (id)v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_100009944()
{
  unint64_t result = qword_100026370;
  if (!qword_100026370)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100026370);
  }
  return result;
}

uint64_t sub_100009984(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000067F8(&qword_100026378);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1000099EC(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_100009A50(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_1000067F8(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

unint64_t sub_100009AAC()
{
  unint64_t result = qword_100026388;
  if (!qword_100026388)
  {
    type metadata accessor for QuickAction();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100026388);
  }
  return result;
}

uint64_t sub_100009B04(long long *a1, uint64_t a2)
{
  long long v2 = *a1;
  long long v3 = a1[1];
  *(void *)(a2 + 32) = *((void *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_100009B1C()
{
  uint64_t v1 = type metadata accessor for QuickAction();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 16) & ~v3;
  uint64_t v5 = v4 + *(void *)(v2 + 64);
  uint64_t v6 = v3 | 7;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);

  return _swift_deallocObject(v0, v5, v6);
}

uint64_t sub_100009BAC(uint64_t a1)
{
  uint64_t v3 = *(void *)(type metadata accessor for QuickAction() - 8);
  uint64_t v4 = v1 + ((*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80));

  return sub_1000093F8(a1, v4);
}

uint64_t *sub_100009C1C(uint64_t *a1)
{
  uint64_t v1 = a1;
  if ((*(unsigned char *)(*(void *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t *sub_100009C80(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5 = *(_DWORD *)(*(void *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    uint64_t v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    uint64_t v7 = type metadata accessor for QuickAction();
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(void *)(v7 - 8) + 16))(a1, a2, v7);
    uint64_t v8 = *(int *)(a3 + 20);
    uint64_t v9 = (char *)a1 + v8;
    uint64_t v10 = (char *)a2 + v8;
    uint64_t v11 = type metadata accessor for Person();
    uint64_t v12 = *(void *)(v11 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11))
    {
      uint64_t v13 = sub_1000067F8(&qword_100026378);
      memcpy(v9, v10, *(void *)(*(void *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v9, v10, v11);
      (*(void (**)(char *, void, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
    }
  }
  return a1;
}

uint64_t sub_100009E20(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = type metadata accessor for QuickAction();
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v4 - 8) + 8))(a1, v4);
  uint64_t v5 = a1 + *(int *)(a2 + 20);
  uint64_t v6 = type metadata accessor for Person();
  uint64_t v9 = *(void *)(v6 - 8);
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v5, 1, v6);
  if (!result)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t))(v9 + 8);
    return v8(v5, v6);
  }
  return result;
}

uint64_t sub_100009F20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for QuickAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 16))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for Person();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = sub_1000067F8(&qword_100026378);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 16))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

uint64_t sub_10000A070(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for QuickAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 24))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for Person();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 24))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = sub_1000067F8(&qword_100026378);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 16))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t sub_10000A224(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for QuickAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 32))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (const void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for Person();
  uint64_t v11 = *(void *)(v10 - 8);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
  {
    uint64_t v12 = sub_1000067F8(&qword_100026378);
    memcpy(v8, v9, *(void *)(*(void *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v11 + 32))(v8, v9, v10);
    (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  }
  return a1;
}

uint64_t sub_10000A374(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for QuickAction();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 40))(a1, a2, v6);
  uint64_t v7 = *(int *)(a3 + 20);
  uint64_t v8 = (void *)(a1 + v7);
  uint64_t v9 = (void *)(a2 + v7);
  uint64_t v10 = type metadata accessor for Person();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v11 + 48);
  int v13 = v12(v8, 1, v10);
  int v14 = v12(v9, 1, v10);
  if (!v13)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v11 + 40))(v8, v9, v10);
      return a1;
    }
    (*(void (**)(void *, uint64_t))(v11 + 8))(v8, v10);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    uint64_t v15 = sub_1000067F8(&qword_100026378);
    memcpy(v8, v9, *(void *)(*(void *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(void *, void *, uint64_t))(v11 + 32))(v8, v9, v10);
  (*(void (**)(void *, void, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
  return a1;
}

uint64_t sub_10000A528(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_getEnumTagSinglePayloadGeneric(a1, a2, a3, sub_10000A53C);
}

uint64_t sub_10000A53C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for QuickAction();
  uint64_t v7 = *(void *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == a2)
  {
    uint64_t v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    return v8(a1, a2, v6);
  }
  else
  {
    uint64_t v10 = sub_1000067F8(&qword_100026378);
    uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 48);
    uint64_t v12 = v10;
    uint64_t v13 = a1 + *(int *)(a3 + 20);
    return v11(v13, a2, v12);
  }
}

uint64_t sub_10000A638(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return _swift_storeEnumTagSinglePayloadGeneric(a1, a2, a3, a4, sub_10000A64C);
}

uint64_t sub_10000A64C(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8 = type metadata accessor for QuickAction();
  uint64_t v9 = *(void *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    uint64_t v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    return v10(a1, a2, a2, v8);
  }
  else
  {
    uint64_t v12 = sub_1000067F8(&qword_100026378);
    uint64_t v13 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56);
    uint64_t v14 = v12;
    uint64_t v15 = a1 + *(int *)(a4 + 20);
    return v13(v15, a2, a2, v14);
  }
}

uint64_t type metadata accessor for NoAvailableContactHandle()
{
  uint64_t result = qword_1000263E8;
  if (!qword_1000263E8) {
    return swift_getSingletonMetadata();
  }
  return result;
}

void sub_10000A7A0()
{
  type metadata accessor for QuickAction();
  if (v0 <= 0x3F)
  {
    sub_10000A868();
    if (v1 <= 0x3F) {
      swift_initStructMetadata();
    }
  }
}

void sub_10000A868()
{
  if (!qword_1000263F8)
  {
    type metadata accessor for Person();
    unint64_t v0 = type metadata accessor for Optional();
    if (!v1) {
      atomic_store(v0, (unint64_t *)&qword_1000263F8);
    }
  }
}

id sub_10000AA84()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppDelegate();
  return [super dealloc];
}

int main(int argc, const char **argv, const char **envp)
{
  type metadata accessor for AppDelegate();
  static CommandLine.unsafeArgv.getter();
  static CommandLine.argc.getter();
  static CommandLine.argc.getter();
  ObjCClassFromMetadata = (objc_class *)swift_getObjCClassFromMetadata();
  uint64_t v4 = NSStringFromClass(ObjCClassFromMetadata);
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  LODWORD(v4) = UIApplicationMain(_:_:_:_:)();
  swift_bridgeObjectRelease();
  exit((int)v4);
}

uint64_t type metadata accessor for AppDelegate()
{
  return self;
}

uint64_t sub_10000AB68()
{
  uint64_t v0 = type metadata accessor for Logger();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  uint64_t v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  static PeopleLogger.viewService.getter();
  uint64_t v4 = Logger.logObject.getter();
  os_log_type_t v5 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v4, v5))
  {
    uint64_t v6 = (uint8_t *)swift_slowAlloc();
    uint64_t v9 = swift_slowAlloc();
    *(_DWORD *)uint64_t v6 = 136315138;
    uint64_t v8 = sub_100018764(0xD00000000000002DLL, 0x800000010001D9A0, &v9);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v4, v5, "%s", v6, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  return 1;
}

unint64_t sub_10000AD40()
{
  unint64_t result = qword_1000260C0;
  if (!qword_1000260C0)
  {
    type metadata accessor for LaunchOptionsKey(255);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000260C0);
  }
  return result;
}

void sub_10000AD98(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = [objc_allocWithZone((Class)TUCallProviderManager) init];
  id v8 = [v7 telephonyProvider];

  id v9 = [objc_allocWithZone((Class)TUDialRequest) initWithProvider:v8];
  id v10 = objc_allocWithZone((Class)CNPhoneNumber);
  swift_bridgeObjectRetain();
  NSString v11 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v12 = [v10 initWithStringValue:v11];

  id v13 = [v12 stringValue];
  static String._unconditionallyBridgeFromObjectiveC(_:)();

  object = String.trimToNil()().value._object;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (object) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = 3;
  }
  id v16 = objc_allocWithZone((Class)TUHandle);
  swift_bridgeObjectRetain();
  NSString v17 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v18 = [v16 initWithType:v15 value:v17];

  [v9 setHandle:v18];
  [v9 setVideo:0];
  v20[4] = a3;
  v20[5] = a4;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 1107296256;
  v20[2] = sub_10000AFFC;
  v20[3] = &unk_100021240;
  unint64_t v19 = _Block_copy(v20);
  swift_retain();
  swift_release();
  [v4 launchAppForDialRequest:v9 completion:v19];
  _Block_release(v19);
}

void sub_10000AFFC(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  id v4 = a2;
  v3(a2);
  swift_release();
}

void sub_10000B068(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t sub_10000B08C()
{
  sub_10000683C((void *)(v0 + 64), *(void *)(v0 + 88));
  uint64_t v1 = dispatch thunk of IntentHandlingApplicationRegistry.applications(forIntentClass:)();
  int64_t v2 = *(void *)(v1 + 16);
  if (v2)
  {
    uint64_t v14 = &_swiftEmptyArrayStorage;
    sub_10000D7C8(0, v2, 0);
    uint64_t v3 = v1 + 32;
    id v4 = &_swiftEmptyArrayStorage;
    do
    {
      sub_1000099EC(v3, (uint64_t)v13);
      sub_10000683C(v13, v13[3]);
      uint64_t v5 = dispatch thunk of ApplicationRecord.bundleIdentifier.getter();
      uint64_t v7 = v6;
      sub_100006880((uint64_t)v13);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_10000D7C8(0, v4[2] + 1, 1);
        id v4 = v14;
      }
      unint64_t v9 = v4[2];
      unint64_t v8 = v4[3];
      if (v9 >= v8 >> 1)
      {
        sub_10000D7C8(v8 > 1, v9 + 1, 1);
        id v4 = v14;
      }
      v4[2] = v9 + 1;
      id v10 = (char *)&v4[2 * v9];
      *((void *)v10 + 4) = v5;
      *((void *)v10 + 5) = v7;
      v3 += 40;
      --v2;
    }
    while (v2);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    id v4 = &_swiftEmptyArrayStorage;
  }
  uint64_t v11 = sub_10000E218((uint64_t)v4);
  swift_bridgeObjectRelease();
  return v11;
}

id sub_10000B210(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  sub_1000067F8(&qword_100026980);
  uint64_t v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_10001B220;
  *(void *)(v8 + 32) = a1;
  specialized Array._endMutation()();
  id v9 = objc_allocWithZone((Class)INStartCallIntent);
  sub_10000E1DC(0, (unint64_t *)&qword_100026620);
  id v20 = a1;
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  id v11 = [v9 initWithCallRecordFilter:0 callRecordToCallBack:0 audioRoute:0 destinationType:1 contacts:isa callCapability:a2];

  if (a4)
  {
    sub_10000E1DC(0, &qword_100026628);
    uint64_t v12 = sub_10000B08C();
    char v13 = sub_10000B404(a3, a4, v12);
    swift_bridgeObjectRelease();
    if ((v13 & 1) == 0)
    {
      if (a2 == 2)
      {
        uint64_t v14 = swift_allocObject();
        *(_OWORD *)(v14 + 16) = xmmword_10001B220;
        *(void *)(v14 + 32) = v20;
        specialized Array._endMutation()();
        id v15 = objc_allocWithZone((Class)INStartVideoCallIntent);
        id v16 = v20;
        Class v17 = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        id v18 = [v15 initWithContacts:v17];

        return v18;
      }
      else
      {

        return 0;
      }
    }
  }
  return v11;
}

uint64_t sub_10000B404(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(void *)(a3 + 16))
  {
    Hasher.init(_seed:)();
    String.hash(into:)();
    Swift::Int v6 = Hasher._finalize()();
    uint64_t v7 = -1 << *(unsigned char *)(a3 + 32);
    unint64_t v8 = v6 & ~v7;
    uint64_t v9 = a3 + 56;
    if ((*(void *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v8))
    {
      uint64_t v10 = *(void *)(a3 + 48);
      id v11 = (void *)(v10 + 16 * v8);
      BOOL v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        return 1;
      }
      uint64_t v14 = ~v7;
      unint64_t v15 = (v8 + 1) & v14;
      if ((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15))
      {
        while (1)
        {
          id v16 = (void *)(v10 + 16 * v15);
          BOOL v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
            break;
          }
          uint64_t result = 0;
          unint64_t v15 = (v15 + 1) & v14;
          if (((*(void *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v15) & 1) == 0) {
            return result;
          }
        }
        return 1;
      }
    }
  }
  return 0;
}

void sub_10000B53C(uint64_t a1, unsigned int (*a2)(uint64_t, uint64_t, uint64_t), void (*a3)(void), uint64_t a4)
{
  v188 = a3;
  uint64_t v187 = a4;
  v185 = a2;
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v180 = *(void *)(v5 - 8);
  uint64_t v181 = v5;
  uint64_t v6 = __chkstk_darwin(v5);
  v177 = (char *)&v165 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v6);
  v183 = (char *)&v165 - v8;
  uint64_t v9 = sub_1000067F8(&qword_100026600);
  __chkstk_darwin(v9 - 8);
  v184 = (char *)&v165 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v171 = type metadata accessor for HandleType();
  uint64_t v170 = *(void *)(v171 - 8);
  __chkstk_darwin(v171);
  v169 = (char *)&v165 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = sub_1000067F8(&qword_100026378);
  uint64_t v13 = __chkstk_darwin(v12 - 8);
  uint64_t v167 = (uint64_t)&v165 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v13);
  uint64_t v166 = (uint64_t)&v165 - v16;
  uint64_t v17 = __chkstk_darwin(v15);
  uint64_t v176 = (uint64_t)&v165 - v18;
  uint64_t v19 = __chkstk_darwin(v17);
  uint64_t v173 = (uint64_t)&v165 - v20;
  uint64_t v21 = __chkstk_darwin(v19);
  uint64_t v182 = (uint64_t)&v165 - v22;
  uint64_t v23 = __chkstk_darwin(v21);
  uint64_t v168 = (uint64_t)&v165 - v24;
  uint64_t v25 = __chkstk_darwin(v23);
  v179 = (uint64_t *)((char *)&v165 - v26);
  __chkstk_darwin(v25);
  uint64_t v178 = (uint64_t)&v165 - v27;
  uint64_t v28 = type metadata accessor for QuickActionType();
  v186 = *(void (**)(char *, char *, uint64_t))(v28 - 8);
  uint64_t v29 = __chkstk_darwin(v28);
  uint64_t v31 = (char *)&v165 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v29);
  id v33 = (char *)&v165 - v32;
  uint64_t v34 = sub_1000067F8(&qword_100026930);
  __chkstk_darwin(v34 - 8);
  v175 = (char *)&v165 - ((v35 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v36 = sub_1000067F8(&qword_100026068);
  __chkstk_darwin(v36 - 8);
  uint64_t v38 = (char *)&v165 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v39 = type metadata accessor for URL();
  uint64_t v40 = *(void *)(v39 - 8);
  uint64_t v41 = *(void *)(v40 + 64);
  uint64_t v42 = __chkstk_darwin(v39);
  int v43 = (char *)&v165 - ((v41 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v42);
  v174 = (char *)&v165 - v44;
  uint64_t v45 = a1;
  if (QuickAction.useStandardProtocol.getter())
  {
    uint64_t v172 = a1;
    QuickAction.standardProtocolURL.getter();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48))(v38, 1, v39) != 1)
    {
      v186 = *(void (**)(char *, char *, uint64_t))(v40 + 32);
      uint64_t v67 = v174;
      v186(v174, v38, v39);
      uint64_t v68 = type metadata accessor for TaskPriority();
      uint64_t v69 = (uint64_t)v175;
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v68 - 8) + 56))(v175, 1, 1, v68);
      (*(void (**)(char *, char *, uint64_t))(v40 + 16))(v43, v67, v39);
      unint64_t v70 = (*(unsigned __int8 *)(v40 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v40 + 80);
      v71 = (char *)swift_allocObject();
      *((void *)v71 + 2) = 0;
      *((void *)v71 + 3) = 0;
      *((void *)v71 + 4) = v189;
      v186(&v71[v70], v43, v39);
      v72 = &v71[(v41 + v70 + 7) & 0xFFFFFFFFFFFFFFF8];
      uint64_t v73 = v187;
      *(void *)v72 = v188;
      *((void *)v72 + 1) = v73;
      swift_retain();
      swift_retain();
      sub_1000170DC(v69, (uint64_t)&unk_100026610, (uint64_t)v71);
      swift_release();
      (*(void (**)(char *, uint64_t))(v40 + 8))(v67, v39);
      return;
    }
    sub_100009A50((uint64_t)v38, &qword_100026068);
    uint64_t v45 = v172;
  }
  QuickAction.type.getter();
  uint64_t v46 = v186;
  (*((void (**)(char *, void, uint64_t))v186 + 13))(v31, enum case for QuickActionType.videoCall(_:), v28);
  sub_10000DE7C();
  dispatch thunk of RawRepresentable.rawValue.getter();
  dispatch thunk of RawRepresentable.rawValue.getter();
  if (v192 == (char *)v190 && v193 == v191) {
    char v47 = 1;
  }
  else {
    char v47 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  uint64_t v48 = (uint64_t)v185;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v49 = (void (*)(char *, uint64_t))*((void *)v46 + 1);
  v49(v31, v28);
  v49(v33, v28);
  if (v47) {
    uint64_t v50 = 2;
  }
  else {
    uint64_t v50 = 1;
  }
  QuickAction.handle.getter();
  if (v51)
  {
    id v52 = objc_allocWithZone((Class)CNPhoneNumber);
    NSString v53 = String._bridgeToObjectiveC()();
    id v54 = [v52 initWithStringValue:v53];

    if (v54) {
      uint64_t v55 = 2;
    }
    else {
      uint64_t v55 = 1;
    }
    id v56 = objc_allocWithZone((Class)INPersonHandle);
    NSString v57 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v58 = [v56 initWithValue:v57 type:v55];
    unint64_t v59 = v189;
    uint64_t v60 = (uint64_t)v184;
    goto LABEL_32;
  }
  uint64_t v61 = v178;
  sub_100009984(v48, v178);
  uint64_t v62 = type metadata accessor for Person();
  uint64_t v63 = *(void (**)(char *, char *, uint64_t))(v62 - 8);
  uint64_t v64 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))*((void *)v63 + 6);
  unsigned int v65 = v64(v61, 1, v62);
  v185 = v64;
  v186 = v63;
  if (v65 == 1)
  {
    sub_100009A50(v61, &qword_100026378);
    unint64_t v59 = v189;
    uint64_t v66 = (uint64_t)v179;
    goto LABEL_24;
  }
  uint64_t v74 = v48;
  uint64_t v75 = v50;
  uint64_t v76 = v170;
  uint64_t v77 = v169;
  uint64_t v78 = v171;
  (*(void (**)(char *, void, uint64_t))(v170 + 104))(v169, enum case for HandleType.phoneNumber(_:), v171);
  v175 = (char *)Person.preferredHandle(ofType:)();
  uint64_t v80 = v79;
  uint64_t v81 = v76;
  uint64_t v50 = v75;
  uint64_t v48 = v74;
  os_log_type_t v82 = (void (**)(uint64_t, uint64_t))v186;
  (*(void (**)(char *, uint64_t))(v81 + 8))(v77, v78);
  v82[1](v61, v62);
  unint64_t v59 = v189;
  uint64_t v66 = (uint64_t)v179;
  if (!v80)
  {
LABEL_24:
    QuickAction.handle.getter();
    uint64_t v89 = v88;
    sub_100009984(v48, v66);
    if (v89)
    {
      sub_100009A50(v66, &qword_100026378);
      id v90 = objc_allocWithZone((Class)INPersonHandle);
      uint64_t v60 = (uint64_t)v184;
    }
    else
    {
      uint64_t v91 = v168;
      sub_100009984(v66, v168);
      if (v185(v91, 1, v62) == 1)
      {
        sub_100009A50(v66, &qword_100026378);
        sub_100009A50(v91, &qword_100026378);
        id v90 = objc_allocWithZone((Class)INPersonHandle);
        NSString v57 = 0;
        uint64_t v60 = (uint64_t)v184;
        goto LABEL_31;
      }
      uint64_t v92 = v170;
      v93 = v169;
      uint64_t v94 = v171;
      (*(void (**)(char *, void, uint64_t))(v170 + 104))(v169, enum case for HandleType.email(_:), v171);
      Person.preferredHandle(ofType:)();
      uint64_t v96 = v95;
      (*(void (**)(char *, uint64_t))(v92 + 8))(v93, v94);
      sub_100009A50((uint64_t)v179, &qword_100026378);
      (*((void (**)(uint64_t, uint64_t))v186 + 1))(v168, v62);
      id v90 = objc_allocWithZone((Class)INPersonHandle);
      uint64_t v60 = (uint64_t)v184;
      if (!v96)
      {
        NSString v57 = 0;
        goto LABEL_31;
      }
    }
    NSString v57 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
LABEL_31:
    id v58 = [v90 initWithValue:v57 type:1];
    goto LABEL_32;
  }
  id v83 = objc_allocWithZone((Class)CNPhoneNumber);
  swift_bridgeObjectRetain();
  NSString v84 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v85 = [v83 initWithStringValue:v84];

  if (v85) {
    uint64_t v86 = 2;
  }
  else {
    uint64_t v86 = 1;
  }
  id v87 = objc_allocWithZone((Class)INPersonHandle);
  NSString v57 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  id v58 = [v87 initWithValue:v57 type:v86];
  uint64_t v60 = (uint64_t)v184;
LABEL_32:

  uint64_t v97 = type metadata accessor for PersonNameComponents();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v97 - 8) + 56))(v60, 1, 1, v97);
  id v98 = v58;
  uint64_t v99 = QuickAction.contactIdentifier.getter();
  uint64_t v101 = v100;
  uint64_t v102 = QuickAction.customIdentifier.getter();
  uint64_t v104 = v103;
  id v105 = objc_allocWithZone((Class)INPerson);
  id v106 = sub_100018140(v98, v60, 0, 0, 0, v99, v101, v102, v104);
  uint64_t v107 = QuickAction.bundleID.getter();
  id v109 = sub_10000B210(v106, v50, v107, v108);
  swift_bridgeObjectRelease();
  if (v109)
  {
    v185 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v106;
    uint64_t v110 = v183;
    static PeopleLogger.common.getter();
    uint64_t v111 = v182;
    sub_100009984(v48, v182);
    id v112 = v109;
    uint64_t v113 = Logger.logObject.getter();
    int v114 = static os_log_type_t.default.getter();
    BOOL v115 = os_log_type_enabled(v113, (os_log_type_t)v114);
    v186 = (void (*)(char *, char *, uint64_t))v98;
    if (v115)
    {
      LODWORD(v178) = v114;
      uint64_t v172 = v45;
      uint64_t v116 = swift_slowAlloc();
      long long v117 = (void *)swift_slowAlloc();
      v184 = (char *)swift_slowAlloc();
      v192 = v184;
      *(_DWORD *)uint64_t v116 = 138412546;
      uint64_t v190 = (uint64_t)v112;
      id v118 = v112;
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      v179 = v117;
      *long long v117 = v109;

      *(_WORD *)(v116 + 12) = 2080;
      uint64_t v119 = v173;
      sub_100009984(v111, v173);
      uint64_t v120 = type metadata accessor for Person();
      uint64_t v121 = *(void *)(v120 - 8);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v121 + 48))(v119, 1, v120) == 1)
      {
        sub_100009A50(v119, &qword_100026378);
        unint64_t v122 = 0xE100000000000000;
        uint64_t v123 = 45;
      }
      else
      {
        uint64_t v123 = Person.description.getter();
        unint64_t v122 = v141;
        (*(void (**)(uint64_t, uint64_t))(v121 + 8))(v119, v120);
      }
      os_log_type_t v142 = v178;
      uint64_t v190 = sub_100018764(v123, v122, (uint64_t *)&v192);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease();
      sub_100009A50(v182, &qword_100026378);
      _os_log_impl((void *)&_mh_execute_header, v113, v142, "handling call intent: %@ for person: %s", (uint8_t *)v116, 0x16u);
      sub_1000067F8(&qword_1000262A8);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v180 + 8))(v183, v181);
      uint64_t v139 = v187;
      uint64_t v140 = (uint64_t)v188;
    }
    else
    {

      sub_100009A50(v111, &qword_100026378);
      (*(void (**)(char *, uint64_t))(v180 + 8))(v110, v181);
      uint64_t v139 = v187;
      uint64_t v140 = (uint64_t)v188;
    }
    uint64_t v143 = QuickAction.bundleID.getter();
    sub_100007CFC(v112, v143, v144, v140, v139);

    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v124 = QuickAction.handle.getter();
    if (v125)
    {
      v126 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v124;
      unint64_t v127 = v125;
      v128 = v177;
      static PeopleLogger.common.getter();
      uint64_t v129 = v176;
      sub_100009984(v48, v176);
      swift_bridgeObjectRetain_n();
      v130 = Logger.logObject.getter();
      int v131 = static os_log_type_t.default.getter();
      BOOL v132 = os_log_type_enabled(v130, (os_log_type_t)v131);
      v185 = v126;
      v186 = (void (*)(char *, char *, uint64_t))v98;
      if (v132)
      {
        uint64_t v133 = swift_slowAlloc();
        v192 = (char *)swift_slowAlloc();
        *(_DWORD *)uint64_t v133 = 136315394;
        swift_bridgeObjectRetain();
        uint64_t v190 = sub_100018764((uint64_t)v126, v127, (uint64_t *)&v192);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease_n();
        *(_WORD *)(v133 + 12) = 2080;
        uint64_t v134 = v166;
        sub_100009984(v129, v166);
        uint64_t v135 = type metadata accessor for Person();
        uint64_t v136 = *(void *)(v135 - 8);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v136 + 48))(v134, 1, v135) == 1)
        {
          sub_100009A50(v134, &qword_100026378);
          unint64_t v137 = 0xE100000000000000;
          uint64_t v138 = 45;
        }
        else
        {
          LODWORD(v184) = v131;
          id v159 = v106;
          uint64_t v160 = v134;
          uint64_t v138 = Person.description.getter();
          unint64_t v137 = v161;
          uint64_t v162 = v160;
          id v106 = v159;
          LOBYTE(v131) = (_BYTE)v184;
          (*(void (**)(uint64_t, uint64_t))(v136 + 8))(v162, v135);
        }
        uint64_t v155 = v187;
        uint64_t v190 = sub_100018764(v138, v137, (uint64_t *)&v192);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        swift_bridgeObjectRelease();
        sub_100009A50(v176, &qword_100026378);
        _os_log_impl((void *)&_mh_execute_header, v130, (os_log_type_t)v131, "handling telephony voice call for handle: %s, person: %s", (uint8_t *)v133, 0x16u);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();

        (*(void (**)(char *, uint64_t))(v180 + 8))(v177, v181);
        v154 = v188;
        unint64_t v59 = v189;
      }
      else
      {
        swift_bridgeObjectRelease_n();
        sub_100009A50(v129, &qword_100026378);

        (*(void (**)(char *, uint64_t))(v180 + 8))(v128, v181);
        uint64_t v155 = v187;
        v154 = v188;
      }
      uint64_t v163 = v59[5];
      uint64_t v164 = v59[6];
      sub_10000683C(v59 + 2, v163);
      (*(void (**)(unsigned int (*)(uint64_t, uint64_t, uint64_t), unint64_t, void (*)(void), uint64_t, uint64_t, uint64_t))(v164 + 8))(v185, v127, v154, v155, v163, v164);

      swift_bridgeObjectRelease();
    }
    else
    {
      v145 = v106;
      v192 = 0;
      unint64_t v193 = 0xE000000000000000;
      _StringGuts.grow(_:)(56);
      v146._object = (void *)0x800000010001DA40;
      v146._countAndFlagsBits = 0xD000000000000036;
      String.append(_:)(v146);
      uint64_t v147 = v167;
      sub_100009984(v48, v167);
      uint64_t v148 = type metadata accessor for Person();
      uint64_t v149 = *(void *)(v148 - 8);
      int v150 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v149 + 48))(v147, 1, v148);
      v151 = (void (*)(void *))v188;
      if (v150 == 1)
      {
        sub_100009A50(v147, &qword_100026378);
        v152 = (void *)0xE100000000000000;
        uint64_t v153 = 45;
      }
      else
      {
        uint64_t v153 = Person.description.getter();
        v152 = v156;
        (*(void (**)(uint64_t, uint64_t))(v149 + 8))(v147, v148);
      }
      v157._countAndFlagsBits = v153;
      v157._object = v152;
      String.append(_:)(v157);
      swift_bridgeObjectRelease();
      v158 = (void *)static PeopleErrors.createError(_:code:)();
      swift_bridgeObjectRelease();
      v151(v158);
    }
  }
}

uint64_t sub_10000C948(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[29] = a6;
  v7[30] = a7;
  v7[27] = a4;
  v7[28] = a5;
  return _swift_task_switch(sub_10000C96C, 0, 0);
}

uint64_t sub_10000C96C()
{
  uint64_t v1 = v0[27];
  sub_1000067F8(&qword_100026618);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10001B230;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v3;
  *(void *)(inited + 72) = &type metadata for Bool;
  *(unsigned char *)(inited + 48) = 1;
  unint64_t v4 = sub_100016B70(inited);
  uint64_t v5 = *(void **)(v1 + 104);
  URL._bridgeToObjectiveC()(v6);
  uint64_t v8 = v7;
  v0[31] = v7;
  sub_100016CBC(v4);
  swift_bridgeObjectRelease();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v0[32] = isa;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[7] = v0 + 25;
  v0[3] = sub_10000CB38;
  uint64_t v10 = swift_continuation_init();
  v0[20] = _NSConcreteStackBlock;
  v0[21] = 0x40000000;
  v0[22] = sub_100017084;
  v0[23] = &unk_100021228;
  v0[24] = v10;
  [v5 openSensitiveURLInBackground:v8 withOptions:isa completionHandler:v0 + 20];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_10000CB38()
{
  return _swift_task_switch(sub_10000CC18, 0, 0);
}

uint64_t sub_10000CC18()
{
  int64_t v2 = (void *)v0[31];
  uint64_t v1 = (void *)v0[32];
  uint64_t v3 = (void (*)(void))v0[29];
  swift_errorRelease();

  v3(0);
  unint64_t v4 = (uint64_t (*)(void))v0[1];
  return v4();
}

uint64_t sub_10000CC9C()
{
  sub_100006880(v0 + 16);
  swift_release();
  sub_100006880(v0 + 64);

  return _swift_deallocClassInstance(v0, 112, 7);
}

uint64_t type metadata accessor for CallActionHandler()
{
  return self;
}

void sub_10000CD14(uint64_t a1, unsigned int (*a2)(uint64_t, uint64_t, uint64_t), void (*a3)(void), uint64_t a4)
{
}

uint64_t sub_10000CD38(Swift::Int *a1, Swift::Int a2, Swift::Int a3)
{
  uint64_t v7 = *v3;
  Hasher.init(_seed:)();
  swift_bridgeObjectRetain();
  String.hash(into:)();
  Swift::Int v8 = Hasher._finalize()();
  uint64_t v9 = -1 << *(unsigned char *)(v7 + 32);
  unint64_t v10 = v8 & ~v9;
  if ((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10))
  {
    uint64_t v11 = *(void *)(v7 + 48);
    uint64_t v12 = (void *)(v11 + 16 * v10);
    BOOL v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      uint64_t v14 = (Swift::Int *)(*(void *)(*v3 + 48) + 16 * v10);
      Swift::Int v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    uint64_t v17 = ~v9;
    while (1)
    {
      unint64_t v10 = (v10 + 1) & v17;
      if (((*(void *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v10) & 1) == 0) {
        break;
      }
      uint64_t v18 = (void *)(v11 + 16 * v10);
      BOOL v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) != 0) {
        goto LABEL_7;
      }
    }
  }
  swift_bridgeObjectRelease();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v21 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_10000D1C8(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *uint64_t v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_10000CEE8()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000067F8(&qword_100026630);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
  uint64_t v4 = v3;
  if (*(void *)(v2 + 16))
  {
    uint64_t v5 = 1 << *(unsigned char *)(v2 + 32);
    uint64_t v30 = (void *)(v2 + 56);
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
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8) {
          goto LABEL_33;
        }
        unint64_t v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          int64_t v11 = v16 + 1;
          if (v16 + 1 >= v8) {
            goto LABEL_33;
          }
          unint64_t v17 = v30[v11];
          if (!v17)
          {
            int64_t v11 = v16 + 2;
            if (v16 + 2 >= v8) {
              goto LABEL_33;
            }
            unint64_t v17 = v30[v11];
            if (!v17)
            {
              int64_t v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                uint64_t v1 = v0;
                uint64_t v29 = 1 << *(unsigned char *)(v2 + 32);
                if (v29 > 63) {
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                }
                else {
                  *uint64_t v30 = -1 << v29;
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
                    goto LABEL_39;
                  }
                  if (v11 >= v8) {
                    goto LABEL_33;
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
      BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
      uint64_t v20 = *v19;
      uint64_t v21 = v19[1];
      Hasher.init(_seed:)();
      String.hash(into:)();
      uint64_t result = Hasher._finalize()();
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
            goto LABEL_38;
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
      BOOL v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
      *BOOL v13 = v20;
      v13[1] = v21;
      ++*(void *)(v4 + 16);
    }
  }
  uint64_t result = swift_release();
  *uint64_t v1 = v4;
  return result;
}

Swift::Int sub_10000D1C8(Swift::Int result, Swift::Int a2, unint64_t a3, char a4)
{
  uint64_t v5 = v4;
  Swift::Int v8 = result;
  unint64_t v9 = *(void *)(*v4 + 16);
  unint64_t v10 = *(void *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0) {
    goto LABEL_22;
  }
  if (a4)
  {
    sub_10000CEE8();
  }
  else
  {
    if (v10 > v9)
    {
      uint64_t result = (Swift::Int)sub_10000D364();
      goto LABEL_22;
    }
    sub_10000D518();
  }
  uint64_t v11 = *v4;
  Hasher.init(_seed:)();
  String.hash(into:)();
  uint64_t result = Hasher._finalize()();
  uint64_t v12 = -1 << *(unsigned char *)(v11 + 32);
  a3 = result & ~v12;
  uint64_t v13 = v11 + 56;
  if ((*(void *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3))
  {
    uint64_t v14 = *(void *)(v11 + 48);
    unint64_t v15 = (void *)(v14 + 16 * a3);
    BOOL v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)(), (result & 1) != 0))
    {
LABEL_21:
      uint64_t result = ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
      __break(1u);
    }
    else
    {
      uint64_t v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(void *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFFF8)) >> a3) & 1) == 0) {
          break;
        }
        int64_t v18 = (void *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          uint64_t result = _stringCompareWithSmolCheck(_:_:expecting:)();
          if ((result & 1) == 0) {
            continue;
          }
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  uint64_t v20 = *v5;
  *(void *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  uint64_t v21 = (Swift::Int *)(*(void *)(v20 + 48) + 16 * a3);
  *uint64_t v21 = v8;
  v21[1] = a2;
  uint64_t v22 = *(void *)(v20 + 16);
  BOOL v23 = __OFADD__(v22, 1);
  uint64_t v24 = v22 + 1;
  if (v23) {
    __break(1u);
  }
  else {
    *(void *)(v20 + 16) = v24;
  }
  return result;
}

void *sub_10000D364()
{
  uint64_t v1 = v0;
  sub_1000067F8(&qword_100026630);
  uint64_t v2 = *v0;
  uint64_t v3 = static _SetStorage.copy(original:)();
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
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (void *)(*(void *)(v2 + 48) + v16);
    uint64_t v18 = v17[1];
    BOOL v19 = (void *)(*(void *)(v4 + 48) + v16);
    *BOOL v19 = *v17;
    v19[1] = v18;
    uint64_t result = (void *)swift_bridgeObjectRetain();
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

uint64_t sub_10000D518()
{
  uint64_t v1 = v0;
  uint64_t v2 = *v0;
  sub_1000067F8(&qword_100026630);
  uint64_t v3 = static _SetStorage.resize(original:capacity:move:)();
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
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29) {
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      int64_t v11 = v16 + 1;
      if (v16 + 1 >= v29) {
        goto LABEL_33;
      }
      unint64_t v17 = *(void *)(v6 + 8 * v11);
      if (!v17)
      {
        int64_t v11 = v16 + 2;
        if (v16 + 2 >= v29) {
          goto LABEL_33;
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
    BOOL v19 = (uint64_t *)(*(void *)(v2 + 48) + 16 * v15);
    uint64_t v20 = *v19;
    uint64_t v21 = v19[1];
    Hasher.init(_seed:)();
    swift_bridgeObjectRetain();
    String.hash(into:)();
    uint64_t result = Hasher._finalize()();
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
          goto LABEL_36;
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
    int64_t v13 = (void *)(*(void *)(v4 + 48) + 16 * v12);
    *int64_t v13 = v20;
    v13[1] = v21;
    ++*(void *)(v4 + 16);
  }
  int64_t v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    uint64_t result = swift_release_n();
    uint64_t v1 = v0;
    goto LABEL_35;
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
      goto LABEL_33;
    }
    unint64_t v17 = *(void *)(v6 + 8 * v11);
    ++v18;
    if (v17) {
      goto LABEL_23;
    }
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_10000D7C8(char a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000D7E8(a1, a2, a3, *v3);
  *uint64_t v3 = (char *)result;
  return result;
}

uint64_t sub_10000D7E8(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000067F8(&qword_100026638);
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
  int64_t v13 = v10 + 32;
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

id sub_10000D954()
{
  id v0 = [self sharedInstance];
  uint64_t v1 = self;
  id result = [v1 defaultWorkspace];
  if (result)
  {
    id v3 = result;
    uint64_t v4 = sub_10000E1DC(0, (unint64_t *)&qword_100026370);
    uint64_t v13 = v4;
    unint64_t v14 = &off_100021128;
    *(void *)&long long v12 = v3;
    type metadata accessor for IntentLauncher();
    uint64_t v5 = swift_allocObject();
    sub_100009B04(&v12, v5 + 16);
    id result = [v1 defaultWorkspace];
    if (result)
    {
      id v6 = result;
      id v7 = [objc_allocWithZone((Class)CNLaunchServices) init];
      uint64_t v13 = sub_10000E1DC(0, &qword_1000265F8);
      unint64_t v14 = &off_1000211D8;
      *(void *)&long long v12 = v0;
      uint64_t v10 = v4;
      int64_t v11 = &protocol witness table for LSApplicationWorkspace;
      *(void *)&long long v9 = v6;
      type metadata accessor for CallActionHandler();
      uint64_t v8 = swift_allocObject();
      sub_100009B04(&v12, v8 + 16);
      *(void *)(v8 + 56) = v5;
      sub_100009B04(&v9, v8 + 64);
      *(void *)(v8 + 104) = v7;
      return (id)v8;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_10000DAD8(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for QuickAction();
  uint64_t v27 = *(void *)(v2 - 8);
  uint64_t v28 = v2;
  __chkstk_darwin(v2);
  int64_t v29 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = type metadata accessor for QuickActionType();
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = __chkstk_darwin(v4);
  unint64_t v26 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = __chkstk_darwin(v6);
  char v25 = (char *)&v22 - v9;
  uint64_t v10 = __chkstk_darwin(v8);
  long long v12 = (char *)&v22 - v11;
  __chkstk_darwin(v10);
  unint64_t v14 = (char *)&v22 - v13;
  QuickAction.type.getter();
  unint64_t v23 = *(void (**)(char *, void, uint64_t))(v5 + 104);
  v23(v12, enum case for QuickActionType.videoCall(_:), v4);
  sub_10000DE7C();
  dispatch thunk of RawRepresentable.rawValue.getter();
  dispatch thunk of RawRepresentable.rawValue.getter();
  uint64_t v24 = a1;
  if (v32 == v30 && v33 == v31) {
    char v15 = 1;
  }
  else {
    char v15 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  int64_t v16 = *(void (**)(char *, uint64_t))(v5 + 8);
  v16(v12, v4);
  v16(v14, v4);
  uint64_t v18 = v27;
  uint64_t v17 = v28;
  BOOL v19 = v29;
  (*(void (**)(char *, uint64_t, uint64_t))(v27 + 16))(v29, v24, v28);
  if (v15)
  {
    char v20 = 1;
  }
  else
  {
    QuickAction.type.getter();
    v23(v26, enum case for QuickActionType.voiceCall(_:), v4);
    dispatch thunk of RawRepresentable.rawValue.getter();
    dispatch thunk of RawRepresentable.rawValue.getter();
    if (v32 == v30 && v33 == v31) {
      char v20 = 1;
    }
    else {
      char v20 = _stringCompareWithSmolCheck(_:_:expecting:)();
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v16(v26, v4);
    v16(v25, v4);
    BOOL v19 = v29;
  }
  (*(void (**)(char *, uint64_t))(v18 + 8))(v19, v17);
  return v20 & 1;
}

unint64_t sub_10000DE7C()
{
  unint64_t result = qword_100026060;
  if (!qword_100026060)
  {
    type metadata accessor for QuickActionType();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100026060);
  }
  return result;
}

uint64_t sub_10000DED4()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_10000DFC8()
{
  uint64_t v2 = *(void *)(type metadata accessor for URL() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = *(void *)(v0 + 32);
  uint64_t v6 = v0 + v3;
  uint64_t v7 = swift_task_alloc();
  long long v8 = *(_OWORD *)(v0 + v4);
  *(void *)(v1 + 16) = v7;
  *(void *)uint64_t v7 = v1;
  *(void *)(v7 + 8) = sub_10000E0E8;
  *(_OWORD *)(v7 + 232) = v8;
  *(void *)(v7 + 216) = v5;
  *(void *)(v7 + 224) = v6;
  return _swift_task_switch(sub_10000C96C, 0, 0);
}

uint64_t sub_10000E0E8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

uint64_t sub_10000E1DC(uint64_t a1, unint64_t *a2)
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

uint64_t sub_10000E218(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 16);
  uint64_t result = Set.init(minimumCapacity:)();
  uint64_t v8 = result;
  if (v2)
  {
    uint64_t v4 = (Swift::Int *)(a1 + 40);
    do
    {
      Swift::Int v5 = *(v4 - 1);
      Swift::Int v6 = *v4;
      swift_bridgeObjectRetain();
      sub_10000CD38(&v7, v5, v6);
      swift_bridgeObjectRelease();
      v4 += 2;
      --v2;
    }
    while (v2);
    return v8;
  }
  return result;
}

uint64_t sub_10000E2B4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10000E2C4()
{
  return swift_release();
}

uint64_t sub_10000E2CC(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4)
{
  unint64_t v59 = a3;
  uint64_t v60 = a4;
  uint64_t v6 = type metadata accessor for QuickAction();
  uint64_t v53 = *(void *)(v6 - 8);
  uint64_t v54 = v6;
  __chkstk_darwin(v6);
  id v52 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for URLComponents();
  uint64_t v56 = *(void *)(v8 - 8);
  uint64_t v57 = v8;
  __chkstk_darwin(v8);
  uint64_t v10 = (char *)&v47 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = type metadata accessor for HandleType();
  uint64_t v55 = *(void *)(v11 - 8);
  __chkstk_darwin(v11);
  uint64_t v13 = (char *)&v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = sub_1000067F8(&qword_100026378);
  uint64_t v15 = __chkstk_darwin(v14 - 8);
  uint64_t v17 = (char *)&v47 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v15);
  char v20 = (char *)&v47 - v19;
  __chkstk_darwin(v18);
  uint64_t v22 = (char *)&v47 - v21;
  uint64_t v23 = a1;
  QuickAction.handle.getter();
  uint64_t v24 = a2;
  uint64_t v26 = v25;
  sub_100009984(a2, (uint64_t)v22);
  if (v26)
  {
    sub_10000E9D8((uint64_t)v22);
LABEL_3:
    URLComponents.init()();
    URLComponents.scheme.setter();
    URLComponents.path.setter();
    uint64_t v27 = v58[5];
    uint64_t v28 = v58[6];
    sub_10000683C(v58 + 2, v27);
    (*(void (**)(char *, void (*)(uint64_t), uint64_t, uint64_t, uint64_t))(v28 + 16))(v10, v59, v60, v27, v28);
    return (*(uint64_t (**)(char *, uint64_t))(v56 + 8))(v10, v57);
  }
  uint64_t v30 = v13;
  uint64_t v31 = v55;
  uint64_t v51 = v11;
  uint64_t v48 = v23;
  id v49 = v17;
  sub_100009984((uint64_t)v22, (uint64_t)v20);
  uint64_t v32 = type metadata accessor for Person();
  uint64_t v33 = *(void *)(v32 - 8);
  int v34 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v33 + 48))(v20, 1, v32);
  uint64_t v50 = v24;
  if (v34 == 1)
  {
    sub_10000E9D8((uint64_t)v22);
    sub_10000E9D8((uint64_t)v20);
    uint64_t v36 = v53;
    uint64_t v35 = v54;
  }
  else
  {
    uint64_t v37 = v31;
    (*(void (**)(char *, void, uint64_t))(v31 + 104))(v30, enum case for HandleType.email(_:), v51);
    Person.preferredHandle(ofType:)();
    uint64_t v39 = v38;
    (*(void (**)(char *, uint64_t))(v37 + 8))(v30, v51);
    sub_10000E9D8((uint64_t)v22);
    (*(void (**)(char *, uint64_t))(v33 + 8))(v20, v32);
    uint64_t v36 = v53;
    uint64_t v35 = v54;
    if (v39) {
      goto LABEL_3;
    }
  }
  uint64_t v40 = v52;
  (*(void (**)(char *, uint64_t, uint64_t))(v36 + 16))(v52, v48, v35);
  uint64_t v41 = (uint64_t)v49;
  sub_100009984(v50, (uint64_t)v49);
  uint64_t v42 = v36;
  uint64_t v43 = type metadata accessor for NoAvailableContactHandle();
  sub_10000EA38((unint64_t *)&unk_1000266F0, (void (*)(uint64_t))type metadata accessor for NoAvailableContactHandle);
  uint64_t v44 = swift_allocError();
  uint64_t v46 = v45;
  (*(void (**)(uint64_t, char *, uint64_t))(v42 + 32))(v45, v40, v35);
  sub_10000EA80(v41, v46 + *(int *)(v43 + 20));
  v59(v44);
  return swift_errorRelease();
}

uint64_t type metadata accessor for MailActionHandler()
{
  return self;
}

uint64_t sub_10000E7D4(uint64_t a1, uint64_t a2, void (*a3)(uint64_t), uint64_t a4)
{
  return sub_10000E2CC(a1, a2, a3, a4);
}

uint64_t sub_10000E7F8()
{
  uint64_t v0 = type metadata accessor for QuickActionType();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  uint64_t v6 = (char *)v10 - v5;
  QuickAction.type.getter();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v4, enum case for QuickActionType.mail(_:), v0);
  sub_10000EA38((unint64_t *)&qword_100026060, (void (*)(uint64_t))&type metadata accessor for QuickActionType);
  dispatch thunk of RawRepresentable.rawValue.getter();
  dispatch thunk of RawRepresentable.rawValue.getter();
  if (v10[2] == v10[0] && v10[3] == v10[1]) {
    char v7 = 1;
  }
  else {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  v8(v6, v0);
  return v7 & 1;
}

uint64_t sub_10000E9D8(uint64_t a1)
{
  uint64_t v2 = sub_1000067F8(&qword_100026378);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_10000EA38(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_10000EA80(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000067F8(&qword_100026378);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_10000ED4C(void *a1)
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  uint64_t v5 = __chkstk_darwin(v3);
  char v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v32 - v8;
  uint64_t v10 = *(void **)(v1 + OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_rootViewController);
  id v11 = [v10 childViewControllers];
  sub_10000E1DC(0, &qword_100026818);
  unint64_t v12 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (v12 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v13 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v13 = *(void *)((v12 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v13 != 1) {
    goto LABEL_16;
  }
  id v14 = [v10 childViewControllers];
  unint64_t v15 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v15 >> 62))
  {
    if (*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10)) {
      goto LABEL_6;
    }
LABEL_15:
    swift_bridgeObjectRelease();
    goto LABEL_16;
  }
  swift_bridgeObjectRetain();
  uint64_t v24 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v24) {
    goto LABEL_15;
  }
LABEL_6:
  if ((v15 & 0xC000000000000001) != 0)
  {
    id v16 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
  }
  else
  {
    if (!*(void *)((v15 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_26;
    }
    id v16 = *(id *)(v15 + 32);
  }
  uint64_t v17 = v16;
  swift_bridgeObjectRelease();
  id v18 = a1;
  id v19 = v17;
  char v20 = static NSObject.== infix(_:_:)();

  if ((v20 & 1) == 0)
  {
LABEL_16:
    static PeopleLogger.viewService.getter();
    uint64_t v25 = Logger.logObject.getter();
    os_log_type_t v26 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v33 = v3;
      uint64_t v27 = (uint8_t *)swift_slowAlloc();
      uint64_t v35 = swift_slowAlloc();
      *(_DWORD *)uint64_t v27 = 136315138;
      uint64_t v34 = sub_100018764(0xD000000000000019, 0x800000010001DC30, &v35);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v25, v26, "%s setting new controller into root view", v27, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v33);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v4 + 8))(v7, v3);
    }
    id v28 = [self currentDevice];
    id v29 = [v28 userInterfaceIdiom];

    if (v29 != (id)1) {
      goto LABEL_22;
    }
    id v30 = [a1 view];
    if (v30)
    {
      uint64_t v31 = v30;
      [v30 _setOverrideVibrancyTrait:1];

LABEL_22:
      sub_100012554();
      sub_100011F60(a1);
      return;
    }
LABEL_26:
    __break(1u);
    return;
  }
  static PeopleLogger.viewService.getter();
  uint64_t v21 = Logger.logObject.getter();
  os_log_type_t v22 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v21, v22))
  {
    uint64_t v23 = (uint8_t *)swift_slowAlloc();
    uint64_t v35 = swift_slowAlloc();
    *(_DWORD *)uint64_t v23 = 136315138;
    uint64_t v34 = sub_100018764(0xD000000000000019, 0x800000010001DC30, &v35);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v21, v22, "%s spotlight controller already in place", v23, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
}

void sub_10000F28C(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = type metadata accessor for Logger();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  uint64_t v9 = (char *)v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for PeopleAnalytics.WidgetLocation();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)v51 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for PeopleAnalytics();
  static PeopleAnalytics.shared.getter();
  (*(void (**)(char *, void, uint64_t))(v11 + 104))(v13, enum case for PeopleAnalytics.WidgetLocation.homeScreen(_:), v10);
  dispatch thunk of PeopleAnalytics.sendEntityCardLaunched(validContactIdentifier:displayPriorities:location:)();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  static PeopleLogger.viewService.getter();
  swift_bridgeObjectRetain_n();
  id v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.debug.getter();
  BOOL v16 = os_log_type_enabled(v14, v15);
  uint64_t v54 = a1;
  if (v16)
  {
    uint64_t v17 = swift_slowAlloc();
    uint64_t v18 = swift_slowAlloc();
    uint64_t v53 = v7;
    uint64_t v56 = v18;
    *(_DWORD *)uint64_t v17 = 136315394;
    uint64_t v55 = sub_100018764(0xD000000000000020, 0x800000010001DC00, &v56);
    uint64_t v52 = v6;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v17 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v55 = sub_100018764(a1, a2, &v56);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "%s showing '%s' in view", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v53 + 8))(v9, v52);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  }
  v51[1] = v3;
  id v19 = *(char **)(v3 + OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_peopleView);
  if (v19)
  {
    char v20 = &v19[OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_contactIdentifier];
    *(void *)char v20 = 0;
    *((void *)v20 + 1) = 0;
    uint64_t v21 = v19;
    swift_bridgeObjectRelease();
    *(void *)&v21[OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_displayPriorities] = &_swiftEmptyArrayStorage;

    swift_bridgeObjectRelease();
  }
  uint64_t v52 = static HorizontalAlignment.center.getter();
  uint64_t v53 = static VerticalAlignment.center.getter();
  uint64_t v56 = v54;
  unint64_t v57 = a2;
  sub_10000FCDC();
  swift_bridgeObjectRetain();
  uint64_t v22 = Text.init<A>(_:)();
  uint64_t v24 = v23;
  char v26 = v25 & 1;
  static Font.headline.getter();
  uint64_t v27 = Text.font(_:)();
  uint64_t v29 = v28;
  char v31 = v30;
  swift_release();
  sub_10000FD30(v22, v24, v26);
  swift_bridgeObjectRelease();
  uint64_t v32 = self;
  id v33 = [v32 labelColor];
  Color.init(uiColor:)();
  uint64_t v34 = Text.foregroundColor(_:)();
  uint64_t v36 = v35;
  char v38 = v37;
  uint64_t v40 = v39;
  swift_release();
  sub_10000FD30(v27, v29, v31 & 1);
  swift_bridgeObjectRelease();
  uint64_t v41 = static Color.clear.getter();
  char v42 = static Edge.Set.all.getter();
  uint64_t v43 = static Color.clear.getter();
  LOBYTE(v27) = static Edge.Set.all.getter();
  uint64_t v44 = static Color.clear.getter();
  char v45 = static Edge.Set.all.getter();
  char v83 = 1;
  char v82 = 1;
  char v80 = v38 & 1;
  uint64_t v56 = v52;
  unint64_t v57 = 0;
  char v58 = 1;
  *(_DWORD *)unint64_t v59 = v55;
  *(_DWORD *)&v59[3] = *(_DWORD *)((char *)&v55 + 3);
  uint64_t v60 = v53;
  uint64_t v61 = 0;
  char v62 = 1;
  *(_DWORD *)uint64_t v63 = *(_DWORD *)v81;
  *(_DWORD *)&v63[3] = *(_DWORD *)&v81[3];
  uint64_t v64 = v34;
  uint64_t v65 = v36;
  char v66 = v38 & 1;
  *(_DWORD *)&v67[3] = *(_DWORD *)&v79[3];
  *(_DWORD *)uint64_t v67 = *(_DWORD *)v79;
  uint64_t v68 = v40;
  uint64_t v69 = v41;
  char v70 = v42;
  *(_DWORD *)v71 = *(_DWORD *)v78;
  *(_DWORD *)&v71[3] = *(_DWORD *)&v78[3];
  uint64_t v72 = v43;
  char v73 = v27;
  *(_DWORD *)&v74[3] = *(_DWORD *)&v77[3];
  *(_DWORD *)uint64_t v74 = *(_DWORD *)v77;
  uint64_t v75 = v44;
  char v76 = v45;
  id v46 = objc_allocWithZone((Class)sub_1000067F8(&qword_100026810));
  uint64_t v47 = (void *)UIHostingController.init(rootView:)();
  id v48 = [v47 view];
  if (v48)
  {
    id v49 = v48;
    id v50 = [v32 clearColor];
    [v49 setBackgroundColor:v50];

    sub_10000ED4C(v47);
  }
  else
  {
    __break(1u);
  }
}

void sub_10000F90C(unsigned __int8 a1)
{
  uint64_t v3 = type metadata accessor for MetricTemplateView();
  __chkstk_darwin(v3 - 8);
  if ((static MetricTemplate.metricsEnabled.getter() & 1) != 0 && (int v5 = a1, v4))
  {
    MetricTemplateView.init(dragRefresh:)();
    id v6 = objc_allocWithZone((Class)sub_1000067F8(&qword_100026800));
    uint64_t v7 = (void *)UIHostingController.init(rootView:)();
    sub_100011F60(v7);
  }
  else
  {
    int v8 = v5;
    uint64_t v9 = *(char **)(v1 + OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_peopleView);
    if (v9 && *(void *)&v9[OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_contactIdentifier + 8])
    {
      switch(v8)
      {
        case 0:
          uint64_t v10 = *(void **)&v9[OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_spotlightContactViewController];
          id v14 = v9;
          id v11 = v10;
          sub_10000ED4C(v11);

          sub_100014B18();
          goto LABEL_11;
        case 1:
        case 2:
          id v14 = v9;
          uint64_t v12 = String.localized.getter();
          sub_10000F28C(v12, v13);
          swift_bridgeObjectRelease();
LABEL_11:

          break;
        case 3:
          return;
        default:
          JUMPOUT(0);
      }
    }
  }
}

id sub_10000FC28()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SceneDelegate();
  [super dealloc];
}

uint64_t type metadata accessor for SceneDelegate()
{
  return self;
}

unint64_t sub_10000FCDC()
{
  unint64_t result = qword_100026808;
  if (!qword_100026808)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100026808);
  }
  return result;
}

uint64_t sub_10000FD30(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

unint64_t sub_10000FD40()
{
  unint64_t result = qword_100026828;
  if (!qword_100026828)
  {
    sub_10000E1DC(255, &qword_100026820);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100026828);
  }
  return result;
}

void sub_10000FDA8(uint64_t a1)
{
  uint64_t v134 = a1;
  uint64_t v2 = sub_1000067F8(&qword_100026830);
  __chkstk_darwin(v2 - 8);
  uint64_t v102 = (char *)v94 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v101 = type metadata accessor for QuickAction();
  uint64_t v133 = *(char **)(v101 - 8);
  __chkstk_darwin(v101);
  id v98 = (char *)v94 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v118 = type metadata accessor for PeopleURL.Scheme();
  unint64_t v5 = *(void *)(v118 - 8);
  __chkstk_darwin(v118);
  long long v117 = (char *)v94 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1000067F8(&qword_100026838);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)v94 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for URLComponents();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v119 = (char *)v94 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v120 = type metadata accessor for Logger();
  uint64_t v13 = *(void *)(v120 - 8);
  uint64_t v14 = __chkstk_darwin(v120);
  BOOL v16 = (char *)v94 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v17 = __chkstk_darwin(v14);
  uint64_t v121 = (char *)v94 - v18;
  __chkstk_darwin(v17);
  v126 = (char *)v94 - v19;
  uint64_t v20 = type metadata accessor for URL();
  uint64_t v21 = *(void *)(v20 - 8);
  uint64_t v22 = __chkstk_darwin(v20);
  uint64_t v100 = (char *)v94 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v24 = __chkstk_darwin(v22);
  v128 = (char *)v94 - v25;
  __chkstk_darwin(v24);
  uint64_t v27 = (char *)v94 - v26;
  uint64_t v103 = v1;
  uint64_t v97 = OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_peopleView;
  id v104 = *(id *)(v1 + OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_peopleView);
  if (v104)
  {
    unint64_t v125 = v9;
    uint64_t v127 = v10;
    unint64_t v131 = v5;
    if ((v134 & 0xC000000000000001) != 0)
    {
      id v28 = v104;
      swift_bridgeObjectRetain();
      __CocoaSet.makeIterator()();
      sub_10000E1DC(0, &qword_100026820);
      sub_10000FD40();
      Set.Iterator.init(_cocoa:)();
      uint64_t v134 = v137[0];
      uint64_t v30 = v137[2];
      uint64_t v108 = v137[1];
      uint64_t v31 = v137[3];
      unint64_t v32 = v137[4];
    }
    else
    {
      uint64_t v36 = -1 << *(unsigned char *)(v134 + 32);
      uint64_t v37 = *(void *)(v134 + 56);
      uint64_t v108 = v134 + 56;
      uint64_t v30 = ~v36;
      uint64_t v38 = -v36;
      if (v38 < 64) {
        uint64_t v39 = ~(-1 << v38);
      }
      else {
        uint64_t v39 = -1;
      }
      unint64_t v32 = v39 & v37;
      id v40 = v104;
      swift_bridgeObjectRetain();
      uint64_t v31 = 0;
    }
    uint64_t v41 = v128;
    uint64_t v106 = v134 & 0x7FFFFFFFFFFFFFFFLL;
    v94[2] = v30;
    int64_t v107 = (unint64_t)(v30 + 64) >> 6;
    BOOL v132 = (void (**)(char *, uint64_t))(v21 + 8);
    uint64_t v129 = (void (**)(char *, uint64_t))(v13 + 8);
    uint64_t v123 = (unsigned int (**)(uint64_t, uint64_t, uint64_t))(v11 + 48);
    uint64_t v124 = (void (**)(char *, char *, uint64_t))(v21 + 16);
    uint64_t v116 = (void (**)(char *, uint64_t, uint64_t))(v11 + 32);
    unsigned int v115 = enum case for PeopleURL.Scheme.people(_:);
    int v114 = (void (**)(char *, void, uint64_t))(v131 + 104);
    uint64_t v113 = (void (**)(char *, uint64_t))(v131 + 8);
    id v109 = (void (**)(uint64_t, uint64_t))(v11 + 8);
    uint64_t v99 = (uint64_t (**)(uint64_t, uint64_t, uint64_t))(v133 + 48);
    uint64_t v96 = (void (**)(char *, uint64_t, uint64_t))(v133 + 32);
    uint64_t v95 = (void (**)(uint64_t, uint64_t))(v133 + 8);
    *(void *)&long long v29 = 136315650;
    long long v112 = v29;
    unint64_t v111 = 0x800000010001DC50;
    uint64_t v110 = (char *)&type metadata for Any + 8;
    v94[1] = 0x800000010001DBE0;
    id v105 = (char *)&type metadata for Swift.AnyObject + 8;
    uint64_t v42 = v120;
    uint64_t v43 = v126;
    uint64_t v122 = v20;
    while (1)
    {
      uint64_t v45 = v31;
      if (v134 < 0)
      {
        uint64_t v48 = __CocoaSet.Iterator.next()();
        if (!v48) {
          goto LABEL_54;
        }
        uint64_t v135 = v48;
        sub_10000E1DC(0, &qword_100026820);
        swift_unknownObjectRetain();
        uint64_t v41 = v128;
        swift_dynamicCast();
        id v49 = v136;
        swift_unknownObjectRelease();
        if (!v49) {
          goto LABEL_54;
        }
      }
      else
      {
        if (v32)
        {
          unint64_t v46 = __clz(__rbit64(v32));
          v32 &= v32 - 1;
          unint64_t v47 = v46 | (v31 << 6);
        }
        else
        {
          int64_t v50 = v31 + 1;
          if (__OFADD__(v31, 1))
          {
            __break(1u);
            return;
          }
          if (v50 >= v107) {
            goto LABEL_54;
          }
          unint64_t v51 = *(void *)(v108 + 8 * v50);
          ++v31;
          if (!v51)
          {
            uint64_t v31 = v45 + 2;
            if (v45 + 2 >= v107) {
              goto LABEL_54;
            }
            unint64_t v51 = *(void *)(v108 + 8 * v31);
            if (!v51)
            {
              uint64_t v31 = v45 + 3;
              if (v45 + 3 >= v107) {
                goto LABEL_54;
              }
              unint64_t v51 = *(void *)(v108 + 8 * v31);
              if (!v51)
              {
                uint64_t v31 = v45 + 4;
                if (v45 + 4 >= v107) {
                  goto LABEL_54;
                }
                unint64_t v51 = *(void *)(v108 + 8 * v31);
                if (!v51)
                {
                  uint64_t v52 = v45 + 5;
                  while (v107 != v52)
                  {
                    unint64_t v51 = *(void *)(v108 + 8 * v52++);
                    if (v51)
                    {
                      uint64_t v31 = v52 - 1;
                      goto LABEL_33;
                    }
                  }
LABEL_54:
                  sub_100010D80();

                  return;
                }
              }
            }
          }
LABEL_33:
          unint64_t v32 = (v51 - 1) & v51;
          unint64_t v47 = __clz(__rbit64(v51)) + (v31 << 6);
        }
        id v49 = *(id *)(*(void *)(v134 + 48) + 8 * v47);
        if (!v49) {
          goto LABEL_54;
        }
      }
      uint64_t v130 = v31;
      unint64_t v131 = v32;
      id v53 = [v49 URL];
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      static PeopleLogger.viewService.getter();
      (*v124)(v41, v27, v20);
      uint64_t v54 = (char *)v49;
      uint64_t v55 = Logger.logObject.getter();
      os_log_type_t v56 = static os_log_type_t.default.getter();
      BOOL v57 = os_log_type_enabled(v55, v56);
      uint64_t v133 = v54;
      if (v57)
      {
        char v58 = v54;
        unint64_t v59 = v27;
        uint64_t v60 = v41;
        uint64_t v61 = swift_slowAlloc();
        char v62 = (void *)swift_slowAlloc();
        uint64_t v136 = (void *)swift_slowAlloc();
        *(_DWORD *)uint64_t v61 = v112;
        *(void *)(v61 + 4) = sub_100018764(0xD000000000000019, v111, (uint64_t *)&v136);
        *(_WORD *)(v61 + 12) = 2112;
        *(void *)(v61 + 14) = v58;
        *char v62 = v49;
        *(_WORD *)(v61 + 22) = 2080;
        sub_100010D88();
        uint64_t v63 = dispatch thunk of CustomStringConvertible.description.getter();
        *(void *)(v61 + 24) = sub_100018764(v63, v64, (uint64_t *)&v136);
        swift_bridgeObjectRelease();
        uint64_t v65 = *v132;
        char v66 = v60;
        uint64_t v27 = v59;
        (*v132)(v66, v20);
        _os_log_impl((void *)&_mh_execute_header, v55, v56, "%s url centext: %@ url: %s", (uint8_t *)v61, 0x20u);
        sub_1000067F8(&qword_1000262A8);
        swift_arrayDestroy();
        uint64_t v67 = v127;
        swift_slowDealloc();
        swift_arrayDestroy();
        uint64_t v43 = v126;
        uint64_t v68 = v120;
        swift_slowDealloc();
        swift_slowDealloc();

        uint64_t v69 = *v129;
        (*v129)(v43, v68);
        uint64_t v70 = (uint64_t)v125;
      }
      else
      {

        uint64_t v65 = *v132;
        (*v132)(v41, v20);

        uint64_t v69 = *v129;
        uint64_t v68 = v42;
        (*v129)(v43, v42);
        uint64_t v70 = (uint64_t)v125;
        uint64_t v67 = v127;
      }
      URLComponents.init(url:resolvingAgainstBaseURL:)();
      if ((*v123)(v70, 1, v67) == 1) {
        break;
      }
      uint64_t v72 = (uint64_t)v119;
      (*v116)(v119, v70, v67);
      URLComponents.scheme.getter();
      uint64_t v73 = v67;
      uint64_t v74 = v117;
      uint64_t v75 = v118;
      (*v114)(v117, v115, v118);
      char v76 = static PeopleURL.Scheme.== infix(_:_:)();
      swift_bridgeObjectRelease();
      (*v113)(v74, v75);
      if ((v76 & 1) == 0)
      {
        (*v109)(v72, v73);
        v71 = v121;
        uint64_t v43 = v126;
        goto LABEL_47;
      }
      if (sub_100016678())
      {
        unsigned __int8 v44 = sub_10001300C(v72);
        sub_10000F90C(v44);

        (*v109)(v72, v127);
        uint64_t v43 = v126;
        uint64_t v20 = v122;
        uint64_t v41 = v128;
        uint64_t v31 = v130;
        unint64_t v32 = v131;
        goto LABEL_13;
      }
      uint64_t v77 = v133;
      id v78 = [v133 URL];
      static URL._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v79 = (uint64_t)v102;
      QuickAction.init(from:)();
      uint64_t v80 = v101;
      int v81 = (*v99)(v79, 1, v101);
      uint64_t v82 = v127;
      uint64_t v20 = v122;
      unint64_t v32 = v131;
      if (v81 != 1)
      {
        uint64_t v93 = (uint64_t)v98;
        (*v96)(v98, v79, v80);
        sub_1000097D8();
        sub_100008708(v93);

        swift_release();
        (*v95)(v93, v80);
        (*v109)((uint64_t)v119, v82);
        uint64_t v43 = v126;
LABEL_50:
        uint64_t v41 = v128;
        uint64_t v31 = v130;
        goto LABEL_13;
      }
      sub_100009A50(v79, &qword_100026830);
      unsigned __int8 v83 = sub_10001300C(v72);
      uint64_t v84 = v103;
      sub_10000F90C(v83);
      static MetricTemplate.metricsEnabled.getter();
      id v85 = *(char **)(v84 + v97);
      if (v85 && *(void *)&v85[OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_contactIdentifier + 8])
      {
        uint64_t v86 = v85;
        uint64_t v87 = String.localized.getter();
        sub_10000F28C(v87, v88);

        uint64_t v82 = v127;
        swift_bridgeObjectRelease();
        uint64_t v89 = v86;
        uint64_t v43 = v126;
        uint64_t v41 = v128;
        uint64_t v31 = v130;
      }
      else
      {
        uint64_t v43 = v126;
        uint64_t v41 = v128;
        uint64_t v31 = v130;
        uint64_t v89 = v133;
      }

      (*v109)(v72, v82);
LABEL_13:
      uint64_t v42 = v68;
      v65(v27, v20);
    }
    sub_100009A50(v70, &qword_100026838);
    v71 = v121;
LABEL_47:
    unint64_t v32 = v131;
    static PeopleLogger.viewService.getter();
    id v90 = Logger.logObject.getter();
    os_log_type_t v91 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v90, v91))
    {
      uint64_t v92 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)uint64_t v92 = 0;
      _os_log_impl((void *)&_mh_execute_header, v90, v91, "Url does not represent people/can't be parsed", v92, 2u);
      swift_slowDealloc();
    }

    v69(v71, v68);
    uint64_t v20 = v122;
    goto LABEL_50;
  }
  static PeopleLogger.viewService.getter();
  id v33 = Logger.logObject.getter();
  os_log_type_t v34 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v33, v34))
  {
    uint64_t v35 = (uint8_t *)swift_slowAlloc();
    v137[0] = swift_slowAlloc();
    *(_DWORD *)uint64_t v35 = 136315138;
    uint64_t v136 = (void *)sub_100018764(0xD000000000000019, 0x800000010001DC50, v137);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v33, v34, "%s impossible error, no peopleView", v35, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v13 + 8))(v16, v120);
}

uint64_t sub_100010D80()
{
  return swift_release();
}

unint64_t sub_100010D88()
{
  unint64_t result = qword_100026840;
  if (!qword_100026840)
  {
    type metadata accessor for URL();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_100026840);
  }
  return result;
}

void sub_100010DE0(void *a1, void *a2)
{
  uint64_t v3 = v2;
  id v57 = a2;
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void **)(v5 - 8);
  uint64_t v7 = __chkstk_darwin(v5);
  uint64_t v9 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v54 - v10;
  static PeopleLogger.viewService.getter();
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.default.getter();
  BOOL v14 = os_log_type_enabled(v12, v13);
  os_log_type_t v56 = v9;
  if (v14)
  {
    uint64_t v15 = swift_slowAlloc();
    uint64_t v55 = v3;
    uint64_t v16 = v5;
    uint64_t v17 = v6;
    uint64_t v18 = (uint8_t *)v15;
    uint64_t v59 = swift_slowAlloc();
    *(_DWORD *)uint64_t v18 = 136315138;
    uint64_t v58 = sub_100018764(0xD00000000000001FLL, 0x800000010001DCF0, &v59);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "%s", v18, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    uint64_t v6 = v17;
    uint64_t v5 = v16;
    uint64_t v3 = v55;
    swift_slowDealloc();
  }

  uint64_t v19 = (void (*)(char *, uint64_t))v6[1];
  v19(v11, v5);
  self;
  uint64_t v20 = swift_dynamicCastObjCClass();
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v54 = v19;
    uint64_t v22 = self;
    uint64_t v23 = a1;
    id v24 = [v22 sharedApplication];
    [v24 _setBackgroundStyle:1];

    id v25 = [self mainScreen];
    [v25 bounds];
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;

    id v34 = [objc_allocWithZone((Class)UIWindow) initWithFrame:v27, v29, v31, v33];
    uint64_t v35 = *(void **)&v3[OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_window];
    *(void *)&v3[OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_window] = v34;
    id v36 = v34;

    [v36 setOpaque:0];
    uint64_t v37 = self;
    id v38 = v36;
    id v39 = [v37 clearColor];
    [v38 setBackgroundColor:v39];

    [v38 setWindowScene:v21];
    [v38 setRootViewController:*(void *)&v3[OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_rootViewController]];
    [v38 makeKeyAndVisible];
    id v40 = objc_allocWithZone((Class)type metadata accessor for PeopleViewHandler());
    id v41 = v38;
    uint64_t v42 = sub_10001283C(v41);
    uint64_t v43 = *(void **)&v3[OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_peopleView];
    *(void *)&v3[OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_peopleView] = v42;

    id v44 = [v57 URLContexts];
    sub_10000E1DC(0, &qword_100026820);
    sub_10000FD40();
    uint64_t v45 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

    uint64_t v55 = v23;
    if ((v45 & 0xC000000000000001) != 0) {
      uint64_t v46 = __CocoaSet.count.getter();
    }
    else {
      uint64_t v46 = *(void *)(v45 + 16);
    }
    swift_bridgeObjectRelease();
    if (v46)
    {
      id v47 = [v57 URLContexts];
      uint64_t v48 = static Set._unconditionallyBridgeFromObjectiveC(_:)();

      sub_10000FDA8(v48);
      swift_bridgeObjectRelease();
    }
    else
    {
      id v49 = v56;
      static PeopleLogger.viewService.getter();
      int64_t v50 = Logger.logObject.getter();
      os_log_type_t v51 = static os_log_type_t.error.getter();
      if (os_log_type_enabled(v50, v51))
      {
        uint64_t v52 = swift_slowAlloc();
        id v57 = v6;
        id v53 = (uint8_t *)v52;
        uint64_t v59 = swift_slowAlloc();
        *(_DWORD *)id v53 = 136315138;
        uint64_t v58 = sub_100018764(0xD00000000000001FLL, 0x800000010001DCF0, &v59);
        UnsafeMutableRawBufferPointer.copyMemory(from:)();
        _os_log_impl((void *)&_mh_execute_header, v50, v51, "%s missing URL data", v53, 0xCu);
        swift_arrayDestroy();
        swift_slowDealloc();
        swift_slowDealloc();
      }

      v54(v49, v5);
      sub_10000F90C(1u);
    }
  }
}

id sub_1000115F8()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static PeopleLogger.viewService.getter();
  uint64_t v6 = Logger.logObject.getter();
  os_log_type_t v7 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v6, v7))
  {
    uint64_t v8 = (uint8_t *)swift_slowAlloc();
    uint64_t v13 = swift_slowAlloc();
    *(_DWORD *)uint64_t v8 = 136315138;
    uint64_t v12 = sub_100018764(0xD00000000000001BLL, 0x800000010001DCB0, &v13);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v6, v7, "%s", v8, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  uint64_t v9 = *(void **)(v1 + OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_peopleView);
  if (v9)
  {
    id v10 = v9;
    sub_100012948(0, 0xE000000000000000, &_swiftEmptyArrayStorage);
  }
  [*(id *)(v1 + OBJC_IVAR____TtC17PeopleViewService13SceneDelegate_rootViewController) dismissViewControllerAnimated:0 completion:0];
  return sub_100012554();
}

void sub_1000119FC(void *a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  uint64_t v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  static PeopleLogger.viewService.getter();
  id v6 = a1;
  os_log_type_t v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = swift_slowAlloc();
    uint64_t v19 = v3;
    uint64_t v10 = v9;
    uint64_t v18 = swift_slowAlloc();
    uint64_t v21 = v18;
    *(_DWORD *)uint64_t v10 = 136315394;
    uint64_t v20 = sub_100018764(0xD000000000000012, 0x800000010001DC70, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v10 + 12) = 2080;
    id v11 = [v6 activityType:v10 + 14];
    uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v17 = v2;
    uint64_t v13 = v12;
    unint64_t v15 = v14;

    uint64_t v20 = sub_100018764(v13, v15, &v21);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "%s activity: %s ", (uint8_t *)v10, 0x16u);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v19 + 8))(v5, v17);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
  sub_10000F90C(1u);
}

id sub_100011CA0()
{
  uint64_t v1 = OBJC_IVAR____TtC17PeopleViewService27RootContainerViewController____lazy_storage___blurView;
  uint64_t v2 = *(void **)(v0 + OBJC_IVAR____TtC17PeopleViewService27RootContainerViewController____lazy_storage___blurView);
  if (v2)
  {
    id v3 = *(id *)(v0 + OBJC_IVAR____TtC17PeopleViewService27RootContainerViewController____lazy_storage___blurView);
  }
  else
  {
    id v4 = [self effectWithStyle:8];
    id v5 = [objc_allocWithZone((Class)UIVisualEffectView) initWithEffect:v4];

    id v6 = *(void **)(v0 + v1);
    *(void *)(v0 + v1) = v5;
    id v3 = v5;

    uint64_t v2 = 0;
  }
  id v7 = v2;
  return v3;
}

void sub_100011E08()
{
  id v1 = [self currentDevice];
  id v2 = [v1 userInterfaceIdiom];

  if (v2 == (id)1) {
    id v3 = [objc_allocWithZone((Class)UIView) init];
  }
  else {
    id v3 = sub_100011CA0();
  }
  id v4 = v3;
  [v0 setView:v3];

  id v5 = [v0 view];
  if (v5)
  {
    id v6 = v5;
    id v7 = [v5 layer];

    [v7 setAllowsGroupOpacity:0];
  }
  else
  {
    __break(1u);
  }
}

void sub_100011F60(void *a1)
{
  id v2 = v1;
  uint64_t v4 = type metadata accessor for Logger();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  id v7 = (char *)v44 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = [a1 view];
  if (v8)
  {
    uint64_t v9 = v8;
    [v2 addChildViewController:a1];
    id v10 = [v2 view];
    if (v10)
    {
      id v11 = v10;
      self;
      uint64_t v12 = (void *)swift_dynamicCastObjCClass();
      if (v12)
      {
        uint64_t v13 = v12;
        id v14 = [v12 contentView];
        [v14 insertSubview:v9 atIndex:0];

        id v46 = [v13 contentView];
LABEL_12:
        [v9 setTranslatesAutoresizingMaskIntoConstraints:0];
        double v26 = self;
        sub_1000067F8(&qword_100026980);
        uint64_t v27 = swift_allocObject();
        *(_OWORD *)(v27 + 16) = xmmword_10001B340;
        id v28 = [v9 topAnchor];
        id v29 = [v46 topAnchor];
        id v30 = [v28 constraintEqualToAnchor:v29];

        *(void *)(v27 + 32) = v30;
        id v31 = [v9 bottomAnchor];
        id v32 = [v46 bottomAnchor];
        id v33 = [v31 constraintEqualToAnchor:v32];

        *(void *)(v27 + 40) = v33;
        id v34 = [v9 leadingAnchor];
        id v35 = [v46 safeAreaLayoutGuide];
        id v36 = [v35 leadingAnchor];

        id v37 = [v34 constraintEqualToAnchor:v36];
        *(void *)(v27 + 48) = v37;
        id v38 = [v9 trailingAnchor];
        id v39 = [v46 safeAreaLayoutGuide];
        id v40 = [v39 trailingAnchor];

        id v41 = [v38 constraintEqualToAnchor:v40];
        *(void *)(v27 + 56) = v41;
        uint64_t v48 = v27;
        specialized Array._endMutation()();
        sub_10000E1DC(0, &qword_100026878);
        Class isa = Array._bridgeToObjectiveC()().super.isa;
        swift_bridgeObjectRelease();
        [v26 activateConstraints:isa];

        [a1 didMoveToParentViewController:v2];
        id v43 = v46;

        return;
      }
    }
    id v24 = [v2 view];
    if (v24)
    {
      id v25 = v24;
      [v24 insertSubview:v9 atIndex:0];

      id v46 = [v2 view];
      if (v46) {
        goto LABEL_12;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    return;
  }
  static PeopleLogger.viewService.getter();
  id v15 = a1;
  uint64_t v16 = Logger.logObject.getter();
  os_log_type_t v17 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v16, v17))
  {
    uint64_t v18 = (uint8_t *)swift_slowAlloc();
    id v46 = (id)swift_slowAlloc();
    uint64_t v48 = (uint64_t)v46;
    uint64_t v45 = v18;
    *(_DWORD *)uint64_t v18 = 136315138;
    v44[1] = v18 + 4;
    id v19 = v15;
    id v20 = [v19 description];
    uint64_t v21 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v23 = v22;

    uint64_t v47 = sub_100018764(v21, v23, &v48);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();

    swift_bridgeObjectRelease();
    _os_log_impl((void *)&_mh_execute_header, v16, v17, "Tried to embed nil view for: %s", v45, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

id sub_100012554()
{
  id v1 = [v0 childViewControllers];
  sub_10000E1DC(0, &qword_100026818);
  unint64_t v2 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v2 >> 62))
  {
    uint64_t v3 = *(void *)((v2 & 0xFFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v3) {
      goto LABEL_3;
    }
    return (id)swift_bridgeObjectRelease_n();
  }
LABEL_12:
  swift_bridgeObjectRetain();
  uint64_t v3 = _CocoaArrayWrapper.endIndex.getter();
  if (!v3) {
    return (id)swift_bridgeObjectRelease_n();
  }
LABEL_3:
  for (uint64_t i = 4; ; ++i)
  {
    if ((v2 & 0xC000000000000001) != 0) {
      id v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
    }
    else {
      id v5 = *(id *)(v2 + 8 * i);
    }
    uint64_t v6 = v5;
    uint64_t v7 = i - 3;
    if (__OFADD__(i - 4, 1))
    {
      __break(1u);
      goto LABEL_12;
    }
    [v5 willMoveToParentViewController:0];
    id result = [v6 view];
    if (!result) {
      break;
    }
    uint64_t v9 = result;
    [result removeFromSuperview];

    [v6 removeFromParentViewController];
    if (v7 == v3) {
      return (id)swift_bridgeObjectRelease_n();
    }
  }
  __break(1u);
  return result;
}

id sub_1000127D4()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RootContainerViewController();
  [super dealloc];
}

uint64_t type metadata accessor for RootContainerViewController()
{
  return self;
}

char *sub_10001283C(void *a1)
{
  uint64_t v3 = &v1[OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_contactIdentifier];
  *(void *)uint64_t v3 = 0;
  *((void *)v3 + 1) = 0;
  *(void *)&v1[OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_displayPriorities] = &_swiftEmptyArrayStorage;
  uint64_t v4 = OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_contactFetcher;
  type metadata accessor for ContactFetcher();
  id v5 = v1;
  *(void *)&v1[v4] = static ContactFetcher.shared.getter();
  uint64_t v6 = OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_spotlightContactViewController;
  *(void *)&v5[v6] = [objc_allocWithZone((Class)SPUIContactViewController) init];
  *(void *)&v5[OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_hostWindow] = a1;
  id v7 = a1;

  v13.receiver = v5;
  v13.super_class = (Class)type metadata accessor for PeopleViewHandler();
  id v8 = [(char *)[super init]];
  uint64_t v9 = *(void **)&v8[OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_spotlightContactViewController];
  id v10 = v8;
  id v11 = v9;
  [v11 setDelegate:v10];

  return v10;
}

void sub_100012948(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v7 = type metadata accessor for Logger();
  uint64_t v35 = *(void *)(v7 - 8);
  uint64_t v8 = __chkstk_darwin(v7);
  id v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  uint64_t v12 = (char *)&v32 - v11;
  objc_super v13 = *(void **)(v3 + OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_spotlightContactViewController);
  id v14 = [v13 contactIdentifier];
  if (!v14)
  {
LABEL_7:
    static PeopleLogger.viewService.getter();
    unint64_t v22 = Logger.logObject.getter();
    os_log_type_t v23 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v22, v23))
    {
      uint64_t v33 = v7;
      uint64_t v24 = swift_slowAlloc();
      id v34 = a3;
      id v25 = (uint8_t *)v24;
      uint64_t v37 = swift_slowAlloc();
      *(_DWORD *)id v25 = 136315138;
      uint64_t v36 = sub_100018764(0xD000000000000029, 0x800000010001DF90, &v37);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v22, v23, "%s -- updating spotlight contact", v25, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(char *, uint64_t))(v35 + 8))(v12, v33);
    }
    else
    {

      (*(void (**)(char *, uint64_t))(v35 + 8))(v12, v7);
    }
    NSString v30 = String._bridgeToObjectiveC()();
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    [v13 updateWithContactIdentifier:v30 preferredBundleIdentifiers:isa];

    return;
  }
  id v15 = v14;
  id v34 = v13;
  uint64_t v16 = a3;
  uint64_t v17 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v19 = v18;

  if (v17 == a1 && v19 == a2)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    char v21 = _stringCompareWithSmolCheck(_:_:expecting:)();
    swift_bridgeObjectRelease();
    a3 = v16;
    objc_super v13 = v34;
    if ((v21 & 1) == 0) {
      goto LABEL_7;
    }
  }
  uint64_t v26 = v7;
  static PeopleLogger.viewService.getter();
  uint64_t v27 = Logger.logObject.getter();
  os_log_type_t v28 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v27, v28))
  {
    id v29 = (uint8_t *)swift_slowAlloc();
    uint64_t v37 = swift_slowAlloc();
    *(_DWORD *)id v29 = 136315138;
    uint64_t v36 = sub_100018764(0xD000000000000029, 0x800000010001DF90, &v37);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v27, v28, "%s -- not updating spotlight", v29, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v35 + 8))(v10, v26);
}

uint64_t sub_100012D68()
{
  uint64_t v1 = v0;
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2);
  id v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (!*(void *)(v0 + OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_contactIdentifier + 8)) {
    return 1;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = (void *)dispatch thunk of ContactFetcher.contact(for:includeImages:)();
  swift_bridgeObjectRelease();
  if (v6)
  {
    id v7 = [v6 identifier];
    uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v10 = v9;

    uint64_t v11 = *(void **)(v1 + OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_displayPriorities);
    swift_bridgeObjectRetain();
    sub_100012948(v8, v10, v11);

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    static PeopleLogger.viewService.getter();
    objc_super v13 = Logger.logObject.getter();
    uint64_t v14 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v13, (os_log_type_t)v14))
    {
      id v15 = (uint8_t *)swift_slowAlloc();
      uint64_t v17 = swift_slowAlloc();
      *(_DWORD *)id v15 = 136315138;
      uint64_t v16 = sub_100018764(0xD000000000000019, 0x800000010001DF70, &v17);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v13, (os_log_type_t)v14, "%s contact not set/confirmed", v15, 0xCu);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }

    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return 2;
  }
}

uint64_t sub_10001300C(uint64_t a1)
{
  uint64_t v2 = type metadata accessor for Logger();
  uint64_t v113 = *(void *)(v2 - 8);
  uint64_t v114 = v2;
  uint64_t v3 = __chkstk_darwin(v2);
  long long v112 = &v89[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v3);
  uint64_t v101 = &v89[-v5];
  uint64_t v100 = type metadata accessor for PeopleURL.ArrayParameter();
  uint64_t v99 = *(void *)(v100 - 8);
  __chkstk_darwin(v100);
  id v98 = &v89[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v106 = type metadata accessor for PeopleURL.Parameter();
  uint64_t v103 = *(void *)(v106 - 8);
  uint64_t v7 = __chkstk_darwin(v106);
  uint64_t v97 = &v89[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v7);
  uint64_t v102 = &v89[-v9];
  uint64_t v116 = type metadata accessor for PeopleURL.PathAction();
  uint64_t v118 = *(void *)(v116 - 8);
  __chkstk_darwin(v116);
  id v105 = &v89[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v11 = sub_1000067F8(&qword_1000269B8);
  uint64_t v12 = __chkstk_darwin(v11);
  id v109 = &v89[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  __chkstk_darwin(v12);
  long long v117 = &v89[-v14];
  uint64_t v15 = sub_1000067F8(&qword_1000269C0);
  uint64_t v16 = __chkstk_darwin(v15 - 8);
  id v104 = &v89[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v18 = __chkstk_darwin(v16);
  unint64_t v111 = &v89[-v19];
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v108 = &v89[-v21];
  uint64_t v22 = __chkstk_darwin(v20);
  int64_t v107 = &v89[-v23];
  uint64_t v24 = __chkstk_darwin(v22);
  uint64_t v26 = &v89[-v25];
  __chkstk_darwin(v24);
  uint64_t v110 = &v89[-v27];
  uint64_t v28 = type metadata accessor for PeopleURL.Scheme();
  uint64_t v29 = *(void *)(v28 - 8);
  __chkstk_darwin(v28);
  id v31 = &v89[-((v30 + 15) & 0xFFFFFFFFFFFFFFF0)];
  URLComponents.scheme.getter();
  uint64_t v32 = *(void (**)(unsigned char *))(v29 + 104);
  unsigned int v115 = enum case for PeopleURL.Scheme.people(_:);
  v32(v31);
  char v33 = static PeopleURL.Scheme.== infix(_:_:)();
  uint64_t v34 = v28;
  uint64_t v35 = v11;
  swift_bridgeObjectRelease();
  uint64_t v36 = *(void (**)(unsigned char *, uint64_t))(v29 + 8);
  v36(v31, v34);
  if (v33)
  {
    os_log_type_t v91 = v31;
    uint64_t v92 = v36;
    uint64_t v93 = v34;
    uint64_t v94 = v32;
    uint64_t v37 = (uint64_t)v110;
    uint64_t v96 = a1;
    URLComponents.peopleAction.getter();
    uint64_t v38 = v118;
    uint64_t v39 = v116;
    (*(void (**)(unsigned char *, void, uint64_t))(v118 + 104))(v26, enum case for PeopleURL.PathAction.showGatheredMetrics(_:), v116);
    (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v38 + 56))(v26, 0, 1, v39);
    uint64_t v95 = v35;
    uint64_t v40 = *(int *)(v35 + 48);
    id v41 = v117;
    uint64_t v42 = &v117[v40];
    sub_1000165C8(v37, (uint64_t)v117);
    sub_1000165C8((uint64_t)v26, (uint64_t)v42);
    id v43 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v38 + 48);
    if (v43(v41, 1, v39) == 1)
    {
      sub_100009A50((uint64_t)v26, &qword_1000269C0);
      sub_100009A50(v37, &qword_1000269C0);
      if (v43(v42, 1, v39) == 1)
      {
        sub_100009A50((uint64_t)v117, &qword_1000269C0);
        return 3;
      }
      goto LABEL_7;
    }
    uint64_t v45 = v107;
    sub_1000165C8((uint64_t)v117, (uint64_t)v107);
    if (v43(v42, 1, v39) == 1)
    {
      sub_100009A50((uint64_t)v26, &qword_1000269C0);
      sub_100009A50(v37, &qword_1000269C0);
      (*(void (**)(unsigned char *, uint64_t))(v118 + 8))(v45, v39);
LABEL_7:
      sub_100009A50((uint64_t)v117, &qword_1000269B8);
      uint64_t v35 = v95;
      uint64_t v32 = v94;
      uint64_t v34 = v93;
      uint64_t v36 = v92;
      id v31 = v91;
      goto LABEL_8;
    }
    uint64_t v56 = v118;
    id v57 = v105;
    (*(void (**)(unsigned char *, char *, uint64_t))(v118 + 32))(v105, v42, v39);
    sub_100016630(&qword_1000269C8, (void (*)(uint64_t))&type metadata accessor for PeopleURL.PathAction);
    int v90 = dispatch thunk of static Equatable.== infix(_:_:)();
    uint64_t v58 = *(void (**)(unsigned char *, uint64_t))(v56 + 8);
    v58(v57, v39);
    sub_100009A50((uint64_t)v26, &qword_1000269C0);
    sub_100009A50(v37, &qword_1000269C0);
    v58(v45, v39);
    sub_100009A50((uint64_t)v117, &qword_1000269C0);
    uint64_t v35 = v95;
    uint64_t v32 = v94;
    uint64_t v34 = v93;
    uint64_t v36 = v92;
    id v31 = v91;
    if (v90) {
      return 3;
    }
  }
LABEL_8:
  uint64_t v46 = v35;
  URLComponents.scheme.getter();
  ((void (*)(unsigned char *, void, uint64_t))v32)(v31, v115, v34);
  char v47 = static PeopleURL.Scheme.== infix(_:_:)();
  swift_bridgeObjectRelease();
  v36(v31, v34);
  if ((v47 & 1) == 0) {
    goto LABEL_23;
  }
  uint64_t v48 = (uint64_t)v108;
  URLComponents.peopleAction.getter();
  uint64_t v49 = v118;
  int64_t v50 = v111;
  uint64_t v51 = v116;
  (*(void (**)(unsigned char *, void, uint64_t))(v118 + 104))(v111, enum case for PeopleURL.PathAction.showSearchResult(_:), v116);
  (*(void (**)(unsigned char *, void, uint64_t, uint64_t))(v49 + 56))(v50, 0, 1, v51);
  uint64_t v52 = v109;
  uint64_t v53 = (uint64_t)&v109[*(int *)(v46 + 48)];
  sub_1000165C8(v48, (uint64_t)v109);
  sub_1000165C8((uint64_t)v50, v53);
  uint64_t v54 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v49 + 48);
  if (v54((uint64_t)v52, 1, v51) == 1)
  {
    sub_100009A50((uint64_t)v50, &qword_1000269C0);
    sub_100009A50(v48, &qword_1000269C0);
    if (v54(v53, 1, v51) == 1)
    {
      sub_100009A50((uint64_t)v52, &qword_1000269C0);
      goto LABEL_18;
    }
LABEL_14:
    sub_100009A50((uint64_t)v52, &qword_1000269B8);
    goto LABEL_23;
  }
  uint64_t v55 = v104;
  sub_1000165C8((uint64_t)v52, (uint64_t)v104);
  if (v54(v53, 1, v51) == 1)
  {
    sub_100009A50((uint64_t)v50, &qword_1000269C0);
    sub_100009A50(v48, &qword_1000269C0);
    (*(void (**)(unsigned char *, uint64_t))(v118 + 8))(v55, v51);
    goto LABEL_14;
  }
  uint64_t v59 = v118;
  uint64_t v60 = v105;
  (*(void (**)(unsigned char *, uint64_t, uint64_t))(v118 + 32))(v105, v53, v51);
  sub_100016630(&qword_1000269C8, (void (*)(uint64_t))&type metadata accessor for PeopleURL.PathAction);
  char v61 = dispatch thunk of static Equatable.== infix(_:_:)();
  char v62 = *(void (**)(unsigned char *, uint64_t))(v59 + 8);
  v62(v60, v51);
  sub_100009A50((uint64_t)v111, &qword_1000269C0);
  sub_100009A50(v48, &qword_1000269C0);
  v62(v55, v51);
  sub_100009A50((uint64_t)v52, &qword_1000269C0);
  if ((v61 & 1) == 0) {
    goto LABEL_23;
  }
LABEL_18:
  unint64_t v64 = v102;
  uint64_t v63 = v103;
  uint64_t v65 = *(void (**)(unsigned char *, void, uint64_t))(v103 + 104);
  uint64_t v66 = v106;
  v65(v102, enum case for PeopleURL.Parameter.contactIdentifier(_:), v106);
  uint64_t v118 = URLComponents.subscript.getter();
  unint64_t v68 = v67;
  uint64_t v69 = *(void (**)(unsigned char *, uint64_t))(v63 + 8);
  v69(v64, v66);
  if (!v68)
  {
LABEL_23:
    int v81 = v112;
    static PeopleLogger.viewService.getter();
    uint64_t v82 = Logger.logObject.getter();
    os_log_type_t v83 = static os_log_type_t.debug.getter();
    if (os_log_type_enabled(v82, v83))
    {
      uint64_t v84 = (uint8_t *)swift_slowAlloc();
      uint64_t v120 = swift_slowAlloc();
      *(_DWORD *)uint64_t v84 = 136315138;
      uint64_t v119 = sub_100018764(0xD000000000000010, 0x800000010001DF50, &v120);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      _os_log_impl((void *)&_mh_execute_header, v82, v83, "%s contact not set", v84, 0xCu);
      uint64_t v44 = 1;
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();

      (*(void (**)(unsigned char *, uint64_t))(v113 + 8))(v81, v114);
    }
    else
    {

      (*(void (**)(unsigned char *, uint64_t))(v113 + 8))(v81, v114);
      return 1;
    }
    return v44;
  }
  uint64_t v70 = v99;
  v71 = v98;
  uint64_t v72 = v100;
  (*(void (**)(unsigned char *, void, uint64_t))(v99 + 104))(v98, enum case for PeopleURL.ArrayParameter.priorities(_:), v100);
  long long v117 = (char *)URLComponents.subscript.getter();
  (*(void (**)(unsigned char *, uint64_t))(v70 + 8))(v71, v72);
  uint64_t v73 = v97;
  uint64_t v74 = v106;
  v65(v97, enum case for PeopleURL.Parameter.lockScreen(_:), v106);
  uint64_t v75 = URLComponents.subscript.getter();
  uint64_t v77 = v76;
  v69(v73, v74);
  if (!v77 || v75 != 1702195828)
  {
    id v78 = v101;
    uint64_t v79 = v118;
    goto LABEL_27;
  }
  id v78 = v101;
  uint64_t v79 = v118;
  if (v77 != 0xE400000000000000)
  {
LABEL_27:
    char v80 = _stringCompareWithSmolCheck(_:_:expecting:)();
    goto LABEL_28;
  }
  char v80 = 1;
LABEL_28:
  swift_bridgeObjectRelease();
  static PeopleLogger.viewService.getter();
  swift_bridgeObjectRetain_n();
  id v85 = Logger.logObject.getter();
  os_log_type_t v86 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v85, v86))
  {
    uint64_t v87 = swift_slowAlloc();
    uint64_t v120 = swift_slowAlloc();
    *(_DWORD *)uint64_t v87 = 136315650;
    uint64_t v119 = sub_100018764(0xD000000000000010, 0x800000010001DF50, &v120);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v87 + 12) = 2080;
    swift_bridgeObjectRetain();
    uint64_t v119 = sub_100018764(v79, v68, &v120);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v87 + 22) = 1024;
    LODWORD(v119) = v80 & 1;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v85, v86, "%s, contactIdentifier: %s, lockScreen: %{BOOL}d", (uint8_t *)v87, 0x1Cu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(unsigned char *, uint64_t))(v113 + 8))(v101, v114);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(unsigned char *, uint64_t))(v113 + 8))(v78, v114);
  }
  uint64_t v44 = sub_100013F68(v79, v68, v117, v80 & 1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v44;
}

uint64_t sub_100013F68(uint64_t a1, unint64_t a2, void *a3, int a4)
{
  uint64_t v5 = v4;
  uint64_t v10 = type metadata accessor for PeopleAnalytics.WidgetLocation();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = &v36[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v14 = type metadata accessor for Logger();
  __chkstk_darwin(v14);
  uint64_t v17 = &v36[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  if (!a2) {
    return 1;
  }
  uint64_t v42 = v15;
  int v43 = a4;
  swift_bridgeObjectRetain();
  uint64_t v18 = dispatch thunk of ContactFetcher.contact(for:includeImages:)();
  if (v18)
  {
    uint64_t v40 = v11;
    uint64_t v41 = v10;
    uint64_t v19 = (uint64_t *)(v5 + OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_contactIdentifier);
    *uint64_t v19 = a1;
    v19[1] = a2;
    uint64_t v20 = (void *)v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    *(void *)(v5 + OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_displayPriorities) = a3;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    id v39 = v20;
    id v21 = [v20 identifier];
    uint64_t v22 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v24 = v23;

    sub_100012948(v22, v24, a3);
    swift_bridgeObjectRelease();
    static PeopleLogger.viewService.getter();
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    uint64_t v25 = Logger.logObject.getter();
    os_log_type_t v26 = static os_log_type_t.default.getter();
    int v27 = v26;
    if (os_log_type_enabled(v25, v26))
    {
      uint64_t v28 = swift_slowAlloc();
      uint64_t v38 = swift_slowAlloc();
      uint64_t v45 = v38;
      *(_DWORD *)uint64_t v28 = 136315650;
      int v37 = v27;
      uint64_t v44 = sub_100018764(0xD000000000000035, 0x800000010001DF10, &v45);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      *(_WORD *)(v28 + 12) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v44 = sub_100018764(a1, a2, &v45);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v28 + 22) = 2080;
      swift_bridgeObjectRetain();
      uint64_t v29 = Array.description.getter();
      unint64_t v31 = v30;
      swift_bridgeObjectRelease();
      uint64_t v44 = sub_100018764(v29, v31, &v45);
      UnsafeMutableRawBufferPointer.copyMemory(from:)();
      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl((void *)&_mh_execute_header, v25, (os_log_type_t)v37, "%s, contactIdentifier: %s, displayPriorities: %s", (uint8_t *)v28, 0x20u);
      swift_arrayDestroy();
      swift_slowDealloc();
      swift_slowDealloc();
    }
    else
    {

      swift_bridgeObjectRelease_n();
      swift_bridgeObjectRelease_n();
    }
    (*(void (**)(unsigned char *, uint64_t))(v42 + 8))(v17, v14);
    uint64_t v34 = v40;
    uint64_t v33 = v41;
    type metadata accessor for PeopleAnalytics();
    static PeopleAnalytics.shared.getter();
    uint64_t v35 = (unsigned int *)&enum case for PeopleAnalytics.WidgetLocation.lockScreen(_:);
    if ((v43 & 1) == 0) {
      uint64_t v35 = (unsigned int *)&enum case for PeopleAnalytics.WidgetLocation.homeScreen(_:);
    }
    (*(void (**)(unsigned char *, void, uint64_t))(v34 + 104))(v13, *v35, v33);
    dispatch thunk of PeopleAnalytics.sendEntityCardLaunched(validContactIdentifier:displayPriorities:location:)();

    swift_release();
    (*(void (**)(unsigned char *, uint64_t))(v34 + 8))(v13, v33);
    return 0;
  }
  else
  {
    swift_bridgeObjectRelease();
    return 2;
  }
}

uint64_t sub_100014430(void *a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = type metadata accessor for DispatchWorkItemFlags();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for DispatchQoS();
  uint64_t v30 = *(void *)(v8 - 8);
  uint64_t v31 = v8;
  __chkstk_darwin(v8);
  uint64_t v29 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = type metadata accessor for Logger();
  uint64_t v11 = *(void *)(v10 - 8);
  __chkstk_darwin(v10);
  uint64_t v13 = (char *)&v25 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  static PeopleLogger.viewService.getter();
  uint64_t v14 = Logger.logObject.getter();
  os_log_type_t v15 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v14, v15))
  {
    uint64_t v16 = swift_slowAlloc();
    uint64_t v28 = v7;
    uint64_t v17 = v16;
    uint64_t v18 = swift_slowAlloc();
    int v27 = v2;
    aBlock[0] = v18;
    *(_DWORD *)uint64_t v17 = 136315394;
    uint64_t v25 = a1;
    uint64_t v32 = (void *)sub_100018764(0xD000000000000018, 0x800000010001DEA0, aBlock);
    uint64_t v26 = v10;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    *(_WORD *)(v17 + 12) = 2048;
    uint64_t v32 = v25;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v14, v15, "%s, reason: %lu", (uint8_t *)v17, 0x16u);
    swift_arrayDestroy();
    uint64_t v2 = v27;
    swift_slowDealloc();
    uint64_t v7 = v28;
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v26);
  }
  else
  {

    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  sub_10000E1DC(0, &qword_100026998);
  uint64_t v19 = (void *)static OS_dispatch_queue.main.getter();
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v2;
  aBlock[4] = (uint64_t)sub_100016504;
  aBlock[5] = v20;
  aBlock[0] = (uint64_t)_NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = (uint64_t)sub_100014A80;
  aBlock[3] = (uint64_t)&unk_100021320;
  id v21 = _Block_copy(aBlock);
  id v22 = v2;
  uint64_t v23 = v29;
  static DispatchQoS.unspecified.getter();
  uint64_t v32 = &_swiftEmptyArrayStorage;
  sub_100016630(&qword_1000269A0, (void (*)(uint64_t))&type metadata accessor for DispatchWorkItemFlags);
  sub_1000067F8(&qword_1000269A8);
  sub_100016524();
  dispatch thunk of SetAlgebra.init<A>(_:)();
  OS_dispatch_queue.async(group:qos:flags:execute:)();
  _Block_release(v21);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(char *, uint64_t))(v30 + 8))(v23, v31);
  return swift_release();
}

uint64_t sub_1000148DC(uint64_t a1)
{
  uint64_t result = (uint64_t)[*(id *)(a1 + OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_hostWindow) _scene];
  if (result)
  {
    uint64_t v2 = (void *)result;
    v4[4] = sub_1000149E0;
    v4[5] = 0;
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 1107296256;
    v4[2] = sub_100014A2C;
    v4[3] = &unk_100021348;
    uint64_t v3 = _Block_copy(v4);
    swift_release();
    [v2 updateClientSettingsWithTransitionBlock:v3];

    _Block_release(v3);
    uint64_t result = swift_isEscapingClosureAtFileLocation();
    if ((result & 1) == 0) {
      return result;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

id sub_1000149E0()
{
  id v0 = [objc_allocWithZone((Class)PPLPeopleEntitySceneTransitionContext) init];
  [v0 setShouldDismiss:1];
  return v0;
}

id sub_100014A2C(uint64_t a1, void *a2)
{
  uint64_t v2 = *(uint64_t (**)(void))(a1 + 32);
  id v3 = a2;
  uint64_t v4 = (void *)v2();

  return v4;
}

uint64_t sub_100014A80(uint64_t a1)
{
  uint64_t v1 = *(void (**)(uint64_t))(a1 + 32);
  uint64_t v2 = swift_retain();
  v1(v2);

  return swift_release();
}

void sub_100014B18()
{
  uint64_t v1 = type metadata accessor for Logger();
  uint64_t v2 = *(void *)(v1 - 8);
  __chkstk_darwin(v1);
  uint64_t v4 = (char *)&v45 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_1000067F8(&qword_100026930);
  __chkstk_darwin(v5 - 8);
  uint64_t v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v8 = *(void *)(v0 + OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_contactIdentifier + 8);
  if (!v8) {
    return;
  }
  uint64_t v48 = v4;
  uint64_t v9 = *(void *)(v0 + OBJC_IVAR____TtC17PeopleViewService17PeopleViewHandler_contactIdentifier);
  uint64_t v10 = type metadata accessor for TaskPriority();
  uint64_t v11 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56);
  uint64_t v49 = v10;
  uint64_t v12 = v11;
  ((void (*)(char *, uint64_t, uint64_t))v11)(v7, 1, 1);
  uint64_t v13 = type metadata accessor for MainActor();
  swift_bridgeObjectRetain_n();
  uint64_t v50 = v13;
  uint64_t v14 = static MainActor.shared.getter();
  os_log_type_t v15 = (void *)swift_allocObject();
  v15[2] = v14;
  v15[3] = &protocol witness table for MainActor;
  v15[4] = v9;
  v15[5] = v8;
  sub_1000170DC((uint64_t)v7, (uint64_t)&unk_100026940, (uint64_t)v15);
  swift_release();
  uint64_t v47 = v9;
  uint64_t v16 = (void *)dispatch thunk of ContactFetcher.contact(for:includeImages:)();
  if (!v16)
  {
    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v17 = v16;
  uint64_t v45 = v2;
  id v18 = [v16 emailAddresses];
  sub_1000067F8(&qword_100026948);
  unint64_t v19 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v46 = v1;
  if (v19 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v20 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v20 = *(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10);
  }
  if (!v20)
  {
    swift_bridgeObjectRelease();
    uint64_t v21 = v49;
LABEL_13:
    sub_10000E1DC(0, &qword_100026950);
    unint64_t v19 = NSString.init(stringLiteral:)();
    goto LABEL_14;
  }
  uint64_t v21 = v49;
  if ((v19 & 0xC000000000000001) != 0)
  {
    id v22 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
  }
  else
  {
    if (!*(void *)((v19 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_33;
    }
    id v22 = *(id *)(v19 + 32);
  }
  uint64_t v23 = v22;
  swift_bridgeObjectRelease();
  unint64_t v19 = (unint64_t)[v23 value];

  if (!v19) {
    goto LABEL_13;
  }
LABEL_14:
  id v24 = [v17 phoneNumbers];
  unint64_t v25 = static Array._unconditionallyBridgeFromObjectiveC(_:)();

  if (!(v25 >> 62))
  {
    uint64_t v26 = *(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (v26) {
      goto LABEL_16;
    }
LABEL_22:
    swift_bridgeObjectRelease();
    unint64_t v32 = 0xE000000000000000;
    goto LABEL_23;
  }
  swift_bridgeObjectRetain();
  uint64_t v26 = _CocoaArrayWrapper.endIndex.getter();
  swift_bridgeObjectRelease();
  if (!v26) {
    goto LABEL_22;
  }
LABEL_16:
  if ((v25 & 0xC000000000000001) == 0)
  {
    if (!*(void *)((v25 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return;
    }
    id v27 = *(id *)(v25 + 32);
    goto LABEL_19;
  }
LABEL_33:
  id v27 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
LABEL_19:
  uint64_t v28 = v27;
  swift_bridgeObjectRelease();
  id v29 = [v28 value];

  id v30 = [v29 stringValue];
  uint64_t v26 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v32 = v31;

LABEL_23:
  v12(v7, 1, 1, v21);
  uint64_t v33 = (id *)(id)v19;
  uint64_t v34 = static MainActor.shared.getter();
  uint64_t v35 = (void *)swift_allocObject();
  v35[2] = v34;
  v35[3] = &protocol witness table for MainActor;
  v35[4] = v33;
  v35[5] = v26;
  v35[6] = v32;
  sub_1000170DC((uint64_t)v7, (uint64_t)&unk_100026960, (uint64_t)v35);
  swift_release();
  unint64_t v36 = CNContact.callHistoryHandles.getter();
  unint64_t v37 = v36;
  if (v36 >> 62)
  {
    swift_bridgeObjectRetain();
    uint64_t v40 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
    if (v40) {
      goto LABEL_25;
    }
  }
  else if (*(void *)((v36 & 0xFFFFFFFFFFFFFF8) + 0x10))
  {
LABEL_25:
    swift_bridgeObjectRelease();
    v12(v7, 1, 1, v21);
    uint64_t v38 = static MainActor.shared.getter();
    id v39 = (void *)swift_allocObject();
    v39[2] = v38;
    v39[3] = &protocol witness table for MainActor;
    v39[4] = v37;
    sub_1000170DC((uint64_t)v7, (uint64_t)&unk_100026970, (uint64_t)v39);

    swift_release();
    return;
  }
  swift_bridgeObjectRelease();
  uint64_t v41 = v48;
  static PeopleLogger.viewService.getter();
  swift_bridgeObjectRetain();
  uint64_t v42 = Logger.logObject.getter();
  os_log_type_t v43 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v42, v43))
  {
    uint64_t v44 = (uint8_t *)swift_slowAlloc();
    uint64_t v52 = swift_slowAlloc();
    *(_DWORD *)uint64_t v44 = 136315138;
    swift_bridgeObjectRetain();
    uint64_t v51 = sub_100018764(v47, v8, &v52);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v42, v43, "No call handles for %s", v44, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, uint64_t))(v45 + 8))(v48, v46);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v45 + 8))(v41, v46);
  }
}

uint64_t sub_100015220(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  v5[3] = a4;
  v5[4] = a5;
  uint64_t v6 = type metadata accessor for Logger();
  v5[5] = v6;
  v5[6] = *(void *)(v6 - 8);
  v5[7] = swift_task_alloc();
  v5[8] = swift_task_alloc();
  uint64_t v7 = type metadata accessor for Date();
  v5[9] = v7;
  v5[10] = *(void *)(v7 - 8);
  v5[11] = swift_task_alloc();
  type metadata accessor for MainActor();
  v5[12] = static MainActor.shared.getter();
  uint64_t v9 = dispatch thunk of Actor.unownedExecutor.getter();
  v5[13] = v9;
  v5[14] = v8;
  return _swift_task_switch(sub_100015380, v9, v8);
}

uint64_t sub_100015380()
{
  type metadata accessor for LaunchRecorderWriter();
  v0[15] = static LaunchRecorderWriter.sharedInstance.getter();
  sub_100016630(&qword_100026990, (void (*)(uint64_t))&type metadata accessor for LaunchRecorderWriter);
  uint64_t v2 = dispatch thunk of Actor.unownedExecutor.getter();
  v0[16] = v2;
  v0[17] = v1;
  return _swift_task_switch(sub_100015444, v2, v1);
}

uint64_t sub_100015444()
{
  dispatch thunk of LaunchRecorderWriter.reload()();
  uint64_t v1 = *(void *)(v0 + 104);
  uint64_t v2 = *(void *)(v0 + 112);
  return _swift_task_switch(sub_1000154A8, v1, v2);
}

uint64_t sub_1000154A8()
{
  Date.init()();
  uint64_t v1 = *(void *)(v0 + 128);
  uint64_t v2 = *(void *)(v0 + 136);
  return _swift_task_switch(sub_10001550C, v1, v2);
}

uint64_t sub_10001550C()
{
  uint64_t v2 = *(void *)(v0 + 80);
  uint64_t v1 = *(void *)(v0 + 88);
  uint64_t v3 = *(void *)(v0 + 72);
  *(unsigned char *)(v0 + 152) = dispatch thunk of LaunchRecorderWriter.add(contactId:time:)() & 1;
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  uint64_t v4 = *(void *)(v0 + 104);
  uint64_t v5 = *(void *)(v0 + 112);
  return _swift_task_switch(sub_1000155A8, v4, v5);
}

uint64_t sub_1000155A8()
{
  if (*(unsigned char *)(v0 + 152) == 1)
  {
    uint64_t v1 = *(void *)(v0 + 128);
    uint64_t v2 = *(void *)(v0 + 136);
    return _swift_task_switch(sub_10001578C, v1, v2);
  }
  else
  {
    swift_release();
    static PeopleErrors.createError(_:code:)();
    swift_willThrow();
    uint64_t v4 = *(void *)(v0 + 48);
    uint64_t v3 = *(void *)(v0 + 56);
    uint64_t v6 = *(void **)(v0 + 32);
    uint64_t v5 = *(void *)(v0 + 40);
    uint64_t v7 = *(void *)(v0 + 24);
    static PeopleLogger.viewService.getter();
    swift_errorRetain();
    _StringGuts.grow(_:)(33);
    swift_bridgeObjectRelease();
    v8._countAndFlagsBits = v7;
    v8._object = v6;
    String.append(_:)(v8);
    v9._countAndFlagsBits = 4203808;
    v9._object = (void *)0xE300000000000000;
    String.append(_:)(v9);
    Logger.ifError(_:message:)();
    swift_release();
    swift_bridgeObjectRelease();
    swift_errorRelease();
    swift_errorRelease();
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    uint64_t v10 = *(uint64_t (**)(void))(v0 + 8);
    return v10();
  }
}

uint64_t sub_10001578C()
{
  dispatch thunk of LaunchRecorderWriter.save()();
  v0[18] = 0;
  uint64_t v1 = v0[13];
  uint64_t v2 = v0[14];
  return _swift_task_switch(sub_100015814, v1, v2);
}

uint64_t sub_100015814()
{
  os_log_type_t v15 = v0;
  swift_release();
  static PeopleLogger.viewService.getter();
  swift_bridgeObjectRetain_n();
  uint64_t v1 = Logger.logObject.getter();
  os_log_type_t v2 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v1, v2))
  {
    uint64_t v11 = v0[6];
    unint64_t v3 = v0[4];
    uint64_t v12 = v0[5];
    uint64_t v13 = v0[8];
    uint64_t v4 = v0[3];
    uint64_t v5 = (uint8_t *)swift_slowAlloc();
    uint64_t v14 = swift_slowAlloc();
    *(_DWORD *)uint64_t v5 = 136315138;
    swift_bridgeObjectRetain();
    v0[2] = sub_100018764(v4, v3, &v14);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease_n();
    _os_log_impl((void *)&_mh_execute_header, v1, v2, "Recorded launch %s", v5, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();
    swift_release();

    (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v13, v12);
  }
  else
  {
    uint64_t v6 = v0[8];
    uint64_t v7 = v0[5];
    uint64_t v8 = v0[6];
    swift_bridgeObjectRelease_n();
    swift_release();

    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  Swift::String v9 = (uint64_t (*)(void))v0[1];
  return v9();
}

uint64_t sub_100015A48()
{
  swift_release();
  uint64_t v2 = v0[6];
  uint64_t v1 = v0[7];
  uint64_t v4 = (void *)v0[4];
  uint64_t v3 = v0[5];
  uint64_t v5 = v0[3];
  static PeopleLogger.viewService.getter();
  swift_errorRetain();
  _StringGuts.grow(_:)(33);
  swift_bridgeObjectRelease();
  v6._countAndFlagsBits = v5;
  v6._object = v4;
  String.append(_:)(v6);
  v7._countAndFlagsBits = 4203808;
  v7._object = (void *)0xE300000000000000;
  String.append(_:)(v7);
  Logger.ifError(_:message:)();
  swift_release();
  swift_bridgeObjectRelease();
  swift_errorRelease();
  swift_errorRelease();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  uint64_t v8 = (uint64_t (*)(void))v0[1];
  return v8();
}

uint64_t sub_100015BB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  type metadata accessor for MainActor();
  v6[5] = static MainActor.shared.getter();
  uint64_t v8 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100015C4C, v8, v7);
}

uint64_t sub_100015C4C()
{
  uint64_t v1 = *(void *)(v0 + 16);
  swift_release();
  uint64_t v2 = self;
  NSString v3 = String._bridgeToObjectiveC()();
  [v2 clearUnreadFor:v1 andPhone:v3];

  uint64_t v4 = *(uint64_t (**)(void))(v0 + 8);
  return v4();
}

uint64_t sub_100015CF4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  v4[3] = a4;
  uint64_t v5 = type metadata accessor for Logger();
  v4[4] = v5;
  v4[5] = *(void *)(v5 - 8);
  void v4[6] = swift_task_alloc();
  type metadata accessor for MainActor();
  v4[7] = static MainActor.shared.getter();
  uint64_t v7 = dispatch thunk of Actor.unownedExecutor.getter();
  return _swift_task_switch(sub_100015DE8, v7, v6);
}

uint64_t sub_100015DE8()
{
  swift_release();
  uint64_t v1 = [objc_allocWithZone((Class)CHManager) init];
  uint64_t v2 = self;
  id v3 = [v2 predicateForCallsWithStatus:kCHCallStatusMissed];
  sub_10000E1DC(0, &qword_100026978);
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  id v5 = [v2 predicateForCallsWithAnyRemoteParticipantHandles:isa];

  sub_1000067F8(&qword_100026980);
  uint64_t v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_10001B380;
  *(void *)(v6 + 32) = v3;
  *(void *)(v6 + 40) = v5;
  uint64_t v19 = v6;
  specialized Array._endMutation()();
  sub_10000E1DC(0, &qword_100026988);
  uint64_t v7 = v3;
  uint64_t v8 = v5;
  Class v9 = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  uint64_t v10 = [self andPredicateWithSubpredicates:v9, v19];

  id v11 = [v1 setRead:1 forCallsWithPredicate:v10];
  static PeopleLogger.viewService.getter();
  uint64_t v12 = Logger.logObject.getter();
  os_log_type_t v13 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v12, v13))
  {
    uint64_t v14 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)uint64_t v14 = 134217984;
    v0[2] = v11;
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    _os_log_impl((void *)&_mh_execute_header, v12, v13, "chmanager setRead result %ld", v14, 0xCu);
    swift_slowDealloc();
    os_log_type_t v15 = v1;
    uint64_t v16 = v12;
    uint64_t v1 = v10;
  }
  else
  {
    os_log_type_t v15 = v7;
    uint64_t v16 = v8;
    uint64_t v8 = v10;
    uint64_t v7 = v12;
  }

  (*(void (**)(void, void))(v0[5] + 8))(v0[6], v0[4]);
  swift_task_dealloc();
  uint64_t v17 = (uint64_t (*)(void))v0[1];
  return v17();
}

id sub_1000160F0()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for PeopleViewHandler();
  return [super dealloc];
}

uint64_t type metadata accessor for PeopleViewHandler()
{
  return self;
}

uint64_t sub_1000161C8()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 48, 7);
}

uint64_t sub_100016208(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v7 = v1[4];
  uint64_t v6 = v1[5];
  uint64_t v8 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v8;
  *uint64_t v8 = v2;
  v8[1] = sub_100016A3C;
  return sub_100015220(a1, v4, v5, v7, v6);
}

uint64_t sub_1000162C8()
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 56, 7);
}

uint64_t sub_100016310(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = v1[5];
  uint64_t v8 = v1[6];
  Class v9 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v9;
  *Class v9 = v2;
  v9[1] = sub_10000E0E8;
  return sub_100015BB0(a1, v4, v5, v6, v7, v8);
}

uint64_t sub_1000163D8()
{
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();

  return _swift_deallocObject(v0, 40, 7);
}

uint64_t sub_100016418(uint64_t a1)
{
  uint64_t v4 = v1[2];
  uint64_t v5 = v1[3];
  uint64_t v6 = v1[4];
  uint64_t v7 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v7;
  void *v7 = v2;
  v7[1] = sub_100016A3C;
  return sub_100015CF4(a1, v4, v5, v6);
}

uint64_t sub_1000164CC()
{
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_100016504()
{
  return sub_1000148DC(*(void *)(v0 + 16));
}

uint64_t sub_10001650C(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_10001651C()
{
  return swift_release();
}

unint64_t sub_100016524()
{
  unint64_t result = qword_1000269B0;
  if (!qword_1000269B0)
  {
    sub_100016580(&qword_1000269A8);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_1000269B0);
  }
  return result;
}

uint64_t sub_100016580(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

uint64_t sub_1000165C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_1000067F8(&qword_1000269C0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_100016630(unint64_t *a1, void (*a2)(uint64_t))
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

uint64_t sub_100016678()
{
  uint64_t v0 = type metadata accessor for PeopleURL.PathAction();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0);
  id v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_1000067F8(&qword_1000269B8);
  uint64_t v5 = v4 - 8;
  __chkstk_darwin(v4);
  uint64_t v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_1000067F8(&qword_1000269C0);
  uint64_t v9 = __chkstk_darwin(v8 - 8);
  uint64_t v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = __chkstk_darwin(v9);
  uint64_t v14 = (char *)&v23 - v13;
  __chkstk_darwin(v12);
  uint64_t v16 = (char *)&v23 - v15;
  URLComponents.peopleAction.getter();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v14, enum case for PeopleURL.PathAction.showSearchResult(_:), v0);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v1 + 56))(v14, 0, 1, v0);
  uint64_t v17 = (uint64_t)&v7[*(int *)(v5 + 56)];
  sub_1000165C8((uint64_t)v16, (uint64_t)v7);
  sub_1000165C8((uint64_t)v14, v17);
  id v18 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48);
  if (v18((uint64_t)v7, 1, v0) == 1)
  {
    uint64_t v19 = &qword_1000269C0;
    sub_100009A50((uint64_t)v14, &qword_1000269C0);
    sub_100009A50((uint64_t)v16, &qword_1000269C0);
    if (v18(v17, 1, v0) == 1)
    {
      char v20 = -1;
    }
    else
    {
      uint64_t v19 = &qword_1000269B8;
      char v20 = 0;
    }
  }
  else
  {
    sub_1000165C8((uint64_t)v7, (uint64_t)v11);
    if (v18(v17, 1, v0) == 1)
    {
      sub_100009A50((uint64_t)v14, &qword_1000269C0);
      sub_100009A50((uint64_t)v16, &qword_1000269C0);
      (*(void (**)(char *, uint64_t))(v1 + 8))(v11, v0);
      char v20 = 0;
      uint64_t v19 = &qword_1000269B8;
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(v3, v17, v0);
      sub_100016630(&qword_1000269C8, (void (*)(uint64_t))&type metadata accessor for PeopleURL.PathAction);
      char v20 = dispatch thunk of static Equatable.== infix(_:_:)();
      uint64_t v21 = *(void (**)(char *, uint64_t))(v1 + 8);
      v21(v3, v0);
      uint64_t v19 = &qword_1000269C0;
      sub_100009A50((uint64_t)v14, &qword_1000269C0);
      sub_100009A50((uint64_t)v16, &qword_1000269C0);
      v21(v11, v0);
    }
  }
  sub_100009A50((uint64_t)v7, v19);
  return v20 & 1;
}

unint64_t sub_100016A40(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000067F8(&qword_100026AD0);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
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
    sub_100019708(v6, (uint64_t)&v13, &qword_100026AD8);
    uint64_t v7 = v13;
    unint64_t result = sub_100018DBC(v13);
    if (v9) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(void *)(v3[6] + 8 * result) = v7;
    unint64_t result = (unint64_t)sub_1000196F8(&v14, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_100016B70(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000067F8(&qword_100026AB8);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
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
    sub_100019708(v6, (uint64_t)&v15, &qword_100026AC0);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_100018E50(v15, v16, (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10001904C);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    BOOL v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1000196F8(&v17, (_OWORD *)(v3[7] + 32 * result));
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

uint64_t sub_100016CBC(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_1000067F8(&qword_100026AB0);
    uint64_t v2 = (void *)static _DictionaryStorage.allocate(capacity:)();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v28 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v27 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v27) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v28 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v27) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v28 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v27) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v28 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    long long v17 = (uint64_t *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    sub_10001969C(*(void *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(void *)&long long v39 = v19;
    *((void *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(void *)&v37[0] = v19;
    *((void *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_1000196F8(v38, v32);
    long long v33 = v29;
    long long v34 = v30;
    uint64_t v35 = v31;
    sub_1000196F8(v32, v36);
    long long v29 = v33;
    long long v30 = v34;
    uint64_t v31 = v35;
    sub_1000196F8(v36, v37);
    sub_1000196F8(v37, &v33);
    uint64_t result = AnyHashable._rawHashValue(seed:)(v2[5]);
    uint64_t v20 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v21 = result & ~v20;
    unint64_t v22 = v21 >> 6;
    if (((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v21) & ~*(void *)&v6[8 * (v21 >> 6)])) | v21 & 0x7FFFFFFFFFFFFFC0;
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
        uint64_t v26 = *(void *)&v6[8 * v22];
      }
      while (v26 == -1);
      unint64_t v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(void *)(v10 + 32) = v31;
    uint64_t result = (uint64_t)sub_1000196F8(&v33, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_100010D80();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v28 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v27) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v28 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_100017084(uint64_t a1, char a2, void *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(*(void *)(v3 + 64) + 40);
  *(unsigned char *)uint64_t v4 = a2;
  *(void *)(v4 + 8) = a3;
  id v5 = a3;

  return _swift_continuation_resume(v3);
}

uint64_t sub_1000170DC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = type metadata accessor for TaskPriority();
  uint64_t v7 = *(void *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    TaskPriority.rawValue.getter();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(void *)(a3 + 16)) {
      goto LABEL_5;
    }
    goto LABEL_3;
  }
  sub_100009A50(a1, &qword_100026930);
  if (*(void *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    dispatch thunk of Actor.unownedExecutor.getter();
    swift_unknownObjectRelease();
  }
LABEL_5:
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = a2;
  *(void *)(v8 + 24) = a3;
  return swift_task_create();
}

void sub_100017288(uint64_t a1, void (*a2)(char *, char *, uint64_t), void (*a3)(void *), uint64_t a4)
{
  uint64_t v120 = a2;
  uint64_t v121 = a3;
  uint64_t v122 = a4;
  uint64_t v5 = type metadata accessor for CocoaError.Code();
  __chkstk_darwin(v5 - 8);
  long long v112 = (char *)&v102 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = type metadata accessor for CocoaError();
  uint64_t v113 = *(void *)(v7 - 8);
  uint64_t v114 = v7;
  __chkstk_darwin(v7);
  unint64_t v111 = (char *)&v102 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = type metadata accessor for Logger();
  uint64_t v110 = *(void *)(v9 - 8);
  __chkstk_darwin(v9);
  long long v117 = (char *)&v102 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_1000067F8(&qword_100026600);
  __chkstk_darwin(v11 - 8);
  uint64_t v118 = (char *)&v102 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = type metadata accessor for HandleType();
  uint64_t v108 = *(void *)(v13 - 8);
  uint64_t v109 = v13;
  __chkstk_darwin(v13);
  int64_t v107 = (char *)&v102 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = sub_1000067F8(&qword_100026378);
  uint64_t v16 = __chkstk_darwin(v15 - 8);
  uint64_t v106 = (uint64_t)&v102 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v18 = __chkstk_darwin(v16);
  uint64_t v116 = (uint64_t)&v102 - v19;
  uint64_t v20 = __chkstk_darwin(v18);
  uint64_t v115 = (uint64_t)&v102 - v21;
  __chkstk_darwin(v20);
  char v23 = (char *)&v102 - v22;
  uint64_t v24 = sub_1000067F8(&qword_100026930);
  __chkstk_darwin(v24 - 8);
  uint64_t v26 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))((char *)&v102 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v27 = sub_1000067F8(&qword_100026068);
  __chkstk_darwin(v27 - 8);
  long long v29 = (char *)&v102 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v30 = type metadata accessor for URL();
  uint64_t v31 = *(void *)(v30 - 8);
  uint64_t v32 = *(void *)(v31 + 64);
  uint64_t v33 = __chkstk_darwin(v30);
  long long v34 = (char *)&v102 - ((v32 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v33);
  unint64_t v36 = (char *)&v102 - v35;
  if (QuickAction.useStandardProtocol.getter())
  {
    id v105 = v26;
    QuickAction.standardProtocolURL.getter();
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v29, 1, v30) != 1)
    {
      uint64_t v120 = *(void (**)(char *, char *, uint64_t))(v31 + 32);
      v120(v36, v29, v30);
      uint64_t v70 = type metadata accessor for TaskPriority();
      uint64_t v71 = (uint64_t)v105;
      (*(void (**)(unsigned int (*)(uint64_t, uint64_t, uint64_t), uint64_t, uint64_t, uint64_t))(*(void *)(v70 - 8) + 56))(v105, 1, 1, v70);
      (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v34, v36, v30);
      unint64_t v72 = (*(unsigned __int8 *)(v31 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v31 + 80);
      uint64_t v73 = (char *)swift_allocObject();
      *((void *)v73 + 2) = 0;
      *((void *)v73 + 3) = 0;
      uint64_t v74 = v120;
      *((void *)v73 + 4) = v119;
      v74(&v73[v72], v34, v30);
      uint64_t v75 = (void (**)(void *))&v73[(v32 + v72 + 7) & 0xFFFFFFFFFFFFFFF8];
      uint64_t v76 = v122;
      *uint64_t v75 = v121;
      v75[1] = (void (*)(void *))v76;
      swift_retain();
      swift_retain();
      sub_1000170DC(v71, (uint64_t)&unk_100026A98, (uint64_t)v73);
      swift_release();
      (*(void (**)(char *, uint64_t))(v31 + 8))(v36, v30);
      return;
    }
    sub_100009A50((uint64_t)v29, &qword_100026068);
  }
  unint64_t v37 = (void (*)(char *, char *, uint64_t))v9;
  QuickAction.handle.getter();
  uint64_t v39 = v38;
  sub_100019708((uint64_t)v120, (uint64_t)v23, &qword_100026378);
  if (v39)
  {
    sub_100009A50((uint64_t)v23, &qword_100026378);
    uint64_t v41 = (uint64_t)v121;
    uint64_t v40 = v122;
LABEL_6:
    uint64_t v42 = (uint64_t)v118;
    id v43 = objc_allocWithZone((Class)CNPhoneNumber);
    swift_bridgeObjectRetain();
    NSString v44 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v45 = [v43 initWithStringValue:v44];

    if (v45) {
      uint64_t v46 = 2;
    }
    else {
      uint64_t v46 = 1;
    }
    id v47 = objc_allocWithZone((Class)INPersonHandle);
    NSString v48 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    id v49 = [v47 initWithValue:v48 type:v46];

    uint64_t v50 = type metadata accessor for PersonNameComponents();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(v50 - 8) + 56))(v42, 1, 1, v50);
    uint64_t v51 = QuickAction.contactIdentifier.getter();
    uint64_t v53 = v52;
    uint64_t v54 = QuickAction.customIdentifier.getter();
    uint64_t v56 = v55;
    id v57 = objc_allocWithZone((Class)INPerson);
    id v58 = sub_100018140(v49, v42, 0, 0, 0, v51, v53, v54, v56);
    sub_1000067F8(&qword_100026980);
    uint64_t v59 = swift_allocObject();
    *(_OWORD *)(v59 + 16) = xmmword_10001B220;
    *(void *)(v59 + 32) = v58;
    uint64_t v124 = v59;
    specialized Array._endMutation()();
    id v60 = objc_allocWithZone((Class)INSendMessageIntent);
    sub_100019358();
    id v61 = v58;
    Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    id v63 = [v60 initWithRecipients:isa outgoingMessageType:1 content:0 speakableGroupName:0 conversationIdentifier:0 serviceName:0 sender:0 attachments:0];

    uint64_t v64 = QuickAction.bundleID.getter();
    sub_100007CFC(v63, v64, v65, v41, v40);

    swift_bridgeObjectRelease();
    return;
  }
  uint64_t v104 = a1;
  uint64_t v66 = v115;
  sub_100019708((uint64_t)v23, v115, &qword_100026378);
  uint64_t v67 = type metadata accessor for Person();
  uint64_t v68 = *(void *)(v67 - 8);
  id v105 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v68 + 48);
  if (v105(v66, 1, v67) == 1)
  {
    sub_100009A50((uint64_t)v23, &qword_100026378);
    sub_100009A50(v66, &qword_100026378);
    uint64_t v69 = v37;
  }
  else
  {
    uint64_t v77 = v108;
    id v78 = *(void (**)(char *, void, uint64_t))(v108 + 104);
    uint64_t v103 = v67;
    uint64_t v79 = v68;
    char v80 = v107;
    uint64_t v81 = v109;
    v78(v107, enum case for HandleType.phoneNumber(_:), v109);
    Person.preferredHandle(ofType:)();
    uint64_t v83 = v82;
    uint64_t v84 = v80;
    uint64_t v68 = v79;
    uint64_t v67 = v103;
    (*(void (**)(char *, uint64_t))(v77 + 8))(v84, v81);
    sub_100009A50((uint64_t)v23, &qword_100026378);
    (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v66, v67);
    uint64_t v69 = v37;
    if (v83)
    {
      uint64_t v41 = (uint64_t)v121;
      uint64_t v40 = v122;
      goto LABEL_6;
    }
  }
  id v85 = v117;
  static PeopleLogger.common.getter();
  uint64_t v86 = v116;
  sub_100019708((uint64_t)v120, v116, &qword_100026378);
  uint64_t v87 = Logger.logObject.getter();
  os_log_type_t v88 = static os_log_type_t.error.getter();
  if (os_log_type_enabled(v87, v88))
  {
    uint64_t v120 = v69;
    uint64_t v89 = v86;
    int v90 = (uint8_t *)swift_slowAlloc();
    uint64_t v124 = swift_slowAlloc();
    *(_DWORD *)int v90 = 136315138;
    uint64_t v91 = v89;
    uint64_t v92 = v106;
    sub_100019708(v91, v106, &qword_100026378);
    if (v105(v92, 1, v67) == 1)
    {
      sub_100009A50(v92, &qword_100026378);
      uint64_t v93 = 0;
      unint64_t v94 = 0xE000000000000000;
    }
    else
    {
      uint64_t v95 = v92;
      uint64_t v93 = Person.description.getter();
      unint64_t v94 = v96;
      (*(void (**)(uint64_t, uint64_t))(v68 + 8))(v95, v67);
    }
    uint64_t v123 = sub_100018764(v93, v94, &v124);
    UnsafeMutableRawBufferPointer.copyMemory(from:)();
    swift_bridgeObjectRelease();
    sub_100009A50(v116, &qword_100026378);
    _os_log_impl((void *)&_mh_execute_header, v87, v88, "Could not find handle for person %s", v90, 0xCu);
    swift_arrayDestroy();
    swift_slowDealloc();
    swift_slowDealloc();

    (*(void (**)(char *, void (*)(char *, char *, uint64_t)))(v110 + 8))(v117, v120);
  }
  else
  {
    sub_100009A50(v86, &qword_100026378);

    (*(void (**)(char *, void (*)(char *, char *, uint64_t)))(v110 + 8))(v85, v69);
  }
  uint64_t v97 = v121;
  uint64_t v99 = v113;
  uint64_t v98 = v114;
  uint64_t v100 = v111;
  static CocoaError.Code.coderInvalidValue.getter();
  sub_1000184D0((uint64_t)&_swiftEmptyArrayStorage);
  sub_100019310(&qword_100026A88, (void (*)(uint64_t))&type metadata accessor for CocoaError);
  _BridgedStoredNSError.init(_:userInfo:)();
  uint64_t v101 = (void *)CocoaError._nsError.getter();
  (*(void (**)(char *, uint64_t))(v99 + 8))(v100, v98);
  v97(v101);
}

uint64_t sub_100017EC4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  v7[29] = a6;
  v7[30] = a7;
  v7[27] = a4;
  v7[28] = a5;
  return _swift_task_switch(sub_100017EE8, 0, 0);
}

uint64_t sub_100017EE8()
{
  uint64_t v1 = v0[27];
  sub_1000067F8(&qword_100026618);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10001B230;
  *(void *)(inited + 32) = static String._unconditionallyBridgeFromObjectiveC(_:)();
  *(void *)(inited + 40) = v3;
  *(void *)(inited + 72) = &type metadata for Bool;
  *(unsigned char *)(inited + 48) = 1;
  unint64_t v4 = sub_100016B70(inited);
  uint64_t v5 = *(void **)(v1 + 24);
  URL._bridgeToObjectiveC()(v6);
  uint64_t v8 = v7;
  v0[31] = v7;
  sub_100016CBC(v4);
  swift_bridgeObjectRelease();
  Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
  v0[32] = isa;
  swift_bridgeObjectRelease();
  v0[2] = v0;
  v0[7] = v0 + 25;
  v0[3] = sub_10000CB38;
  uint64_t v10 = swift_continuation_init();
  v0[20] = _NSConcreteStackBlock;
  v0[21] = 0x40000000;
  v0[22] = sub_100017084;
  v0[23] = &unk_1000213D8;
  v0[24] = v10;
  [v5 openSensitiveURLInBackground:v8 withOptions:isa completionHandler:v0 + 20];
  return _swift_continuation_await(v0 + 2);
}

uint64_t sub_1000180B4()
{
  swift_release();

  return _swift_deallocClassInstance(v0, 32, 7);
}

uint64_t type metadata accessor for MessageActionHandler()
{
  return self;
}

void sub_10001811C(uint64_t a1, void (*a2)(char *, char *, uint64_t), void (*a3)(void *), uint64_t a4)
{
}

id sub_100018140(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t v14 = type metadata accessor for PersonNameComponents();
  uint64_t v15 = *(void *)(v14 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(a2, 1, v14) != 1)
  {
    Class isa = PersonNameComponents._bridgeToObjectiveC()().super.isa;
    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(a2, v14);
  }
  if (a4)
  {
    NSString v17 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
    uint64_t v18 = a9;
    if (a7) {
      goto LABEL_5;
    }
LABEL_8:
    NSString v19 = 0;
    if (v18) {
      goto LABEL_6;
    }
LABEL_9:
    NSString v20 = 0;
    goto LABEL_10;
  }
  NSString v17 = 0;
  uint64_t v18 = a9;
  if (!a7) {
    goto LABEL_8;
  }
LABEL_5:
  NSString v19 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  if (!v18) {
    goto LABEL_9;
  }
LABEL_6:
  NSString v20 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
LABEL_10:
  id v21 = [v24 initWithPersonHandle:a1 nameComponents:isa displayName:v17 image:a5 contactIdentifier:v19 customIdentifier:v20];

  return v21;
}

uint64_t sub_1000182FC(uint64_t a1, int *a2)
{
  uint64_t v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  unint64_t v4 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v4;
  void *v4 = v2;
  v4[1] = sub_1000183D8;
  return v6(a1);
}

uint64_t sub_1000183D8()
{
  uint64_t v3 = *v0;
  swift_task_dealloc();
  uint64_t v1 = *(uint64_t (**)(void))(v3 + 8);
  return v1();
}

unint64_t sub_1000184D0(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v3 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_1000067F8(&qword_100026AB8);
  uint64_t v2 = static _DictionaryStorage.allocate(capacity:)();
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
    sub_100019708(v6, (uint64_t)&v15, &qword_100026AC0);
    uint64_t v7 = v15;
    uint64_t v8 = v16;
    unint64_t result = sub_100018E50(v15, v16, (uint64_t (*)(uint64_t, uint64_t, Swift::Int))sub_10001861C);
    if (v10) {
      break;
    }
    *(void *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v3[6] + 16 * result);
    uint64_t *v11 = v7;
    v11[1] = v8;
    unint64_t result = (unint64_t)sub_1000196F8(&v17, (_OWORD *)(v3[7] + 32 * result));
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

unint64_t sub_10001861C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t i = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    char v10 = (void *)(v9 + 16 * i);
    if ((*v10 != a1 || v10[1] != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      unint64_t i = (i + 1) & v12;
      if ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i))
      {
        BOOL v13 = (void *)(v9 + 16 * i);
        if ((*v13 != a1 || v13[1] != a2) && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
        {
          for (unint64_t i = (i + 1) & v12; ((*(void *)(v4 + ((i >> 3) & 0xFFFFFFFFFFFFFF8)) >> i) & 1) != 0; unint64_t i = (i + 1) & v12)
          {
            uint64_t v15 = (void *)(v9 + 16 * i);
            if (*v15 == a1 && v15[1] == a2) {
              break;
            }
            if (_stringCompareWithSmolCheck(_:_:expecting:)()) {
              break;
            }
          }
        }
      }
    }
  }
  return i;
}

uint64_t sub_100018764(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6 = sub_100018838(v12, 0, 0, 1, a1, a2);
  uint64_t v7 = v12[0];
  if (v6)
  {
    uint64_t v8 = v6;
    ObjectType = (void *)swift_getObjectType();
    v12[0] = v8;
    uint64_t v9 = *a3;
    if (*a3)
    {
      sub_10001969C((uint64_t)v12, *a3);
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
      sub_10001969C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  sub_100006880((uint64_t)v12);
  return v7;
}

uint64_t sub_100018838(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            UnsafeMutableRawBufferPointer.subscript.setter();
            uint64_t result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    uint64_t result = sub_1000189F4(a5, a6);
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
  uint64_t v8 = _StringObject.sharedUTF8.getter();
  if (!v8)
  {
    _assertionFailure(_:_:file:line:flags:)();
    __break(1u);
LABEL_17:
    uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
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

uint64_t sub_1000189F4(uint64_t a1, unint64_t a2)
{
  uint64_t v2 = (uint64_t)sub_100018A8C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
    uint64_t v2 = sub_100018C6C(0, *(void *)(v2 + 16) + 1, 1, (char *)v2);
  }
  unint64_t v4 = *(void *)(v2 + 16);
  unint64_t v3 = *(void *)(v2 + 24);
  if (v4 >= v3 >> 1) {
    uint64_t v2 = sub_100018C6C(v3 > 1, v4 + 1, 1, (char *)v2);
  }
  *(void *)(v2 + 16) = v4 + 1;
  *(unsigned char *)(v2 + 32 + v4) = 0;
  return v2;
}

void *sub_100018A8C(uint64_t a1, unint64_t a2)
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
      unint64_t v3 = sub_100018C04(v2, 0);
      if (v2 < 0) {
        break;
      }
      unint64_t v4 = v3;
      uint64_t v5 = _StringGuts.copyUTF8(into:)();
      if (v6) {
        goto LABEL_14;
      }
      if (v5 == v2) {
        return v4;
      }
      _assertionFailure(_:_:file:line:flags:)();
      __break(1u);
LABEL_10:
      uint64_t v2 = String.UTF8View._foreignCount()();
      if (!v2) {
        return &_swiftEmptyArrayStorage;
      }
    }
    _fatalErrorMessage(_:_:file:line:flags:)();
    __break(1u);
LABEL_14:
    uint64_t result = (void *)_assertionFailure(_:_:file:line:flags:)();
    __break(1u);
  }
  else
  {
    return &_swiftEmptyArrayStorage;
  }
  return result;
}

void *sub_100018C04(uint64_t a1, uint64_t a2)
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
  sub_1000067F8(&qword_100026AC8);
  unint64_t v4 = (void *)swift_allocObject();
  size_t v5 = j__malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_100018C6C(char a1, int64_t a2, char a3, char *a4)
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
    sub_1000067F8(&qword_100026AC8);
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
  uint64_t result = _fatalErrorMessage(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

unint64_t sub_100018DBC(uint64_t a1)
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v2 = Hasher._finalize()();
  swift_bridgeObjectRelease();

  return sub_100018ED4(a1, v2);
}

uint64_t sub_100018E50(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t, uint64_t, Swift::Int))
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v5 = Hasher._finalize()();

  return a3(a1, a2, v5);
}

unint64_t sub_100018ED4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
    if (v6 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = _stringCompareWithSmolCheck(_:_:expecting:)();
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
          uint64_t v13 = static String._unconditionallyBridgeFromObjectiveC(_:)();
          uint64_t v15 = v14;
          if (v13 == static String._unconditionallyBridgeFromObjectiveC(_:)() && v15 == v16) {
            break;
          }
          char v18 = _stringCompareWithSmolCheck(_:_:expecting:)();
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

unint64_t sub_10001904C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
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
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_100019130()
{
  uint64_t v0 = type metadata accessor for QuickActionType();
  uint64_t v1 = *(void *)(v0 - 8);
  uint64_t v2 = __chkstk_darwin(v0);
  uint64_t v4 = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2);
  unint64_t v6 = (char *)v10 - v5;
  QuickAction.type.getter();
  (*(void (**)(char *, void, uint64_t))(v1 + 104))(v4, enum case for QuickActionType.message(_:), v0);
  sub_100019310((unint64_t *)&qword_100026060, (void (*)(uint64_t))&type metadata accessor for QuickActionType);
  dispatch thunk of RawRepresentable.rawValue.getter();
  dispatch thunk of RawRepresentable.rawValue.getter();
  if (v10[2] == v10[0] && v10[3] == v10[1]) {
    char v7 = 1;
  }
  else {
    char v7 = _stringCompareWithSmolCheck(_:_:expecting:)();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v8 = *(void (**)(char *, uint64_t))(v1 + 8);
  v8(v4, v0);
  v8(v6, v0);
  return v7 & 1;
}

uint64_t sub_100019310(unint64_t *a1, void (*a2)(uint64_t))
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

unint64_t sub_100019358()
{
  unint64_t result = qword_100026620;
  if (!qword_100026620)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_100026620);
  }
  return result;
}

uint64_t sub_100019398()
{
  uint64_t v1 = type metadata accessor for URL();
  uint64_t v2 = *(void *)(v1 - 8);
  uint64_t v3 = *(unsigned __int8 *)(v2 + 80);
  uint64_t v4 = (v3 + 40) & ~v3;
  uint64_t v5 = v3 | 7;
  unint64_t v6 = ((*(void *)(v2 + 64) + v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 16;
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0 + v4, v1);
  swift_release();

  return _swift_deallocObject(v0, v6, v5);
}

uint64_t sub_10001948C()
{
  uint64_t v2 = *(void *)(type metadata accessor for URL() - 8);
  unint64_t v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  unint64_t v4 = (*(void *)(v2 + 64) + v3 + 7) & 0xFFFFFFFFFFFFFFF8;
  uint64_t v5 = *(void *)(v0 + 32);
  uint64_t v6 = v0 + v3;
  uint64_t v7 = swift_task_alloc();
  long long v8 = *(_OWORD *)(v0 + v4);
  *(void *)(v1 + 16) = v7;
  *(void *)uint64_t v7 = v1;
  *(void *)(v7 + 8) = sub_10000E0E8;
  *(_OWORD *)(v7 + 232) = v8;
  *(void *)(v7 + 216) = v5;
  *(void *)(v7 + 224) = v6;
  return _swift_task_switch(sub_100017EE8, 0, 0);
}

uint64_t sub_1000195AC()
{
  swift_release();

  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_1000195E4(uint64_t a1)
{
  unint64_t v4 = *(int **)(v1 + 16);
  uint64_t v5 = (void *)swift_task_alloc();
  *(void *)(v2 + 16) = v5;
  *uint64_t v5 = v2;
  v5[1] = sub_10000E0E8;
  uint64_t v6 = (uint64_t (*)(uint64_t, int *))((char *)&dword_100026AA0 + dword_100026AA0);
  return v6(a1, v4);
}

uint64_t sub_10001969C(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

_OWORD *sub_1000196F8(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_100019708(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5 = sub_1000067F8(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_10001976C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

uint64_t CocoaError._nsError.getter()
{
  return CocoaError._nsError.getter();
}

uint64_t static CocoaError.Code.coderInvalidValue.getter()
{
  return static CocoaError.Code.coderInvalidValue.getter();
}

uint64_t type metadata accessor for CocoaError.Code()
{
  return type metadata accessor for CocoaError.Code();
}

uint64_t type metadata accessor for CocoaError()
{
  return type metadata accessor for CocoaError();
}

uint64_t URLComponents.init(url:resolvingAgainstBaseURL:)()
{
  return URLComponents.init(url:resolvingAgainstBaseURL:)();
}

uint64_t URLComponents.url.getter()
{
  return URLComponents.url.getter();
}

uint64_t URLComponents.path.setter()
{
  return URLComponents.path.setter();
}

uint64_t URLComponents.subscript.getter()
{
  return URLComponents.subscript.getter();
}

{
  return URLComponents.subscript.getter();
}

uint64_t URLComponents.peopleAction.getter()
{
  return URLComponents.peopleAction.getter();
}

uint64_t URLComponents.scheme.getter()
{
  return URLComponents.scheme.getter();
}

uint64_t URLComponents.scheme.setter()
{
  return URLComponents.scheme.setter();
}

uint64_t URLComponents.init()()
{
  return URLComponents.init()();
}

uint64_t type metadata accessor for URLComponents()
{
  return type metadata accessor for URLComponents();
}

NSPersonNameComponents __swiftcall PersonNameComponents._bridgeToObjectiveC()()
{
  uint64_t v0 = (objc_class *)PersonNameComponents._bridgeToObjectiveC()();
  result._private = v1;
  result.super.Class isa = v0;
  return result;
}

uint64_t type metadata accessor for PersonNameComponents()
{
  return type metadata accessor for PersonNameComponents();
}

uint64_t _BridgedStoredNSError.init(_:userInfo:)()
{
  return _BridgedStoredNSError.init(_:userInfo:)();
}

void __swiftcall URL._bridgeToObjectiveC()(NSURL *__return_ptr retstr)
{
}

Swift::Void __swiftcall URL.appendPathComponent(_:)(Swift::String a1)
{
}

uint64_t static URL._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static URL._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t URL.init(string:)()
{
  return URL.init(string:)();
}

uint64_t type metadata accessor for URL()
{
  return type metadata accessor for URL();
}

uint64_t Date.init()()
{
  return Date.init()();
}

uint64_t type metadata accessor for Date()
{
  return type metadata accessor for Date();
}

uint64_t Logger.ifError(_:message:)()
{
  return Logger.ifError(_:message:)();
}

uint64_t Logger.logObject.getter()
{
  return Logger.logObject.getter();
}

uint64_t type metadata accessor for Logger()
{
  return type metadata accessor for Logger();
}

uint64_t UIApplicationMain(_:_:_:_:)()
{
  return UIApplicationMain(_:_:_:_:)();
}

uint64_t type metadata accessor for PeopleURL.PathAction()
{
  return type metadata accessor for PeopleURL.PathAction();
}

uint64_t type metadata accessor for PeopleURL.ArrayParameter()
{
  return type metadata accessor for PeopleURL.ArrayParameter();
}

uint64_t static PeopleURL.Scheme.== infix(_:_:)()
{
  return static PeopleURL.Scheme.== infix(_:_:)();
}

uint64_t type metadata accessor for PeopleURL.Scheme()
{
  return type metadata accessor for PeopleURL.Scheme();
}

uint64_t type metadata accessor for PeopleURL.Parameter()
{
  return type metadata accessor for PeopleURL.Parameter();
}

uint64_t static PeopleErrors.createError(_:code:)()
{
  return static PeopleErrors.createError(_:code:)();
}

uint64_t static PeopleLogger.viewService.getter()
{
  return static PeopleLogger.viewService.getter();
}

uint64_t static PeopleLogger.common.getter()
{
  return static PeopleLogger.common.getter();
}

uint64_t type metadata accessor for PeopleAnalytics.WidgetLocation()
{
  return type metadata accessor for PeopleAnalytics.WidgetLocation();
}

uint64_t dispatch thunk of PeopleAnalytics.sendEntityCardLaunched(validContactIdentifier:displayPriorities:location:)()
{
  return dispatch thunk of PeopleAnalytics.sendEntityCardLaunched(validContactIdentifier:displayPriorities:location:)();
}

uint64_t dispatch thunk of PeopleAnalytics.sendWidgetPerformQuickAction(_:)()
{
  return dispatch thunk of PeopleAnalytics.sendWidgetPerformQuickAction(_:)();
}

uint64_t static PeopleAnalytics.shared.getter()
{
  return static PeopleAnalytics.shared.getter();
}

uint64_t type metadata accessor for PeopleAnalytics()
{
  return type metadata accessor for PeopleAnalytics();
}

uint64_t type metadata accessor for HandleType()
{
  return type metadata accessor for HandleType();
}

uint64_t QuickAction.customIdentifier.getter()
{
  return QuickAction.customIdentifier.getter();
}

uint64_t QuickAction.contactIdentifier.getter()
{
  return QuickAction.contactIdentifier.getter();
}

uint64_t QuickAction.standardProtocolURL.getter()
{
  return QuickAction.standardProtocolURL.getter();
}

uint64_t QuickAction.useStandardProtocol.getter()
{
  return QuickAction.useStandardProtocol.getter();
}

uint64_t QuickAction.init(from:)()
{
  return QuickAction.init(from:)();
}

uint64_t QuickAction.type.getter()
{
  return QuickAction.type.getter();
}

uint64_t QuickAction.handle.getter()
{
  return QuickAction.handle.getter();
}

uint64_t QuickAction.bundleID.getter()
{
  return QuickAction.bundleID.getter();
}

uint64_t type metadata accessor for QuickAction()
{
  return type metadata accessor for QuickAction();
}

uint64_t static ContactFetcher.shared.getter()
{
  return static ContactFetcher.shared.getter();
}

uint64_t dispatch thunk of ContactFetcher.contact(for:includeImages:)()
{
  return dispatch thunk of ContactFetcher.contact(for:includeImages:)();
}

uint64_t type metadata accessor for ContactFetcher()
{
  return type metadata accessor for ContactFetcher();
}

uint64_t static MetricTemplate.metricsEnabled.getter()
{
  return static MetricTemplate.metricsEnabled.getter();
}

uint64_t type metadata accessor for QuickActionType()
{
  return type metadata accessor for QuickActionType();
}

uint64_t type metadata accessor for ContactFormatter.Style()
{
  return type metadata accessor for ContactFormatter.Style();
}

uint64_t ContactFormatter.init(style:fallback:)()
{
  return ContactFormatter.init(style:fallback:)();
}

uint64_t type metadata accessor for ContactFormatter()
{
  return type metadata accessor for ContactFormatter();
}

uint64_t dispatch thunk of ApplicationRecord.bundleIdentifier.getter()
{
  return dispatch thunk of ApplicationRecord.bundleIdentifier.getter();
}

uint64_t static LaunchRecorderWriter.sharedInstance.getter()
{
  return static LaunchRecorderWriter.sharedInstance.getter();
}

uint64_t dispatch thunk of LaunchRecorderWriter.add(contactId:time:)()
{
  return dispatch thunk of LaunchRecorderWriter.add(contactId:time:)();
}

uint64_t dispatch thunk of LaunchRecorderWriter.save()()
{
  return dispatch thunk of LaunchRecorderWriter.save()();
}

uint64_t dispatch thunk of LaunchRecorderWriter.reload()()
{
  return dispatch thunk of LaunchRecorderWriter.reload()();
}

uint64_t type metadata accessor for LaunchRecorderWriter()
{
  return type metadata accessor for LaunchRecorderWriter();
}

uint64_t dispatch thunk of ContactFetcherProtocol.contact(for:includeImages:)()
{
  return dispatch thunk of ContactFetcherProtocol.contact(for:includeImages:)();
}

uint64_t dispatch thunk of IntentHandlingApplicationRegistry.applications(forIntentClass:)()
{
  return dispatch thunk of IntentHandlingApplicationRegistry.applications(forIntentClass:)();
}

uint64_t Person.description.getter()
{
  return Person.description.getter();
}

uint64_t Person.preferredHandle(ofType:)()
{
  return Person.preferredHandle(ofType:)();
}

uint64_t Person.init(from:statuses:contactFormatter:)()
{
  return Person.init(from:statuses:contactFormatter:)();
}

uint64_t type metadata accessor for Person()
{
  return type metadata accessor for Person();
}

uint64_t static VerticalAlignment.center.getter()
{
  return static VerticalAlignment.center.getter();
}

uint64_t static HorizontalAlignment.center.getter()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t UIHostingController.init(rootView:)()
{
  return UIHostingController.init(rootView:)();
}

uint64_t static Edge.Set.all.getter()
{
  return static Edge.Set.all.getter();
}

uint64_t static Font.headline.getter()
{
  return static Font.headline.getter();
}

uint64_t Text.foregroundColor(_:)()
{
  return Text.foregroundColor(_:)();
}

uint64_t Text.font(_:)()
{
  return Text.font(_:)();
}

uint64_t Text.init<A>(_:)()
{
  return Text.init<A>(_:)();
}

uint64_t Color.init(uiColor:)()
{
  return Color.init(uiColor:)();
}

uint64_t static Color.clear.getter()
{
  return static Color.clear.getter();
}

uint64_t type metadata accessor for DispatchWorkItemFlags()
{
  return type metadata accessor for DispatchWorkItemFlags();
}

uint64_t static DispatchQoS.unspecified.getter()
{
  return static DispatchQoS.unspecified.getter();
}

uint64_t type metadata accessor for DispatchQoS()
{
  return type metadata accessor for DispatchQoS();
}

uint64_t MetricTemplateView.init(dragRefresh:)()
{
  return MetricTemplateView.init(dragRefresh:)();
}

uint64_t type metadata accessor for MetricTemplateView()
{
  return type metadata accessor for MetricTemplateView();
}

uint64_t dispatch thunk of WidgetCenter.reloadAllTimelines()()
{
  return dispatch thunk of WidgetCenter.reloadAllTimelines()();
}

uint64_t static WidgetCenter.shared.getter()
{
  return static WidgetCenter.shared.getter();
}

uint64_t type metadata accessor for WidgetCenter()
{
  return type metadata accessor for WidgetCenter();
}

NSDictionary __swiftcall Dictionary._bridgeToObjectiveC()()
{
  return (NSDictionary)Dictionary._bridgeToObjectiveC()();
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t dispatch thunk of static Equatable.== infix(_:_:)()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString __swiftcall String._bridgeToObjectiveC()()
{
  return (NSString)String._bridgeToObjectiveC()();
}

uint64_t static String._forceBridgeFromObjectiveC(_:result:)()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._conditionallyBridgeFromObjectiveC(_:result:)()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

uint64_t String.localized.getter()
{
  return String.localized.getter();
}

Swift::String_optional __swiftcall String.trimToNil()()
{
  uint64_t v0 = String.trimToNil()();
  result.value._object = v1;
  result.value._countAndFlagsBits = v0;
  return result;
}

Swift::Void __swiftcall String.append(_:)(Swift::String a1)
{
}

Swift::Int __swiftcall String.UTF8View._foreignCount()()
{
  return String.UTF8View._foreignCount()();
}

uint64_t dispatch thunk of RawRepresentable.rawValue.getter()
{
  return dispatch thunk of RawRepresentable.rawValue.getter();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Array.description.getter()
{
  return Array.description.getter();
}

uint64_t specialized Array._endMutation()()
{
  return specialized Array._endMutation()();
}

uint64_t dispatch thunk of Actor.unownedExecutor.getter()
{
  return dispatch thunk of Actor.unownedExecutor.getter();
}

uint64_t static MainActor.shared.getter()
{
  return static MainActor.shared.getter();
}

uint64_t type metadata accessor for MainActor()
{
  return type metadata accessor for MainActor();
}

uint64_t TaskPriority.rawValue.getter()
{
  return TaskPriority.rawValue.getter();
}

uint64_t type metadata accessor for TaskPriority()
{
  return type metadata accessor for TaskPriority();
}

uint64_t static Set._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Set._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t Set.init(minimumCapacity:)()
{
  return Set.init(minimumCapacity:)();
}

uint64_t Set.Iterator.init(_cocoa:)()
{
  return Set.Iterator.init(_cocoa:)();
}

uint64_t static os_log_type_t.info.getter()
{
  return static os_log_type_t.info.getter();
}

uint64_t static os_log_type_t.debug.getter()
{
  return static os_log_type_t.debug.getter();
}

uint64_t static os_log_type_t.error.getter()
{
  return static os_log_type_t.error.getter();
}

uint64_t static os_log_type_t.default.getter()
{
  return static os_log_type_t.default.getter();
}

uint64_t static OS_dispatch_queue.main.getter()
{
  return static OS_dispatch_queue.main.getter();
}

uint64_t OS_dispatch_queue.async(group:qos:flags:execute:)()
{
  return OS_dispatch_queue.async(group:qos:flags:execute:)();
}

uint64_t static NSObject.== infix(_:_:)()
{
  return static NSObject.== infix(_:_:)();
}

uint64_t NSString.init(stringLiteral:)()
{
  return NSString.init(stringLiteral:)();
}

uint64_t CNContact.callHistoryHandles.getter()
{
  return CNContact.callHistoryHandles.getter();
}

uint64_t type metadata accessor for Optional()
{
  return type metadata accessor for Optional();
}

uint64_t UnsafeMutableRawBufferPointer.copyMemory(from:)()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

uint64_t UnsafeMutableRawBufferPointer.subscript.setter()
{
  return UnsafeMutableRawBufferPointer.subscript.setter();
}

uint64_t dispatch thunk of SetAlgebra.init<A>(_:)()
{
  return dispatch thunk of SetAlgebra.init<A>(_:)();
}

uint64_t __CocoaSet.makeIterator()()
{
  return __CocoaSet.makeIterator()();
}

uint64_t __CocoaSet.count.getter()
{
  return __CocoaSet.count.getter();
}

uint64_t __CocoaSet.Iterator.next()()
{
  return __CocoaSet.Iterator.next()();
}

Swift::Int __swiftcall AnyHashable._rawHashValue(seed:)(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t static CommandLine.unsafeArgv.getter()
{
  return static CommandLine.unsafeArgv.getter();
}

uint64_t static CommandLine.argc.getter()
{
  return static CommandLine.argc.getter();
}

uint64_t static _SetStorage.copy(original:)()
{
  return static _SetStorage.copy(original:)();
}

uint64_t static _SetStorage.resize(original:capacity:move:)()
{
  return static _SetStorage.resize(original:capacity:move:)();
}

Swift::Void __swiftcall _StringGuts.grow(_:)(Swift::Int a1)
{
}

uint64_t _StringGuts.copyUTF8(into:)()
{
  return _StringGuts.copyUTF8(into:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t _StringObject.sharedUTF8.getter()
{
  return _StringObject.sharedUTF8.getter();
}

uint64_t _assertionFailure(_:_:file:line:flags:)()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t static _DictionaryStorage.allocate(capacity:)()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t _fatalErrorMessage(_:_:file:line:flags:)()
{
  return _fatalErrorMessage(_:_:file:line:flags:)();
}

uint64_t dispatch thunk of CustomStringConvertible.description.getter()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)()
{
  return ELEMENT_TYPE_OF_SET_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t Error.localizedDescription.getter()
{
  return Error.localizedDescription.getter();
}

uint64_t Error._getEmbeddedNSError()()
{
  return Error._getEmbeddedNSError()();
}

uint64_t Error._code.getter()
{
  return Error._code.getter();
}

uint64_t Error._domain.getter()
{
  return Error._domain.getter();
}

uint64_t Error._userInfo.getter()
{
  return Error._userInfo.getter();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t _typeName(_:qualified:)()
{
  return _typeName(_:qualified:)();
}

uint64_t IMSPIMarkSPIMessagesAsRead()
{
  return _IMSPIMarkSPIMessagesAsRead();
}

uint64_t IMSPIQueryMessagesWithIDsWithOnlyUnreadAndQOS()
{
  return _IMSPIQueryMessagesWithIDsWithOnlyUnreadAndQOS();
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void exit(int a1)
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

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocBox()
{
  return _swift_allocBox();
}

uint64_t swift_allocError()
{
  return _swift_allocError();
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

uint64_t swift_continuation_init()
{
  return _swift_continuation_init();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_dynamicCastObjCClass()
{
  return _swift_dynamicCastObjCClass();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getDynamicType()
{
  return _swift_getDynamicType();
}

uint64_t swift_getErrorValue()
{
  return _swift_getErrorValue();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return _swift_isEscapingClosureAtFileLocation();
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

uint64_t swift_willThrow()
{
  return _swift_willThrow();
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithArray:];
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithObjects:count:];
}

id objc_msgSend_body(void *a1, const char *a2, ...)
{
  return _[a1 body];
}

id objc_msgSend_checkAndClear_service_(void *a1, const char *a2, ...)
{
  return [a1 checkAndClear:service:];
}

id objc_msgSend_checkWithWait_service_(void *a1, const char *a2, ...)
{
  return [a1 checkWithWait:service:];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return [a1 countByEnumeratingWithState:objects:count:];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return [a1 enumerateObjectsUsingBlock:];
}

id objc_msgSend_initWith_andText_(void *a1, const char *a2, ...)
{
  return [a1 initWith:andText:];
}

id objc_msgSend_initWithBlock_(void *a1, const char *a2, ...)
{
  return [a1 initWithBlock:];
}

id objc_msgSend_initWithKey_ascending_(void *a1, const char *a2, ...)
{
  return [a1 initWithKey:ascending:];
}

id objc_msgSend_initWithValue_(void *a1, const char *a2, ...)
{
  return [a1 initWithValue:];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_logHandle(void *a1, const char *a2, ...)
{
  return _[a1 logHandle];
}

id objc_msgSend_onComplete_(void *a1, const char *a2, ...)
{
  return [a1 onComplete:];
}

id objc_msgSend_sortUsingDescriptors_(void *a1, const char *a2, ...)
{
  return [a1 sortUsingDescriptors:];
}

id objc_msgSend_then(void *a1, const char *a2, ...)
{
  return _[a1 then];
}