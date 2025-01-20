@interface SingleCycleViewCollectionViewFlowLayout
- (BOOL)flipsHorizontallyInOppositeLayoutDirection;
- (_TtC24MenstrualCyclesAppPlugin39SingleCycleViewCollectionViewFlowLayout)init;
- (_TtC24MenstrualCyclesAppPlugin39SingleCycleViewCollectionViewFlowLayout)initWithCoder:(id)a3;
- (void)prepareLayout;
@end

@implementation SingleCycleViewCollectionViewFlowLayout

- (_TtC24MenstrualCyclesAppPlugin39SingleCycleViewCollectionViewFlowLayout)init
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = [(UICollectionViewFlowLayout *)&v4 init];
  [(UICollectionViewFlowLayout *)v2 setScrollDirection:1];
  return v2;
}

- (_TtC24MenstrualCyclesAppPlugin39SingleCycleViewCollectionViewFlowLayout)initWithCoder:(id)a3
{
  result = (_TtC24MenstrualCyclesAppPlugin39SingleCycleViewCollectionViewFlowLayout *)sub_241633038();
  __break(1u);
  return result;
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (void)prepareLayout
{
  v2 = self;
  sub_2413B3754();
}

@end