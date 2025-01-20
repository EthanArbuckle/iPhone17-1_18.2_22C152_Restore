@interface MOSuggestionCollectionViewDateSectionHeaderView
- (_TtC16MomentsUIService47MOSuggestionCollectionViewDateSectionHeaderView)initWithCoder:(id)a3;
- (_TtC16MomentsUIService47MOSuggestionCollectionViewDateSectionHeaderView)initWithFrame:(CGRect)a3;
@end

@implementation MOSuggestionCollectionViewDateSectionHeaderView

- (_TtC16MomentsUIService47MOSuggestionCollectionViewDateSectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService47MOSuggestionCollectionViewDateSectionHeaderView *)specialized MOSuggestionCollectionViewDateSectionHeaderView.init(frame:)();
}

- (_TtC16MomentsUIService47MOSuggestionCollectionViewDateSectionHeaderView)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC16MomentsUIService47MOSuggestionCollectionViewDateSectionHeaderView_dateLabel;
  id v5 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v4) = (Class)closure #1 in variable initialization expression of MOSuggestionCollectionViewDateSectionHeaderView.dateLabel();
  v6 = (char *)self + OBJC_IVAR____TtC16MomentsUIService47MOSuggestionCollectionViewDateSectionHeaderView_date;
  uint64_t v7 = type metadata accessor for Date();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 1, 1, v7);

  result = (_TtC16MomentsUIService47MOSuggestionCollectionViewDateSectionHeaderView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService47MOSuggestionCollectionViewDateSectionHeaderView_dateLabel));
  v3 = (char *)self + OBJC_IVAR____TtC16MomentsUIService47MOSuggestionCollectionViewDateSectionHeaderView_date;

  outlined destroy of Date?((uint64_t)v3);
}

@end