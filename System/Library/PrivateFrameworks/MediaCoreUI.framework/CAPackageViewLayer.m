@interface CAPackageViewLayer
- (_TtC11MediaCoreUIP33_F4C8615D44A19A30266CA641FD3263FC18CAPackageViewLayer)init;
- (_TtC11MediaCoreUIP33_F4C8615D44A19A30266CA641FD3263FC18CAPackageViewLayer)initWithCoder:(id)a3;
- (_TtC11MediaCoreUIP33_F4C8615D44A19A30266CA641FD3263FC18CAPackageViewLayer)initWithLayer:(id)a3;
- (void)layoutSublayers;
@end

@implementation CAPackageViewLayer

- (void)layoutSublayers
{
  v2 = self;
  sub_255B90344();
}

- (_TtC11MediaCoreUIP33_F4C8615D44A19A30266CA641FD3263FC18CAPackageViewLayer)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC11MediaCoreUIP33_F4C8615D44A19A30266CA641FD3263FC18CAPackageViewLayer_packageLayer) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC11MediaCoreUIP33_F4C8615D44A19A30266CA641FD3263FC18CAPackageViewLayer_foregroundColor) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CAPackageViewLayer();
  return [(CAPackageViewLayer *)&v3 init];
}

- (_TtC11MediaCoreUIP33_F4C8615D44A19A30266CA641FD3263FC18CAPackageViewLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_255C80F58();
  swift_unknownObjectRelease();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC11MediaCoreUIP33_F4C8615D44A19A30266CA641FD3263FC18CAPackageViewLayer_packageLayer) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC11MediaCoreUIP33_F4C8615D44A19A30266CA641FD3263FC18CAPackageViewLayer_foregroundColor) = 0;
  __swift_project_boxed_opaque_existential_1(v8, v8[3]);
  uint64_t v4 = sub_255C81418();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CAPackageViewLayer();
  v5 = [(CAPackageViewLayer *)&v7 initWithLayer:v4];
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v8);
  return v5;
}

- (_TtC11MediaCoreUIP33_F4C8615D44A19A30266CA641FD3263FC18CAPackageViewLayer)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC11MediaCoreUIP33_F4C8615D44A19A30266CA641FD3263FC18CAPackageViewLayer_packageLayer) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC11MediaCoreUIP33_F4C8615D44A19A30266CA641FD3263FC18CAPackageViewLayer_foregroundColor) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CAPackageViewLayer();
  return [(CAPackageViewLayer *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11MediaCoreUIP33_F4C8615D44A19A30266CA641FD3263FC18CAPackageViewLayer_packageLayer));
  objc_super v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC11MediaCoreUIP33_F4C8615D44A19A30266CA641FD3263FC18CAPackageViewLayer_foregroundColor);
}

@end