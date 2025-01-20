@interface STKImageGlyphCollectionViewLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4;
- (CGRect)targetRectForSectionIndex:(int64_t)a3;
- (CGSize)collectionViewContentSize;
- (STKImageGlyphCollectionViewLayout)initWithCoder:(id)a3;
- (STKImageGlyphCollectionViewLayout)initWithSection:(id)a3;
- (STKImageGlyphCollectionViewLayout)initWithSection:(id)a3 configuration:(id)a4;
- (STKImageGlyphCollectionViewLayout)initWithSection:(id)a3 sectionProvider:(id)a4 configuration:(id)a5;
- (STKImageGlyphCollectionViewLayout)initWithSectionProvider:(id)a3;
- (STKImageGlyphCollectionViewLayout)initWithSectionProvider:(id)a3 configuration:(id)a4;
- (id)currentlyFocusedIndexPath;
- (id)invalidationContextForEndingInteractiveMovementOfItemsToFinalIndexPaths:(id)a3 previousIndexPaths:(id)a4 movementCancelled:(BOOL)a5;
- (id)invalidationContextForInteractivelyMovingItems:(id)a3 withTargetPosition:(CGPoint)a4 previousIndexPaths:(id)a5 previousPosition:(CGPoint)a6;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForInteractivelyMovingItemAtIndexPath:(id)a3 withTargetPosition:(CGPoint)a4;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)paginationOriginForCurrentOffset:(CGPoint)a3;
- (id)targetIndexPathForInteractivelyMovingItem:(id)a3 withPosition:(CGPoint)a4;
- (int64_t)currentlyFocusedSectionIndex;
- (void)dealloc;
- (void)invalidateLayout;
- (void)prepareLayout;
@end

@implementation STKImageGlyphCollectionViewLayout

- (STKImageGlyphCollectionViewLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  v5 = _Block_copy(a3);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  return (STKImageGlyphCollectionViewLayout *)sub_24532C40C((uint64_t)sub_24532ECD4, v6, a4);
}

- (STKImageGlyphCollectionViewLayout)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_24532EBD0();
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  id v3 = self;
  uint64_t v4 = sub_24532C620();

  if (v4)
  {
    sub_24532EB90();
    v5 = (void *)sub_2453FFCF8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  -[STKImageGlyphCollectionViewLayout targetContentOffsetForProposedContentOffset:withScrollingVelocity:](self, sel_targetContentOffsetForProposedContentOffset_withScrollingVelocity_, a3.x, a3.y, 0.0, 0.0);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3 withScrollingVelocity:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  double v6 = a3.y;
  double v7 = a3.x;
  v8 = self;
  double v9 = sub_24532C7C8(v7, v6, x, y);
  double v11 = v10;

  double v12 = v9;
  double v13 = v11;
  result.double y = v13;
  result.double x = v12;
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = self;
  BOOL v8 = sub_24532C908(x, y, width, height);

  return v8;
}

- (CGSize)collectionViewContentSize
{
  v2 = self;
  double v3 = sub_24532C2E0();
  sub_2452B18B0();
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4 = sub_2453FCDC8();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  double v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2453FCD68();
  double v8 = self;
  double v9 = sub_24532C2E0();
  uint64_t v10 = sub_2452B2C10();
  if (v10)
  {
    double v11 = (void *)v10;
    uint64_t v12 = sub_2453FCD88();
    id v13 = sub_24522997C(v12);
  }
  else
  {

    id v13 = 0;
  }
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v13;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v5 = sub_2453FCDC8();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  double v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2453FCD68();
  double v9 = self;
  uint64_t v10 = sub_24532C2E0();
  uint64_t v11 = sub_2452B2C10();
  if (v11)
  {
    uint64_t v12 = (void *)v11;
    uint64_t v13 = sub_2453FCD88();
    v14 = (void *)sub_24522E474(v13);
  }
  else
  {

    v14 = 0;
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v14;
}

- (id)targetIndexPathForInteractivelyMovingItem:(id)a3 withPosition:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v7 = sub_2453FCDC8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v11);
  uint64_t v13 = (char *)&v18 - v12;
  sub_2453FCD68();
  v14 = self;
  sub_24532CF70(x, y);

  uint64_t v15 = *(void (**)(char *, uint64_t))(v8 + 8);
  v15(v13, v7);
  uint64_t v16 = (void *)sub_2453FCD58();
  v15(v10, v7);

  return v16;
}

- (id)layoutAttributesForInteractivelyMovingItemAtIndexPath:(id)a3 withTargetPosition:(CGPoint)a4
{
  double y = a4.y;
  double x = a4.x;
  uint64_t v7 = sub_2453FCDC8();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x270FA5388](v7);
  uint64_t v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2453FCD68();
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___STKImageGlyphCollectionViewLayout_isRearranging) = 1;
  uint64_t v11 = self;
  uint64_t v12 = (void *)sub_2453FCD58();
  uint64_t v13 = (objc_class *)type metadata accessor for ImageGlyphCollectionViewLayout();
  v16.receiver = v11;
  v16.super_class = v13;
  id v14 = -[STKImageGlyphCollectionViewLayout layoutAttributesForInteractivelyMovingItemAtIndexPath:withTargetPosition:](&v16, sel_layoutAttributesForInteractivelyMovingItemAtIndexPath_withTargetPosition_, v12, x, y);

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);

  return v14;
}

