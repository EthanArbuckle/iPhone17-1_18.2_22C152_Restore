@interface CKTapbackPlatterView
- (CGRect)tapbackContentContainerRect;
- (CKTapbackPlatterView)initWithCoder:(id)a3;
- (CKTapbackPlatterView)initWithFrame:(CGRect)a3;
- (UIColor)backgroundColor;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
@end

@implementation CKTapbackPlatterView

- (UIColor)backgroundColor
{
  id v2 = objc_msgSend(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKTapbackPlatterView_backgroundView), sel_backgroundColor);

  return (UIColor *)v2;
}

- (void)setBackgroundColor:(id)a3
{
  v4 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKTapbackPlatterView_backgroundView);
  id v6 = a3;
  v5 = self;
  objc_msgSend(v4, sel_setBackgroundColor_, v6);
  objc_msgSend(*(id *)((char *)&v5->super.super.super.isa + OBJC_IVAR___CKTapbackPlatterView_mediumTail), sel_setBackgroundColor_, v6);
  objc_msgSend(*(id *)((char *)&v5->super.super.super.isa + OBJC_IVAR___CKTapbackPlatterView_smallTail), sel_setBackgroundColor_, v6);
}

- (CKTapbackPlatterView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18F6EAC60();
}

- (CKTapbackPlatterView)initWithFrame:(CGRect)a3
{
  return (CKTapbackPlatterView *)TapbackPlatterView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_18F6E95A0();
}

- (CGRect)tapbackContentContainerRect
{
  [(CKTapbackPlatterView *)self bounds];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void).cxx_destruct
{
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR___CKTapbackPlatterView_gradientReferenceView);
  double v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___CKTapbackPlatterView_tapback);
}

@end