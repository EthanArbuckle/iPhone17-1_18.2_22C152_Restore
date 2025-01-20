@interface LocalFileEnumerator
- (NSString)description;
- (_TtC24LocalStorageFileProvider19LocalFileEnumerator)init;
- (void)currentSyncAnchorWithCompletionHandler:(id)a3;
- (void)enumerateChangesForObserver:(id)a3 fromSyncAnchor:(id)a4;
- (void)enumerateItemsForObserver:(id)a3 startingAtPage:(id)a4;
- (void)invalidate;
@end

@implementation LocalFileEnumerator

- (NSString)description
{
  v2 = self;
  sub_100008B38();

  NSString v3 = sub_10096BC00();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)enumerateItemsForObserver:(id)a3 startingAtPage:(id)a4
{
}

- (void)enumerateChangesForObserver:(id)a3 fromSyncAnchor:(id)a4
{
}

- (void)currentSyncAnchorWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_10003AFA8((uint64_t)v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)invalidate
{
  v2 = self;
  sub_100039CB4();
}

- (_TtC24LocalStorageFileProvider19LocalFileEnumerator)init
{
  result = (_TtC24LocalStorageFileProvider19LocalFileEnumerator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24LocalStorageFileProvider19LocalFileEnumerator_observedID));
  NSString v3 = (char *)self + OBJC_IVAR____TtC24LocalStorageFileProvider19LocalFileEnumerator_itemURL;
  uint64_t v4 = sub_10096AE50();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  sub_100020314((uint64_t)self + OBJC_IVAR____TtC24LocalStorageFileProvider19LocalFileEnumerator_domain, (uint64_t (*)(void))type metadata accessor for LocalDomain);
  swift_release();
  swift_bridgeObjectRelease();
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC24LocalStorageFileProvider19LocalFileEnumerator_enumeratorsQueue);
}

@end