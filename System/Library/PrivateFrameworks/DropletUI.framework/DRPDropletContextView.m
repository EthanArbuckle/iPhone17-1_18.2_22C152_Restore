@interface DRPDropletContextView
- (BOOL)disableDropletEffectFilters;
- (DRPDropletContextKeylineStyle)keylineStyle;
- (DRPDropletContextView)initWithCoder:(id)a3;
- (DRPDropletContextView)initWithFrame:(CGRect)a3;
- (UIColor)dropletColor;
- (double)dropletRadius;
- (id)acquireGeometricChangeAssertionForReason:(id)a3;
- (id)addContainerWithContentView:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (unint64_t)boundaryEdges;
- (void)applyKeylineStyle:(id)a3 forContainerView:(id)a4;
- (void)dealloc;
- (void)invalidate;
- (void)layoutSubviews;
- (void)removeContainer:(id)a3;
- (void)setBoundaryEdges:(unint64_t)a3;
- (void)setDisableDropletEffectFilters:(BOOL)a3;
- (void)setDropletColor:(id)a3;
- (void)setDropletRadius:(double)a3;
- (void)setKeylineStyle:(id)a3;
@end

@implementation DRPDropletContextView

- (BOOL)disableDropletEffectFilters
{
  v2 = self;
  v3 = (char *)sub_24D13AC18();
  char v4 = *(unsigned char *)(*(void *)&v3[OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView]
                + OBJC_IVAR____TtC9DropletUI16DropletGroupView_disableDropletEffectFilters);

  return v4;
}

- (void)setDisableDropletEffectFilters:(BOOL)a3
{
  int v3 = a3;
  char v4 = self;
  v7 = (char *)sub_24D13AC18();
  uint64_t v5 = *(void *)&v7[OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView];
  int v6 = *(unsigned __int8 *)(v5 + OBJC_IVAR____TtC9DropletUI16DropletGroupView_disableDropletEffectFilters);
  *(unsigned char *)(v5 + OBJC_IVAR____TtC9DropletUI16DropletGroupView_disableDropletEffectFilters) = v3;
  if (v6 != v3) {
    sub_24D12ADB4();
  }
}

- (unint64_t)boundaryEdges
{
  v2 = self;
  unint64_t v3 = DRPDropletContextView.boundaryEdges.getter();

  return v3;
}

- (void)setBoundaryEdges:(unint64_t)a3
{
  char v4 = self;
  DRPDropletContextView.boundaryEdges.setter(a3);
}

- (double)dropletRadius
{
  v2 = self;
  unint64_t v3 = (char *)sub_24D13AC18();
  double v4 = *(double *)(*(void *)&v3[OBJC_IVAR____TtC9DropletUI16DropletShapeView_dropletGroupView]
                 + OBJC_IVAR____TtC9DropletUI30DropletParticipantTrackingView_dropletParticipantRadiusOfInfluence);

  return v4;
}

- (void)setDropletRadius:(double)a3
{
  double v4 = self;
  DRPDropletContextView.dropletRadius.setter(a3);
}

- (UIColor)dropletColor
{
  v2 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___DRPDropletContextView_dropletColor);
  swift_beginAccess();
  return (UIColor *)*v2;
}

- (void)setDropletColor:(id)a3
{
  uint64_t v5 = (void **)((char *)&self->super.super.super.isa + OBJC_IVAR___DRPDropletContextView_dropletColor);
  swift_beginAccess();
  int v6 = *v5;
  *uint64_t v5 = a3;
  id v7 = a3;
  v8 = self;
  sub_24D13B7D4(v6);
}

- (DRPDropletContextKeylineStyle)keylineStyle
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();
  return (DRPDropletContextKeylineStyle *)v2;
}

- (void)setKeylineStyle:(id)a3
{
  uint64_t v5 = (id *)((char *)&self->super.super.super.isa + OBJC_IVAR___DRPDropletContextView_keylineStyle);
  swift_beginAccess();
  *uint64_t v5 = a3;
  swift_unknownObjectRetain_n();
  int v6 = self;
  swift_unknownObjectRelease();
  [(DRPDropletContextView *)v6 applyKeylineStyle:*v5 forContainerView:0];

  swift_unknownObjectRelease();
}

- (void)applyKeylineStyle:(id)a3 forContainerView:(id)a4
{
  swift_unknownObjectRetain();
  id v7 = a4;
  v8 = self;
  DRPDropletContextView.applyKeylineStyle(_:for:)(a3, (uint64_t)a4);
  swift_unknownObjectRelease();
}

- (id)addContainerWithContentView:(id)a3
{
  id v5 = a3;
  int v6 = self;
  DRPDropletContextView.addContainer(contentView:)(v7, (UIView_optional *)a3);
  v9 = v8;

  return v9;
}

- (void)removeContainer:(id)a3
{
  double v4 = (DRPDropletContainerView *)a3;
  id v5 = self;
  DRPDropletContextView.removeContainer(_:)(v4);
}

- (id)acquireGeometricChangeAssertionForReason:(id)a3
{
  sub_24D149268();
  double v4 = self;
  id result = sub_24D13AC18();
  int v6 = *(void **)((char *)result + OBJC_IVAR____TtC9DropletUI16DropletShapeView_geometryChangingAssertions);
  if (v6)
  {
    id v7 = result;
    id v8 = v6;
    v9 = (void *)sub_24D149258();
    id v10 = objc_msgSend(v8, sel_acquireForReason_, v9);

    swift_bridgeObjectRelease();
    return v10;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (void)invalidate
{
  v2 = self;
  unint64_t v3 = (char *)sub_24D13AC18();
  id v4 = *(id *)&v3[OBJC_IVAR____TtC9DropletUI16DropletShapeView_geometryChangingAssertions];

  objc_msgSend(v4, sel_invalidate);
}

- (DRPDropletContextView)initWithFrame:(CGRect)a3
{
  return (DRPDropletContextView *)DRPDropletContextView.init(frame:)();
}

- (DRPDropletContextView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___DRPDropletContextView_dropletColor) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___DRPDropletContextView_keylineStyle) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___DRPDropletContextView____lazy_storage___containerViewsParentView) = 0;
  *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___DRPDropletContextView____lazy_storage___dropletShapeView) = 0;
  id v4 = a3;

  id result = (DRPDropletContextView *)sub_24D149448();
  __break(1u);
  return result;
}

- (void)dealloc
{
  v2 = self;
  sub_24D13E29C();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___DRPDropletContextView____lazy_storage___containerViewsParentView));
  unint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___DRPDropletContextView____lazy_storage___dropletShapeView);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = self;
  v15.value.super.isa = (Class)a4;
  DRPDropletContextView.hitTest(_:with:)(v10, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v15);
  v12 = v11;

  return v12;
}

- (void)layoutSubviews
{
  v2 = self;
  DRPDropletContextView.layoutSubviews()();
}

@end