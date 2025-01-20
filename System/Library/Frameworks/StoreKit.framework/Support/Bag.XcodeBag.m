@interface Bag.XcodeBag
- (BOOL)isExpired;
- (NSDate)expirationDate;
- (NSString)profile;
- (NSString)profileVersion;
- (_TtCC9storekitd3BagP33_548B24E65CA9FE1CAECE2177332C57EA8XcodeBag)init;
- (id)BOOLForKey:(id)a3;
- (id)URLForKey:(id)a3;
- (id)arrayForKey:(id)a3;
- (id)dictionaryForKey:(id)a3;
- (id)doubleForKey:(id)a3;
- (id)integerForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (void)createSnapshotWithCompletion:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setExpired:(BOOL)a3;
@end

@implementation Bag.XcodeBag

- (BOOL)isExpired
{
  return sub_10018911C() & 1;
}

- (void)setExpired:(BOOL)a3
{
}

- (NSDate)expirationDate
{
  uint64_t v2 = sub_10001E6FC((uint64_t *)&unk_10039DC30);
  __chkstk_darwin(v2 - 8);
  v4 = (char *)&v8 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100189258((uint64_t)v4);
  uint64_t v5 = type metadata accessor for Date();
  Class isa = 0;
  if (sub_10001E448((uint64_t)v4, 1, v5) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(*(void *)(v5 - 8) + 8))(v4, v5);
  }

  return (NSDate *)isa;
}

- (void)setExpirationDate:(id)a3
{
  uint64_t v5 = sub_10001E6FC((uint64_t *)&unk_10039DC30);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    static Date._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = type metadata accessor for Date();
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v8 = type metadata accessor for Date();
    uint64_t v9 = 1;
  }
  sub_10001B5DC((uint64_t)v7, v9, 1, v8);
  v10 = self;
  sub_100189384((uint64_t)v7);
}

- (NSString)profile
{
  uint64_t v2 = self;
  sub_100187C4C();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSString)profileVersion
{
  sub_100187CB0();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (id)arrayForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_10018A764(v4);

  return v6;
}

- (id)BOOLForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_10018A7CC(v4);

  return v6;
}

- (void)createSnapshotWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  _Block_copy(v4);
  uint64_t v5 = self;
  sub_10018A834((uint64_t)v5, (void (**)(const void *, unint64_t, void *))v4);
  _Block_release(v4);
}

- (id)doubleForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_10018B124(v4);

  return v6;
}

- (id)integerForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_10018B18C(v4);

  return v6;
}

- (id)stringForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_10018B1F4(v4);

  return v6;
}

- (id)URLForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_10018B25C(v4);

  return v6;
}

- (id)dictionaryForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_10018B2C4(v4);

  return v6;
}

- (_TtCC9storekitd3BagP33_548B24E65CA9FE1CAECE2177332C57EA8XcodeBag)init
{
}

- (void).cxx_destruct
{
}

@end