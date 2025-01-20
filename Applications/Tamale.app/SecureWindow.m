@interface SecureWindow
+ (BOOL)_isSecure;
- (_TtC6Tamale12SecureWindow)initWithCoder:(id)a3;
- (_TtC6Tamale12SecureWindow)initWithContentRect:(CGRect)a3;
- (_TtC6Tamale12SecureWindow)initWithFrame:(CGRect)a3;
- (_TtC6Tamale12SecureWindow)initWithWindowScene:(id)a3;
@end

@implementation SecureWindow

+ (BOOL)_isSecure
{
  return 1;
}

- (_TtC6Tamale12SecureWindow)initWithWindowScene:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(SecureWindow *)&v5 initWithWindowScene:a3];
}

- (_TtC6Tamale12SecureWindow)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[SecureWindow initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC6Tamale12SecureWindow)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(SecureWindow *)&v5 initWithCoder:a3];
}

- (_TtC6Tamale12SecureWindow)initWithContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[SecureWindow initWithContentRect:](&v8, "initWithContentRect:", x, y, width, height);
}

@end