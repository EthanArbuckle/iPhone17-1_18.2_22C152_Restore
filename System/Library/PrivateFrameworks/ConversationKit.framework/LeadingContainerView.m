@interface LeadingContainerView
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIView)viewForLastBaselineLayout;
- (_TtC15ConversationKitP33_7B133F2533FF4A198A88A5022078738420LeadingContainerView)initWithCoder:(id)a3;
- (_TtC15ConversationKitP33_7B133F2533FF4A198A88A5022078738420LeadingContainerView)initWithFrame:(CGRect)a3;
@end

@implementation LeadingContainerView

- (UIView)viewForLastBaselineLayout
{
  Baseline = LeadingContainerView.forLastBaselineLayout.getter();
  return (UIView *)Baseline;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  double v8 = LeadingContainerView.sizeThatFits(_:)(width, height, v6, v7);
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double height = v12;
  result.double width = v11;
  return result;
}

- (_TtC15ConversationKitP33_7B133F2533FF4A198A88A5022078738420LeadingContainerView)initWithFrame:(CGRect)a3
{
  return (_TtC15ConversationKitP33_7B133F2533FF4A198A88A5022078738420LeadingContainerView *)LeadingContainerView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC15ConversationKitP33_7B133F2533FF4A198A88A5022078738420LeadingContainerView)initWithCoder:(id)a3
{
  return (_TtC15ConversationKitP33_7B133F2533FF4A198A88A5022078738420LeadingContainerView *)LeadingContainerView.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15ConversationKitP33_7B133F2533FF4A198A88A5022078738420LeadingContainerView_wrappedView));
}

@end