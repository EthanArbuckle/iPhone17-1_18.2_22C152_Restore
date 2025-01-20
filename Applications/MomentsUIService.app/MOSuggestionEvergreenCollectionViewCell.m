@interface MOSuggestionEvergreenCollectionViewCell
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (_TtC16MomentsUIService39MOSuggestionEvergreenCollectionViewCell)initWithCoder:(id)a3;
- (_TtC16MomentsUIService39MOSuggestionEvergreenCollectionViewCell)initWithFrame:(CGRect)a3;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (void)prepareForReuse;
@end

@implementation MOSuggestionEvergreenCollectionViewCell

- (_TtC16MomentsUIService39MOSuggestionEvergreenCollectionViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService39MOSuggestionEvergreenCollectionViewCell *)specialized MOSuggestionEvergreenCollectionViewCell.init(frame:)();
}

- (_TtC16MomentsUIService39MOSuggestionEvergreenCollectionViewCell)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC16MomentsUIService39MOSuggestionEvergreenCollectionViewCell_assetView;
  type metadata accessor for MOSuggestionSheetAssetView();
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.super.super.isa + v5) = (Class)[v6 init];
  swift_weakInit();
  swift_weakInit();

  result = (_TtC16MomentsUIService39MOSuggestionEvergreenCollectionViewCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a4;
  v9 = self;
  id v10 = MOSuggestionEvergreenCollectionViewCell.hitTest(_:with:)((uint64_t)a4, x, y);

  return v10;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 1;
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MOSuggestionEvergreenCollectionViewCell();
  v2 = v5.receiver;
  [(MOSuggestionEvergreenCollectionViewCell *)&v5 prepareForReuse];
  uint64_t v3 = (*(uint64_t (**)(void))((swift_isaMask & *v2) + 0xA0))(0);
  v4 = (void *)(*(uint64_t (**)(uint64_t))((swift_isaMask & *v2) + 0x68))(v3);
  (*(void (**)(void))((swift_isaMask & *v4) + 0xA0))(0);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService39MOSuggestionEvergreenCollectionViewCell_assetView));
  swift_weakDestroy();

  swift_weakDestroy();
}

@end