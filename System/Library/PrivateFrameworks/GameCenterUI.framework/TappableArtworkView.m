@interface TappableArtworkView
- (_TtC12GameCenterUI19TappableArtworkView)initWithFrame:(CGRect)a3;
- (void)didTap;
@end

@implementation TappableArtworkView

- (void)didTap
{
  v2 = self;
  sub_1AF4184D8();
}

- (_TtC12GameCenterUI19TappableArtworkView)initWithFrame:(CGRect)a3
{
  return (_TtC12GameCenterUI19TappableArtworkView *)sub_1AF418588(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC12GameCenterUI19TappableArtworkView_tapGestureRecognizer));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC12GameCenterUI19TappableArtworkView_tapHandler);

  sub_1AF368930(v3);
}

@end