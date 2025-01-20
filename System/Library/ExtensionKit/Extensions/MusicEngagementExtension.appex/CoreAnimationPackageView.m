@interface CoreAnimationPackageView
- (_TtC11MusicCoreUI24CoreAnimationPackageView)initWithCoder:(id)a3;
- (_TtC11MusicCoreUI24CoreAnimationPackageView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CoreAnimationPackageView

- (_TtC11MusicCoreUI24CoreAnimationPackageView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized CoreAnimationPackageView.init(coder:)();
}

- (void)layoutSubviews
{
  v2 = self;
  CoreAnimationPackageView.layoutSubviews()();
}

- (_TtC11MusicCoreUI24CoreAnimationPackageView)initWithFrame:(CGRect)a3
{
  result = (_TtC11MusicCoreUI24CoreAnimationPackageView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(void **)&self->definition[OBJC_IVAR____TtC11MusicCoreUI24CoreAnimationPackageView_definition + 8];
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI24CoreAnimationPackageView_foregroundColor));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI24CoreAnimationPackageView_stateAnimationTimer));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI24CoreAnimationPackageView_package));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11MusicCoreUI24CoreAnimationPackageView_packageLayer));
  v4 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11MusicCoreUI24CoreAnimationPackageView_stateController);
}

@end