@interface MOSuggestionShowMoreFooterView
- (_TtC16MomentsUIService30MOSuggestionShowMoreFooterView)initWithCoder:(id)a3;
- (_TtC16MomentsUIService30MOSuggestionShowMoreFooterView)initWithFrame:(CGRect)a3;
@end

@implementation MOSuggestionShowMoreFooterView

- (_TtC16MomentsUIService30MOSuggestionShowMoreFooterView)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService30MOSuggestionShowMoreFooterView *)MOSuggestionShowMoreFooterView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MomentsUIService30MOSuggestionShowMoreFooterView)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC16MomentsUIService30MOSuggestionShowMoreFooterView_showMoreButton;
  id v5 = a3;
  closure #1 in variable initialization expression of MOSuggestionShowMoreFooterView.showMoreButton();
  *(Class *)((char *)&self->super.super.super.super.isa + v4) = v6;
  v7 = (void (__swiftcall **)())((char *)self
                               + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionShowMoreFooterView_showMoreAction);
  *v7 = MOSuggestionInterstitialExpandableListViewCellConstants.init();
  v7[1] = 0;

  result = (_TtC16MomentsUIService30MOSuggestionShowMoreFooterView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionShowMoreFooterView_showMoreButton));

  swift_release();
}

@end