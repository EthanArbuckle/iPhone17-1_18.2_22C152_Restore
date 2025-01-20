@interface BaseTableView
- (_TtC11Diagnostics13BaseTableView)initWithCoder:(id)a3;
- (_TtC11Diagnostics13BaseTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
@end

@implementation BaseTableView

- (_TtC11Diagnostics13BaseTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for BaseTableView();
  return -[BaseTableView initWithFrame:style:](&v10, "initWithFrame:style:", a4, x, y, width, height);
}

- (_TtC11Diagnostics13BaseTableView)initWithCoder:(id)a3
{
  result = (_TtC11Diagnostics13BaseTableView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

@end