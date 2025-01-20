@interface DOCUntrashOperation
- (NSString)actionNameForUndoing;
- (_TtC14RecentsAvocado19DOCUntrashOperation)initWithItems:(id)a3 restoreDirectory:(id)a4;
- (id)operationForRedoing;
- (id)operationForUndoing;
- (void)registerUndo;
@end

@implementation DOCUntrashOperation

- (NSString)actionNameForUndoing
{
  v2 = self;
  sub_10001E130();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = sub_1004CDB10();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v5 = 0;
  }
  return (NSString *)v5;
}

- (id)operationForRedoing
{
  v2 = self;
  uint64_t v3 = sub_10001E4B0();

  return v3;
}

- (id)operationForUndoing
{
  v2 = self;
  uint64_t v3 = sub_10001E618();

  return v3;
}

- (void)registerUndo
{
}

- (_TtC14RecentsAvocado19DOCUntrashOperation)initWithItems:(id)a3 restoreDirectory:(id)a4
{
  id v4 = a4;
  result = (_TtC14RecentsAvocado19DOCUntrashOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(void **)&self->FPUntrashOperation_opaque[OBJC_IVAR____TtC14RecentsAvocado19DOCUntrashOperation_undoManager];
}

@end