@interface MediaAPIUpdate
+ (Class)databaseEntityClass;
+ (id)defaultProperties;
- (BOOL)isManagedAccount;
- (BOOL)isOffloaded;
- (BOOL)isPerDevice;
- (NSNumber)evid;
- (NSNumber)itemIdentifier;
- (NSString)bundleID;
- (NSString)buyParams;
- (NSString)description;
- (NSString)parentalControlsName;
- (_TtC9appstored14MediaAPIUpdate)initWithDatabaseID:(int64_t)a3 propertyValues:(id)a4 externalPropertyValues:(id)a5;
- (id)purchaseInfoForUpdateUserInitiated:(BOOL)a3;
- (int64_t)itemID;
- (int64_t)parentalControlsRank;
- (int64_t)softwarePlatform;
- (int64_t)updateState;
- (void)setBundleID:(id)a3;
- (void)setEvid:(id)a3;
- (void)setItemID:(int64_t)a3;
- (void)setUpdateState:(int64_t)a3;
@end

@implementation MediaAPIUpdate

+ (Class)databaseEntityClass
{
  type metadata accessor for MediaAPIUpdateEntity();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC9appstored14MediaAPIUpdate)initWithDatabaseID:(int64_t)a3 propertyValues:(id)a4 externalPropertyValues:(id)a5
{
  return (_TtC9appstored14MediaAPIUpdate *)sub_1000C0A3C(a3);
}

+ (id)defaultProperties
{
  v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
  return v2.super.isa;
}

- (NSString)description
{
  NSArray v2 = self;
  sub_1000C0CE0();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)bundleID
{
  NSArray v2 = self;
  sub_1000C0970();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)setBundleID:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  v5 = (uint64_t *)((char *)self + OBJC_IVAR____TtC9appstored14MediaAPIUpdate____lazy_storage___bundleID);
  uint64_t *v5 = v4;
  v5[1] = v6;
  swift_bridgeObjectRelease();
}

- (NSNumber)evid
{
  NSArray v2 = self;
  NSString v3 = sub_1000C08A8();

  return (NSNumber *)v3;
}

- (void)setEvid:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9appstored14MediaAPIUpdate____lazy_storage___evid);
  *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9appstored14MediaAPIUpdate____lazy_storage___evid) = (Class)a3;
  id v3 = a3;
}

- (BOOL)isManagedAccount
{
  NSArray v2 = self;
  NSString v3 = String._bridgeToObjectiveC()();
  unint64_t v4 = (unint64_t)sub_10026E91C(v2, (uint64_t)v3);

  return (v4 >> 4) & 1;
}

- (BOOL)isOffloaded
{
  NSArray v2 = self;
  NSString v3 = String._bridgeToObjectiveC()();
  unint64_t v4 = (unint64_t)sub_10026E91C(v2, (uint64_t)v3);

  return (v4 >> 2) & 1;
}

- (BOOL)isPerDevice
{
  NSArray v2 = self;
  NSString v3 = String._bridgeToObjectiveC()();
  unint64_t v4 = (unint64_t)sub_10026E91C(v2, (uint64_t)v3);

  return (v4 >> 3) & 1;
}

- (int64_t)itemID
{
  NSArray v2 = self;
  id v3 = sub_1000C0768();

  return (int64_t)v3;
}

- (void)setItemID:(int64_t)a3
{
  id v3 = (char *)self + OBJC_IVAR____TtC9appstored14MediaAPIUpdate____lazy_storage___itemID;
  *(void *)id v3 = a3;
  v3[8] = 0;
}

- (int64_t)updateState
{
  NSArray v2 = self;
  id v3 = sub_1000C06E0();

  return (int64_t)v3;
}

- (void)setUpdateState:(int64_t)a3
{
  id v3 = (char *)self + OBJC_IVAR____TtC9appstored14MediaAPIUpdate____lazy_storage___updateState;
  *(void *)id v3 = a3;
  v3[8] = 0;
}

- (void).cxx_destruct
{
  sub_1000C4418(*(id *)((char *)&self->super.super.isa
                      + OBJC_IVAR____TtC9appstored14MediaAPIUpdate____lazy_storage___metadataDictionary));
  sub_1000C4418(*(id *)((char *)&self->super.super.isa
                      + OBJC_IVAR____TtC9appstored14MediaAPIUpdate____lazy_storage___platformSpecificAttributesDictionary));
  swift_bridgeObjectRelease();
  sub_1000C4438(*(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9appstored14MediaAPIUpdate____lazy_storage___metadata), *(int64_t *)((char *)&self->super._databaseID+ OBJC_IVAR____TtC9appstored14MediaAPIUpdate____lazy_storage___metadata));
  id v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR____TtC9appstored14MediaAPIUpdate____lazy_storage___evid);
}

- (NSString)buyParams
{
  NSArray v2 = self;
  sub_1000C321C();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  return (NSString *)v5;
}

- (int64_t)softwarePlatform
{
  return 1;
}

- (NSString)parentalControlsName
{
  NSArray v2 = self;
  uint64_t v3 = sub_1000C1310();
  if (v3)
  {
    NSString v4 = String._bridgeToObjectiveC()();
    id v5 = sub_100268A28(v3, v4);

    if (v5)
    {
      static String._unconditionallyBridgeFromObjectiveC(_:)();

      uint64_t v3 = String._bridgeToObjectiveC()();
      swift_bridgeObjectRelease();
    }
    else
    {

      uint64_t v3 = 0;
    }
  }
  else
  {
  }
  return (NSString *)v3;
}

- (int64_t)parentalControlsRank
{
  NSArray v2 = self;
  uint64_t v3 = sub_1000C1310();
  if (v3)
  {
    NSString v4 = v3;
    id v5 = (_TtC9appstored14MediaAPIUpdate *)String._bridgeToObjectiveC()();
    id v6 = sub_100268868(v4, v5, 0);

    NSArray v2 = v5;
  }
  else
  {
    id v6 = 0;
  }

  return (int64_t)v6;
}

- (NSNumber)itemIdentifier
{
  NSArray v2 = self;
  NSString v3 = String._bridgeToObjectiveC()();
  Class isa = (Class)sub_10026E82C(v2, (uint64_t)v3);

  if (!isa)
  {
    sub_100018D68(0, (unint64_t *)&qword_1005A3230);
    Class isa = NSNumber.init(integerLiteral:)(0).super.super.isa;
  }

  return (NSNumber *)isa;
}

- (id)purchaseInfoForUpdateUserInitiated:(BOOL)a3
{
  BOOL v3 = a3;
  NSString v4 = self;
  id v5 = sub_1000C36E4(v3);

  return v5;
}

@end