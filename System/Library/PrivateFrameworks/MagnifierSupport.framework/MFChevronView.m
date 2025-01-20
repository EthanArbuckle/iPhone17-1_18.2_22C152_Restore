@interface MFChevronView
- (_TtC16MagnifierSupport13MFChevronView)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport13MFChevronView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MFChevronView

- (_TtC16MagnifierSupport13MFChevronView)initWithFrame:(CGRect)a3
{
  return (_TtC16MagnifierSupport13MFChevronView *)sub_23582E470(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MagnifierSupport13MFChevronView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23582EA40();
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = (char *)v4.receiver;
  [(MFChevronView *)&v4 layoutSubviews];
  objc_msgSend(v2, sel_bounds, v4.receiver, v4.super_class);
  objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC16MagnifierSupport13MFChevronView_chevronLayer], sel_setPosition_, v3 * 0.5, -*(double *)&v2[OBJC_IVAR____TtC16MagnifierSupport13MFChevronView_chevronDistanceFromTopEdge]);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport13MFChevronView_chevronLayer));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MagnifierSupport13MFChevronView_chevronShapeAnimatableProperty);
}

@end