@interface UIKitNavigationBar
+ (BOOL)_isFromSwiftUI;
- (_TtC7SwiftUI18UIKitNavigationBar)initWithCoder:(id)a3;
- (_TtC7SwiftUI18UIKitNavigationBar)initWithFrame:(CGRect)a3;
@end

@implementation UIKitNavigationBar

- (_TtC7SwiftUI18UIKitNavigationBar)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  return -[UIKitNavigationBar initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

+ (BOOL)_isFromSwiftUI
{
  return 1;
}

- (_TtC7SwiftUI18UIKitNavigationBar)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(UIKitNavigationBar *)&v5 initWithCoder:a3];
}

@end