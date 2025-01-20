@interface WidgetWindow
+ (BOOL)_isSecure;
- (_TtC10ChronoCore12WidgetWindow)initWithCoder:(id)a3;
- (_TtC10ChronoCore12WidgetWindow)initWithContentRect:(CGRect)a3;
- (_TtC10ChronoCore12WidgetWindow)initWithFrame:(CGRect)a3;
- (_TtC10ChronoCore12WidgetWindow)initWithWindowScene:(id)a3;
@end

@implementation WidgetWindow

+ (BOOL)_isSecure
{
  return 1;
}

- (_TtC10ChronoCore12WidgetWindow)initWithWindowScene:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WidgetWindow();
  return [(WidgetWindow *)&v5 initWithWindowScene:a3];
}

- (_TtC10ChronoCore12WidgetWindow)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for WidgetWindow();
  return -[WidgetWindow initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC10ChronoCore12WidgetWindow)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for WidgetWindow();
  return [(WidgetWindow *)&v5 initWithCoder:a3];
}

- (_TtC10ChronoCore12WidgetWindow)initWithContentRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for WidgetWindow();
  return -[WidgetWindow initWithContentRect:](&v8, sel_initWithContentRect_, x, y, width, height);
}

@end