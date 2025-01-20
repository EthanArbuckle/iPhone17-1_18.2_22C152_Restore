@interface CollectionViewTableFlowLayout
- (BOOL)sectionFootersPinToVisibleBounds;
- (BOOL)sectionHeadersPinToVisibleBounds;
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGSize)collectionViewContentSize;
- (_TtC18ASMessagesProvider29CollectionViewTableFlowLayout)init;
- (id)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4;
- (id)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
- (void)invalidateLayoutWithContext:(id)a3;
- (void)prepareLayout;
- (void)setSectionFootersPinToVisibleBounds:(BOOL)a3;
- (void)setSectionHeadersPinToVisibleBounds:(BOOL)a3;
@end

@implementation CollectionViewTableFlowLayout

- (_TtC18ASMessagesProvider29CollectionViewTableFlowLayout)init
{
  return (_TtC18ASMessagesProvider29CollectionViewTableFlowLayout *)sub_16381C();
}

- (BOOL)sectionHeadersPinToVisibleBounds
{
  return 0;
}

- (void)setSectionHeadersPinToVisibleBounds:(BOOL)a3
{
  v3 = self;
  sub_165144((void *)0x80000000007DDFD0);
}

- (BOOL)sectionFootersPinToVisibleBounds
{
  return 0;
}

- (void)setSectionFootersPinToVisibleBounds:(BOOL)a3
{
  v3 = self;
  sub_165144((void *)0x80000000007DDF90);
}

- (void)prepareLayout
{
  v2 = self;
  sub_163B10();
}

- (CGSize)collectionViewContentSize
{
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for CollectionViewTableFlowLayout();
  v2 = (char *)v10.receiver;
  [(CollectionViewTableFlowLayout *)&v10 collectionViewContentSize];
  double v4 = v3;
  double v6 = v5;
  double v7 = *(double *)&v2[OBJC_IVAR____TtC18ASMessagesProvider29CollectionViewTableFlowLayout_globalHeaderSize + 8];

  double v8 = v6 + v7;
  double v9 = v4;
  result.height = v8;
  result.width = v9;
  return result;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4 = sub_76C1E0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  double v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_76C120();
  double v8 = self;
  id v9 = sub_163D88();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v9;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  return sub_16424C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, char *))sub_163F64);
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  return sub_16424C(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t (*)(uint64_t, uint64_t, char *))sub_164148);
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  double v7 = self;
  uint64_t v8 = sub_164380(x, y, width, height);

  if (v8)
  {
    sub_F76C0();
    v9.super.isa = sub_77D880().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }

  return v9.super.isa;
}

- (id)finalLayoutAttributesForDisappearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  return sub_164700(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (SEL *)&selRef_finalLayoutAttributesForDisappearingSupplementaryElementOfKind_atIndexPath_);
}

- (id)initialLayoutAttributesForAppearingSupplementaryElementOfKind:(id)a3 atIndexPath:(id)a4
{
  return sub_164700(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (SEL *)&selRef_initialLayoutAttributesForAppearingSupplementaryElementOfKind_atIndexPath_);
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = self;
  unsigned __int8 v8 = sub_16488C(x, y, width, height);

  return v8 & 1;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = self;
  unsigned __int8 v8 = sub_164A28(x, y, width, height);

  return v8;
}

- (void)invalidateLayoutWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_164CC4(v4);
}

- (void).cxx_destruct
{
  sub_13308(*(uint64_t *)((char *)&self->super.super.super.super.isa
                       + OBJC_IVAR____TtC18ASMessagesProvider29CollectionViewTableFlowLayout_pendingPrepareObserver));
}

@end