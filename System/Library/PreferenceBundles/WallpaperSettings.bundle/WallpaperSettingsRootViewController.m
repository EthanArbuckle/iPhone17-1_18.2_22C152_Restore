@interface WallpaperSettingsRootViewController
- (WallpaperSettingsRootViewController)initWithCoder:(id)a3;
- (WallpaperSettingsRootViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)handleURL:(NSDictionary *)a3 withCompletion:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation WallpaperSettingsRootViewController

- (void)viewDidLoad
{
  v2 = self;
  WallpaperSettingsRootViewController.viewDidLoad()();
}

- (void)viewIsAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(WallpaperSettingsRootViewController *)&v5 viewIsAppearing:v3];
  sub_3368();
}

- (void)viewDidAppear:(BOOL)a3
{
  id v4 = self;
  WallpaperSettingsRootViewController.viewDidAppear(_:)(a3);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  WallpaperSettingsRootViewController.viewWillTransition(to:with:)(a4, width, height);
  swift_unknownObjectRelease();
}

- (WallpaperSettingsRootViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_336E0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (WallpaperSettingsRootViewController *)WallpaperSettingsRootViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (WallpaperSettingsRootViewController)initWithCoder:(id)a3
{
  return (WallpaperSettingsRootViewController *)WallpaperSettingsRootViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  swift_release();

  swift_unknownObjectRelease();
}

- (void)handleURL:(NSDictionary *)a3 withCompletion:(id)a4
{
  uint64_t v7 = sub_5CC8(&qword_48378);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_337D0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_45248;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_45258;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_5F10((uint64_t)v9, (uint64_t)&unk_45268, (uint64_t)v14);
  swift_release();
}

@end