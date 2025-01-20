@interface HeaderFooterTableView
- (BOOL)_shouldShowHeadersAndFooters;
- (_TtC5Media21HeaderFooterTableView)initWithCoder:(id)a3;
- (_TtC5Media21HeaderFooterTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
@end

@implementation HeaderFooterTableView

- (BOOL)_shouldShowHeadersAndFooters
{
  return 1;
}

- (_TtC5Media21HeaderFooterTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for HeaderFooterTableView();
  return -[HeaderFooterTableView initWithFrame:style:](&v10, "initWithFrame:style:", a4, x, y, width, height);
}

- (_TtC5Media21HeaderFooterTableView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for HeaderFooterTableView();
  return [(HeaderFooterTableView *)&v5 initWithCoder:a3];
}

@end