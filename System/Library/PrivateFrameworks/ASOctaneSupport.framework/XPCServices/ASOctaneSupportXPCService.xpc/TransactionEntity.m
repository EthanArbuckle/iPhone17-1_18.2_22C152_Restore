@interface TransactionEntity
+ (Class)memoryEntityClass;
+ (id)databaseTable;
- (_TtC25ASOctaneSupportXPCService17TransactionEntity)init;
- (_TtC25ASOctaneSupportXPCService17TransactionEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4;
- (_TtC25ASOctaneSupportXPCService17TransactionEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4;
@end

@implementation TransactionEntity

+ (id)databaseTable
{
  sub_100153568();
  NSString v2 = sub_10024E6A0();
  swift_bridgeObjectRelease();
  return v2;
}

+ (Class)memoryEntityClass
{
  sub_1001535D4();
  return (Class)swift_getObjCClassFromMetadata();
}

- (_TtC25ASOctaneSupportXPCService17TransactionEntity)initWithPropertyValues:(id)a3 onConnection:(id)a4
{
  uint64_t v5 = sub_10024E4F0();
  return (_TtC25ASOctaneSupportXPCService17TransactionEntity *)sub_100153694(v5, a4);
}

- (_TtC25ASOctaneSupportXPCService17TransactionEntity)initWithPersistentID:(int64_t)a3 onConnection:(id)a4
{
  return (_TtC25ASOctaneSupportXPCService17TransactionEntity *)sub_10015378C(a3, a4);
}

- (_TtC25ASOctaneSupportXPCService17TransactionEntity)init
{
  return (_TtC25ASOctaneSupportXPCService17TransactionEntity *)sub_100153820();
}

@end