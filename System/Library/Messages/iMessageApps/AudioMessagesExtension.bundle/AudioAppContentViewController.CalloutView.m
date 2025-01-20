@interface AudioAppContentViewController.CalloutView
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView)initWithCoder:(id)a3;
- (_TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation AudioAppContentViewController.CalloutView

- (_TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView)initWithFrame:(CGRect)a3
{
  return (_TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView *)sub_362D4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_3D714();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_36604();
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  sub_3D964();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_backdropColor));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_textColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_shadowColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_shapeView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_backgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_shadowView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCC22AudioMessagesExtension29AudioAppContentViewControllerP33_6C80B9CA6D0C59A10BF4E668E4172F5C11CalloutView_labelView);
}

@end