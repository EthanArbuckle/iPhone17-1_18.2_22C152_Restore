@interface DOCProgressCollectionIndicatorButtonItem.ProgressItemContainerView
- (BOOL)isActivePopoverSource;
- (_TtCC18DocumentAppIntents40DOCProgressCollectionIndicatorButtonItemP33_7FE6E7EDF8817CAC89B25E74FF115DD725ProgressItemContainerView)initWithFrame:(CGRect)a3;
- (void)setIsActivePopoverSource:(BOOL)a3;
@end

@implementation DOCProgressCollectionIndicatorButtonItem.ProgressItemContainerView

- (BOOL)isActivePopoverSource
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtCC18DocumentAppIntents40DOCProgressCollectionIndicatorButtonItemP33_7FE6E7EDF8817CAC89B25E74FF115DD725ProgressItemContainerView_isActivePopoverSource);
}

- (void)setIsActivePopoverSource:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtCC18DocumentAppIntents40DOCProgressCollectionIndicatorButtonItemP33_7FE6E7EDF8817CAC89B25E74FF115DD725ProgressItemContainerView_isActivePopoverSource) = a3;
  [(DOCProgressCollectionIndicatorButtonItem.ProgressItemContainerView *)self setNeedsLayout];
}

- (_TtCC18DocumentAppIntents40DOCProgressCollectionIndicatorButtonItemP33_7FE6E7EDF8817CAC89B25E74FF115DD725ProgressItemContainerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtCC18DocumentAppIntents40DOCProgressCollectionIndicatorButtonItemP33_7FE6E7EDF8817CAC89B25E74FF115DD725ProgressItemContainerView_isActivePopoverSource) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCProgressCollectionIndicatorButtonItem.ProgressItemContainerView();
  return -[DOCView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

@end