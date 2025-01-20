@interface ServiceProductCardBackgroundView
- (_TtC20StoreDynamicUIPlugin32ServiceProductCardBackgroundView)init;
- (_TtC20StoreDynamicUIPlugin32ServiceProductCardBackgroundView)initWithCoder:(id)a3;
- (_TtC20StoreDynamicUIPlugin32ServiceProductCardBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ServiceProductCardBackgroundView

- (_TtC20StoreDynamicUIPlugin32ServiceProductCardBackgroundView)initWithFrame:(CGRect)a3
{
  return (_TtC20StoreDynamicUIPlugin32ServiceProductCardBackgroundView *)sub_D23C4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC20StoreDynamicUIPlugin32ServiceProductCardBackgroundView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_D24FC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_D2608();
}

- (_TtC20StoreDynamicUIPlugin32ServiceProductCardBackgroundView)init
{
}

- (void).cxx_destruct
{
  id v3 = *(void **)&self->AMSUICommonView_opaque[OBJC_IVAR____TtC20StoreDynamicUIPlugin32ServiceProductCardBackgroundView_visualEffectView];
}

@end