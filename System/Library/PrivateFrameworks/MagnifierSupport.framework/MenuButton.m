@interface MenuButton
- (BOOL)clickPresentationInteractionShouldBegin:(id)a3;
- (BOOL)clickPresentationInteractionShouldPresent:(id)a3;
- (BOOL)isAccessibilityElement;
- (CGPoint)accessibilityActivationPoint;
- (NSString)accessibilityLabel;
- (_TtC16MagnifierSupport10MenuButton)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport10MenuButton)initWithFrame:(CGRect)a3;
- (id)clickPresentationInteraction:(id)a3 presentationForPresentingViewController:(id)a4;
- (id)clickPresentationInteraction:(id)a3 previewForHighlightingAtLocation:(CGPoint)a4;
- (void)clickPresentationInteractionEnded:(id)a3 wasCancelled:(BOOL)a4;
- (void)didTap:(id)a3;
- (void)layoutSubviews;
- (void)removeFromSuperview;
@end

@implementation MenuButton

- (_TtC16MagnifierSupport10MenuButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_235787398();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2357853E8();
}

- (void)didTap:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_23594A6A8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_2357861AC();

  sub_23566A3AC((uint64_t)v6, &qword_26AF15750);
}

- (void)removeFromSuperview
{
  v2 = self;
  sub_23578643C();
}

- (_TtC16MagnifierSupport10MenuButton)initWithFrame:(CGRect)a3
{
  result = (_TtC16MagnifierSupport10MenuButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport10MenuButton____lazy_storage___label));
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport10MenuButton_clickInteraction));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport10MenuButton____lazy_storage___internalButton));
  sub_23566A2B4((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport10MenuButton_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport10MenuButton_cameraMenu));
  swift_bridgeObjectRelease();
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
  id v3 = sub_235783480();
  objc_msgSend(v3, sel_accessibilityActivationPoint);
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.y = v9;
  result.x = v8;
  return result;
}

- (id)clickPresentationInteraction:(id)a3 presentationForPresentingViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = self;
  double v9 = (void *)sub_2357874B0(v6);

  return v9;
}

- (BOOL)clickPresentationInteractionShouldBegin:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_235786948(v4);
  LOBYTE(self) = v6;

  return self & 1;
}

- (BOOL)clickPresentationInteractionShouldPresent:(id)a3
{
  id v4 = a3;
  double v5 = self;
  sub_235786C68(v4);
  LOBYTE(self) = v6;

  return self & 1;
}

- (void)clickPresentationInteractionEnded:(id)a3 wasCancelled:(BOOL)a4
{
  id v5 = a3;
  char v6 = self;
  sub_23578768C();
}

- (id)clickPresentationInteraction:(id)a3 previewForHighlightingAtLocation:(CGPoint)a4
{
  id v5 = a3;
  char v6 = self;
  id v7 = sub_235786FD4(v5);

  return v7;
}

@end