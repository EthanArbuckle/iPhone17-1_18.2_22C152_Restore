@interface MOSuggestionWorkoutIconGlyphView
- (_TtC16MomentsUIService32MOSuggestionWorkoutIconGlyphView)initWithCoder:(id)a3;
- (_TtC16MomentsUIService32MOSuggestionWorkoutIconGlyphView)initWithFrame:(CGRect)a3;
- (void)handleTraitChange;
- (void)layoutSubviews;
@end

@implementation MOSuggestionWorkoutIconGlyphView

- (void)layoutSubviews
{
  v2 = self;
  [(MOSuggestionWorkoutIconGlyphView *)v2 bounds];
  id v4 = [(MOSuggestionWorkoutIconGlyphView *)v2 _setCornerRadius:v3 * 0.5];
  id v5 = (id)(*(uint64_t (**)(id))((swift_isaMask & (uint64_t)v2->super.super.super.isa) + 0x68))(v4);
  MOSuggestionInterstitialExpandableListViewCellConstants.init()();
  [v5 setFrame:];
}

- (_TtC16MomentsUIService32MOSuggestionWorkoutIconGlyphView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC16MomentsUIService32MOSuggestionWorkoutIconGlyphView_iconView;
  id v6 = objc_allocWithZone((Class)UIImageView);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MomentsUIService32MOSuggestionWorkoutIconGlyphView_lightBackgroundColor) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC16MomentsUIService32MOSuggestionWorkoutIconGlyphView_darkBackgroundColor) = 0;

  result = (_TtC16MomentsUIService32MOSuggestionWorkoutIconGlyphView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)handleTraitChange
{
  v2 = self;
  id v3 = [(MOSuggestionWorkoutIconGlyphView *)v2 traitCollection];
  id v4 = [v3 userInterfaceStyle];

  if (v4 == (id)2) {
    uint64_t v5 = (*(uint64_t (**)(void))((swift_isaMask & (uint64_t)v2->super.super.super.isa) + 0x98))();
  }
  else {
    uint64_t v5 = (*(uint64_t (**)(void))((swift_isaMask & (uint64_t)v2->super.super.super.isa) + 0x80))();
  }
  id v6 = (id)v5;
  -[MOSuggestionWorkoutIconGlyphView setBackgroundColor:](v2, "setBackgroundColor:");
}

- (_TtC16MomentsUIService32MOSuggestionWorkoutIconGlyphView)initWithFrame:(CGRect)a3
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService32MOSuggestionWorkoutIconGlyphView_iconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService32MOSuggestionWorkoutIconGlyphView_lightBackgroundColor));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MomentsUIService32MOSuggestionWorkoutIconGlyphView_darkBackgroundColor);
}

@end