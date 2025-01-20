@interface CycleChartsCollectionViewLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4;
- (CGSize)collectionViewContentSize;
- (_TtC24MenstrualCyclesAppPlugin31CycleChartsCollectionViewLayout)init;
- (_TtC24MenstrualCyclesAppPlugin31CycleChartsCollectionViewLayout)initWithCoder:(id)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (void)prepareLayout;
@end

@implementation CycleChartsCollectionViewLayout

- (CGSize)collectionViewContentSize
{
  double v2 = *(double *)((char *)&self->super.super.isa
                 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleChartsCollectionViewLayout_contentSize);
  double v3 = *(double *)((char *)&self->super._collectionView
                 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleChartsCollectionViewLayout_contentSize);
  result.height = v3;
  result.width = v2;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  uint64_t v8 = sub_2412AD6BC(x, y, width, height);

  if (v8)
  {
    sub_2411B9D00(0, (unint64_t *)&qword_268D01100);
    v9 = (void *)sub_241631F18();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4 = sub_24162BB18();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162BAA8();
  uint64_t v8 = self;
  id v9 = sub_2412AE668((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v9;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v5 = sub_24162BB18();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = _sSo25HKMCDisplayTypeIdentifiera24MenstrualCyclesAppPluginE2idSSvg_0();
  uint64_t v11 = v10;
  sub_24162BAA8();
  v12 = self;
  v13 = sub_2412AF1B8(v9, v11, (uint64_t)v8);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v13;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  double v3 = a3.x
     + *(double *)((char *)&self->super.super.isa
                 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleChartsCollectionViewLayout_axisColumnWidthAdjustment);
  uint64_t v4 = OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleChartsCollectionViewLayout_headerHeightAdjustment;
  double v5 = a3.y
     + *(double *)((char *)&self->super.super.isa
                 + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleChartsCollectionViewLayout_headerHeightAdjustment);
  *(Class *)((char *)&self->super.super.isa
           + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleChartsCollectionViewLayout_axisColumnWidthAdjustment) = 0;
  *(Class *)((char *)&self->super.super.isa + v4) = 0;
  result.CGFloat y = v5;
  result.CGFloat x = v3;
  return result;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v6 = self;
  sub_2412B0FCC(x, y);
  double v8 = v7;
  double v10 = v9;

  double v11 = v8;
  double v12 = v10;
  result.double y = v12;
  result.double x = v11;
  return result;
}

- (void)prepareLayout
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  double v2 = v3.receiver;
  [(CycleChartsCollectionViewLayout *)&v3 prepareLayout];
  if ((v2[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleChartsCollectionViewLayout_pendingScrollToSectionIndex + 8] & 1) == 0) {
    sub_2412B12B4(*(void *)&v2[OBJC_IVAR____TtC24MenstrualCyclesAppPlugin31CycleChartsCollectionViewLayout_pendingScrollToSectionIndex]);
  }
}

- (_TtC24MenstrualCyclesAppPlugin31CycleChartsCollectionViewLayout)init
{
  return (_TtC24MenstrualCyclesAppPlugin31CycleChartsCollectionViewLayout *)sub_2412AFED4();
}

- (_TtC24MenstrualCyclesAppPlugin31CycleChartsCollectionViewLayout)initWithCoder:(id)a3
{
  return (_TtC24MenstrualCyclesAppPlugin31CycleChartsCollectionViewLayout *)sub_2412AFFB8(a3);
}

- (void).cxx_destruct
{
}

@end