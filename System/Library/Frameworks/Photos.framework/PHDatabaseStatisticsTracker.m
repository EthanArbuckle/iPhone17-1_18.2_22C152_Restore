@interface PHDatabaseStatisticsTracker
- (NSArray)sqlStatements;
- (_TtC6Photos27PHDatabaseStatisticsTracker)init;
- (int64_t)currentByteCount;
- (void)addManagedObjectContext:(id)a3;
- (void)disableGatheringSqlStatements;
- (void)enableGatheringSqlStatements;
- (void)managedObjectContext:(id)a3 didExecuteFetchRequest:(id)a4 withSQLString:(id)a5 bindVariables:(id)a6 rowCount:(int64_t)a7;
- (void)removeAllSqlStatements;
@end

@implementation PHDatabaseStatisticsTracker

- (void)addManagedObjectContext:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19B077E34(v4);
}

- (_TtC6Photos27PHDatabaseStatisticsTracker)init
{
  return (_TtC6Photos27PHDatabaseStatisticsTracker *)sub_19B045ED4();
}

- (int64_t)currentByteCount
{
  v2 = self;
  int64_t v3 = sub_19B088BF8();

  return v3;
}

- (void)enableGatheringSqlStatements
{
  v2 = self;
  sub_19B088EF4();
}

- (void)disableGatheringSqlStatements
{
  v2 = self;
  sub_19B089288();
}

- (NSArray)sqlStatements
{
  v2 = self;
  sub_19B0896E8();

  int64_t v3 = (void *)sub_19B2A97D0();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (void)removeAllSqlStatements
{
  v2 = self;
  sub_19B089760();
}

- (void)managedObjectContext:(id)a3 didExecuteFetchRequest:(id)a4 withSQLString:(id)a5 bindVariables:(id)a6 rowCount:(int64_t)a7
{
  uint64_t v10 = sub_19B2A9790();
  uint64_t v12 = v11;
  uint64_t v13 = sub_19B2A97E0();
  id v14 = a3;
  id v15 = a4;
  v16 = self;
  sub_19B089840((uint64_t)v16, v17, v10, v12, v13);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

- (void).cxx_destruct
{
}

@end