@interface CycleTimelineCollectionViewLayout
+ (Class)invalidationContextClass;
+ (Class)layoutAttributesClass;
- (BOOL)flipsHorizontallyInOppositeLayoutDirection;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4;
- (CGSize)collectionViewContentSize;
- (NSString)description;
- (_TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout)init;
- (_TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout)initWithCoder:(id)a3;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)prepareLayout;
@end

@implementation CycleTimelineCollectionViewLayout

- (NSString)description
{
  swift_getObjectType();
  v3 = self;
  sub_2416333E8();
  sub_241631E08();
  swift_bridgeObjectRelease();
  sub_241631E08();
  sub_241632F68();

  v4 = (void *)sub_241631CC8();
  swift_bridgeObjectRelease();

  return (NSString *)v4;
}

- (_TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24162AC90();
}

+ (Class)layoutAttributesClass
{
  type metadata accessor for CycleTimelineCollectionViewLayoutAttributes();

  return (Class)swift_getObjCClassFromMetadata();
}

+ (Class)invalidationContextClass
{
  type metadata accessor for CycleTimelineCollectionViewLayoutInvalidationContext();

  return (Class)swift_getObjCClassFromMetadata();
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (void)prepareLayout
{
  v2 = self;
  sub_24162914C();
}

- (CGSize)collectionViewContentSize
{
  v2 = (double *)((char *)self
                + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_contentSize);
  double v3 = 0.0;
  double v4 = 0.0;
  if ((*((unsigned char *)&self->super._collectionViewBoundsSize.width
        + OBJC_IVAR____TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout_contentSize) & 1) == 0)
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
  v7 = self;
  id v8 = [(CycleTimelineCollectionViewLayout *)v7 collectionView];
  if (v8)
  {
    v9 = v8;
    v10 = sub_241629688(v8, x, y, width, height);
    v11 = v7;
    sub_24162A9B4((uint64_t)v10, v11);
    swift_bridgeObjectRelease();
  }
  sub_2415E60B0();
  v12 = (void *)sub_241631F18();
  swift_bridgeObjectRelease();

  return v12;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4 = sub_24162BB18();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_24162BAA8();
  id v8 = self;
  v9 = sub_241629AC4((uint64_t)v7);

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
  sub_241629F0C(v4);
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  id v8 = sub_24162A184(x, y, width, height);

  return v8;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  CGFloat y = a3.y;
  double x = a3.x;
  uint64_t v7 = sub_24162BB18();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = self;
  id v12 = [(CycleTimelineCollectionViewLayout *)v11 collectionView];
  if (v12)
  {
    v13 = v12;
    objc_msgSend(v12, sel_bounds);
    CGFloat Width = CGRectGetWidth(v20);
    CGFloat y = 0.0;
    sub_24162A348(v13, x + Width * 0.5);
    sub_241628B94();
    double x = v15;

    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  }

  double v16 = x;
  double v17 = y;
  result.CGFloat y = v17;
  result.double x = v16;
  return result;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  -[CycleTimelineCollectionViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](self, sel_targetContentOffsetForProposedContentOffset_withScrollingVelocity_, a3.x, a3.y, 0.0, 0.0);
  result.CGFloat y = v4;
  result.double x = v3;
  return result;
}

- (_TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout)init
{
  CGPoint result = (_TtC24MenstrualCyclesAppPlugin33CycleTimelineCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end