@interface InteractiveTimelineCollectionViewLayout
+ (Class)invalidationContextClass;
+ (Class)layoutAttributesClass;
- (BOOL)flipsHorizontallyInOppositeLayoutDirection;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4;
- (CGSize)collectionViewContentSize;
- (NSString)description;
- (_TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout)init;
- (_TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout)initWithCoder:(id)a3;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)prepareLayout;
@end

@implementation InteractiveTimelineCollectionViewLayout

- (NSString)description
{
  swift_getObjectType();
  v3 = self;
  sub_241161A00();
  sub_241160860();
  swift_bridgeObjectRelease();
  sub_241160860();
  sub_241161690();

  v4 = (void *)sub_2411606F0();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (_TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout)initWithCoder:(id)a3
{
  v4 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout_itemHeight;
  *(void *)v4 = 0;
  v4[8] = 1;
  v5 = (char *)self + OBJC_IVAR____TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout_contentSize;
  *(void *)v5 = 0;
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  uint64_t v6 = OBJC_IVAR____TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout_computedAttributes;
  id v7 = a3;
  *(Class *)((char *)&self->super.super.isa + v6) = (Class)sub_241061B08(MEMORY[0x263F8EE78]);

  result = (_TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout *)sub_2411616B0();
  __break(1u);
  return result;
}

+ (Class)layoutAttributesClass
{
  type metadata accessor for InteractiveTimelineCollectionViewLayoutAttributes();

  return (Class)swift_getObjCClassFromMetadata();
}

+ (Class)invalidationContextClass
{
  type metadata accessor for InteractiveTimelineCollectionViewLayoutInvalidationContext();

  return (Class)swift_getObjCClassFromMetadata();
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (void)prepareLayout
{
  v2 = self;
  sub_2410E70CC();
}

- (CGSize)collectionViewContentSize
{
  v2 = (double *)((char *)self
                + OBJC_IVAR____TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout_contentSize);
  double v3 = 0.0;
  double v4 = 0.0;
  if ((*((unsigned char *)&self->super._collectionViewBoundsSize.width
        + OBJC_IVAR____TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout_contentSize) & 1) == 0)
  {
    double v4 = *v2;
    double v3 = v2[1];
  }
  result.height = v3;
  result.width = v4;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v7 = self;
  id v8 = [(InteractiveTimelineCollectionViewLayout *)v7 collectionView];
  if (v8)
  {
    v9 = v8;
    v10 = sub_2410E72AC(v8, x, y, width, height);
    v11 = v7;
    sub_2410E8B98((uint64_t)v10, v11);
    swift_bridgeObjectRelease();
  }
  sub_2410E902C();
  v12 = (void *)sub_241160980();
  swift_bridgeObjectRelease();

  return v12;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4 = sub_24115CE00();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  id v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24115CDA0();
  id v8 = self;
  v9 = sub_2410E772C((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v9;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_2410E7BB4(v4);
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v7 = self;
  id v8 = sub_2410E7E40(x, y, width, height);

  return v8;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double x = a3.x;
  uint64_t v5 = self;
  double v6 = sub_2410E8E74(x);
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.CGFloat y = v10;
  result.double x = v9;
  return result;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  -[InteractiveTimelineCollectionViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](self, sel_targetContentOffsetForProposedContentOffset_withScrollingVelocity_, a3.x, a3.y, 0.0, 0.0);
  result.CGFloat y = v4;
  result.double x = v3;
  return result;
}

- (_TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout)init
{
  CGPoint result = (_TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super._insertedSupplementaryIndexPathsDict
                     + OBJC_IVAR____TtC26MedicationsHealthAppPlugin39InteractiveTimelineCollectionViewLayout_config));

  swift_bridgeObjectRelease();
}

@end