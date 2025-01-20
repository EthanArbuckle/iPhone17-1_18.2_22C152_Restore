@interface DBWallpaperRootViewController
- (CRSUIWallpaper)currentWallpaper;
- (_TtC9DashBoard29DBWallpaperRootViewController)initWithCoder:(id)a3;
- (_TtC9DashBoard29DBWallpaperRootViewController)initWithEnvironment:(id)a3;
- (_TtC9DashBoard29DBWallpaperRootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)invalidate;
- (void)setWallpaper:(id)a3 duration:(double)a4 delay:(double)a5 updates:(id)a6;
- (void)viewDidLoad;
@end

@implementation DBWallpaperRootViewController

- (_TtC9DashBoard29DBWallpaperRootViewController)initWithEnvironment:(id)a3
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9DashBoard29DBWallpaperRootViewController_wallpaperViewController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9DashBoard29DBWallpaperRootViewController_nextWallpaperViewController) = 0;
  swift_unknownObjectWeakAssign();
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DBWallpaperRootViewController();
  return [(DBWallpaperRootViewController *)&v5 initWithNibName:0 bundle:0];
}

- (_TtC9DashBoard29DBWallpaperRootViewController)initWithCoder:(id)a3
{
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9DashBoard29DBWallpaperRootViewController_wallpaperViewController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC9DashBoard29DBWallpaperRootViewController_nextWallpaperViewController) = 0;
  id v5 = a3;

  result = (_TtC9DashBoard29DBWallpaperRootViewController *)sub_22D85EA28();
  __break(1u);
  return result;
}

- (CRSUIWallpaper)currentWallpaper
{
  v2 = self;
  id v3 = DBWallpaperRootViewController.currentWallpaper.getter();

  return (CRSUIWallpaper *)v3;
}

- (void)setWallpaper:(id)a3 duration:(double)a4 delay:(double)a5 updates:(id)a6
{
  v10 = _Block_copy(a6);
  _Block_copy(v10);
  swift_unknownObjectRetain();
  v11 = self;
  sub_22D8534B8(a3, (char *)v11, (void (**)(void))v10, a4, a5);
  _Block_release(v10);
  _Block_release(v10);
  swift_unknownObjectRelease();
}

- (void)viewDidLoad
{
  v2 = self;
  DBWallpaperRootViewController.viewDidLoad()();
}

- (_TtC9DashBoard29DBWallpaperRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC9DashBoard29DBWallpaperRootViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_22D7C465C((uint64_t)self + OBJC_IVAR____TtC9DashBoard29DBWallpaperRootViewController_environment);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9DashBoard29DBWallpaperRootViewController_wallpaperViewController));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9DashBoard29DBWallpaperRootViewController_nextWallpaperViewController);
}

- (void)invalidate
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9DashBoard29DBWallpaperRootViewController_wallpaperViewController);
  id v3 = self;
  if (v2) {
    objc_msgSend(v2, sel_invalidate);
  }
  id v4 = self;
  id v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9DashBoard29DBWallpaperRootViewController_nextWallpaperViewController);
  if (v5)
  {
    id v5 = objc_msgSend(v5, sel_invalidate);
    id v4 = self;
  }
  MEMORY[0x270F9A758](v5, v4);
}

@end