@interface MOSuggestionPickerBadgeIconView
- (_TtC16MomentsUIService31MOSuggestionPickerBadgeIconView)initWithCoder:(id)a3;
- (_TtC16MomentsUIService31MOSuggestionPickerBadgeIconView)initWithFrame:(CGRect)a3;
@end

@implementation MOSuggestionPickerBadgeIconView

- (_TtC16MomentsUIService31MOSuggestionPickerBadgeIconView)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService31MOSuggestionPickerBadgeIconView *)specialized MOSuggestionPickerBadgeIconView.init(frame:)();
}

- (_TtC16MomentsUIService31MOSuggestionPickerBadgeIconView)initWithCoder:(id)a3
{
  id v3 = a3;
  specialized MOSuggestionPickerBadgeIconView.init(coder:)();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService31MOSuggestionPickerBadgeIconView_suggestionsImageView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MomentsUIService31MOSuggestionPickerBadgeIconView_privacyImageView);
}

@end