- (id)invalidationContextForInteractivelyMovingItems:(id)a3 withTargetPosition:(CGPoint)a4 previousIndexPaths:(id)a5 previousPosition:(CGPoint)a6
{
  double y = a6.y;
  double x = a6.x;
  double v8 = a4.y;
  double v9 = a4.x;
  sub_2453FCDC8();
  sub_2453FFD18();
  sub_2453FFD18();
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___STKImageGlyphCollectionViewLayout_isRearranging) = 0;
  uint64_t v11 = self;
  uint64_t v12 = (void *)sub_2453FFCF8();
  uint64_t v13 = (void *)sub_2453FFCF8();
  v16.receiver = v11;
  v16.super_class = (Class)type metadata accessor for ImageGlyphCollectionViewLayout();
  id v14 = -[STKImageGlyphCollectionViewLayout invalidationContextForInteractivelyMovingItems:withTargetPosition:previousIndexPaths:previousPosition:](&v16, sel_invalidationContextForInteractivelyMovingItems_withTargetPosition_previousIndexPaths_previousPosition_, v12, v13, v9, v8, x, y);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v14;
}

- (id)invalidationContextForEndingInteractiveMovementOfItemsToFinalIndexPaths:(id)a3 previousIndexPaths:(id)a4 movementCancelled:(BOOL)a5
{
  BOOL v5 = a5;
  sub_2453FCDC8();
  sub_2453FFD18();
  sub_2453FFD18();
  *((unsigned char *)&self->super.super.super.isa + OBJC_IVAR___STKImageGlyphCollectionViewLayout_isRearranging) = 0;
  uint64_t v7 = self;
  double v8 = (void *)sub_2453FFCF8();
  double v9 = (void *)sub_2453FFCF8();
  v12.receiver = v7;
  v12.super_class = (Class)type metadata accessor for ImageGlyphCollectionViewLayout();
  id v10 = [(STKImageGlyphCollectionViewLayout *)&v12 invalidationContextForEndingInteractiveMovementOfItemsToFinalIndexPaths:v8 previousIndexPaths:v9 movementCancelled:v5];

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v10;
}

- (void)invalidateLayout
{
  v2 = self;
  double v3 = sub_24532C2E0();
  sub_2452B2DD4();

  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for ImageGlyphCollectionViewLayout();
  [(STKImageGlyphCollectionViewLayout *)&v4 invalidateLayout];
}

- (void)prepareLayout
{
  v2 = self;
  sub_24532D8A4();
}

- (id)paginationOriginForCurrentOffset:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  BOOL v5 = self;
  uint64_t v6 = sub_24532C2E0();
  uint64_t v7 = sub_2452B2404(x, y);
  double v9 = v8;
  char v11 = v10;

  if (v11) {
    id v12 = 0;
  }
  else {
    id v12 = objc_msgSend(self, sel_itk_valueWithPoint_, *(double *)&v7, v9);
  }

  return v12;
}

- (CGRect)targetRectForSectionIndex:(int64_t)a3
{
  objc_super v4 = self;
  BOOL v5 = sub_24532C2E0();
  sub_2452B2524(a3, (uint64_t)v14);
  double v6 = *(double *)v14;
  double v7 = *(double *)&v14[1];
  double v8 = *(double *)&v14[2];
  double v9 = *(double *)&v14[3];

  sub_24532E9EC((uint64_t)v14, (uint64_t)v15);
  double v10 = 0.0;
  if (v16) {
    double v11 = 0.0;
  }
  else {
    double v11 = v8;
  }
  if (v16) {
    double v12 = 0.0;
  }
  else {
    double v12 = v9;
  }
  if (v16) {
    double v13 = 0.0;
  }
  else {
    double v13 = v6;
  }
  if ((v16 & 1) == 0) {
    double v10 = v7;
  }
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.double y = v10;
  result.origin.double x = v13;
  return result;
}

- (id)currentlyFocusedIndexPath
{
  uint64_t v3 = sub_2453FCDC8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  double v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v7 = self;
  sub_24532DC3C();

  double v8 = (void *)sub_2453FCD58();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  return v8;
}

- (int64_t)currentlyFocusedSectionIndex
{
  v2 = self;
  uint64_t v3 = sub_24532C2E0();
  id v4 = [(STKImageGlyphCollectionViewLayout *)v2 collectionView];
  if (v4)
  {
    uint64_t v5 = v4;
    objc_msgSend(v4, sel_contentOffset);
    CGFloat v7 = v6;
    CGFloat v9 = v8;
  }
  else
  {
    CGFloat v9 = 0.0;
    CGFloat v7 = 0.0;
  }
  int64_t v10 = sub_2452B2694(v7, v9);

  return v10;
}

- (void)dealloc
{
  v2 = self;
  ImageGlyphCollectionViewLayout.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___STKImageGlyphCollectionViewLayout____lazy_storage___layoutSolver);
}

- (STKImageGlyphCollectionViewLayout)initWithSection:(id)a3
{
  id v3 = a3;
  CGRect result = (STKImageGlyphCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (STKImageGlyphCollectionViewLayout)initWithSection:(id)a3 configuration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  CGRect result = (STKImageGlyphCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (STKImageGlyphCollectionViewLayout)initWithSectionProvider:(id)a3
{
  id v3 = _Block_copy(a3);
  _Block_release(v3);
  CGRect result = (STKImageGlyphCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (STKImageGlyphCollectionViewLayout)initWithSection:(id)a3 sectionProvider:(id)a4 configuration:(id)a5
{
  _Block_copy(a4);
  id v7 = a3;
  id v8 = a5;
  CGRect result = (STKImageGlyphCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end