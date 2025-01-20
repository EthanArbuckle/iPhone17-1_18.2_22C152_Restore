@interface ECLocalMessageActionID
- (BOOL)isEqual:(id)a3;
- (ECLocalMessageActionID)init;
- (ECLocalMessageActionID)initWithDatabaseID:(int64_t)a3;
- (NSString)description;
- (NSString)stringValue;
- (int64_t)databaseID;
- (int64_t)hash;
@end

@implementation ECLocalMessageActionID

- (int64_t)databaseID
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___ECLocalMessageActionID_databaseID);
}

- (NSString)stringValue
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1BF172130();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (ECLocalMessageActionID)initWithDatabaseID:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ECLocalMessageActionID_databaseID) = (Class)a3;
  v3 = self;
  id v4 = (id)EFStringWithInt64();
  uint64_t v5 = sub_1BF172140();
  uint64_t v7 = v6;

  v8 = (uint64_t *)((char *)v3 + OBJC_IVAR___ECLocalMessageActionID_stringValue);
  uint64_t *v8 = v5;
  v8[1] = v7;

  v10.receiver = v3;
  v10.super_class = (Class)ECLocalMessageActionID;
  return [(ECLocalMessageActionID *)&v10 init];
}

- (NSString)description
{
  v2 = self;
  v3 = [(ECLocalMessageActionID *)v2 stringValue];
  sub_1BF172140();

  id v4 = (void *)sub_1BF172130();
  swift_bridgeObjectRelease();
  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1BF172150();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    uint64_t v5 = self;
  }
  BOOL v6 = ECLocalMessageActionID.isEqual(_:)((uint64_t)v8);

  sub_1BF15886C((uint64_t)v8);
  return v6;
}

- (int64_t)hash
{
  v2 = self;
  [(ECLocalMessageActionID *)v2 databaseID];
  int64_t v3 = sub_1BF172160();

  return v3;
}

- (ECLocalMessageActionID)init
{
  result = (ECLocalMessageActionID *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end