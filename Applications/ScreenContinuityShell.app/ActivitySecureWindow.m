@interface ActivitySecureWindow
+ (BOOL)_isSecure;
- (_TtC21ScreenContinuityShell20ActivitySecureWindow)initWithCoder:(id)a3;
- (_TtC21ScreenContinuityShell20ActivitySecureWindow)initWithContentRect:(CGRect)a3;
- (_TtC21ScreenContinuityShell20ActivitySecureWindow)initWithFrame:(CGRect)a3;
- (_TtC21ScreenContinuityShell20ActivitySecureWindow)initWithWindowScene:(id)a3;
@end

@implementation ActivitySecureWindow

+ (BOOL)_isSecure
{
  return 1;
}

- (_TtC21ScreenContinuityShell20ActivitySecureWindow)initWithWindowScene:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ActivitySecureWindow();
  return [(ActivitySecureWindow *)&v5 initWithWindowScene:a3];
}

- (_TtC21ScreenContinuityShell20ActivitySecureWindow)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ActivitySecureWindow();
  return -[ActivitySecureWindow initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC21ScreenContinuityShell20ActivitySecureWindow)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ActivitySecureWindow();
  return [(ActivitySecureWindow *)&v5 initWithCoder:a3];
}

- (_TtC21ScreenContinuityShell20ActivitySecureWindow)initWithContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ActivitySecureWindow();
  return -[ActivitySecureWindow initWithContentRect:](&v8, "initWithContentRect:", x, y, width, height);
}

@end