@interface ArtworkItemProvider
- (_TtC19AppStoreKitInternal19ArtworkItemProvider)init;
- (_TtC19AppStoreKitInternal19ArtworkItemProvider)initWithItem:(id)a3 typeIdentifier:(id)a4;
- (id)loadDataRepresentationForTypeIdentifier:(id)a3 completionHandler:(id)a4;
@end

@implementation ArtworkItemProvider

- (id)loadDataRepresentationForTypeIdentifier:(id)a3 completionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  uint64_t v6 = sub_1E1D5BE58();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  v10 = self;
  id v11 = ArtworkItemProvider.loadDataRepresentation(forTypeIdentifier:completionHandler:)(v6, v8, (uint64_t)sub_1E1C9F290, v9);

  swift_bridgeObjectRelease();
  swift_release();
  return v11;
}

- (_TtC19AppStoreKitInternal19ArtworkItemProvider)init
{
  result = (_TtC19AppStoreKitInternal19ArtworkItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC19AppStoreKitInternal19ArtworkItemProvider)initWithItem:(id)a3 typeIdentifier:(id)a4
{
  swift_unknownObjectRetain();
  result = (_TtC19AppStoreKitInternal19ArtworkItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
}

@end