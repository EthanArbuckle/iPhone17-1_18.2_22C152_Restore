@interface CAPackageViewLayer
- (_TtC22HomeAccessoryControlUIP33_0684E7923880ED2149AEE4170560832218CAPackageViewLayer)init;
- (_TtC22HomeAccessoryControlUIP33_0684E7923880ED2149AEE4170560832218CAPackageViewLayer)initWithCoder:(id)a3;
- (_TtC22HomeAccessoryControlUIP33_0684E7923880ED2149AEE4170560832218CAPackageViewLayer)initWithLayer:(id)a3;
- (void)layoutSublayers;
@end

@implementation CAPackageViewLayer

- (void)layoutSublayers
{
  v2 = self;
  sub_251641254();
}

- (_TtC22HomeAccessoryControlUIP33_0684E7923880ED2149AEE4170560832218CAPackageViewLayer)init
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC22HomeAccessoryControlUIP33_0684E7923880ED2149AEE4170560832218CAPackageViewLayer_packageState) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC22HomeAccessoryControlUIP33_0684E7923880ED2149AEE4170560832218CAPackageViewLayer_packageLayer) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CAPackageViewLayer();
  return [(CAPackageViewLayer *)&v3 init];
}

- (_TtC22HomeAccessoryControlUIP33_0684E7923880ED2149AEE4170560832218CAPackageViewLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  sub_251783398();
  swift_unknownObjectRelease();
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC22HomeAccessoryControlUIP33_0684E7923880ED2149AEE4170560832218CAPackageViewLayer_packageState) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC22HomeAccessoryControlUIP33_0684E7923880ED2149AEE4170560832218CAPackageViewLayer_packageLayer) = 0;
  __swift_project_boxed_opaque_existential_1(v8, v8[3]);
  uint64_t v4 = sub_2517835A8();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CAPackageViewLayer();
  v5 = [(CAPackageViewLayer *)&v7 initWithLayer:v4];
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v8);
  return v5;
}

- (_TtC22HomeAccessoryControlUIP33_0684E7923880ED2149AEE4170560832218CAPackageViewLayer)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC22HomeAccessoryControlUIP33_0684E7923880ED2149AEE4170560832218CAPackageViewLayer_packageState) = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC22HomeAccessoryControlUIP33_0684E7923880ED2149AEE4170560832218CAPackageViewLayer_packageLayer) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CAPackageViewLayer();
  return [(CAPackageViewLayer *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  swift_release();
  objc_super v3 = *(Class *)((char *)&self->super.super.isa
                + OBJC_IVAR____TtC22HomeAccessoryControlUIP33_0684E7923880ED2149AEE4170560832218CAPackageViewLayer_packageLayer);
}

@end