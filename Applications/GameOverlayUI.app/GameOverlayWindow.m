@interface GameOverlayWindow
- (_TtC13GameOverlayUI17GameOverlayWindow)initWithCoder:(id)a3;
- (_TtC13GameOverlayUI17GameOverlayWindow)initWithContentRect:(CGRect)a3;
- (_TtC13GameOverlayUI17GameOverlayWindow)initWithFrame:(CGRect)a3;
- (_TtC13GameOverlayUI17GameOverlayWindow)initWithWindowScene:(id)a3;
- (unint64_t)_supportedInterfaceOrientationsForRootViewController;
@end

@implementation GameOverlayWindow

- (unint64_t)_supportedInterfaceOrientationsForRootViewController
{
  return 30;
}

- (_TtC13GameOverlayUI17GameOverlayWindow)initWithWindowScene:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(GameOverlayWindow *)&v5 initWithWindowScene:a3];
}

- (_TtC13GameOverlayUI17GameOverlayWindow)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[GameOverlayWindow initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC13GameOverlayUI17GameOverlayWindow)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(GameOverlayWindow *)&v5 initWithCoder:a3];
}

- (_TtC13GameOverlayUI17GameOverlayWindow)initWithContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[GameOverlayWindow initWithContentRect:](&v8, "initWithContentRect:", x, y, width, height);
}

@end