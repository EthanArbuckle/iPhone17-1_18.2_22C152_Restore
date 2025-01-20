@interface SearchResultsCollectionCompositionalLayout
- (CGSize)collectionViewContentSize;
- (_TtC22SubscribePageExtension42SearchResultsCollectionCompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4;
- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4;
@end

@implementation SearchResultsCollectionCompositionalLayout

- (_TtC22SubscribePageExtension42SearchResultsCollectionCompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  v5 = _Block_copy(a3);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v5;
  return (_TtC22SubscribePageExtension42SearchResultsCollectionCompositionalLayout *)sub_1000F3834((uint64_t)sub_1000F56D4, v6, a4);
}

- (CGSize)collectionViewContentSize
{
  v2 = self;
  double v3 = sub_1000F3A30();
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
  uint64_t v5 = sub_1000F3D6C(x);

  if (v5)
  {
    sub_1000F5604();
    v6.super.isa = sub_1007677F0().super.isa;
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
  uint64_t v4 = sub_100756440();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  v8 = (char *)&v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_100756380();
  v9 = self;
  Class isa = sub_100756340().super.isa;
  v11 = (objc_class *)type metadata accessor for SearchResultsCollectionCompositionalLayout();
  v15.receiver = v9;
  v15.super_class = v11;
  v12 = (_TtC22SubscribePageExtension42SearchResultsCollectionCompositionalLayout *)[(BaseCollectionCompositionalLayout *)&v15 layoutAttributesForItemAtIndexPath:isa];

  if (v12)
  {
    id v13 = sub_1000F493C(v12);

    v9 = v12;
  }
  else
  {
    id v13 = 0;
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);

  return v13;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v5 = sub_100756440();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1007675F0();
  sub_100756380();
  v10 = self;
  NSString v11 = sub_1007675C0();
  Class isa = sub_100756340().super.isa;
  id v13 = (objc_class *)type metadata accessor for SearchResultsCollectionCompositionalLayout();
  v17.receiver = v10;
  v17.super_class = v13;
  id v14 = [(BaseCollectionCompositionalLayout *)&v17 layoutAttributesForSupplementaryViewOfKind:v11 atIndexPath:isa];

  if (v14)
  {
    id v15 = v14;
    id v14 = sub_1000F493C(v15);

    swift_bridgeObjectRelease();
  }
  else
  {

    swift_bridgeObjectRelease();
  }
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);

  return v14;
}

- (id)layoutAttributesForDecorationViewOfKind:(id)a3 atIndexPath:(id)a4
{
  uint64_t v5 = sub_100756440();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5, v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_1007675F0();
  uint64_t v12 = v11;
  sub_100756380();
  id v13 = self;
  id v14 = sub_1000F4D1C(v10, v12, (uint64_t)v9);

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v9, v5);

  return v14;
}

@end