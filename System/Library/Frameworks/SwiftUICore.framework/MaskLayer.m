@interface MaskLayer
- (_TtC7SwiftUI9MaskLayer)init;
- (_TtC7SwiftUI9MaskLayer)initWithCoder:(id)a3;
- (_TtC7SwiftUI9MaskLayer)initWithLayer:(id)a3;
@end

@implementation MaskLayer

- (_TtC7SwiftUI9MaskLayer)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7SwiftUI9MaskLayer_clips) = (Class)MEMORY[0x263F8EE78];
  v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC7SwiftUI9MaskLayer_clipTransform);
  _OWORD *v4 = 0u;
  v4[1] = 0u;
  v4[2] = 0u;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(MaskLayer *)&v6 init];
}

- (_TtC7SwiftUI9MaskLayer)initWithLayer:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7SwiftUI9MaskLayer_clips) = (Class)MEMORY[0x263F8EE78];
  v5 = (_OWORD *)((char *)self + OBJC_IVAR____TtC7SwiftUI9MaskLayer_clipTransform);
  _OWORD *v5 = 0u;
  v5[1] = 0u;
  v5[2] = 0u;
  __swift_project_boxed_opaque_existential_1(v10, v10[3]);
  uint64_t v6 = _bridgeAnythingToObjectiveC<A>(_:)();
  v9.receiver = self;
  v9.super_class = ObjectType;
  v7 = [(MaskLayer *)&v9 initWithLayer:v6];
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v10);
  return v7;
}

- (_TtC7SwiftUI9MaskLayer)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7SwiftUI9MaskLayer_clips) = (Class)MEMORY[0x263F8EE78];
  uint64_t v6 = (_OWORD *)((char *)self + OBJC_IVAR____TtC7SwiftUI9MaskLayer_clipTransform);
  *uint64_t v6 = 0u;
  v6[1] = 0u;
  v6[2] = 0u;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(MaskLayer *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end