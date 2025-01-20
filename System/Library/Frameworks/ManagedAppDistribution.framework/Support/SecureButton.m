@interface SecureButton
- (CGSize)drawingSize;
- (_TtC28ManagedAppDistributionDaemon12SecureButton)init;
- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4;
@end

@implementation SecureButton

- (CGSize)drawingSize
{
  double v2 = *(double *)((char *)&self->super.isa + OBJC_IVAR____TtC28ManagedAppDistributionDaemon12SecureButton_drawingSize);
  double v3 = *(double *)&self->drawingSize[OBJC_IVAR____TtC28ManagedAppDistributionDaemon12SecureButton_drawingSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)drawInContext:(CGContext *)a3 atPoint:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  v7 = a3;
  v8 = self;
  sub_1003EC548(v7, x, y);
}

- (_TtC28ManagedAppDistributionDaemon12SecureButton)init
{
  CGSize result = (_TtC28ManagedAppDistributionDaemon12SecureButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  double v3 = *(void **)&self->drawingSize[OBJC_IVAR____TtC28ManagedAppDistributionDaemon12SecureButton_drawingPlan + 8];
  v4 = *(void **)&self->style[OBJC_IVAR____TtC28ManagedAppDistributionDaemon12SecureButton_drawingPlan];

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC28ManagedAppDistributionDaemon12SecureButton_backgroundDrawing));
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC28ManagedAppDistributionDaemon12SecureButton_borderDrawing);
}

@end