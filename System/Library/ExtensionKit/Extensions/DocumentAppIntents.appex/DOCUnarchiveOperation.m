@interface DOCUnarchiveOperation
- (NSString)actionNameForUndoing;
- (_TtC18DocumentAppIntents21DOCUnarchiveOperation)initWithItem:(id)a3 destinationFolder:(id)a4;
- (id)operationForRedoing;
- (id)operationForUndoing;
- (void)registerUndo;
@end

@implementation DOCUnarchiveOperation

- (NSString)actionNameForUndoing
{
  v2 = self;
  sub_100278A70();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = sub_1004F44D0();
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
  uint64_t v3 = sub_100278BE0();

  return v3;
}

- (id)operationForUndoing
{
  v2 = self;
  uint64_t v3 = (void *)sub_100278D60();

  return v3;
}

- (void)registerUndo
{
}

- (_TtC18DocumentAppIntents21DOCUnarchiveOperation)initWithItem:(id)a3 destinationFolder:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (_TtC18DocumentAppIntents21DOCUnarchiveOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(void **)&self->FPUnarchiveOperation_opaque[OBJC_IVAR____TtC18DocumentAppIntents21DOCUnarchiveOperation_undoManager];
}

@end