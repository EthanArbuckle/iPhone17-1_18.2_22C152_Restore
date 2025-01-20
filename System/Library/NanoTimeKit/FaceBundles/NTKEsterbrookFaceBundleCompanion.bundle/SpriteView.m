@interface SpriteView
- (BOOL)showDebugHelpers;
- (_TtC32NTKEsterbrookFaceBundleCompanion10SpriteView)initWithCoder:(id)a3;
- (_TtC32NTKEsterbrookFaceBundleCompanion10SpriteView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setShowDebugHelpers:(BOOL)a3;
@end

@implementation SpriteView

- (BOOL)showDebugHelpers
{
  return *((unsigned char *)&self->super.super.super.isa
         + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_showDebugHelpers);
}

- (void)setShowDebugHelpers:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_showDebugHelpers) = a3;
  v3 = self;
  sub_246AC49E4();
}

- (_TtC32NTKEsterbrookFaceBundleCompanion10SpriteView)initWithCoder:(id)a3
{
  return 0;
}

- (void)dealloc
{
  v2 = self;
  sub_246AC554C();
}

- (void).cxx_destruct
{
  sub_246AC5F38((uint64_t)self + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_sprite, (uint64_t (*)(void))type metadata accessor for Sprite);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_spriteLayer));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_animator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_debugContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_debugNormalsView));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_debugFrameIndexLabel);
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SpriteView();
  v2 = (char *)v5.receiver;
  [(SpriteView *)&v5 layoutSubviews];
  v3 = *(void **)&v2[OBJC_IVAR____TtC32NTKEsterbrookFaceBundleCompanion10SpriteView_spriteLayer];
  if (v3)
  {
    id v4 = v3;
    objc_msgSend(v2, sel_bounds, v5.receiver, v5.super_class);
    objc_msgSend(v4, sel_setFrame_);
  }
  sub_246AC56D8();
}

- (_TtC32NTKEsterbrookFaceBundleCompanion10SpriteView)initWithFrame:(CGRect)a3
{
  result = (_TtC32NTKEsterbrookFaceBundleCompanion10SpriteView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end