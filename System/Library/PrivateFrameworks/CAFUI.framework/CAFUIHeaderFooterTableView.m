@interface CAFUIHeaderFooterTableView
- (BOOL)_shouldShowHeadersAndFooters;
- (_TtC5CAFUI26CAFUIHeaderFooterTableView)initWithCoder:(id)a3;
- (_TtC5CAFUI26CAFUIHeaderFooterTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
@end

@implementation CAFUIHeaderFooterTableView

- (BOOL)_shouldShowHeadersAndFooters
{
  return 1;
}

- (_TtC5CAFUI26CAFUIHeaderFooterTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for CAFUIHeaderFooterTableView();
  return -[CAFUIHeaderFooterTableView initWithFrame:style:](&v10, sel_initWithFrame_style_, a4, x, y, width, height);
}

- (_TtC5CAFUI26CAFUIHeaderFooterTableView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CAFUIHeaderFooterTableView();
  return [(CAFUIHeaderFooterTableView *)&v5 initWithCoder:a3];
}

@end