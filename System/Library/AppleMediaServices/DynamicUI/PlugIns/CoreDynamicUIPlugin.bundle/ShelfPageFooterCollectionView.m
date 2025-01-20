@interface ShelfPageFooterCollectionView
- (CGSize)contentSize;
- (CGSize)intrinsicContentSize;
- (_TtC19CoreDynamicUIPlugin29ShelfPageFooterCollectionView)init;
- (_TtC19CoreDynamicUIPlugin29ShelfPageFooterCollectionView)initWithCoder:(id)a3;
- (_TtC19CoreDynamicUIPlugin29ShelfPageFooterCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (void)setContentSize:(CGSize)a3;
@end

@implementation ShelfPageFooterCollectionView

- (_TtC19CoreDynamicUIPlugin29ShelfPageFooterCollectionView)init
{
  return (_TtC19CoreDynamicUIPlugin29ShelfPageFooterCollectionView *)sub_75440();
}

- (_TtC19CoreDynamicUIPlugin29ShelfPageFooterCollectionView)initWithCoder:(id)a3
{
  return (_TtC19CoreDynamicUIPlugin29ShelfPageFooterCollectionView *)sub_754D4(a3);
}

- (_TtC19CoreDynamicUIPlugin29ShelfPageFooterCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  return (_TtC19CoreDynamicUIPlugin29ShelfPageFooterCollectionView *)sub_75588(a4, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CGSize)contentSize
{
  v2 = self;
  sub_756D0();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  double v5 = self;
  sub_75764(width, height);
}

- (CGSize)intrinsicContentSize
{
  v2 = self;
  CGFloat v3 = sub_75804();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.double height = v7;
  result.double width = v6;
  return result;
}

@end