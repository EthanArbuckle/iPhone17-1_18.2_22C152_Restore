@interface DOCCopyOperation
- (NSDictionary)transferResults;
- (NSString)actionNameForUndoing;
- (_TtC14RecentsAvocado16DOCCopyOperation)initWithItems:(id)a3 destinationFolder:(id)a4;
- (_TtC14RecentsAvocado16DOCCopyOperation)initWithItems:(id)a3 destinationURL:(id)a4;
- (_TtC14RecentsAvocado16DOCCopyOperation)initWithSourceURLs:(id)a3 destinationFolder:(id)a4;
- (_TtC14RecentsAvocado16DOCCopyOperation)initWithSourceURLsAndNames:(id)a3 destinationFolder:(id)a4;
- (_TtC14RecentsAvocado16DOCCopyOperation)initWithURLs:(id)a3 destinationFolder:(id)a4;
- (id)operationForRedoing;
- (id)operationForUndoing;
- (void)actionMain;
- (void)presendNotifications;
- (void)registerUndo;
@end

@implementation DOCCopyOperation

- (void)presendNotifications
{
  v2 = self;
  if (DOCCopyOperation.handlePresendNotifications_asDSCopy()())
  {
  }
  else
  {
    v3.receiver = v2;
    v3.super_class = (Class)type metadata accessor for DOCCopyOperation();
    [(DOCCopyOperation *)&v3 presendNotifications];
  }
}

- (void)actionMain
{
  v2 = self;
  DOCCopyOperation.actionMain()();
}

- (NSString)actionNameForUndoing
{
  uint64_t v2 = *(void *)(*(void *)&self->FPCopyOperation_opaque[OBJC_IVAR____TtC14RecentsAvocado16DOCCopyOperation_sourceURLs]
                 + 16);
  objc_super v3 = self;
  if (v2) {
    sub_1003163A8();
  }
  else {
    sub_100315E60();
  }
  uint64_t v5 = v4;

  if (v5)
  {
    NSString v6 = sub_1004CDB10();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v6 = 0;
  }
  return (NSString *)v6;
}

- (id)operationForRedoing
{
  uint64_t v2 = self;
  objc_super v3 = DOCCopyOperation.operationForRedoing()();

  return v3;
}

- (id)operationForUndoing
{
  uint64_t v2 = self;
  id v3 = DOCCopyOperation.operationForUndoing()();

  return v3;
}

- (void)registerUndo
{
}

- (_TtC14RecentsAvocado16DOCCopyOperation)initWithItems:(id)a3 destinationFolder:(id)a4
{
}

- (_TtC14RecentsAvocado16DOCCopyOperation)initWithURLs:(id)a3 destinationFolder:(id)a4
{
}

- (_TtC14RecentsAvocado16DOCCopyOperation)initWithItems:(id)a3 destinationURL:(id)a4
{
  uint64_t v4 = sub_1004CAC10();
  __chkstk_darwin(v4 - 8);
  sub_1004CABC0();
  result = (_TtC14RecentsAvocado16DOCCopyOperation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC14RecentsAvocado16DOCCopyOperation)initWithSourceURLs:(id)a3 destinationFolder:(id)a4
{
}

- (_TtC14RecentsAvocado16DOCCopyOperation)initWithSourceURLsAndNames:(id)a3 destinationFolder:(id)a4
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  id v3 = *(void **)&self->FPCopyOperation_opaque[OBJC_IVAR____TtC14RecentsAvocado16DOCCopyOperation_undoManager];
}

- (NSDictionary)transferResults
{
  uint64_t v2 = self;
  uint64_t v3 = DOCCopyOperation.transferResults.getter();

  if (v3)
  {
    sub_1000333C8(0, (unint64_t *)&qword_100627EE0);
    v4.super.isa = sub_1004CD990().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }
  return (NSDictionary *)v4.super.isa;
}

@end