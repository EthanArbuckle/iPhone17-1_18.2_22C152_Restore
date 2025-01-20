@interface AegirAppViewController
- (BOOL)prefersHomeIndicatorAutoHidden;
- (BOOL)prefersStatusBarHidden;
- (_TtC11AegirPoster22AegirAppViewController)initWithCoder:(id)a3;
- (_TtC11AegirPoster22AegirAppViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)astronomyVistaViewContentsAnimationFinished:(id)a3;
- (void)dealloc;
- (void)didTapView:(id)a3;
- (void)onDeviceOrientationDidChange;
- (void)preferencePaneDidChangeWithPreference:(id)a3;
- (void)scrollViewDidEndDecelerating:(id)a3;
- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4;
- (void)scrollViewDidScroll:(id)a3;
- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation AegirAppViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10002C77C();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AegirAppViewController();
  [(AegirAppViewController *)&v4 viewWillAppear:v3];
}

- (void)dealloc
{
  BOOL v3 = self;
  objc_super v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4];

  id v6 = [self currentDevice];
  [v6 endGeneratingDeviceOrientationNotifications];

  sub_10002D354();
  v7.receiver = v4;
  v7.super_class = (Class)type metadata accessor for AegirAppViewController();
  [(AegirAppViewController *)&v7 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_vistaController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_settingsButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_rotationModel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_renderingConfig));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_preferenceViewController));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC11AegirPoster22AegirAppViewController_currentLocation);
}

- (void)onDeviceOrientationDidChange
{
  v2 = self;
  sub_10002CC8C();
}

- (BOOL)prefersHomeIndicatorAutoHidden
{
  return 1;
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10002D7C4(v4);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10002DA94(v4);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
  {
    id v6 = a3;
    objc_super v7 = self;
    sub_10002DDD0();
  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double x = a4.x;
  id v8 = a3;
  v9 = self;
  sub_10002FDA4(v8, (uint64_t)a5, x);
}

- (void)didTapView:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10002E218(v4);
}

- (void)preferencePaneDidChangeWithPreference:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10002F200();
}

- (void)astronomyVistaViewContentsAnimationFinished:(id)a3
{
  uint64_t v5 = sub_100031B18();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = a3;
  v10 = self;
  sub_100031AA8();
  v11 = sub_100031AF8();
  os_log_type_t v12 = sub_100031EF8();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "astronomyVistaViewContentsAnimationFinished", v13, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (_TtC11AegirPoster22AegirAppViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_100031C58();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC11AegirPoster22AegirAppViewController *)sub_10002F4D8(v5, v7, a4);
}

- (_TtC11AegirPoster22AegirAppViewController)initWithCoder:(id)a3
{
  return (_TtC11AegirPoster22AegirAppViewController *)sub_10002F67C(a3);
}

@end