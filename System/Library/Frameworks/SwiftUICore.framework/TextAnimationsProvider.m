@interface TextAnimationsProvider
+ (CGRect)drawStaticString:(id)a3 withAttributes:(id)a4 options:(unint64_t)a5 inRect:(CGRect)a6 withPadding:(double)a7 forceClipping:(BOOL)a8 cgContext:(CGContext *)a9 stringDrawingContext:(id)a10;
+ (id)animationNamesForDomain:(id)a3;
+ (id)animationRenderer;
+ (id)animationWithName:(id)a3;
+ (id)animationWithName:(id)a3 localeIdentifier:(id)a4;
- (_TtC7SwiftUI22TextAnimationsProvider)init;
@end

@implementation TextAnimationsProvider

+ (id)animationNamesForDomain:(id)a3
{
  if (a3) {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
  }
  swift_bridgeObjectRelease();
  v3.super.isa = Array._bridgeToObjectiveC()().super.isa;

  return v3.super.isa;
}

+ (id)animationRenderer
{
  id v2 = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for TextEffectsRenderer()), sel_init);

  return v2;
}

+ (id)animationWithName:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v5 = specialized static TextAnimationsProvider.textEffect(named:)(v3, v4);
  swift_bridgeObjectRelease();

  return v5;
}

+ (id)animationWithName:(id)a3 localeIdentifier:(id)a4
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v6 = specialized static TextAnimationsProvider.textEffect(named:)(v4, v5);
  swift_bridgeObjectRelease();

  return v6;
}

+ (CGRect)drawStaticString:(id)a3 withAttributes:(id)a4 options:(unint64_t)a5 inRect:(CGRect)a6 withPadding:(double)a7 forceClipping:(BOOL)a8 cgContext:(CGContext *)a9 stringDrawingContext:(id)a10
{
  CGFloat height = a6.size.height;
  CGFloat width = a6.size.width;
  CGFloat y = a6.origin.y;
  CGFloat x = a6.origin.x;
  swift_unknownObjectRetain();
  id v18 = a10;
  id v19 = a4;
  v20 = a9;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  if (v19)
  {
    uint64_t v21 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
  }
  else
  {
    uint64_t v21 = 0;
  }
  specialized static TextAnimationsProvider.drawStatic(string:attributes:options:rect:padding:forceClipping:cgContext:stringDrawingContext:)((uint64_t)v34, v21, v20, v18, x, y, width, height, a7);
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v34);
  double v30 = v23;
  double v31 = v25;
  double v32 = v27;
  double v33 = v29;
  result.size.CGFloat height = v33;
  result.size.CGFloat width = v32;
  result.origin.CGFloat y = v31;
  result.origin.CGFloat x = v30;
  return result;
}

- (_TtC7SwiftUI22TextAnimationsProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(TextAnimationsProvider *)&v3 init];
}

@end