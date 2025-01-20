@interface CGDrawingLayer
- (_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer)init;
- (_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer)initWithCoder:(id)a3;
- (_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer)initWithLayer:(id)a3;
- (void)drawInContext:(CGContext *)a3;
@end

@implementation CGDrawingLayer

- (_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  PlatformDrawableContent.init()();
  v5 = (char *)v4 + OBJC_IVAR____TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer_state;
  char *v5 = 3;
  *((void *)v5 + 1) = 0;

  v7.receiver = v4;
  v7.super_class = ObjectType;
  return [(CGDrawingLayer *)&v7 init];
}

- (void).cxx_destruct
{
  outlined consume of PlatformDrawableContent.Storage(*(void **)((char *)&self->super.super.isa+ OBJC_IVAR____TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer_content), *(id *)((char *)&self->super._attr.refcount+ OBJC_IVAR____TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer_content), *(uint64_t *)((char *)&self->super._attr.layer+ OBJC_IVAR____TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer_content), *(uint64_t *)((char *)&self->super._attr._objc_observation_info+ OBJC_IVAR____TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer_content), *(void *)&self->content[OBJC_IVAR____TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer_content], self->content[OBJC_IVAR____TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer_content + 8]);

  swift_release();
}

- (void)drawInContext:(CGContext *)a3
{
  v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer_content);
  v5 = *(void **)((char *)&self->super._attr.refcount
                + OBJC_IVAR____TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer_content);
  uint64_t v6 = *(uint64_t *)((char *)&self->super._attr.layer
                  + OBJC_IVAR____TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer_content);
  uint64_t v7 = *(uint64_t *)((char *)&self->super._attr._objc_observation_info
                  + OBJC_IVAR____TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer_content);
  uint64_t v8 = *(void *)&self->content[OBJC_IVAR____TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer_content];
  char v9 = self->content[OBJC_IVAR____TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer_content + 8];
  v10 = a3;
  v11 = self;
  outlined copy of PlatformDrawableContent.Storage(v4, v5, v6, v7, v8, v9);
  [(CGDrawingLayer *)v11 bounds];
  [(CGDrawingLayer *)v11 contentsScale];
  swift_beginAccess();
  PlatformDrawableContent.draw(in:size:contentsScale:state:)();
  swift_endAccess();
  outlined consume of PlatformDrawableContent.Storage(v4, v5, v6, v7, v8, v9);
}

- (_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer)initWithLayer:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  v5 = self;
  PlatformDrawableContent.init()();
  uint64_t v6 = (char *)v5 + OBJC_IVAR____TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer_state;
  *uint64_t v6 = 3;
  *((void *)v6 + 1) = 0;

  __swift_project_boxed_opaque_existential_1(v11, v11[3]);
  uint64_t v7 = _bridgeAnythingToObjectiveC<A>(_:)();
  v10.receiver = v5;
  v10.super_class = ObjectType;
  uint64_t v8 = [(CGDrawingLayer *)&v10 initWithLayer:v7];
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v11);
  return v8;
}

- (_TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v6 = a3;
  uint64_t v7 = self;
  PlatformDrawableContent.init()();
  uint64_t v8 = (char *)v7 + OBJC_IVAR____TtC7SwiftUIP33_65A81BD07F0108B0485D2E15DE104A7514CGDrawingLayer_state;
  *uint64_t v8 = 3;
  *((void *)v8 + 1) = 0;

  v11.receiver = v7;
  v11.super_class = ObjectType;
  char v9 = [(CGDrawingLayer *)&v11 initWithCoder:v6];

  return v9;
}

@end