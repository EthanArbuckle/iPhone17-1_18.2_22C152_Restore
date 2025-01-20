@interface PosterBoardUICoordinator
- (_TtC17WallpaperSettings24PosterBoardUICoordinator)init;
- (void)modalController:(id)a3 didDismissSheetWithResponse:(id)a4;
- (void)modalController:(id)a3 willDismissSheetWithResponse:(id)a4;
- (void)start;
@end

@implementation PosterBoardUICoordinator

- (void)start
{
  v2 = self;
  sub_8DD8();
}

- (_TtC17WallpaperSettings24PosterBoardUICoordinator)init
{
  result = (_TtC17WallpaperSettings24PosterBoardUICoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17WallpaperSettings24PosterBoardUICoordinator_windowScene));

  sub_A580((uint64_t)self + OBJC_IVAR____TtC17WallpaperSettings24PosterBoardUICoordinator_delegate);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC17WallpaperSettings24PosterBoardUICoordinator_modalController);
}

- (void)modalController:(id)a3 willDismissSheetWithResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_9DD0(v7);
}

- (void)modalController:(id)a3 didDismissSheetWithResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_A238();
}

@end