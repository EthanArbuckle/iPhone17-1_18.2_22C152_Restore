@interface EDPersistedMessageID
- (BOOL)isEqual:(id)a3;
- (EDPersistedMessageID)init;
- (EDPersistedMessageID)initWithDatabaseID:(int64_t)a3;
- (EDPersistedMessageID)initWithString:(id)a3;
- (NSString)description;
- (NSString)stringValue;
- (int64_t)databaseID;
- (int64_t)hash;
@end

@implementation EDPersistedMessageID

- (int64_t)databaseID
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___EDPersistedMessageID_databaseID);
}

- (NSString)stringValue
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1DB5E1868();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (EDPersistedMessageID)initWithDatabaseID:(int64_t)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___EDPersistedMessageID_databaseID) = (Class)a3;
  v3 = self;
  id v4 = (id)EFStringWithInt64();
  uint64_t v5 = sub_1DB5E1898();
  uint64_t v7 = v6;

  v8 = (uint64_t *)((char *)v3 + OBJC_IVAR___EDPersistedMessageID_stringValue);
  uint64_t *v8 = v5;
  v8[1] = v7;

  v10.receiver = v3;
  v10.super_class = (Class)EDPersistedMessageID;
  return [(EDPersistedMessageID *)&v10 init];
}

- (EDPersistedMessageID)initWithString:(id)a3
{
  sub_1DB5E1898();
  id v4 = (void *)sub_1DB5E1868();
  swift_bridgeObjectRelease();
  id v5 = objc_msgSend(v4, sel_longLongValue);

  return [(EDPersistedMessageID *)self initWithDatabaseID:v5];
}

- (NSString)description
{
  v2 = self;
  v3 = [(EDPersistedMessageID *)v2 stringValue];
  sub_1DB5E1898();

  id v4 = (void *)sub_1DB5E1868();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_1DB5E1B38();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    id v5 = self;
  }
  BOOL v6 = EDPersistedMessageID.isEqual(_:)((uint64_t)v8);

  sub_1DB5A7520((uint64_t)v8);
  return v6;
}

- (int64_t)hash
{
  v2 = self;
  [(EDPersistedMessageID *)v2 databaseID];
  int64_t v3 = sub_1DB5E1E08();

  return v3;
}

- (EDPersistedMessageID)init
{
  result = (EDPersistedMessageID *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end