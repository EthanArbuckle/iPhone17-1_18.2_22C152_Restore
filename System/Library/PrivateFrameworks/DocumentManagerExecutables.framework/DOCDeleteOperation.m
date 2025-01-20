@interface DOCDeleteOperation
- (NSString)actionNameForUndoing;
- (_TtC26DocumentManagerExecutables18DOCDeleteOperation)initWithItems:(id)a3;
- (id)operationForRedoing;
- (id)operationForUndoing;
- (void)registerUndo;
@end

@implementation DOCDeleteOperation

- (NSString)actionNameForUndoing
{
  return (NSString *)0;
}

- (id)operationForRedoing
{
  v2 = self;
  v3 = sub_22BE2506C();

  return v3;
}

- (id)operationForUndoing
{
  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC26DocumentManagerExecutables18DOCDeleteOperation_undoManager);
  v3 = self;
  objc_msgSend(v2, sel_setShouldRemoveAllActions_, 1);
  v4 = *(Class *)((char *)&v3->super.super.super.super.super.isa
                + OBJC_IVAR____TtC26DocumentManagerExecutables18DOCDeleteOperation_originalOperation);
  if (v4) {
    id v5 = objc_msgSend(v4, sel_operationForRedoing);
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (void)registerUndo
{
}

- (_TtC26DocumentManagerExecutables18DOCDeleteOperation)initWithItems:(id)a3
{
  result = (_TtC26DocumentManagerExecutables18DOCDeleteOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC26DocumentManagerExecutables18DOCDeleteOperation_undoManager);
}

@end