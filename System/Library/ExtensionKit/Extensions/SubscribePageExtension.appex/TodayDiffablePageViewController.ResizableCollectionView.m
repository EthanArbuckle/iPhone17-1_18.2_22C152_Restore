@interface TodayDiffablePageViewController.ResizableCollectionView
- (CGRect)frame;
- (_TtCC22SubscribePageExtension31TodayDiffablePageViewControllerP33_B12EF26EAF02F70AE4817770683129CD23ResizableCollectionView)initWithCoder:(id)a3;
- (_TtCC22SubscribePageExtension31TodayDiffablePageViewControllerP33_B12EF26EAF02F70AE4817770683129CD23ResizableCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
- (void)reloadData;
- (void)setFrame:(CGRect)a3;
@end

@implementation TodayDiffablePageViewController.ResizableCollectionView

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  [(TodayDiffablePageViewController.ResizableCollectionView *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_1003CD76C(x, y, width, height);
}

- (void)reloadData
{
  double v2 = self;
  sub_1003CDEE8();
}

- (_TtCC22SubscribePageExtension31TodayDiffablePageViewControllerP33_B12EF26EAF02F70AE4817770683129CD23ResizableCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  return -[TodayDiffablePageViewController.ResizableCollectionView initWithFrame:collectionViewLayout:](&v10, "initWithFrame:collectionViewLayout:", a4, x, y, width, height);
}

- (_TtCC22SubscribePageExtension31TodayDiffablePageViewControllerP33_B12EF26EAF02F70AE4817770683129CD23ResizableCollectionView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(TodayDiffablePageViewController.ResizableCollectionView *)&v5 initWithCoder:a3];
}

@end