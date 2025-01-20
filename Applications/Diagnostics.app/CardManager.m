@interface CardManager
- (_TtC11Diagnostics11CardManager)init;
- (id)indexPathForElementWithModelIdentifier:(id)a3 inView:(id)a4;
- (id)modelIdentifierForElementAtIndexPath:(id)a3 inView:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
@end

@implementation CardManager

- (_TtC11Diagnostics11CardManager)init
{
  return (_TtC11Diagnostics11CardManager *)sub_1000F7CA8();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  v11 = self;
  id v12 = sub_1000FBA9C(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v12;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  int64_t v8 = sub_10010017C(a4);

  return v8;
}

- (id)modelIdentifierForElementAtIndexPath:(id)a3 inView:(id)a4
{
  uint64_t v6 = type metadata accessor for IndexPath();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a4;
  v11 = self;
  sub_100100234();
  uint64_t v13 = v12;

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if (v13)
  {
    NSString v14 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v14 = 0;
  }

  return v14;
}

- (id)indexPathForElementWithModelIdentifier:(id)a3 inView:(id)a4
{
  uint64_t v6 = sub_10003AFD0(&qword_1001865D0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  id v12 = a4;
  uint64_t v13 = self;
  sub_1000FC014(v9, v11, (uint64_t)v8);

  swift_bridgeObjectRelease();
  uint64_t v14 = type metadata accessor for IndexPath();
  uint64_t v15 = *(void *)(v14 - 8);
  Class isa = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v8, 1, v14) != 1)
  {
    Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(v15 + 8))(v8, v14);
  }

  return isa;
}

@end