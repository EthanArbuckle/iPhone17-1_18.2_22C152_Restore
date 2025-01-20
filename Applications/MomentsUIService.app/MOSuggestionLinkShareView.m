@interface MOSuggestionLinkShareView
- (_TtC16MomentsUIService25MOSuggestionLinkShareView)initWithFrame:(CGRect)a3;
- (_TtC16MomentsUIService25MOSuggestionLinkShareView)initWithMetadata:(id)a3;
- (_TtC16MomentsUIService25MOSuggestionLinkShareView)initWithMetadataLoadedFromRequest:(id)a3;
- (_TtC16MomentsUIService25MOSuggestionLinkShareView)initWithMetadataLoadedFromURL:(id)a3;
- (_TtC16MomentsUIService25MOSuggestionLinkShareView)initWithPresentationProperties:(id)a3;
- (_TtC16MomentsUIService25MOSuggestionLinkShareView)initWithPresentationProperties:(id)a3 URL:(id)a4;
- (_TtC16MomentsUIService25MOSuggestionLinkShareView)initWithURL:(id)a3;
@end

@implementation MOSuggestionLinkShareView

- (_TtC16MomentsUIService25MOSuggestionLinkShareView)initWithURL:(id)a3
{
}

- (_TtC16MomentsUIService25MOSuggestionLinkShareView)initWithMetadata:(id)a3
{
  id v3 = a3;
  result = (_TtC16MomentsUIService25MOSuggestionLinkShareView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC16MomentsUIService25MOSuggestionLinkShareView)initWithFrame:(CGRect)a3
{
}

- (_TtC16MomentsUIService25MOSuggestionLinkShareView)initWithPresentationProperties:(id)a3
{
  swift_unknownObjectRetain();
  result = (_TtC16MomentsUIService25MOSuggestionLinkShareView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC16MomentsUIService25MOSuggestionLinkShareView)initWithPresentationProperties:(id)a3 URL:(id)a4
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = type metadata accessor for URL();
    uint64_t v10 = 0;
    v9 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
  }
  else
  {
    uint64_t v8 = type metadata accessor for URL();
    v9 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56);
    uint64_t v10 = 1;
  }
  (*v9)(v7, v10, 1, v8);
  swift_unknownObjectRetain();
  result = (_TtC16MomentsUIService25MOSuggestionLinkShareView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC16MomentsUIService25MOSuggestionLinkShareView)initWithMetadataLoadedFromURL:(id)a3
{
}

- (_TtC16MomentsUIService25MOSuggestionLinkShareView)initWithMetadataLoadedFromRequest:(id)a3
{
}

@end