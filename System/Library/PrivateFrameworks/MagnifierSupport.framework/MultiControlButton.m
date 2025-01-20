@interface MultiControlButton
- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild;
- (BOOL)clickPresentationInteractionShouldBegin:(id)a3;
- (BOOL)clickPresentationInteractionShouldPresent:(id)a3;
- (_TtC16MagnifierSupport18MultiControlButton)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport18MultiControlButton)initWithFrame:(CGRect)a3;
- (id)clickPresentationInteraction:(id)a3 presentationForPresentingViewController:(id)a4;
- (id)clickPresentationInteraction:(id)a3 previewForHighlightingAtLocation:(CGPoint)a4;
- (void)addTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5;
- (void)clickPresentationInteractionEnded:(id)a3 wasCancelled:(BOOL)a4;
- (void)didTap:(id)a3;
- (void)layoutSubviews;
@end

@implementation MultiControlButton

- (_TtC16MagnifierSupport18MultiControlButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2356BD9F8();
}

- (void)addTarget:(id)a3 action:(SEL)a4 forControlEvents:(unint64_t)a5
{
  if (a3)
  {
    v8 = self;
    swift_unknownObjectRetain();
    sub_23594A6A8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    v9 = self;
  }
  sub_2356BC2B0((uint64_t)v10, (uint64_t)a4, a5);

  sub_2356BDF2C((uint64_t)v10);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2356BC6BC();
}

- (void)didTap:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC16MagnifierSupport18MultiControlButton_delegate;
  if (MEMORY[0x237DEA060]((char *)self + OBJC_IVAR____TtC16MagnifierSupport18MultiControlButton_delegate, a2))
  {
    uint64_t v6 = *((void *)v5 + 1);
    swift_getObjectType();
    v7 = *(void (**)(void))(v6 + 8);
    id v8 = a3;
    v9 = self;
    v7();

    swift_unknownObjectRelease();
  }
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (_TtC16MagnifierSupport18MultiControlButton)initWithFrame:(CGRect)a3
{
  result = (_TtC16MagnifierSupport18MultiControlButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport18MultiControlButton_clickInteraction));
  sub_23566A2B4((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport18MultiControlButton_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport18MultiControlButton____lazy_storage___keyboardButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport18MultiControlButton____lazy_storage___label));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MagnifierSupport18MultiControlButton____lazy_storage___internalButton);
}

- (id)clickPresentationInteraction:(id)a3 presentationForPresentingViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  v9 = (void *)sub_2356BDAE8(v6);

  return v9;
}

- (BOOL)clickPresentationInteractionShouldBegin:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2356BCFA0(v4);
  LOBYTE(self) = v6;

  return self & 1;
}

- (BOOL)clickPresentationInteractionShouldPresent:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2356BD268(v4);
  LOBYTE(self) = v6;

  return self & 1;
}

- (void)clickPresentationInteractionEnded:(id)a3 wasCancelled:(BOOL)a4
{
  id v5 = a3;
  char v6 = self;
  sub_2356BDD58();
}

- (id)clickPresentationInteraction:(id)a3 previewForHighlightingAtLocation:(CGPoint)a4
{
  id v5 = a3;
  char v6 = self;
  id v7 = sub_2356BD57C(v5);

  return v7;
}

@end