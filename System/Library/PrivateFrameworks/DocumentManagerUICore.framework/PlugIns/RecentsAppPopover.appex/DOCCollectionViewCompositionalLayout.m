@interface DOCCollectionViewCompositionalLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGSize)collectionViewContentSize;
- (_TtC17RecentsAppPopover36DOCCollectionViewCompositionalLayout)initWithCoder:(id)a3;
- (_TtC17RecentsAppPopover36DOCCollectionViewCompositionalLayout)initWithSection:(id)a3;
- (_TtC17RecentsAppPopover36DOCCollectionViewCompositionalLayout)initWithSection:(id)a3 configuration:(id)a4;
- (_TtC17RecentsAppPopover36DOCCollectionViewCompositionalLayout)initWithSectionProvider:(id)a3;
- (_TtC17RecentsAppPopover36DOCCollectionViewCompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (void)prepareLayout;
@end

@implementation DOCCollectionViewCompositionalLayout

- (void)prepareLayout
{
  v2 = self;
  sub_1000D361C();
}

- (CGSize)collectionViewContentSize
{
  v2 = self;
  double v3 = sub_1000D3760();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = self;
  char v8 = sub_1000D3844(x, y, width, height);

  return v8 & 1;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v16.receiver = self;
  v16.super_class = (Class)swift_getObjectType();
  id v7 = v16.receiver;
  id v8 = -[DOCCollectionViewCompositionalLayout layoutAttributesForElementsInRect:](&v16, "layoutAttributesForElementsInRect:", x, y, width, height);
  if (v8)
  {
    v9 = v8;
    sub_1000D4FB4();
    unint64_t v10 = sub_1004BEDE0();

    uint64_t v11 = (uint64_t)v7 + OBJC_IVAR____TtC17RecentsAppPopover36DOCCollectionViewCompositionalLayout_coreLayout;
    swift_beginAccess();
    sub_1000D4ECC(v11, (uint64_t)v15, (void (*)(uint64_t, uint64_t))&_swift_unknownObjectWeakCopyInit);
    uint64_t v12 = sub_1000D49B4(v10);
    swift_bridgeObjectRelease();
    sub_1000D4EA0((uint64_t)v15);

    if (v12)
    {
      v13.super.isa = sub_1004BEDC0().super.isa;
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
  }
  v13.super.isa = 0;
LABEL_6:
  return v13.super.isa;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v5 = sub_1004BBFB0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  id v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1004BEB10();
  sub_1004BBF40();
  v9 = self;
  unint64_t v10 = (void *)sub_1000D3B44();

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  return v10;
}

- (_TtC17RecentsAppPopover36DOCCollectionViewCompositionalLayout)initWithSection:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17RecentsAppPopover36DOCCollectionViewCompositionalLayout_footerViewHeight) = 0;
  uint64_t v6 = (_OWORD *)((char *)self
                + OBJC_IVAR____TtC17RecentsAppPopover36DOCCollectionViewCompositionalLayout_footerViewContentInsets);
  long long v7 = *(_OWORD *)&NSDirectionalEdgeInsetsZero.bottom;
  *uint64_t v6 = *(_OWORD *)&NSDirectionalEdgeInsetsZero.top;
  v6[1] = v7;
  id v8 = (char *)self + OBJC_IVAR____TtC17RecentsAppPopover36DOCCollectionViewCompositionalLayout_coreLayout;
  v11[0] = 0;
  uint64_t v15 = 0;
  uint64_t v13 = 0;
  uint64_t v14 = 0;
  uint64_t v12 = 0;
  swift_unknownObjectWeakInit();
  sub_1000D4ECC((uint64_t)v11, (uint64_t)v8, (void (*)(uint64_t, uint64_t))&_swift_unknownObjectWeakTakeInit);
  v10.receiver = self;
  v10.super_class = ObjectType;
  return [(DOCCollectionViewCompositionalLayout *)&v10 initWithSection:a3];
}

- (_TtC17RecentsAppPopover36DOCCollectionViewCompositionalLayout)initWithSection:(id)a3 configuration:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC17RecentsAppPopover36DOCCollectionViewCompositionalLayout_footerViewHeight) = 0;
  id v8 = (_OWORD *)((char *)self
                + OBJC_IVAR____TtC17RecentsAppPopover36DOCCollectionViewCompositionalLayout_footerViewContentInsets);
  long long v9 = *(_OWORD *)&NSDirectionalEdgeInsetsZero.bottom;
  *id v8 = *(_OWORD *)&NSDirectionalEdgeInsetsZero.top;
  v8[1] = v9;
  objc_super v10 = (char *)self + OBJC_IVAR____TtC17RecentsAppPopover36DOCCollectionViewCompositionalLayout_coreLayout;
  v13[0] = 0;
  uint64_t v17 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  uint64_t v14 = 0;
  swift_unknownObjectWeakInit();
  sub_1000D4ECC((uint64_t)v13, (uint64_t)v10, (void (*)(uint64_t, uint64_t))&_swift_unknownObjectWeakTakeInit);
  v12.receiver = self;
  v12.super_class = ObjectType;
  return [(DOCCollectionViewCompositionalLayout *)&v12 initWithSection:a3 configuration:a4];
}

- (_TtC17RecentsAppPopover36DOCCollectionViewCompositionalLayout)initWithSectionProvider:(id)a3
{
  double v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  return (_TtC17RecentsAppPopover36DOCCollectionViewCompositionalLayout *)sub_1000D4000((uint64_t)sub_1000D4FFC, v4);
}

- (_TtC17RecentsAppPopover36DOCCollectionViewCompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  uint64_t v5 = _Block_copy(a3);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  return (_TtC17RecentsAppPopover36DOCCollectionViewCompositionalLayout *)sub_1000D41B0((uint64_t)sub_1000D4F5C, v6, a4);
}

- (_TtC17RecentsAppPopover36DOCCollectionViewCompositionalLayout)initWithCoder:(id)a3
{
  return (_TtC17RecentsAppPopover36DOCCollectionViewCompositionalLayout *)sub_1000D4390(a3);
}

- (void).cxx_destruct
{
}

@end