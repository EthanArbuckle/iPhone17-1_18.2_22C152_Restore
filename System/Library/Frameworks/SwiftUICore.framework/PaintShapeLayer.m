@interface PaintShapeLayer
- (_TtC7SwiftUIP33_E19F490D25D5E0EC8A24903AF958E34115PaintShapeLayer)init;
- (_TtC7SwiftUIP33_E19F490D25D5E0EC8A24903AF958E34115PaintShapeLayer)initWithCoder:(id)a3;
- (_TtC7SwiftUIP33_E19F490D25D5E0EC8A24903AF958E34115PaintShapeLayer)initWithLayer:(id)a3;
- (void)drawInContext:(CGContext *)a3;
@end

@implementation PaintShapeLayer

- (_TtC7SwiftUIP33_E19F490D25D5E0EC8A24903AF958E34115PaintShapeLayer)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (char *)self + OBJC_IVAR____TtC7SwiftUIP33_E19F490D25D5E0EC8A24903AF958E34115PaintShapeLayer_path;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v4[32] = 6;
  v5 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC7SwiftUIP33_E19F490D25D5E0EC8A24903AF958E34115PaintShapeLayer_origin);
  void *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC7SwiftUIP33_E19F490D25D5E0EC8A24903AF958E34115PaintShapeLayer_paint) = 0;
  v6 = (_OWORD *)((char *)self
                + OBJC_IVAR____TtC7SwiftUIP33_E19F490D25D5E0EC8A24903AF958E34115PaintShapeLayer_paintBounds);
  _OWORD *v6 = 0u;
  v6[1] = 0u;
  *(_WORD *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC7SwiftUIP33_E19F490D25D5E0EC8A24903AF958E34115PaintShapeLayer_fillStyle) = 256;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(PaintShapeLayer *)&v8 init];
}

- (_TtC7SwiftUIP33_E19F490D25D5E0EC8A24903AF958E34115PaintShapeLayer)initWithCoder:(id)a3
{
  swift_getObjectType();
  v4 = (char *)self + OBJC_IVAR____TtC7SwiftUIP33_E19F490D25D5E0EC8A24903AF958E34115PaintShapeLayer_path;
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  v4[32] = 6;
  v5 = (Class *)((char *)&self->super.super.isa
               + OBJC_IVAR____TtC7SwiftUIP33_E19F490D25D5E0EC8A24903AF958E34115PaintShapeLayer_origin);
  void *v5 = 0;
  v5[1] = 0;
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC7SwiftUIP33_E19F490D25D5E0EC8A24903AF958E34115PaintShapeLayer_paint) = 0;
  v6 = (_OWORD *)((char *)self
                + OBJC_IVAR____TtC7SwiftUIP33_E19F490D25D5E0EC8A24903AF958E34115PaintShapeLayer_paintBounds);
  _OWORD *v6 = 0u;
  v6[1] = 0u;
  *(_WORD *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC7SwiftUIP33_E19F490D25D5E0EC8A24903AF958E34115PaintShapeLayer_fillStyle) = 256;
  swift_deallocPartialClassInstance();
  return 0;
}

- (_TtC7SwiftUIP33_E19F490D25D5E0EC8A24903AF958E34115PaintShapeLayer)initWithLayer:(id)a3
{
  swift_unknownObjectRetain();
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  return (_TtC7SwiftUIP33_E19F490D25D5E0EC8A24903AF958E34115PaintShapeLayer *)PaintShapeLayer.init(layer:)(v4);
}

- (void)drawInContext:(CGContext *)a3
{
  v4 = a3;
  v5 = self;
  PaintShapeLayer.draw(in:)(v4);
}

- (void).cxx_destruct
{
  outlined consume of Path.Storage(*(uint64_t *)((char *)&self->super.super.isa+ OBJC_IVAR____TtC7SwiftUIP33_E19F490D25D5E0EC8A24903AF958E34115PaintShapeLayer_path), *(void *)((char *)&self->super._attr.refcount+ OBJC_IVAR____TtC7SwiftUIP33_E19F490D25D5E0EC8A24903AF958E34115PaintShapeLayer_path), *(uint64_t *)((char *)&self->super._attr.layer+ OBJC_IVAR____TtC7SwiftUIP33_E19F490D25D5E0EC8A24903AF958E34115PaintShapeLayer_path), *(uint64_t *)((char *)&self->super._attr._objc_observation_info+ OBJC_IVAR____TtC7SwiftUIP33_E19F490D25D5E0EC8A24903AF958E34115PaintShapeLayer_path), self->path[OBJC_IVAR____TtC7SwiftUIP33_E19F490D25D5E0EC8A24903AF958E34115PaintShapeLayer_path]);

  swift_release();
}

@end