@interface DOCProgressCollectionListViewController.ProgressListingView
- (CGSize)intrinsicContentSize;
- (_TtCC17RecentsAppPopover39DOCProgressCollectionListViewController19ProgressListingView)initWithCoder:(id)a3;
- (_TtCC17RecentsAppPopover39DOCProgressCollectionListViewController19ProgressListingView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (double)fittingHeight;
- (void)layoutSubviews;
- (void)setFittingHeight:(double)a3;
@end

@implementation DOCProgressCollectionListViewController.ProgressListingView

- (CGSize)intrinsicContentSize
{
  [(DOCProgressCollectionListViewController.ProgressListingView *)self contentSize];
  double v3 = fmax(v2, 300.0);
  double v5 = fmax(v4, 1.0);
  result.height = v5;
  result.width = v3;
  return result;
}

- (double)fittingHeight
{
  return *(double *)((char *)&self->super.super.super.super.super.isa
                   + OBJC_IVAR____TtCC17RecentsAppPopover39DOCProgressCollectionListViewController19ProgressListingView_fittingHeight);
}

- (void)setFittingHeight:(double)a3
{
  double v3 = *(double *)((char *)&self->super.super.super.super.super.isa
                 + OBJC_IVAR____TtCC17RecentsAppPopover39DOCProgressCollectionListViewController19ProgressListingView_fittingHeight);
  *(double *)((char *)&self->super.super.super.super.super.isa
            + OBJC_IVAR____TtCC17RecentsAppPopover39DOCProgressCollectionListViewController19ProgressListingView_fittingHeight) = a3;
  if (v3 != a3) {
    [(DOCProgressCollectionListViewController.ProgressListingView *)self invalidateIntrinsicContentSize];
  }
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_1003D80D0();
}

- (_TtCC17RecentsAppPopover39DOCProgressCollectionListViewController19ProgressListingView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v9 = OBJC_IVAR____TtCC17RecentsAppPopover39DOCProgressCollectionListViewController19ProgressListingView_fittingHeight;
  uint64_t v10 = qword_100615D68;
  id v11 = a4;
  v12 = self;
  if (v10 != -1) {
    swift_once();
  }
  *(Class *)((char *)&v12->super.super.super.super.super.isa + v9) = (Class)qword_10063F6D8;
  *(Class *)((char *)&v12->super.super.super.super.super.isa
           + OBJC_IVAR____TtCC17RecentsAppPopover39DOCProgressCollectionListViewController19ProgressListingView_fittingHeightUpdateDisabledCount) = 0;

  v15.receiver = v12;
  v15.super_class = (Class)type metadata accessor for DOCProgressCollectionListViewController.ProgressListingView();
  v13 = -[DOCProgressCollectionListViewController.ProgressListingView initWithFrame:collectionViewLayout:](&v15, "initWithFrame:collectionViewLayout:", v11, x, y, width, height);

  return v13;
}

- (_TtCC17RecentsAppPopover39DOCProgressCollectionListViewController19ProgressListingView)initWithCoder:(id)a3
{
  return (_TtCC17RecentsAppPopover39DOCProgressCollectionListViewController19ProgressListingView *)sub_1003D82A0(a3);
}

@end