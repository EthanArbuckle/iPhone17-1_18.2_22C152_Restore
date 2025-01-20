@interface LocalRootEnumerator
- (NSString)description;
- (_TtC24LocalStorageFileProvider19LocalRootEnumerator)init;
- (void)currentSyncAnchorWithCompletionHandler:(id)a3;
- (void)enumerateChangesForObserver:(id)a3 fromSyncAnchor:(id)a4;
- (void)enumerateItemsForObserver:(id)a3 startingAtPage:(id)a4;
- (void)invalidate;
@end

@implementation LocalRootEnumerator

- (NSString)description
{
  v2 = self;
  sub_1000090A4();

  NSString v3 = sub_10096BC00();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)enumerateChangesForObserver:(id)a3 fromSyncAnchor:(id)a4
{
}

- (void)enumerateItemsForObserver:(id)a3 startingAtPage:(id)a4
{
}

- (void)currentSyncAnchorWithCompletionHandler:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC24LocalStorageFileProvider19LocalRootEnumerator_fileEnumerator);
  v7 = self;
  id v8 = v6;
  sub_10003B494((uint64_t)v8, (void (*)(void))sub_100082804, v5, (uint64_t)v7);

  swift_release();
}

- (void)invalidate
{
  v2 = self;
  sub_10008242C();
}

- (_TtC24LocalStorageFileProvider19LocalRootEnumerator)init
{
  result = (_TtC24LocalStorageFileProvider19LocalRootEnumerator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1000203D4((uint64_t)self + OBJC_IVAR____TtC24LocalStorageFileProvider19LocalRootEnumerator_domain, (uint64_t (*)(void))type metadata accessor for LocalDomain);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24LocalStorageFileProvider19LocalRootEnumerator_fileEnumerator));
  sub_1000203D4((uint64_t)self + OBJC_IVAR____TtC24LocalStorageFileProvider19LocalRootEnumerator_containerSnapshot, type metadata accessor for LocalContainerSnapshot);
}

@end