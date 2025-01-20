@interface DOCMoveOperation
- (NSString)actionNameForUndoing;
- (_TtC14RecentsAvocado16DOCMoveOperation)initWithItems:(id)a3 destinationFolder:(id)a4;
- (_TtC14RecentsAvocado16DOCMoveOperation)initWithItems:(id)a3 destinationURL:(id)a4;
- (_TtC14RecentsAvocado16DOCMoveOperation)initWithSourceURLs:(id)a3 destinationFolder:(id)a4;
- (_TtC14RecentsAvocado16DOCMoveOperation)initWithSourceURLsAndNames:(id)a3 destinationFolder:(id)a4;
- (_TtC14RecentsAvocado16DOCMoveOperation)initWithURLs:(id)a3 destinationFolder:(id)a4;
- (id)operationForRedoing;
- (id)operationForUndoing;
- (void)actionMain;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)presendNotifications;
- (void)registerUndo;
@end

@implementation DOCMoveOperation

- (_TtC14RecentsAvocado16DOCMoveOperation)initWithURLs:(id)a3 destinationFolder:(id)a4
{
  sub_1004CAC10();
  uint64_t v5 = sub_1004CDE30();
  return (_TtC14RecentsAvocado16DOCMoveOperation *)sub_100446674(v5, a4);
}

- (void)presendNotifications
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCMoveOperation();
  id v2 = v4.receiver;
  [(DOCMoveOperation *)&v4 presendNotifications];
  id v3 = objc_msgSend(self, "defaultCenter", v4.receiver, v4.super_class);
  if (qword_100626AA8 != -1) {
    swift_once();
  }
  [v3 postNotificationName:qword_100650910 object:v2];
}

- (void)actionMain
{
  id v2 = self;
  sub_1004469BC();
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  if (a3)
  {
    id v6 = a4;
    v7 = self;
    swift_unknownObjectRetain();
    sub_1004CF2A0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v8 = a4;
    v9 = self;
  }
  sub_100446B50((uint64_t)v10, a4);

  sub_100035F60((uint64_t)v10);
}

- (NSString)actionNameForUndoing
{
  id v2 = self;
  sub_1004470C0();
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
  id v2 = *(void **)&self->FPMoveOperation_opaque[OBJC_IVAR____TtC14RecentsAvocado16DOCMoveOperation_undoManager];
  if (v2)
  {
    uint64_t v4 = *(void *)&self->FPMoveOperation_opaque[OBJC_IVAR____TtC14RecentsAvocado16DOCMoveOperation_sourceItems];
    NSString v5 = *(void **)&self->FPMoveOperation_opaque[OBJC_IVAR____TtC14RecentsAvocado16DOCMoveOperation_destinationFolderItem];
    objc_allocWithZone((Class)type metadata accessor for DOCMoveOperation());
    id v6 = self;
    id v7 = v2;
    swift_bridgeObjectRetain();
    id v8 = sub_1004467C4(v4, v5, v7);
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (id)operationForUndoing
{
  id v2 = self;
  uint64_t v3 = sub_1004474A8();

  return v3;
}

- (void)registerUndo
{
  uint64_t v3 = *(void **)&self->FPMoveOperation_opaque[OBJC_IVAR____TtC14RecentsAvocado16DOCMoveOperation_undoManager];
  if (v3) {
    [v3 registerUndoOperationForSender:self];
  }
}

- (_TtC14RecentsAvocado16DOCMoveOperation)initWithItems:(id)a3 destinationFolder:(id)a4
{
}

- (_TtC14RecentsAvocado16DOCMoveOperation)initWithItems:(id)a3 destinationURL:(id)a4
{
  uint64_t v4 = sub_1004CAC10();
  __chkstk_darwin(v4 - 8);
  sub_1004CABC0();
  result = (_TtC14RecentsAvocado16DOCMoveOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC14RecentsAvocado16DOCMoveOperation)initWithSourceURLs:(id)a3 destinationFolder:(id)a4
{
}

- (_TtC14RecentsAvocado16DOCMoveOperation)initWithSourceURLsAndNames:(id)a3 destinationFolder:(id)a4
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  uint64_t v3 = *(void **)&self->FPMoveOperation_opaque[OBJC_IVAR____TtC14RecentsAvocado16DOCMoveOperation_undoManager];
}

@end