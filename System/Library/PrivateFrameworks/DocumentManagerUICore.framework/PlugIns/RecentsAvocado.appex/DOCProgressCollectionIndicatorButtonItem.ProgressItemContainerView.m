@interface DOCProgressCollectionIndicatorButtonItem.ProgressItemContainerView
- (BOOL)isActivePopoverSource;
- (_TtCC14RecentsAvocado40DOCProgressCollectionIndicatorButtonItemP33_2B75571D2ADFD97A444FB46733E89D1925ProgressItemContainerView)initWithFrame:(CGRect)a3;
- (void)setIsActivePopoverSource:(BOOL)a3;
@end

@implementation DOCProgressCollectionIndicatorButtonItem.ProgressItemContainerView

- (BOOL)isActivePopoverSource
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtCC14RecentsAvocado40DOCProgressCollectionIndicatorButtonItemP33_2B75571D2ADFD97A444FB46733E89D1925ProgressItemContainerView_isActivePopoverSource);
}

- (void)setIsActivePopoverSource:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtCC14RecentsAvocado40DOCProgressCollectionIndicatorButtonItemP33_2B75571D2ADFD97A444FB46733E89D1925ProgressItemContainerView_isActivePopoverSource) = a3;
  [(DOCProgressCollectionIndicatorButtonItem.ProgressItemContainerView *)self setNeedsLayout];
}

- (_TtCC14RecentsAvocado40DOCProgressCollectionIndicatorButtonItemP33_2B75571D2ADFD97A444FB46733E89D1925ProgressItemContainerView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtCC14RecentsAvocado40DOCProgressCollectionIndicatorButtonItemP33_2B75571D2ADFD97A444FB46733E89D1925ProgressItemContainerView_isActivePopoverSource) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for DOCProgressCollectionIndicatorButtonItem.ProgressItemContainerView();
  return -[DOCView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

@end