@interface UISecureWindow
+ (BOOL)_isSecure;
- (_TtC7SwiftUI14UISecureWindow)initWithCoder:(id)a3;
- (_TtC7SwiftUI14UISecureWindow)initWithContentRect:(CGRect)a3;
- (_TtC7SwiftUI14UISecureWindow)initWithFrame:(CGRect)a3;
- (_TtC7SwiftUI14UISecureWindow)initWithWindowScene:(id)a3;
@end

@implementation UISecureWindow

+ (BOOL)_isSecure
{
  return 1;
}

- (_TtC7SwiftUI14UISecureWindow)initWithWindowScene:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for UISecureWindow();
  return [(UISecureWindow *)&v5 initWithWindowScene:a3];
}

- (_TtC7SwiftUI14UISecureWindow)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for UISecureWindow();
  return -[UISecureWindow initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC7SwiftUI14UISecureWindow)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for UISecureWindow();
  return [(UISecureWindow *)&v5 initWithCoder:a3];
}

- (_TtC7SwiftUI14UISecureWindow)initWithContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for UISecureWindow();
  return -[UISecureWindow initWithContentRect:](&v8, sel_initWithContentRect_, x, y, width, height);
}

@end