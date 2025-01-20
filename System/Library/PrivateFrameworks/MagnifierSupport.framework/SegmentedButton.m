@interface SegmentedButton
- (BOOL)clickPresentationInteractionShouldBegin:(id)a3;
- (BOOL)clickPresentationInteractionShouldPresent:(id)a3;
- (_TtC16MagnifierSupport15SegmentedButton)initWithCoder:(id)a3;
- (_TtC16MagnifierSupport15SegmentedButton)initWithFrame:(CGRect)a3;
- (id)clickPresentationInteraction:(id)a3 presentationForPresentingViewController:(id)a4;
- (id)clickPresentationInteraction:(id)a3 previewForHighlightingAtLocation:(CGPoint)a4;
- (void)clickPresentationInteractionEnded:(id)a3 wasCancelled:(BOOL)a4;
- (void)didSelectSegment:(id)a3;
- (void)didTap:(id)a3;
- (void)layoutSubviews;
- (void)removeFromSuperview;
@end

@implementation SegmentedButton

- (_TtC16MagnifierSupport15SegmentedButton)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23583F4C4();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_23583E100();
}

- (void)didTap:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC16MagnifierSupport15SegmentedButton_delegate;
  if (MEMORY[0x237DEA060]((char *)self + OBJC_IVAR____TtC16MagnifierSupport15SegmentedButton_delegate, a2))
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

- (void)didSelectSegment:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23583E408();
}

- (void)removeFromSuperview
{
  v2 = self;
  sub_23583E710();
}

- (_TtC16MagnifierSupport15SegmentedButton)initWithFrame:(CGRect)a3
{
  result = (_TtC16MagnifierSupport15SegmentedButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport15SegmentedButton_clickInteraction));
  sub_23566A2B4((uint64_t)self + OBJC_IVAR____TtC16MagnifierSupport15SegmentedButton_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MagnifierSupport15SegmentedButton____lazy_storage___segmentedControl));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MagnifierSupport15SegmentedButton____lazy_storage___internalButton);
}

- (id)clickPresentationInteraction:(id)a3 presentationForPresentingViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  v9 = (void *)sub_23583F59C(v6);

  return v9;
}

- (BOOL)clickPresentationInteractionShouldBegin:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23583EBAC(v4);
  LOBYTE(self) = v6;

  return self & 1;
}

- (BOOL)clickPresentationInteractionShouldPresent:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23583EE74(v4);
  LOBYTE(self) = v6;

  return self & 1;
}

- (void)clickPresentationInteractionEnded:(id)a3 wasCancelled:(BOOL)a4
{
  id v5 = a3;
  char v6 = self;
  sub_23583F80C();
}

- (id)clickPresentationInteraction:(id)a3 previewForHighlightingAtLocation:(CGPoint)a4
{
  id v5 = a3;
  char v6 = self;
  id v7 = sub_23583F188(v5);

  return v7;
}

@end