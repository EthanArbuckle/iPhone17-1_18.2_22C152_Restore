@interface _AXMTARKitInvisibleWindow
+ (BOOL)_isSecure;
- (_AXMTARKitInvisibleWindow)initWithFrame:(CGRect)a3;
@end

@implementation _AXMTARKitInvisibleWindow

- (_AXMTARKitInvisibleWindow)initWithFrame:(CGRect)a3
{
  v4 = +[UIScreen mainScreen];
  v7.receiver = self;
  v7.super_class = (Class)_AXMTARKitInvisibleWindow;
  v5 = [(_AXMTARKitInvisibleWindow *)&v7 initWithScreen:v4];

  return v5;
}

+ (BOOL)_isSecure
{
  return 1;
}

@end