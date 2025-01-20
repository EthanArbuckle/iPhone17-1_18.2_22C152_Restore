@interface ToggleButton
- (BOOL)clickPresentationInteractionShouldBegin:(id)a3;
- (BOOL)clickPresentationInteractionShouldPresent:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (NSString)largeContentTitle;
- (UIImage)largeContentImage;
- (_TtC16MagnifierSupport12ToggleButton)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport12ToggleButton)initWithFrame:(CGRect)a3;
- (id)clickPresentationInteraction:(id)a3 presentationForPresentingViewController:(id)a4;
- (id)clickPresentationInteraction:(id)a3 previewForHighlightingAtLocation:(CGPoint)a4;
- (void)clickPresentationInteractionEnded:(id)a3 wasCancelled:(BOOL)a4;
- (void)didTap:(id)a3;
- (void)labelTapped:(id)a3;
- (void)layoutSubviews;
- (void)removeFromSuperview;
@end

@implementation ToggleButton

- (_TtC16MagnifierSupport12ToggleButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23572C8EC();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_23572A6D8();
}

- (void)didTap:(id)a3
{
}

- (void)labelTapped:(id)a3
{
}

- (void)removeFromSuperview
{
  v2 = self;
  sub_23572B254();
}

- (_TtC16MagnifierSupport12ToggleButton)initWithFrame:(CGRect)a3
{
  result = (_TtC16MagnifierSupport12ToggleButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport12ToggleButton____lazy_storage___label));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport12ToggleButton_clickInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport12ToggleButton____lazy_storage___internalButton));
  id v3 = (char *)self + OBJC_IVAR____TtC16MagnifierSupport12ToggleButton_delegate;
  sub_23566A2B4((uint64_t)v3);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSString)accessibilityLabel
{
  sub_23579D854();
  v2 = (void *)sub_235949A88();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (CGPoint)accessibilityActivationPoint
{
  v2 = self;
  double v3 = sub_23572B760();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.y = v7;
  result.x = v6;
  return result;
}

- (NSString)accessibilityValue
{
  v2 = self;
  sub_23572B874();
  uint64_t v4 = v3;

  if (v4)
  {
    double v5 = (void *)sub_235949A88();
    swift_bridgeObjectRelease();
  }
  else
  {
    double v5 = 0;
  }
  return (NSString *)v5;
}

- (NSString)largeContentTitle
{
  v2 = self;
  id v3 = sub_2357278B0();
  id v4 = objc_msgSend(v3, sel_text);

  if (v4)
  {
    sub_235949AC8();

    id v4 = (id)sub_235949A88();
    swift_bridgeObjectRelease();
  }
  else
  {
  }
  return (NSString *)v4;
}

- (UIImage)largeContentImage
{
  id v2 = sub_23579D108();
  return (UIImage *)v2;
}

- (id)clickPresentationInteraction:(id)a3 presentationForPresentingViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  v9 = (void *)sub_23572CA24(v6);

  return v9;
}

- (BOOL)clickPresentationInteractionShouldBegin:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_23572BCC0(v4);
  LOBYTE(self) = v6;

  return self & 1;
}

- (BOOL)clickPresentationInteractionShouldPresent:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_23572BFE4(v4);
  LOBYTE(self) = v6;

  return self & 1;
}

- (void)clickPresentationInteractionEnded:(id)a3 wasCancelled:(BOOL)a4
{
  id v5 = a3;
  char v6 = self;
  sub_23572CC94();
}

- (id)clickPresentationInteraction:(id)a3 previewForHighlightingAtLocation:(CGPoint)a4
{
  id v5 = a3;
  char v6 = self;
  id v7 = sub_23572C354(v5);

  return v7;
}

@end