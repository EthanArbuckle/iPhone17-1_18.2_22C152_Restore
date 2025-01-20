@interface DBWallpaperWindow
- (_TtC9DashBoard17DBWallpaperWindow)initWithCoder:(id)a3;
- (_TtC9DashBoard17DBWallpaperWindow)initWithFrame:(CGRect)a3;
- (_TtC9DashBoard17DBWallpaperWindow)initWithWindowScene:(id)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation DBWallpaperWindow

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

- (_TtC9DashBoard17DBWallpaperWindow)initWithWindowScene:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DBWallpaperWindow();
  return [(DBWallpaperWindow *)&v5 initWithWindowScene:a3];
}

- (_TtC9DashBoard17DBWallpaperWindow)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DBWallpaperWindow();
  return -[DBWallpaperWindow initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC9DashBoard17DBWallpaperWindow)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DBWallpaperWindow();
  return [(DBWallpaperWindow *)&v5 initWithCoder:a3];
}

@end