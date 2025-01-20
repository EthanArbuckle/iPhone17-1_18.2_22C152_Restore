@interface CKTapbackPickerCollectionViewLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CKTapbackPickerCollectionViewLayout)initWithCoder:(id)a3;
- (CKTapbackPickerCollectionViewLayout)initWithSection:(id)a3;
- (CKTapbackPickerCollectionViewLayout)initWithSection:(id)a3 configuration:(id)a4;
- (CKTapbackPickerCollectionViewLayout)initWithSection:(id)a3 sectionProvider:(id)a4 configuration:(id)a5;
- (CKTapbackPickerCollectionViewLayout)initWithSectionProvider:(id)a3;
- (CKTapbackPickerCollectionViewLayout)initWithSectionProvider:(id)a3 configuration:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)prepareLayout;
@end

@implementation CKTapbackPickerCollectionViewLayout

- (CKTapbackPickerCollectionViewLayout)initWithCoder:(id)a3
{
  *(UICollectionView **)((char *)&self->super.super._collectionView
                       + OBJC_IVAR___CKTapbackPickerCollectionViewLayout_tapbackPickerLayoutDelegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR___CKTapbackPickerCollectionViewLayout____lazy_storage___dynamicAnimator) = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR___CKTapbackPickerCollectionViewLayout_lastPanGestureRecognizerPositionInCollectionViewCoordinates);
  void *v5 = 0;
  v5[1] = 0;
  id v6 = a3;

  result = (CKTapbackPickerCollectionViewLayout *)sub_18F7BA5D0();
  __break(1u);
  return result;
}

- (void)prepareLayout
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for TapbackPickerCollectionViewLayout();
  id v2 = v3.receiver;
  [(CKTapbackPickerCollectionViewLayout *)&v3 prepareLayout];
  sub_18F735F60();
  sub_18F7362C8();
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4 = sub_18F7B6410();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18F7B63E0();
  v8 = self;
  if (UIAccessibilityIsReduceMotionEnabled() || UIAccessibilityIsVoiceOverRunning())
  {
    v9 = (void *)sub_18F7B63D0();
    v10 = (objc_class *)type metadata accessor for TapbackPickerCollectionViewLayout();
    v14.receiver = v8;
    v14.super_class = v10;
    id v11 = [(CKTapbackPickerCollectionViewLayout *)&v14 layoutAttributesForItemAtIndexPath:v9];
  }
  else
  {
    v12 = (CKTapbackPickerCollectionViewLayout *)sub_18F735B28();
    v9 = (void *)sub_18F7B63D0();
    id v11 = [(CKTapbackPickerCollectionViewLayout *)v12 layoutAttributesForCellAtIndexPath:v9];

    v8 = v12;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v11;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  uint64_t v8 = sub_18F7369B4(x, y, width, height);

  if (v8)
  {
    sub_18EF3528C(0, (unint64_t *)&unk_1E922B6B0);
    v9 = (void *)sub_18F7B99A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for TapbackPickerCollectionViewLayout();
  id v7 = v11.receiver;
  BOOL v8 = -[CKTapbackPickerCollectionViewLayout shouldInvalidateLayoutForBoundsChange:](&v11, sel_shouldInvalidateLayoutForBoundsChange_, x, y, width, height);
  if (v8)
  {
    id v9 = sub_18F735B28();
    objc_msgSend(v9, sel_removeAllBehaviors, v11.receiver, v11.super_class);
  }
  sub_18F736C7C(x, y, width, height);

  return v8;
}

- (CKTapbackPickerCollectionViewLayout)initWithSection:(id)a3
{
  id v3 = a3;
  result = (CKTapbackPickerCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (CKTapbackPickerCollectionViewLayout)initWithSection:(id)a3 configuration:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  result = (CKTapbackPickerCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (CKTapbackPickerCollectionViewLayout)initWithSectionProvider:(id)a3
{
  id v3 = _Block_copy(a3);
  _Block_release(v3);
  result = (CKTapbackPickerCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (CKTapbackPickerCollectionViewLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  id v5 = _Block_copy(a3);
  id v6 = a4;
  _Block_release(v5);
  result = (CKTapbackPickerCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (CKTapbackPickerCollectionViewLayout)initWithSection:(id)a3 sectionProvider:(id)a4 configuration:(id)a5
{
  _Block_copy(a4);
  id v7 = a3;
  id v8 = a5;
  result = (CKTapbackPickerCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18F4C25DC((uint64_t)self + OBJC_IVAR___CKTapbackPickerCollectionViewLayout_tapbackPickerLayoutDelegate);
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR___CKTapbackPickerCollectionViewLayout____lazy_storage___dynamicAnimator);
}

@end