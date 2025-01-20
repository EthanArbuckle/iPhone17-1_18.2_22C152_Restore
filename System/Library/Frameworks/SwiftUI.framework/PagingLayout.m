@interface PagingLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (_TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF012PagingLayout)init;
- (_TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF012PagingLayout)initWithCoder:(id)a3;
- (id)invalidationContextForBoundsChange:(CGRect)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
@end

@implementation PagingLayout

- (_TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF012PagingLayout)init
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = [(UICollectionViewFlowLayout *)&v4 init];
  [(UICollectionViewFlowLayout *)v2 setMinimumLineSpacing:0.0];
  [(UICollectionViewFlowLayout *)v2 setMinimumInteritemSpacing:0.0];
  -[UICollectionViewFlowLayout setSectionInset:](v2, sel_setSectionInset_, *MEMORY[0x1E4FB2848], *(double *)(MEMORY[0x1E4FB2848] + 8), *(double *)(MEMORY[0x1E4FB2848] + 16), *(double *)(MEMORY[0x1E4FB2848] + 24));
  [(UICollectionViewFlowLayout *)v2 setScrollDirection:1];

  return v2;
}

- (_TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF012PagingLayout)initWithCoder:(id)a3
{
  result = (_TtC7SwiftUIP33_8825076C2763A50452A210CBE1FA4AF012PagingLayout *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return 1;
}

- (id)invalidationContextForBoundsChange:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v11.receiver = self;
  v11.super_class = (Class)swift_getObjectType();
  id v7 = v11.receiver;
  id v8 = -[UICollectionViewFlowLayout invalidationContextForBoundsChange:](&v11, sel_invalidationContextForBoundsChange_, x, y, width, height);
  self;
  v9 = (void *)swift_dynamicCastObjCClass();
  if (v9) {
    objc_msgSend(v9, sel_setInvalidateFlowLayoutDelegateMetrics_, 1, v11.receiver, v11.super_class);
  }

  return v8;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = type metadata accessor for IndexPath();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  id v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v9 = self;
  Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v13.receiver = v9;
  v13.super_class = ObjectType;
  id v11 = [(UICollectionViewFlowLayout *)&v13 layoutAttributesForItemAtIndexPath:isa];

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return v11;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v7 = self;
  uint64_t v8 = PagingLayout.layoutAttributesForElements(in:)(x, y, width, height);

  if (v8)
  {
    type metadata accessor for UICollectionViewLayoutAttributes();
    v9.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.Class isa = 0;
  }

  return v9.super.isa;
}

@end