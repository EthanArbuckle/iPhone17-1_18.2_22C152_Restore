@interface CCUITouchPassThroughView
- (BOOL)isTouchPassThroughDisabled;
- (CCUITouchPassThroughView)initWithCoder:(id)a3;
- (CCUITouchPassThroughView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)setTouchPassThroughDisabled:(BOOL)a3;
@end

@implementation CCUITouchPassThroughView

- (BOOL)isTouchPassThroughDisabled
{
  return *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___CCUITouchPassThroughView__isTouchPassThroughDisabled);
}

- (void)setTouchPassThroughDisabled:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___CCUITouchPassThroughView__isTouchPassThroughDisabled) = a3;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  v9 = self;
  v15.value.super.isa = (Class)a4;
  CCUITouchPassThroughView.hitTest(_:with:)(v10, (CGPoint)__PAIR128__(*(unint64_t *)&y, *(unint64_t *)&x), v15);
  v12 = v11;

  return v12;
}

- (CCUITouchPassThroughView)initWithFrame:(CGRect)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___CCUITouchPassThroughView__isTouchPassThroughDisabled) = 0;
  v4.receiver = self;
  v4.super_class = (Class)CCUITouchPassThroughView;
  return -[CCUITouchPassThroughView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CCUITouchPassThroughView)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___CCUITouchPassThroughView__isTouchPassThroughDisabled) = 0;
  v4.receiver = self;
  v4.super_class = (Class)CCUITouchPassThroughView;
  return [(CCUITouchPassThroughView *)&v4 initWithCoder:a3];
}

@end