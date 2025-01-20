@interface SecureWindow
+ (BOOL)_isSecure;
- (_TtC16SharingUIService12SecureWindow)initWithCoder:(id)a3;
- (_TtC16SharingUIService12SecureWindow)initWithContentRect:(CGRect)a3;
- (_TtC16SharingUIService12SecureWindow)initWithFrame:(CGRect)a3;
- (_TtC16SharingUIService12SecureWindow)initWithWindowScene:(id)a3;
@end

@implementation SecureWindow

+ (BOOL)_isSecure
{
  return 1;
}

- (_TtC16SharingUIService12SecureWindow)initWithWindowScene:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SecureWindow();
  return [(SecureWindow *)&v5 initWithWindowScene:a3];
}

- (_TtC16SharingUIService12SecureWindow)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SecureWindow();
  return -[SecureWindow initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC16SharingUIService12SecureWindow)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SecureWindow();
  return [(SecureWindow *)&v5 initWithCoder:a3];
}

- (_TtC16SharingUIService12SecureWindow)initWithContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for SecureWindow();
  return -[SecureWindow initWithContentRect:](&v8, "initWithContentRect:", x, y, width, height);
}

@end