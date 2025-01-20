@interface ImageLayer
- (_TtC7SwiftUI10ImageLayer)init;
- (_TtC7SwiftUI10ImageLayer)initWithCoder:(id)a3;
- (_TtC7SwiftUI10ImageLayer)initWithLayer:(id)a3;
@end

@implementation ImageLayer

- (_TtC7SwiftUI10ImageLayer)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(ImageLayer *)&v3 init];
}

- (_TtC7SwiftUI10ImageLayer)initWithLayer:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  __swift_project_boxed_opaque_existential_1(v9, v9[3]);
  uint64_t v5 = _bridgeAnythingToObjectiveC<A>(_:)();
  v8.receiver = self;
  v8.super_class = ObjectType;
  v6 = [(ImageLayer *)&v8 initWithLayer:v5];
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v6;
}

- (_TtC7SwiftUI10ImageLayer)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(ImageLayer *)&v5 initWithCoder:a3];
}

@end