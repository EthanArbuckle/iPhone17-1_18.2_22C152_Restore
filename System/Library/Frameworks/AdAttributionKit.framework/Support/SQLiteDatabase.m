@interface SQLiteDatabase
- (BOOL)connectionNeedsResetForCorruption:(id)a3;
- (BOOL)connectionNeedsResetForReopen:(id)a3;
- (_TtC20AttributionKitDaemon14SQLiteDatabase)init;
@end

@implementation SQLiteDatabase

- (_TtC20AttributionKitDaemon14SQLiteDatabase)init
{
  result = (_TtC20AttributionKitDaemon14SQLiteDatabase *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC20AttributionKitDaemon14SQLiteDatabase_databaseID;
  uint64_t v4 = type metadata accessor for UUID();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();

  swift_bridgeObjectRelease();
}

- (BOOL)connectionNeedsResetForReopen:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100053130(v4);

  return 1;
}

- (BOOL)connectionNeedsResetForCorruption:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100053484((uint64_t)v4);
}

@end