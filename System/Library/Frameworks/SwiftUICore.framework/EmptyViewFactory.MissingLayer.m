@interface EmptyViewFactory.MissingLayer
- (BOOL)needsDisplayOnBoundsChange;
- (_TtCV7SwiftUI16EmptyViewFactoryP33_7A45621CE16223183E03CAC88E8C5E6012MissingLayer)init;
- (_TtCV7SwiftUI16EmptyViewFactoryP33_7A45621CE16223183E03CAC88E8C5E6012MissingLayer)initWithCoder:(id)a3;
- (_TtCV7SwiftUI16EmptyViewFactoryP33_7A45621CE16223183E03CAC88E8C5E6012MissingLayer)initWithLayer:(id)a3;
- (void)drawInContext:(CGContext *)a3;
@end

@implementation EmptyViewFactory.MissingLayer

- (BOOL)needsDisplayOnBoundsChange
{
  return 1;
}

- (void)drawInContext:(CGContext *)a3
{
  v4 = a3;
  v5 = self;
  EmptyViewFactory.MissingLayer.draw(in:)(v4);
}

- (_TtCV7SwiftUI16EmptyViewFactoryP33_7A45621CE16223183E03CAC88E8C5E6012MissingLayer)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(EmptyViewFactory.MissingLayer *)&v3 init];
}

- (_TtCV7SwiftUI16EmptyViewFactoryP33_7A45621CE16223183E03CAC88E8C5E6012MissingLayer)initWithLayer:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  __swift_project_boxed_opaque_existential_1(v9, v9[3]);
  uint64_t v5 = _bridgeAnythingToObjectiveC<A>(_:)();
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = [(EmptyViewFactory.MissingLayer *)&v8 initWithLayer:v5];
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v6;
}

- (_TtCV7SwiftUI16EmptyViewFactoryP33_7A45621CE16223183E03CAC88E8C5E6012MissingLayer)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(EmptyViewFactory.MissingLayer *)&v5 initWithCoder:a3];
}

@end