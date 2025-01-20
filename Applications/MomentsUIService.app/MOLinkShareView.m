@interface MOLinkShareView
- (CGSize)intrinsicContentSize;
- (_TtC16MomentsUIService15MOLinkShareView)initWithFrame:(CGRect)a3;
- (_TtC16MomentsUIService15MOLinkShareView)initWithMetadata:(id)a3;
- (_TtC16MomentsUIService15MOLinkShareView)initWithMetadataLoadedFromRequest:(id)a3;
- (_TtC16MomentsUIService15MOLinkShareView)initWithMetadataLoadedFromURL:(id)a3;
- (_TtC16MomentsUIService15MOLinkShareView)initWithPresentationProperties:(id)a3;
- (_TtC16MomentsUIService15MOLinkShareView)initWithPresentationProperties:(id)a3 URL:(id)a4;
- (_TtC16MomentsUIService15MOLinkShareView)initWithURL:(id)a3;
@end

@implementation MOLinkShareView

- (CGSize)intrinsicContentSize
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for MOLinkShareView();
  [(MOLinkShareView *)&v4 intrinsicContentSize];
  double v3 = 0.0;
  result.height = v2;
  result.width = v3;
  return result;
}

- (_TtC16MomentsUIService15MOLinkShareView)initWithURL:(id)a3
{
  return (_TtC16MomentsUIService15MOLinkShareView *)@objc MOLinkShareView.init(url:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))&type metadata accessor for URL, (uint64_t (*)(uint64_t))&static URL._unconditionallyBridgeFromObjectiveC(_:), (uint64_t (*)(uint64_t))&URL._bridgeToObjectiveC(), (SEL *)&selRef_initWithURL_);
}

- (_TtC16MomentsUIService15MOLinkShareView)initWithMetadata:(id)a3
{
  return (_TtC16MomentsUIService15MOLinkShareView *)@objc MOLinkShareView.init(metadata:)(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithMetadata_);
}

- (_TtC16MomentsUIService15MOLinkShareView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MOLinkShareView();
  return -[MOLinkShareView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC16MomentsUIService15MOLinkShareView)initWithPresentationProperties:(id)a3
{
  return (_TtC16MomentsUIService15MOLinkShareView *)@objc MOLinkShareView.init(metadata:)(self, (uint64_t)a2, (uint64_t)a3, (SEL *)&selRef_initWithPresentationProperties_);
}

- (_TtC16MomentsUIService15MOLinkShareView)initWithPresentationProperties:(id)a3 URL:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for URL?);
  uint64_t v8 = __chkstk_darwin(v7 - 8);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v8);
  v12 = (char *)&v22 - v11;
  if (a4)
  {
    static URL._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v13 = type metadata accessor for URL();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 0, 1, v13);
  }
  else
  {
    uint64_t v13 = type metadata accessor for URL();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v12, 1, 1, v13);
  }
  outlined init with copy of URL?((uint64_t)v12, (uint64_t)v10);
  type metadata accessor for URL();
  uint64_t v14 = *(void *)(v13 - 8);
  int v15 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v14 + 48))(v10, 1, v13);
  swift_unknownObjectRetain();
  v17 = 0;
  if (v15 != 1)
  {
    URL._bridgeToObjectiveC()(v16);
    v17 = v18;
    (*(void (**)(char *, uint64_t))(v14 + 8))(v10, v13);
  }
  v19 = (objc_class *)type metadata accessor for MOLinkShareView();
  v22.receiver = self;
  v22.super_class = v19;
  v20 = [(MOLinkShareView *)&v22 initWithPresentationProperties:a3 URL:v17];
  swift_unknownObjectRelease();

  outlined destroy of URL?((uint64_t)v12);
  return v20;
}

- (_TtC16MomentsUIService15MOLinkShareView)initWithMetadataLoadedFromURL:(id)a3
{
  return (_TtC16MomentsUIService15MOLinkShareView *)@objc MOLinkShareView.init(url:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))&type metadata accessor for URL, (uint64_t (*)(uint64_t))&static URL._unconditionallyBridgeFromObjectiveC(_:), (uint64_t (*)(uint64_t))&URL._bridgeToObjectiveC(), (SEL *)&selRef_initWithMetadataLoadedFromURL_);
}

- (_TtC16MomentsUIService15MOLinkShareView)initWithMetadataLoadedFromRequest:(id)a3
{
  return (_TtC16MomentsUIService15MOLinkShareView *)@objc MOLinkShareView.init(url:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(void))&type metadata accessor for URLRequest, (uint64_t (*)(uint64_t))&static URLRequest._unconditionallyBridgeFromObjectiveC(_:), (uint64_t (*)(uint64_t))&URLRequest._bridgeToObjectiveC(), (SEL *)&selRef_initWithMetadataLoadedFromRequest_);
}

@end