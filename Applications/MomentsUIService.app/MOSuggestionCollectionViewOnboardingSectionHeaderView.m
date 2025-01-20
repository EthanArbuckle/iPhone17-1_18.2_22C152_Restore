@interface MOSuggestionCollectionViewOnboardingSectionHeaderView
- (_TtC16MomentsUIService53MOSuggestionCollectionViewOnboardingSectionHeaderView)initWithCoder:(id)a3;
- (_TtC16MomentsUIService53MOSuggestionCollectionViewOnboardingSectionHeaderView)initWithFrame:(CGRect)a3;
- (void)pressedNewEntryButton;
@end

@implementation MOSuggestionCollectionViewOnboardingSectionHeaderView

- (_TtC16MomentsUIService53MOSuggestionCollectionViewOnboardingSectionHeaderView)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService53MOSuggestionCollectionViewOnboardingSectionHeaderView *)MOSuggestionCollectionViewOnboardingSectionHeaderView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MomentsUIService53MOSuggestionCollectionViewOnboardingSectionHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized MOSuggestionCollectionViewOnboardingSectionHeaderView.init(coder:)();
}

- (void)pressedNewEntryButton
{
  void (*v2)(void *__return_ptr);
  _TtC16MomentsUIService53MOSuggestionCollectionViewOnboardingSectionHeaderView *v3;
  uint64_t v4;
  uint64_t v5;
  void v6[3];
  uint64_t v7;
  uint64_t v8;
  void v9[5];

  v2 = *(void (**)(void *__return_ptr))((swift_isaMask & (uint64_t)self->super.super.super.super.isa) + 0x78);
  id v3 = self;
  v2(v9);
  if (v9[3])
  {
    outlined init with copy of MOProtectedAppsManagerDelegate((uint64_t)v9, (uint64_t)v6);
    outlined destroy of MOSuggestionSheetNewEntryButtonDelegate?((uint64_t)v9);
    v4 = v7;
    v5 = v8;
    __swift_project_boxed_opaque_existential_1(v6, v7);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v5);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v6);
  }
  else
  {
    outlined destroy of MOSuggestionSheetNewEntryButtonDelegate?((uint64_t)v9);
  }
}

- (void).cxx_destruct
{
  outlined destroy of MOSuggestionSheetNewEntryButtonDelegate?((uint64_t)self+ OBJC_IVAR____TtC16MomentsUIService53MOSuggestionCollectionViewOnboardingSectionHeaderView_newEntryDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService53MOSuggestionCollectionViewOnboardingSectionHeaderView_newEntryButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService53MOSuggestionCollectionViewOnboardingSectionHeaderView_onboardingTipView));
  swift_bridgeObjectRelease();

  swift_release();
}

@end