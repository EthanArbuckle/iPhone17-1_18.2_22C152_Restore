@interface Bag
+ (AMSBagProtocol)defaultBag;
+ (AMSBagProtocol)sandboxBag;
+ (id)xcodeBagWithBundleId:(id)a3;
+ (void)setDefaultBag:(id)a3;
+ (void)setSandboxBag:(id)a3;
- (BOOL)isExpired;
- (NSDate)expirationDate;
- (NSString)profile;
- (NSString)profileVersion;
- (_TtC9storekitd3Bag)init;
- (id)BOOLForKey:(id)a3;
- (id)URLForKey:(id)a3;
- (id)URLForKey:(id)a3 account:(id)a4;
- (id)arrayForKey:(id)a3;
- (id)dictionaryForKey:(id)a3;
- (id)doubleForKey:(id)a3;
- (id)integerForKey:(id)a3;
- (id)stringForKey:(id)a3;
- (void)createSnapshotWithCompletion:(id)a3;
@end

@implementation Bag

- (NSString)profile
{
  v2 = self;
  sub_100187C4C();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSString)profileVersion
{
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (BOOL)isExpired
{
  NSString v2 = self;
  unsigned __int8 v3 = sub_100187CF0();

  return v3 & 1;
}

- (NSDate)expirationDate
{
  uint64_t v3 = sub_10001E6FC((uint64_t *)&unk_10039DC30);
  __chkstk_darwin(v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = self;
  sub_100187E1C((uint64_t)v5);

  uint64_t v7 = type metadata accessor for Date();
  Class isa = 0;
  if (sub_10001E448((uint64_t)v5, 1, v7) != 1)
  {
    Class isa = Date._bridgeToObjectiveC()().super.isa;
    (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v5, v7);
  }

  return (NSDate *)isa;
}

+ (AMSBagProtocol)defaultBag
{
  NSString v2 = (void *)sub_100187FF8(&qword_10039A240);

  return (AMSBagProtocol *)v2;
}

+ (void)setDefaultBag:(id)a3
{
  uint64_t v3 = swift_unknownObjectRetain();
  sub_1001880B0(v3, &qword_10039A240, &qword_1003B0208);
}

+ (AMSBagProtocol)sandboxBag
{
  NSString v2 = (void *)sub_100187FF8(&qword_10039A248);

  return (AMSBagProtocol *)v2;
}

+ (void)setSandboxBag:(id)a3
{
  uint64_t v3 = swift_unknownObjectRetain();
  sub_1001880B0(v3, &qword_10039A248, &qword_1003B0210);
}

+ (id)xcodeBagWithBundleId:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v5 = sub_100188148(v3, v4);
  swift_bridgeObjectRelease();

  return v5;
}

- (id)arrayForKey:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = sub_10018836C((uint64_t)v4);

  return v6;
}

- (id)BOOLForKey:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = sub_100188410((uint64_t)v4);

  return v6;
}

- (void)createSnapshotWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = self;
  sub_1001884B4((uint64_t)sub_10018DA64, v5);

  swift_release();
}

- (id)doubleForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_100188670((uint64_t)v4);

  return v6;
}

- (id)integerForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_100188714((uint64_t)v4);

  return v6;
}

- (id)stringForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_1001887B8((uint64_t)v4);

  return v6;
}

- (id)URLForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_10018885C((uint64_t)v4);

  return v6;
}

- (id)URLForKey:(id)a3 account:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  id v9 = sub_100188900((uint64_t)v6, (uint64_t)a4);

  return v9;
}

- (id)dictionaryForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_100188A20((uint64_t)v4);

  return v6;
}

- (_TtC9storekitd3Bag)init
{
}

- (void).cxx_destruct
{
}

@end