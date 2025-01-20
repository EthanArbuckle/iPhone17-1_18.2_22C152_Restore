@interface CNAvatarPosterPairCollectionViewLayout
- (BOOL)flipsHorizontallyInOppositeLayoutDirection;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3;
- (CGSize)collectionViewContentSize;
- (_TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout)init;
- (_TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout)initWithCoder:(id)a3;
- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3;
- (id)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4;
- (id)indexPathsToDeleteForSupplementaryViewOfKind:(id)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (void)finalizeCollectionViewUpdates;
- (void)prepareForCollectionViewUpdates:(id)a3;
- (void)prepareLayout;
@end

@implementation CNAvatarPosterPairCollectionViewLayout

- (_TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18B708E80();
}

- (BOOL)flipsHorizontallyInOppositeLayoutDirection
{
  return 1;
}

- (void)prepareForCollectionViewUpdates:(id)a3
{
  sub_18B650634(0, &qword_1E913DFE0);
  sub_18B985F88();
  v4 = self;
  v5 = (void *)sub_18B985F78();
  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for CNAvatarPosterPairCollectionViewLayout();
  [(CNAvatarPosterPairCollectionViewLayout *)&v6 prepareForCollectionViewUpdates:v5];

  swift_bridgeObjectRelease();
}

- (void)finalizeCollectionViewUpdates
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for CNAvatarPosterPairCollectionViewLayout();
  v2 = (char *)v4.receiver;
  [(CNAvatarPosterPairCollectionViewLayout *)&v4 finalizeCollectionViewUpdates];
  id v3 = &v2[OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_itemIndexPathsToDelete];
  swift_beginAccess();
  *(void *)id v3 = MEMORY[0x1E4FBC860];

  swift_bridgeObjectRelease();
}

- (void)prepareLayout
{
  v2 = self;
  sub_18B704AD8();
}

- (CGSize)collectionViewContentSize
{
  double v2 = *(double *)((char *)&self->super._collectionViewBoundsSize.width
                 + OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_contentBounds);
  double v3 = *(double *)((char *)&self->super._collectionViewBoundsSize.height
                 + OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_contentBounds);
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  return sub_18B70719C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_18B706510);
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  return sub_18B7078D0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, char *))sub_18B7068C8);
}

- (id)finalLayoutAttributesForDisappearingItemAtIndexPath:(id)a3
{
  return sub_18B70719C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(char *))sub_18B706A4C);
}

- (id)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  return sub_18B7078D0(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, char *))sub_18B7072A4);
}

- (id)indexPathsToDeleteForSupplementaryViewOfKind:(id)a3
{
  swift_beginAccess();
  sub_18B983D68();
  sub_18B984478();
  double v3 = (void *)sub_18B985F78();
  swift_bridgeObjectRelease();

  return v3;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  uint64_t v8 = sub_18B707A84(x, y, width, height);

  if (v8)
  {
    sub_18B650634(0, &qword_1E913DFD8);
    v9 = (void *)sub_18B985F78();
    swift_bridgeObjectRelease();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)a3
{
  CGFloat x = a3.x;
  objc_super v4 = self;
  sub_18B708550(x);
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.CGFloat y = v10;
  result.CGFloat x = v9;
  return result;
}

- (_TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout)init
{
  CGPoint result = (_TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_18B663E90(*(uint64_t *)((char *)&self->super.super.isa
                           + OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_itemRevealProgressProvider));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_18B66405C((uint64_t)self+ OBJC_IVAR____TtC10ContactsUI38CNAvatarPosterPairCollectionViewLayout_indexPathToMaintainForTransition, (uint64_t *)&unk_1E913C860);
}

@end