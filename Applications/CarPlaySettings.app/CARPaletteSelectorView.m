@interface CARPaletteSelectorView
- (_TtC15CarPlaySettings22CARPaletteSelectorView)initWithCoder:(id)a3;
- (_TtC15CarPlaySettings22CARPaletteSelectorView)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)didTapPaletteWithSender:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndScrollingAnimation:(id)a3;
- (void)scrollViewDidScroll:(id)a3;
@end

@implementation CARPaletteSelectorView

- (_TtC15CarPlaySettings22CARPaletteSelectorView)initWithCoder:(id)a3
{
  v5 = (char *)self + OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_delegate;
  *(_OWORD *)v5 = 0u;
  *((_OWORD *)v5 + 1) = 0u;
  *((void *)v5 + 4) = 0;
  uint64_t v6 = OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_scrollView;
  id v7 = objc_allocWithZone((Class)UIScrollView);
  id v8 = a3;
  [v7 initWithFrame:0.0, 0.0, 0.0, 0.0];
  uint64_t v9 = OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_stackView;
  *(Class *)((char *)&self->super.super.super.isa + v9) = (Class)[objc_allocWithZone((Class)UIStackView) initWithFrame:0.0, 0.0, 0.0, 0.0];

  result = (_TtC15CarPlaySettings22CARPaletteSelectorView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v8 = a4;
  uint64_t v9 = self;
  id v10 = sub_10004D374((uint64_t)a4, x, y);

  return v10;
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  v4 = *(void (**)(id))((swift_isaMask & (uint64_t)self->super.super.super.isa) + 0xE8);
  id v5 = a3;
  uint64_t v6 = self;
  v4(v5);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10004D748(v4);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10004DA10(v4);
}

- (void)didTapPaletteWithSender:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10004DC30(v4);
}

- (_TtC15CarPlaySettings22CARPaletteSelectorView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_100032F78((uint64_t)self + OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_delegate, &qword_1000AFC58);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_selectedPalette));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_scrollView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15CarPlaySettings22CARPaletteSelectorView_stackView);
}

@end