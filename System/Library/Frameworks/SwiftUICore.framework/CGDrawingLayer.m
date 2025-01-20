@interface CGDrawingLayer
- (_TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer)init;
- (_TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer)initWithCoder:(id)a3;
- (_TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer)initWithLayer:(id)a3;
- (void)drawInContext:(CGContext *)a3;
@end

@implementation CGDrawingLayer

- (_TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer_content;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((void *)v4 + 4) = 0;
  v4[40] = 5;
  v5 = (char *)self + OBJC_IVAR____TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer_state;
  char *v5 = 3;
  *((void *)v5 + 1) = 0;
  id v6 = a3;

  result = (_TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)drawInContext:(CGContext *)a3
{
  v4 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer_content);
  v5 = *(void **)((char *)&self->super._attr.refcount
                + OBJC_IVAR____TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer_content);
  uint64_t v6 = *(uint64_t *)((char *)&self->super._attr.layer
                  + OBJC_IVAR____TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer_content);
  uint64_t v7 = *(uint64_t *)((char *)&self->super._attr._objc_observation_info
                  + OBJC_IVAR____TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer_content);
  uint64_t v8 = *(void *)&self->content[OBJC_IVAR____TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer_content];
  char v9 = self->content[OBJC_IVAR____TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer_content + 8];
  v10 = a3;
  v11 = self;
  outlined copy of PlatformDrawableContent.Storage(v4, v5, v6, v7, v8, v9);
  [(CGDrawingLayer *)v11 bounds];
  double v13 = v12;
  double v15 = v14;
  [(CGDrawingLayer *)v11 contentsScale];
  double v17 = v16;
  uint64_t v18 = (uint64_t)v11 + OBJC_IVAR____TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer_state;
  swift_beginAccess();
  PlatformDrawableContent.draw(in:size:contentsScale:state:)(v10, v18, v13, v15, v17);
  swift_endAccess();
  outlined consume of PlatformDrawableContent.Storage(v4, v5, v6, v7, v8, v9);
}

- (_TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer)init
{
  result = (_TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer)initWithLayer:(id)a3
{
}

- (void).cxx_destruct
{
  outlined consume of PlatformDrawableContent.Storage(*(void **)((char *)&self->super.super.isa+ OBJC_IVAR____TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer_content), *(id *)((char *)&self->super._attr.refcount+ OBJC_IVAR____TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer_content), *(uint64_t *)((char *)&self->super._attr.layer+ OBJC_IVAR____TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer_content), *(uint64_t *)((char *)&self->super._attr._objc_observation_info+ OBJC_IVAR____TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer_content), *(void *)&self->content[OBJC_IVAR____TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer_content], self->content[OBJC_IVAR____TtC7SwiftUIP33_E2A63CF3FB15FAD08FBE4CE6D0C83E5114CGDrawingLayer_content + 8]);

  swift_release();
}

@end