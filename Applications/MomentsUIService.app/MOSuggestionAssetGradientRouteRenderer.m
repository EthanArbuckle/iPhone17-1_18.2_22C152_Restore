@interface MOSuggestionAssetGradientRouteRenderer
- (_TtC16MomentsUIService38MOSuggestionAssetGradientRouteRenderer)initWithOverlay:(id)a3;
- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5;
@end

@implementation MOSuggestionAssetGradientRouteRenderer

- (void)drawMapRect:(id)a3 zoomScale:(double)a4 inContext:(CGContext *)a5
{
  v7 = a5;
  v8 = self;
  [v8 overlay].boundingMapRect;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  swift_unknownObjectRelease();
  CGFloat v13 = MKRoadWidthAtZoomScale(a4) * 0.666666667;
  [(MOSuggestionAssetGradientRouteRenderer *)v8 applyStrokePropertiesToContext:v7 atZoomScale:a4];
  v14[2] = v8;
  v14[3] = v10;
  v14[4] = v12;
  (*(void (**)(CGContext *, uint64_t (*)(), void *, CGFloat))((swift_isaMask & (uint64_t)v8->super.super.super.isa)
                                                                                   + 0x78))(v7, partial apply for closure #1 in MOSuggestionAssetGradientRouteRenderer.draw(_:zoomScale:in:), v14, v13);
}

- (_TtC16MomentsUIService38MOSuggestionAssetGradientRouteRenderer)initWithOverlay:(id)a3
{
  swift_unknownObjectRetain();
  result = (_TtC16MomentsUIService38MOSuggestionAssetGradientRouteRenderer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end