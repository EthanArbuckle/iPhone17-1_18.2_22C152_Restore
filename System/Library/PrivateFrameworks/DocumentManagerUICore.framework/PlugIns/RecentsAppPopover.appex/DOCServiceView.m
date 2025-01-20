@interface DOCServiceView
- (_TtC17RecentsAppPopover14DOCServiceView)initWithCoder:(id)a3;
- (_TtC17RecentsAppPopover14DOCServiceView)initWithFrame:(CGRect)a3;
@end

@implementation DOCServiceView

- (_TtC17RecentsAppPopover14DOCServiceView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCServiceView();
  return -[DOCServiceView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC17RecentsAppPopover14DOCServiceView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCServiceView();
  return [(DOCServiceView *)&v5 initWithCoder:a3];
}

@end