@interface BIABubbleOptionsiOSViewController
- (_TtC8Business33BIABubbleOptionsiOSViewController)initWithCoder:(id)a3;
- (void)_handleBubbleTapped;
- (void)loadView;
@end

@implementation BIABubbleOptionsiOSViewController

- (void)loadView
{
  v2 = self;
  sub_1000A9150();
}

- (void)_handleBubbleTapped
{
  v2 = self;
  sub_1000A9E34();
}

- (_TtC8Business33BIABubbleOptionsiOSViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Business33BIABubbleOptionsiOSViewController____lazy_storage___optionsLabel) = 0;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC8Business33BIABubbleOptionsiOSViewController_containingViewGestureRecognizer) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for BIABubbleOptionsiOSViewController();
  return [(BIABubbleOptionsViewController *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8Business33BIABubbleOptionsiOSViewController____lazy_storage___optionsLabel));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8Business33BIABubbleOptionsiOSViewController_containingViewGestureRecognizer);
}

@end