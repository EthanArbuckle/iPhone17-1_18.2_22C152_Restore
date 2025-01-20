@interface DOCUnarchiveOperation
- (NSString)actionNameForUndoing;
- (_TtC33com_apple_DocumentManager_Service21DOCUnarchiveOperation)initWithItem:(id)a3 destinationFolder:(id)a4;
- (id)operationForRedoing;
- (id)operationForUndoing;
- (void)registerUndo;
@end

@implementation DOCUnarchiveOperation

- (NSString)actionNameForUndoing
{
  v2 = self;
  sub_1004C34A8();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = sub_1004CD2B0();
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
  uint64_t v3 = sub_1004C3618();

  return v3;
}

- (id)operationForUndoing
{
  v2 = self;
  uint64_t v3 = (void *)sub_1004C3798();

  return v3;
}

- (void)registerUndo
{
}

- (_TtC33com_apple_DocumentManager_Service21DOCUnarchiveOperation)initWithItem:(id)a3 destinationFolder:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (_TtC33com_apple_DocumentManager_Service21DOCUnarchiveOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(void **)&self->FPUnarchiveOperation_opaque[OBJC_IVAR____TtC33com_apple_DocumentManager_Service21DOCUnarchiveOperation_undoManager];
}

@end