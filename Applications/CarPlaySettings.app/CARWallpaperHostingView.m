@interface CARWallpaperHostingView
- (_TtC15CarPlaySettings23CARWallpaperHostingView)initWithCoder:(id)a3;
- (_TtC15CarPlaySettings23CARWallpaperHostingView)initWithFrame:(CGRect)a3;
@end

@implementation CARWallpaperHostingView

- (_TtC15CarPlaySettings23CARWallpaperHostingView)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC15CarPlaySettings23CARWallpaperHostingView_wallpaperID);
  void *v4 = 0;
  v4[1] = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15CarPlaySettings23CARWallpaperHostingView_wallpaperView) = 0;
  id v5 = a3;

  result = (_TtC15CarPlaySettings23CARWallpaperHostingView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC15CarPlaySettings23CARWallpaperHostingView)initWithFrame:(CGRect)a3
{
  result = (_TtC15CarPlaySettings23CARWallpaperHostingView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15CarPlaySettings23CARWallpaperHostingView_themeManager));
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15CarPlaySettings23CARWallpaperHostingView_wallpaperView);
}

@end