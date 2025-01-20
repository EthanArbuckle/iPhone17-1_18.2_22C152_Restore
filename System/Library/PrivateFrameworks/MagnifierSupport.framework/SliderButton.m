@interface SliderButton
- (BOOL)clickPresentationInteractionShouldBegin:(id)a3;
- (BOOL)clickPresentationInteractionShouldPresent:(id)a3;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)isAccessibilityElement;
- (NSString)accessibilityIdentifier;
- (NSString)largeContentTitle;
- (UIImage)largeContentImage;
- (_TtC16MagnifierSupport12SliderButton)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport12SliderButton)initWithFrame:(CGRect)a3;
- (id)clickPresentationInteraction:(id)a3 presentationForPresentingViewController:(id)a4;
- (id)clickPresentationInteraction:(id)a3 previewForHighlightingAtLocation:(CGPoint)a4;
- (void)clickPresentationInteractionEnded:(id)a3 wasCancelled:(BOOL)a4;
- (void)didTap:(id)a3;
- (void)layoutSubviews;
- (void)removeFromSuperview;
@end

@implementation SliderButton

- (id)clickPresentationInteraction:(id)a3 presentationForPresentingViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  v9 = (void *)sub_2356BEA5C(v6);

  return v9;
}

- (BOOL)clickPresentationInteractionShouldBegin:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2356BE064(v4);
  LOBYTE(self) = v6;

  return self & 1;
}

- (BOOL)clickPresentationInteractionShouldPresent:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2356BE384(v4);
  LOBYTE(self) = v6;

  return self & 1;
}

- (void)clickPresentationInteractionEnded:(id)a3 wasCancelled:(BOOL)a4
{
  id v5 = a3;
  char v6 = self;
  sub_2356BECCC();
}

- (id)clickPresentationInteraction:(id)a3 previewForHighlightingAtLocation:(CGPoint)a4
{
  id v5 = a3;
  char v6 = self;
  id v7 = sub_2356BE6EC(v5);

  return v7;
}

- (_TtC16MagnifierSupport12SliderButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2357D0910();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2357CFDFC();
}

- (void)didTap:(id)a3
{
  id v5 = a3;
  id v4 = self;
  sub_2357D09F4();
}

- (void)removeFromSuperview
{
  v2 = self;
  sub_2357D008C();
}

- (_TtC16MagnifierSupport12SliderButton)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport12SliderButton_clickInteraction));
  sub_23566A2B4((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport12SliderButton_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport12SliderButton____lazy_storage___internalButton));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MagnifierSupport12SliderButton____lazy_storage___slider);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (NSString)largeContentTitle
{
  return (NSString *)sub_2357D0598((uint64_t)self, (uint64_t)a2, (void (*)(void))sub_23579D854);
}

- (UIImage)largeContentImage
{
  id v2 = sub_23579D108();
  return (UIImage *)v2;
}

- (NSString)accessibilityIdentifier
{
  return (NSString *)sub_2357D0598((uint64_t)self, (uint64_t)a2, (void (*)(void))Control.rawValue.getter);
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = sub_2357D0604(v4);

  return self & 1;
}

@end