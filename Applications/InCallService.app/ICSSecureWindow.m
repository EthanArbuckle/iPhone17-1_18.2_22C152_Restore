@interface ICSSecureWindow
+ (BOOL)_isSecure;
- (ICSSecureWindow)initWithCoder:(id)a3;
- (ICSSecureWindow)initWithContentRect:(CGRect)a3;
- (ICSSecureWindow)initWithFrame:(CGRect)a3;
- (ICSSecureWindow)initWithWindowScene:(id)a3;
@end

@implementation ICSSecureWindow

+ (BOOL)_isSecure
{
  return 1;
}

- (ICSSecureWindow)initWithWindowScene:(id)a3
{
  return (ICSSecureWindow *)sub_10017C7E8(a3);
}

- (ICSSecureWindow)initWithFrame:(CGRect)a3
{
  return (ICSSecureWindow *)sub_10017C860();
}

- (ICSSecureWindow)initWithCoder:(id)a3
{
  return (ICSSecureWindow *)sub_10017C8C4(a3);
}

- (ICSSecureWindow)initWithContentRect:(CGRect)a3
{
  return (ICSSecureWindow *)sub_10017C93C();
}

@end