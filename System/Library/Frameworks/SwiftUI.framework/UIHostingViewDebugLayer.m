@interface UIHostingViewDebugLayer
- (NSString)name;
- (_TtC7SwiftUI23UIHostingViewDebugLayer)init;
- (_TtC7SwiftUI23UIHostingViewDebugLayer)initWithCoder:(id)a3;
- (_TtC7SwiftUI23UIHostingViewDebugLayer)initWithLayer:(id)a3;
- (void)setName:(id)a3;
@end

@implementation UIHostingViewDebugLayer

- (_TtC7SwiftUI23UIHostingViewDebugLayer)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(UIHostingViewDebugLayer *)&v3 init];
}

- (NSString)name
{
  v2 = self;
  uint64_t v3 = UIHostingViewDebugLayer.name.getter();
  uint64_t v5 = v4;

  if (v5)
  {
    v6 = (void *)MEMORY[0x18C115780](v3, v5);
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }

  return (NSString *)v6;
}

- (void)setName:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
    v9 = self;
    a3 = (id)MEMORY[0x18C115780](v6, v8);
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = self;
  }
  v11.receiver = self;
  v11.super_class = ObjectType;
  [(UIHostingViewDebugLayer *)&v11 setName:a3];
}

- (_TtC7SwiftUI23UIHostingViewDebugLayer)initWithLayer:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  __swift_project_boxed_opaque_existential_1(v9, v9[3]);
  uint64_t v5 = _bridgeAnythingToObjectiveC<A>(_:)();
  v8.receiver = self;
  v8.super_class = ObjectType;
  uint64_t v6 = [(UIHostingViewDebugLayer *)&v8 initWithLayer:v5];
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v9);
  return v6;
}

- (_TtC7SwiftUI23UIHostingViewDebugLayer)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(UIHostingViewDebugLayer *)&v5 initWithCoder:a3];
}

@end