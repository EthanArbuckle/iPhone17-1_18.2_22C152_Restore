@interface DOCTrashOperation
- (NSString)actionNameForUndoing;
- (_TtC11SaveToFiles17DOCTrashOperation)initWithItems:(id)a3;
- (id)operationForRedoing;
- (id)operationForUndoing;
- (void)actionMain;
- (void)registerUndo;
@end

@implementation DOCTrashOperation

- (void)actionMain
{
  v2 = self;
  sub_1003B194C();
}

- (NSString)actionNameForUndoing
{
  v2 = self;
  sub_1003B1B38();
  uint64_t v4 = v3;

  if (v4)
  {
    NSString v5 = sub_1004D1200();
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
  uint64_t v3 = sub_1003B1EA8();

  return v3;
}

- (id)operationForUndoing
{
  v2 = self;
  uint64_t v3 = sub_1003B207C();

  return v3;
}

- (void)registerUndo
{
}

- (_TtC11SaveToFiles17DOCTrashOperation)initWithItems:(id)a3
{
  result = (_TtC11SaveToFiles17DOCTrashOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  uint64_t v3 = *(void **)&self->FPTrashOperation_opaque[OBJC_IVAR____TtC11SaveToFiles17DOCTrashOperation_undoManager];
}

@end