@interface StaticEffectLayer
- (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D417StaticEffectLayer)init;
- (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D417StaticEffectLayer)initWithCoder:(id)a3;
- (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D417StaticEffectLayer)initWithLayer:(id)a3;
- (void)drawInContext:(CGContext *)a3;
@end

@implementation StaticEffectLayer

- (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D417StaticEffectLayer)initWithCoder:(id)a3
{
  result = (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D417StaticEffectLayer *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D417StaticEffectLayer)initWithLayer:(id)a3
{
  return (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D417StaticEffectLayer *)@objc StaticEffectLayer.init(layer:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D417StaticEffectLayer_content, &OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D417StaticEffectLayer_segmentIndex);
}

- (void)drawInContext:(CGContext *)a3
{
  v4 = a3;
  v5 = self;
  StaticEffectLayer.draw(in:)(v4);
}

- (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D417StaticEffectLayer)init
{
  result = (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D417StaticEffectLayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end