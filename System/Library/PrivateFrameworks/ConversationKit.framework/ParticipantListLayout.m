@interface ParticipantListLayout
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3;
- (CGSize)collectionViewContentSize;
- (_TtC15ConversationKit21ParticipantListLayout)init;
- (_TtC15ConversationKit21ParticipantListLayout)initWithCoder:(id)a3;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
- (void)prepareLayout;
@end

@implementation ParticipantListLayout

- (_TtC15ConversationKit21ParticipantListLayout)init
{
  return (_TtC15ConversationKit21ParticipantListLayout *)ParticipantListLayout.init()();
}

- (_TtC15ConversationKit21ParticipantListLayout)initWithCoder:(id)a3
{
  id v3 = a3;
  ParticipantListLayout.init(coder:)();
}

- (void)prepareLayout
{
  v2 = self;
  ParticipantListLayout.prepare()();
}

- (CGSize)collectionViewContentSize
{
  double v2 = ParticipantListLayout.collectionViewContentSize.getter();
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)a3
{
  return ParticipantListLayout.shouldInvalidateLayout(forBoundsChange:)((__C::CGRect)a3);
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  v9 = ParticipantListLayout.layoutAttributesForItem(at:)();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v9;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v7 = self;
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  unint64_t v8 = (unint64_t)ParticipantListLayout.layoutAttributesForElements(in:)(v12);

  if (v8)
  {
    type metadata accessor for UICollectionViewLayoutAttributes();
    v9.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.isa = 0;
  }
  return v9.super.isa;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  double v3 = (char *)self + OBJC_IVAR____TtC15ConversationKit21ParticipantListLayout_delegate;
  outlined destroy of weak ConversationControlsCountdownJoinButtonDelegate?((uint64_t)v3);
}

@end