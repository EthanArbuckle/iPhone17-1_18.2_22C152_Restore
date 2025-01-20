@interface SpriteAnimator
- (_TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator)init;
- (void)dealloc;
- (void)displayLinkFired;
@end

@implementation SpriteAnimator

- (void)dealloc
{
  v2 = self;
  sub_246AAE5A0();
}

- (void).cxx_destruct
{
  sub_246AAF1BC((uint64_t)self + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_sprite, (uint64_t (*)(void))type metadata accessor for Sprite);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_currentImage));
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_displayLink));
  v3 = (char *)self + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator_animationObserver;

  sub_246AABC84((uint64_t)v3);
}

- (void)displayLinkFired
{
  v2 = self;
  sub_246AAE92C();
}

- (_TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator)init
{
  result = (_TtC32NTKEsterbrookFaceBundleCompanion14SpriteAnimator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end