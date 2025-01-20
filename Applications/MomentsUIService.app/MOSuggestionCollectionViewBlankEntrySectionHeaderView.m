@interface MOSuggestionCollectionViewBlankEntrySectionHeaderView
- (_TtC16MomentsUIService53MOSuggestionCollectionViewBlankEntrySectionHeaderView)initWithCoder:(id)a3;
- (_TtC16MomentsUIService53MOSuggestionCollectionViewBlankEntrySectionHeaderView)initWithFrame:(CGRect)a3;
- (void)pressedNewEntryButton;
- (void)pressedSegmentControl;
@end

@implementation MOSuggestionCollectionViewBlankEntrySectionHeaderView

- (_TtC16MomentsUIService53MOSuggestionCollectionViewBlankEntrySectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService53MOSuggestionCollectionViewBlankEntrySectionHeaderView *)MOSuggestionCollectionViewBlankEntrySectionHeaderView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MomentsUIService53MOSuggestionCollectionViewBlankEntrySectionHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized MOSuggestionCollectionViewBlankEntrySectionHeaderView.init(coder:)();
}

- (void)pressedSegmentControl
{
  v2 = self;
  MOSuggestionCollectionViewBlankEntrySectionHeaderView.pressedSegmentControl()();
}

- (void)pressedNewEntryButton
{
  v2 = self;
  MOSuggestionCollectionViewBlankEntrySectionHeaderView.pressedNewEntryButton()();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  outlined destroy of MOSuggestionSheetNewEntryButtonDelegate?((uint64_t)self+ OBJC_IVAR____TtC16MomentsUIService53MOSuggestionCollectionViewBlankEntrySectionHeaderView_newEntryDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService53MOSuggestionCollectionViewBlankEntrySectionHeaderView_headerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService53MOSuggestionCollectionViewBlankEntrySectionHeaderView_suggestionSegmentedControl));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService53MOSuggestionCollectionViewBlankEntrySectionHeaderView_newEntryButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService53MOSuggestionCollectionViewBlankEntrySectionHeaderView_privacyTipView));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService53MOSuggestionCollectionViewBlankEntrySectionHeaderView_stateOfMindTipView));
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end