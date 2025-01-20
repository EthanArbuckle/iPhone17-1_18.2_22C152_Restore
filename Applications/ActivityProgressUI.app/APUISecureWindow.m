@interface APUISecureWindow
+ (BOOL)_isSecure;
- (_TtC18ActivityProgressUI16APUISecureWindow)initWithCoder:(id)a3;
- (_TtC18ActivityProgressUI16APUISecureWindow)initWithContentRect:(CGRect)a3;
- (_TtC18ActivityProgressUI16APUISecureWindow)initWithFrame:(CGRect)a3;
- (_TtC18ActivityProgressUI16APUISecureWindow)initWithWindowScene:(id)a3;
@end

@implementation APUISecureWindow

+ (BOOL)_isSecure
{
  return 1;
}

- (_TtC18ActivityProgressUI16APUISecureWindow)initWithWindowScene:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for APUISecureWindow();
  return [(APUISecureWindow *)&v5 initWithWindowScene:a3];
}

- (_TtC18ActivityProgressUI16APUISecureWindow)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for APUISecureWindow();
  return -[APUISecureWindow initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC18ActivityProgressUI16APUISecureWindow)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for APUISecureWindow();
  return [(APUISecureWindow *)&v5 initWithCoder:a3];
}

- (_TtC18ActivityProgressUI16APUISecureWindow)initWithContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for APUISecureWindow();
  return -[APUISecureWindow initWithContentRect:](&v8, "initWithContentRect:", x, y, width, height);
}

@end