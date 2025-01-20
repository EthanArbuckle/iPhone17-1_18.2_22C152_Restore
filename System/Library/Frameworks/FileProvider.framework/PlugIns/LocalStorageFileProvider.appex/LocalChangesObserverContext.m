@interface LocalChangesObserverContext
- (_TtC24LocalStorageFileProvider27LocalChangesObserverContext)init;
- (int64_t)suggestedBatchSize;
- (void)didDeleteItemsWithIdentifiers:(id)a3;
- (void)didUpdateItems:(id)a3;
- (void)finishEnumeratingChangesUpToSyncAnchor:(id)a3 moreComing:(BOOL)a4;
- (void)finishEnumeratingWithError:(id)a3;
@end

@implementation LocalChangesObserverContext

- (void)finishEnumeratingChangesUpToSyncAnchor:(id)a3 moreComing:(BOOL)a4
{
  id v6 = a3;
  v7 = self;
  sub_100007D10((uint64_t)v6, a4);
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC24LocalStorageFileProvider27LocalChangesObserverContext_localFileEnumerator));

  swift_unknownObjectWeakDestroy();
}

- (int64_t)suggestedBatchSize
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC24LocalStorageFileProvider27LocalChangesObserverContext_observer);
  if (([v2 respondsToSelector:"suggestedBatchSize"] & 1) == 0) {
    return 200;
  }

  return (int64_t)[v2 suggestedBatchSize];
}

- (void)didUpdateItems:(id)a3
{
  sub_10002B7CC((uint64_t *)&unk_100ACAF78);
  unint64_t v4 = sub_10096C0A0();
  v5 = self;
  sub_100036E80(v4);

  swift_bridgeObjectRelease();
}

- (void)didDeleteItemsWithIdentifiers:(id)a3
{
  type metadata accessor for NSFileProviderItemIdentifier(0);
  sub_10096C0A0();
  unint64_t v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC24LocalStorageFileProvider27LocalChangesObserverContext_observer);
  v5 = self;
  Class isa = sub_10096C080().super.isa;
  [v4 didDeleteItemsWithIdentifiers:isa];

  swift_bridgeObjectRelease();
}

- (void)finishEnumeratingWithError:(id)a3
{
  id v5 = a3;
  unint64_t v4 = self;
  sub_1000370F4();
}

- (_TtC24LocalStorageFileProvider27LocalChangesObserverContext)init
{
  result = (_TtC24LocalStorageFileProvider27LocalChangesObserverContext *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end