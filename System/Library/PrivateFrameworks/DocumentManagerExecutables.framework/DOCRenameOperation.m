@interface DOCRenameOperation
- (NSString)actionNameForUndoing;
- (_TtC26DocumentManagerExecutables18DOCRenameOperation)initWithItem:(id)a3 newDisplayName:(id)a4;
- (_TtC26DocumentManagerExecutables18DOCRenameOperation)initWithItem:(id)a3 newFileName:(id)a4;
- (_TtC26DocumentManagerExecutables18DOCRenameOperation)initWithItem:(id)a3 newName:(id)a4;
- (id)operationForRedoing;
- (id)operationForUndoing;
- (void)registerUndo;
@end

@implementation DOCRenameOperation

- (NSString)actionNameForUndoing
{
  v2 = self;
  result = (NSString *)(id)_DocumentManagerBundle();
  if (result)
  {
    v4 = result;
    sub_22BE91F78();

    v5 = (void *)sub_22BE92C98();
    swift_bridgeObjectRelease();
    return (NSString *)v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (id)operationForRedoing
{
  v2 = self;
  v3 = sub_22BE06540();

  return v3;
}

- (id)operationForUndoing
{
  v2 = self;
  v3 = sub_22BE066DC();

  return v3;
}

- (void)registerUndo
{
}

- (_TtC26DocumentManagerExecutables18DOCRenameOperation)initWithItem:(id)a3 newName:(id)a4
{
}

- (_TtC26DocumentManagerExecutables18DOCRenameOperation)initWithItem:(id)a3 newFileName:(id)a4
{
}

- (_TtC26DocumentManagerExecutables18DOCRenameOperation)initWithItem:(id)a3 newDisplayName:(id)a4
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables18DOCRenameOperation_item));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC26DocumentManagerExecutables18DOCRenameOperation_undoManager);
}

@end