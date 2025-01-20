@interface SecureWindow
+ (BOOL)_isSecure;
- (_TtC7Sidecar12SecureWindow)initWithCoder:(id)a3;
- (_TtC7Sidecar12SecureWindow)initWithContentRect:(CGRect)a3;
- (_TtC7Sidecar12SecureWindow)initWithFrame:(CGRect)a3;
- (_TtC7Sidecar12SecureWindow)initWithWindowScene:(id)a3;
@end

@implementation SecureWindow

+ (BOOL)_isSecure
{
  return 1;
}

- (_TtC7Sidecar12SecureWindow)initWithWindowScene:(id)a3
{
  return (_TtC7Sidecar12SecureWindow *)sub_100011DCC(a3, type metadata accessor for SecureWindow, (SEL *)&selRef_initWithWindowScene_);
}

- (_TtC7Sidecar12SecureWindow)initWithFrame:(CGRect)a3
{
  return (_TtC7Sidecar12SecureWindow *)sub_100007E14();
}

- (_TtC7Sidecar12SecureWindow)initWithCoder:(id)a3
{
  return (_TtC7Sidecar12SecureWindow *)sub_100011F88(a3, type metadata accessor for SecureWindow);
}

- (_TtC7Sidecar12SecureWindow)initWithContentRect:(CGRect)a3
{
  return (_TtC7Sidecar12SecureWindow *)sub_100007EB4();
}

@end