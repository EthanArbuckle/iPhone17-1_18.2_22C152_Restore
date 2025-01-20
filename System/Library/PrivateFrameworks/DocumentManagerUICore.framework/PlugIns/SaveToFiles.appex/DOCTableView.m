@interface DOCTableView
- (_TtC11SaveToFiles12DOCTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
@end

@implementation DOCTableView

- (_TtC11SaveToFiles12DOCTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for DOCTableView();
  return -[DOCTableView initWithFrame:style:](&v10, "initWithFrame:style:", a4, x, y, width, height);
}

@end