@interface SharedDynamicLayer
- (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D418SharedDynamicLayer)init;
- (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D418SharedDynamicLayer)initWithCoder:(id)a3;
- (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D418SharedDynamicLayer)initWithLayer:(id)a3;
- (void)drawInDisplayList:(id)a3;
@end

@implementation SharedDynamicLayer

- (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D418SharedDynamicLayer)initWithCoder:(id)a3
{
  result = (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D418SharedDynamicLayer *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D418SharedDynamicLayer)initWithLayer:(id)a3
{
  return (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D418SharedDynamicLayer *)@objc TextLinesLayer.init(layer:)((uint64_t)self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(uint64_t *))SharedDynamicLayer.init(layer:));
}

- (_TtC7SwiftUIP33_FB86B422571764190CF2C7C4C92612D418SharedDynamicLayer)init
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = [(RBLayer *)&v4 init];
  -[SharedDynamicLayer setFrame:](v2, sel_setFrame_, 0.0, 0.0, 0.0, 0.0);
  [(SharedDynamicLayer *)v2 setOpaque:0];
  [(SharedDynamicLayer *)v2 setNeedsDisplay];

  return v2;
}

- (void)drawInDisplayList:(id)a3
{
  id v4 = a3;
  v5 = self;
  SharedDynamicLayer.draw(inDisplayList:)(v4);
}

@end