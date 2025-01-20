@interface DOCModalBlurViewControllerView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (_TtC17RecentsAppPopover30DOCModalBlurViewControllerView)initWithCoder:(id)a3;
- (_TtC17RecentsAppPopover30DOCModalBlurViewControllerView)initWithFrame:(CGRect)a3;
@end

@implementation DOCModalBlurViewControllerView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_1004BEB10();
    v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    v6 = 0;
  }
  v7 = self;
  char v8 = sub_1001FCAA8(v4, v6);

  swift_bridgeObjectRelease();
  return v8 & 1;
}

- (_TtC17RecentsAppPopover30DOCModalBlurViewControllerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCModalBlurViewControllerView();
  return -[DOCModalBlurViewControllerView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC17RecentsAppPopover30DOCModalBlurViewControllerView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCModalBlurViewControllerView();
  return [(DOCModalBlurViewControllerView *)&v5 initWithCoder:a3];
}

@end