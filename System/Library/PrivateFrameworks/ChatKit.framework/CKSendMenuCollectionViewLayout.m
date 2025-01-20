@interface CKSendMenuCollectionViewLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGSize)collectionViewContentSize;
- (CKSendMenuCollectionViewLayout)initWithCoder:(id)a3;
- (CKSendMenuCollectionViewLayout)initWithSection:(id)a3;
- (CKSendMenuCollectionViewLayout)initWithSection:(id)a3 configuration:(id)a4;
- (CKSendMenuCollectionViewLayout)initWithSection:(id)a3 sectionProvider:(id)a4 configuration:(id)a5;
- (CKSendMenuCollectionViewLayout)initWithSectionProvider:(id)a3;
- (CKSendMenuCollectionViewLayout)initWithSectionProvider:(id)a3 configuration:(id)a4;
- (id)_animationForReusableView:(id)a3 toLayoutAttributes:(id)a4 type:(unint64_t)a5;
- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)prepareLayout;
- (void)stretchSpringsAttachedToCellsForBoundsChange:(CGRect)a3;
@end

@implementation CKSendMenuCollectionViewLayout

- (CKSendMenuCollectionViewLayout)initWithCoder:(id)a3
{
  *(UICollectionView **)((char *)&self->super.super._collectionView
                       + OBJC_IVAR___CKSendMenuCollectionViewLayout_sendMenuLayoutDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___CKSendMenuCollectionViewLayout____lazy_storage___dynamicAnimator) = 0;
  v5 = (char *)self + OBJC_IVAR___CKSendMenuCollectionViewLayout_frozenCollectionViewContentSize;
  *(void *)v5 = 0;
  *((void *)v5 + 1) = 0;
  v5[16] = 1;
  v6 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR___CKSendMenuCollectionViewLayout_lastPanGestureRecognizerPositionInCollectionViewCoordinates);
  void *v6 = 0;
  v6[1] = 0;
  id v7 = a3;

  result = (CKSendMenuCollectionViewLayout *)sub_18F7BA5D0();
  __break(1u);
  return result;
}

- (CGSize)collectionViewContentSize
{
  v2 = (double *)((char *)self + OBJC_IVAR___CKSendMenuCollectionViewLayout_frozenCollectionViewContentSize);
  if ((*((unsigned char *)&self->super.super._collectionViewBoundsSize.width
        + OBJC_IVAR___CKSendMenuCollectionViewLayout_frozenCollectionViewContentSize) & 1) != 0)
  {
    v5.receiver = self;
    v5.super_class = (Class)type metadata accessor for SendMenuCollectionViewLayout();
    [(CKSendMenuCollectionViewLayout *)&v5 collectionViewContentSize];
  }
  else
  {
    double v3 = *v2;
    double v4 = v2[1];
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)initialLayoutAttributesForAppearingItemAtIndexPath:(id)a3
{
  return sub_18F4CFE70(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_18F4CD7C8);
}

- (id)_animationForReusableView:(id)a3 toLayoutAttributes:(id)a4 type:(unint64_t)a5
{
  id v7 = self;
  id v8 = a3;
  id v9 = a4;
  v10 = sub_18F4D10D4(a3, a4);
  uint64_t v12 = v11;

  if (v10)
  {
    v14[4] = v10;
    v14[5] = v12;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 1107296256;
    v14[2] = sub_18F4CE470;
    v14[3] = &block_descriptor_7;
    v10 = _Block_copy(v14);
    swift_release();
  }

  return v10;
}

- (void)prepareLayout
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SendMenuCollectionViewLayout();
  id v2 = v3.receiver;
  [(CKSendMenuCollectionViewLayout *)&v3 prepareLayout];
  sub_18F4CE518();
  sub_18F4CE8A8();
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4 = sub_18F7B6410();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  id v7 = (char *)&v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18F7B63E0();
  id v8 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.super.isa) + 0xE8);
  id v9 = self;
  if (v8())
  {
    v10 = (CKSendMenuCollectionViewLayout *)sub_18F4CCFD4();
    uint64_t v11 = (void *)sub_18F7B63D0();
    id v12 = [(CKSendMenuCollectionViewLayout *)v10 layoutAttributesForCellAtIndexPath:v11];

    id v9 = v10;
  }
  else
  {
    uint64_t v11 = (void *)sub_18F7B63D0();
    v13 = (objc_class *)type metadata accessor for SendMenuCollectionViewLayout();
    v15.receiver = v9;
    v15.super_class = v13;
    id v12 = [(CKSendMenuCollectionViewLayout *)&v15 layoutAttributesForItemAtIndexPath:v11];
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v12;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  return sub_18F4D0978(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, sub_18F4CF09C);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for SendMenuCollectionViewLayout();
  id v7 = v11.receiver;
  BOOL v8 = -[CKSendMenuCollectionViewLayout shouldInvalidateLayoutForBoundsChange:](&v11, sel_shouldInvalidateLayoutForBoundsChange_, x, y, width, height);
  if (v8)
  {
    id v9 = sub_18F4CCFD4();
    objc_msgSend(v9, sel_removeAllBehaviors, v11.receiver, v11.super_class);
  }
  objc_msgSend(v7, sel_stretchSpringsAttachedToCellsForBoundsChange_, x, y, width, height, v11.receiver, v11.super_class);

  return v8;
}

- (CKSendMenuCollectionViewLayout)initWithSection:(id)a3
{
  id v3 = a3;
  CGSize result = (CKSendMenuCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (CKSendMenuCollectionViewLayout)initWithSection:(id)a3 configuration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  CGSize result = (CKSendMenuCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (CKSendMenuCollectionViewLayout)initWithSectionProvider:(id)a3
{
  id v3 = _Block_copy(a3);
  _Block_release(v3);
  CGSize result = (CKSendMenuCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (CKSendMenuCollectionViewLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  id v5 = _Block_copy(a3);
  id v6 = a4;
  _Block_release(v5);
  CGSize result = (CKSendMenuCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (CKSendMenuCollectionViewLayout)initWithSection:(id)a3 sectionProvider:(id)a4 configuration:(id)a5
{
  _Block_copy(a4);
  id v7 = a3;
  id v8 = a5;
  CGSize result = (CKSendMenuCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR___CKSendMenuCollectionViewLayout_sendMenuLayoutDelegate);
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___CKSendMenuCollectionViewLayout____lazy_storage___dynamicAnimator);
}

- (void)stretchSpringsAttachedToCellsForBoundsChange:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v7 = self;
  sub_18F4CF648(x, y, width, height);
}

@end