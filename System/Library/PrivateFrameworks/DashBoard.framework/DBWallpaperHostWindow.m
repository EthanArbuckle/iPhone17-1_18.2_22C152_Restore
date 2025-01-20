@interface DBWallpaperHostWindow
- (_TtC9DashBoard21DBWallpaperHostWindow)initWithCoder:(id)a3;
- (_TtC9DashBoard21DBWallpaperHostWindow)initWithFrame:(CGRect)a3;
- (_TtC9DashBoard21DBWallpaperHostWindow)initWithWindowScene:(id)a3;
- (_TtC9DashBoard21DBWallpaperHostWindow)initWithWindowScene:(id)a3 frame:(CGRect)a4 sceneFrame:(CGRect)a5 sceneIdentity:(id)a6;
- (id)createAdditionalPresentationView;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation DBWallpaperHostWindow

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (id)createAdditionalPresentationView
{
  v3 = (objc_class *)type metadata accessor for DBWallpaperAdditionalPresentationView();
  id v4 = objc_allocWithZone(v3);
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v8.receiver = v4;
  v8.super_class = v3;
  v5 = self;
  v6 = -[DBWallpaperHostWindow initWithFrame:](&v8, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  -[DBWallpaperHostWindow setBackgroundColor:](v6, sel_setBackgroundColor_, 0, v8.receiver, v8.super_class);

  return v6;
}

- (_TtC9DashBoard21DBWallpaperHostWindow)initWithWindowScene:(id)a3 frame:(CGRect)a4 sceneFrame:(CGRect)a5 sceneIdentity:(id)a6
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  double v11 = a4.size.height;
  double v12 = a4.size.width;
  double v13 = a4.origin.y;
  double v14 = a4.origin.x;
  v17.receiver = self;
  v17.super_class = (Class)type metadata accessor for DBWallpaperHostWindow();
  return -[DBLocalSceneHostWindow initWithWindowScene:frame:sceneFrame:sceneIdentity:](&v17, sel_initWithWindowScene_frame_sceneFrame_sceneIdentity_, a3, a6, v14, v13, v12, v11, x, y, width, height);
}

- (_TtC9DashBoard21DBWallpaperHostWindow)initWithWindowScene:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DBWallpaperHostWindow();
  return [(DBWallpaperHostWindow *)&v5 initWithWindowScene:a3];
}

- (_TtC9DashBoard21DBWallpaperHostWindow)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DBWallpaperHostWindow();
  return -[DBWallpaperHostWindow initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9DashBoard21DBWallpaperHostWindow)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DBWallpaperHostWindow();
  return [(DBWallpaperHostWindow *)&v5 initWithCoder:a3];
}

@end