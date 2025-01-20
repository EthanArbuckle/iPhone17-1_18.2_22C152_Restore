@interface ALDApplicationRepair
+ (BOOL)shouldAttemptToRepairApplication:(id)a3 options:(id)a4 logKey:(id)a5;
- (ApplicationRepairDelegate)delegate;
- (BOOL)repairApplication:(id)a3 error:(id *)a4;
- (NSArray)repairedBundleIDs;
- (NSString)repairType;
- (_TtC9appstored20ALDApplicationRepair)init;
- (_TtC9appstored20ALDApplicationRepair)initWithFairPlayStatus:(int)a3;
- (_TtC9appstored6LogKey)logKey;
- (int)fairPlayStatus;
- (void)setDelegate:(id)a3;
- (void)setFairPlayStatus:(int)a3;
- (void)setLogKey:(id)a3;
- (void)setRepairedBundleIDs:(id)a3;
@end

@implementation ALDApplicationRepair

- (NSArray)repairedBundleIDs
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored20ALDApplicationRepair_repairedBundleIDs))
  {
    swift_bridgeObjectRetain();
    v2.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v2.super.isa = 0;
  }
  return (NSArray *)v2.super.isa;
}

- (void)setRepairedBundleIDs:(id)a3
{
  if (a3) {
    v4 = (objc_class *)static Array._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else {
    v4 = 0;
  }
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored20ALDApplicationRepair_repairedBundleIDs) = v4;
  swift_bridgeObjectRelease();
}

- (ApplicationRepairDelegate)delegate
{
  NSArray v2 = (void *)swift_unknownObjectRetain();
  return (ApplicationRepairDelegate *)v2;
}

- (void)setDelegate:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored20ALDApplicationRepair_delegate) = (Class)a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (int)fairPlayStatus
{
  return *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored20ALDApplicationRepair_fairPlayStatus);
}

- (void)setFairPlayStatus:(int)a3
{
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored20ALDApplicationRepair_fairPlayStatus) = a3;
}

- (_TtC9appstored6LogKey)logKey
{
  return (_TtC9appstored6LogKey *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                          + OBJC_IVAR____TtC9appstored20ALDApplicationRepair_logKey));
}

- (void)setLogKey:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored20ALDApplicationRepair_logKey);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored20ALDApplicationRepair_logKey) = (Class)a3;
  id v3 = a3;
}

- (NSString)repairType
{
  if (*(void *)&self->repairedBundleIDs[OBJC_IVAR____TtC9appstored20ALDApplicationRepair_repairType])
  {
    swift_bridgeObjectRetain();
    NSString v2 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v2 = 0;
  }
  return (NSString *)v2;
}

+ (BOOL)shouldAttemptToRepairApplication:(id)a3 options:(id)a4 logKey:(id)a5
{
  return [a3 hasUnknownDistributor];
}

- (_TtC9appstored20ALDApplicationRepair)initWithFairPlayStatus:(int)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored20ALDApplicationRepair_repairedBundleIDs) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored20ALDApplicationRepair_delegate) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored20ALDApplicationRepair_logKey) = 0;
  *(_OWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored20ALDApplicationRepair_repairType) = xmmword_100488FC0;
  *(_DWORD *)((char *)&self->super.isa + OBJC_IVAR____TtC9appstored20ALDApplicationRepair_fairPlayStatus) = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ALDApplicationRepair();
  return [(ALDApplicationRepair *)&v4 init];
}

- (BOOL)repairApplication:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v6 = self;
  sub_100056C54(v5);

  return 1;
}

- (_TtC9appstored20ALDApplicationRepair)init
{
  result = (_TtC9appstored20ALDApplicationRepair *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
}

@end