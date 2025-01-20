@interface DOCCollectionView
- (CGSize)contentSize;
- (_TtC17RecentsAppPopover17DOCCollectionView)initWithCoder:(id)a3;
- (_TtC17RecentsAppPopover17DOCCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (void)setContentSize:(CGSize)a3;
@end

@implementation DOCCollectionView

- (CGSize)contentSize
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for DOCCollectionView();
  [(DOCCollectionView *)&v4 contentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = self;
  DOCCollectionView.contentSize.setter(width, height);
}

- (_TtC17RecentsAppPopover17DOCCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC17RecentsAppPopover17DOCCollectionView____lazy_storage___offsetAdjustmentBehaviors) = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for DOCCollectionView();
  return -[DOCCollectionView initWithFrame:collectionViewLayout:](&v10, "initWithFrame:collectionViewLayout:", a4, x, y, width, height);
}

- (_TtC17RecentsAppPopover17DOCCollectionView)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC17RecentsAppPopover17DOCCollectionView____lazy_storage___offsetAdjustmentBehaviors) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCCollectionView();
  return [(DOCCollectionView *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end