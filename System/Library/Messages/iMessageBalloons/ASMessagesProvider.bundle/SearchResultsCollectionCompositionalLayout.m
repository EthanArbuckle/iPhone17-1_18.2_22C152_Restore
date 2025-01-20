@interface SearchResultsCollectionCompositionalLayout
- (CGSize)collectionViewContentSize;
- (_TtC18ASMessagesProvider42SearchResultsCollectionCompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4;
- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
@end

@implementation SearchResultsCollectionCompositionalLayout

- (_TtC18ASMessagesProvider42SearchResultsCollectionCompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  v5 = _Block_copy(a3);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  return (_TtC18ASMessagesProvider42SearchResultsCollectionCompositionalLayout *)sub_F58F0((uint64_t)sub_F77F8, v6, a4);
}

- (CGSize)collectionViewContentSize
{
  v2 = self;
  double v3 = sub_F5AEC();
  double v5 = v4;

  double v6 = v3;
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double x = a3.origin.x;
  double v4 = self;
  uint64_t v5 = sub_F5E28(x);

  if (v5)
  {
    sub_F76C0();
    v6.super.isa = sub_77D880().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v6.super.isa = 0;
  }

  return v6.super.isa;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4 = sub_76C1E0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  double v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_76C120();
  v8 = self;
  Class isa = sub_76C0E0().super.isa;
  v10 = (objc_class *)type metadata accessor for SearchResultsCollectionCompositionalLayout();
  v14.receiver = v8;
  v14.super_class = v10;
  v11 = (_TtC18ASMessagesProvider42SearchResultsCollectionCompositionalLayout *)[(BaseCollectionCompositionalLayout *)&v14 layoutAttributesForItemAtIndexPath:isa];

  if (v11)
  {
    id v12 = sub_F69F8(v11);

    v8 = v11;
  }
  else
  {
    id v12 = 0;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v12;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v5 = sub_76C1E0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_77D670();
  sub_76C120();
  v9 = self;
  NSString v10 = sub_77D640();
  Class isa = sub_76C0E0().super.isa;
  id v12 = (objc_class *)type metadata accessor for SearchResultsCollectionCompositionalLayout();
  v16.receiver = v9;
  v16.super_class = v12;
  id v13 = [(BaseCollectionCompositionalLayout *)&v16 layoutAttributesForSupplementaryViewOfKind:v10 atIndexPath:isa];

  if (v13)
  {
    id v14 = v13;
    id v13 = sub_F69F8(v14);

    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v13;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v5 = sub_76C1E0();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_77D670();
  uint64_t v11 = v10;
  sub_76C120();
  id v12 = self;
  id v13 = sub_F6DD8(v9, v11, (uint64_t)v8);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v13;
}

@end