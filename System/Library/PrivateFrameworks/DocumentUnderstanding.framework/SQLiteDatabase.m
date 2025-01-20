@interface SQLiteDatabase
- (_TtC21DocumentUnderstanding14SQLiteDatabase)init;
- (void)dealloc;
@end

@implementation SQLiteDatabase

- (void)dealloc
{
  v2 = self;
  SQLiteDatabase.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC21DocumentUnderstanding14SQLiteDatabase_internalSQLiteDB));
  swift_bridgeObjectRelease();
  sub_2367D5B2C((uint64_t)self + OBJC_IVAR____TtC21DocumentUnderstanding14SQLiteDatabase_temporaryURL);
  swift_bridgeObjectRelease();
}

- (_TtC21DocumentUnderstanding14SQLiteDatabase)init
{
}

@end