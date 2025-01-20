@interface IntrinsicSizeAdjustingTableView
- (CGSize)intrinsicContentSize;
- (_TtC11Diagnostics31IntrinsicSizeAdjustingTableView)initWithCoder:(id)a3;
- (_TtC11Diagnostics31IntrinsicSizeAdjustingTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
@end

@implementation IntrinsicSizeAdjustingTableView

- (CGSize)intrinsicContentSize
{
  v2 = self;
  [(IntrinsicSizeAdjustingTableView *)v2 layoutIfNeeded];
  [(IntrinsicSizeAdjustingTableView *)v2 contentSize];
  double v4 = v3;

  double v5 = ceil(v4);
  double v6 = UIViewNoIntrinsicMetric;
  result.height = v5;
  result.width = v6;
  return result;
}

- (_TtC11Diagnostics31IntrinsicSizeAdjustingTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for IntrinsicSizeAdjustingTableView();
  return -[IntrinsicSizeAdjustingTableView initWithFrame:style:](&v10, "initWithFrame:style:", a4, x, y, width, height);
}

- (_TtC11Diagnostics31IntrinsicSizeAdjustingTableView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for IntrinsicSizeAdjustingTableView();
  return [(IntrinsicSizeAdjustingTableView *)&v5 initWithCoder:a3];
}

@end