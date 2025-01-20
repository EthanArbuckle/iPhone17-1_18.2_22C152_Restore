@interface DOCCreateFolderOperation
- (NSString)actionNameForUndoing;
- (_TtC26DocumentManagerExecutables24DOCCreateFolderOperation)initWithParentItem:(id)a3 folderName:(id)a4;
- (id)operationForRedoing;
- (id)operationForUndoing;
- (void)registerUndo;
@end

@implementation DOCCreateFolderOperation

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
  v3 = sub_22BE6AA60();

  return v3;
}

- (id)operationForUndoing
{
  v2 = self;
  v3 = sub_22BE6AC50();

  return v3;
}

- (void)registerUndo
{
}

- (_TtC26DocumentManagerExecutables24DOCCreateFolderOperation)initWithParentItem:(id)a3 folderName:(id)a4
{
  id v4 = a3;
  result = (_TtC26DocumentManagerExecutables24DOCCreateFolderOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCCreateFolderOperation_parentItem));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCCreateFolderOperation_folderItem));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC26DocumentManagerExecutables24DOCCreateFolderOperation_undoManager);
}

@end