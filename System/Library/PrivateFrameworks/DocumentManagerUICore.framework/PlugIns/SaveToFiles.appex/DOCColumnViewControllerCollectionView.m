@interface DOCColumnViewControllerCollectionView
- (_TtC11SaveToFiles37DOCColumnViewControllerCollectionView)initWithCoder:(id)a3;
- (_TtC11SaveToFiles37DOCColumnViewControllerCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4;
@end

@implementation DOCColumnViewControllerCollectionView

- (_TtC11SaveToFiles37DOCColumnViewControllerCollectionView)initWithFrame:(CGRect)a3 collectionViewLayout:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for DOCColumnViewControllerCollectionView();
  return -[DOCCollectionView initWithFrame:collectionViewLayout:](&v10, "initWithFrame:collectionViewLayout:", a4, x, y, width, height);
}

- (_TtC11SaveToFiles37DOCColumnViewControllerCollectionView)initWithCoder:(id)a3
{
  return (_TtC11SaveToFiles37DOCColumnViewControllerCollectionView *)sub_1000F8384(self, (uint64_t)a2, (uint64_t)a3, v3, (uint64_t (*)(uint64_t))type metadata accessor for DOCColumnViewControllerCollectionView);
}

@end