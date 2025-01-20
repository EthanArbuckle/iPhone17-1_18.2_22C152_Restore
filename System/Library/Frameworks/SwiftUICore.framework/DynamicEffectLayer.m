@interface DynamicEffectLayer
- (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D418DynamicEffectLayer)init;
- (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D418DynamicEffectLayer)initWithCoder:(id)a3;
- (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D418DynamicEffectLayer)initWithLayer:(id)a3;
- (void)drawInDisplayList:(id)a3;
@end

@implementation DynamicEffectLayer

- (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D418DynamicEffectLayer)initWithCoder:(id)a3
{
  result = (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D418DynamicEffectLayer *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D418DynamicEffectLayer)initWithLayer:(id)a3
{
  return (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D418DynamicEffectLayer *)@objc StaticEffectLayer.init(layer:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D418DynamicEffectLayer_content, &OBJC_IVAR____TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D418DynamicEffectLayer_segmentIndex);
}

- (void)drawInDisplayList:(id)a3
{
  id v4 = a3;
  v5 = self;
  DynamicEffectLayer.draw(inDisplayList:)(v4);
}

- (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D418DynamicEffectLayer)init
{
  result = (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D418DynamicEffectLayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end