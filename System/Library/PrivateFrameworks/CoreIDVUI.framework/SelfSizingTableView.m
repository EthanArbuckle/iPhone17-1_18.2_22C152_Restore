@interface SelfSizingTableView
- (CGSize)contentSize;
- (CGSize)intrinsicContentSize;
- (_TtC9CoreIDVUI19SelfSizingTableView)initWithCoder:(id)a3;
- (_TtC9CoreIDVUI19SelfSizingTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4;
- (void)setContentSize:(CGSize)a3;
@end

@implementation SelfSizingTableView

- (CGSize)contentSize
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for SelfSizingTableView();
  [(SelfSizingTableView *)&v4 contentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for SelfSizingTableView();
  id v5 = v6.receiver;
  -[SelfSizingTableView setContentSize:](&v6, sel_setContentSize_, width, height);
  objc_msgSend(v5, sel_invalidateIntrinsicContentSize, v6.receiver, v6.super_class);
  objc_msgSend(v5, sel_setNeedsLayout);
}

- (CGSize)intrinsicContentSize
{
  double v2 = *(double *)((char *)&self->super.super.super.super.super.isa
                 + OBJC_IVAR____TtC9CoreIDVUI19SelfSizingTableView_maxHeight);
  double v3 = self;
  [(SelfSizingTableView *)v3 contentSize];
  if (v4 < v2) {
    double v2 = v4;
  }
  [(SelfSizingTableView *)v3 contentSize];
  double v6 = v5;

  double v7 = v6;
  double v8 = v2;
  result.double height = v8;
  result.double width = v7;
  return result;
}

- (_TtC9CoreIDVUI19SelfSizingTableView)initWithFrame:(CGRect)a3 style:(int64_t)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC9CoreIDVUI19SelfSizingTableView_maxHeight) = (Class)0x7FF0000000000000;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for SelfSizingTableView();
  return -[SelfSizingTableView initWithFrame:style:](&v10, sel_initWithFrame_style_, a4, x, y, width, height);
}

- (_TtC9CoreIDVUI19SelfSizingTableView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa + OBJC_IVAR____TtC9CoreIDVUI19SelfSizingTableView_maxHeight) = (Class)0x7FF0000000000000;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SelfSizingTableView();
  return [(SelfSizingTableView *)&v5 initWithCoder:a3];
}

@end