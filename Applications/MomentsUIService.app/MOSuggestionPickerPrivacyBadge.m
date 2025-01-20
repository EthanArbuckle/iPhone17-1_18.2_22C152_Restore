@interface MOSuggestionPickerPrivacyBadge
- (_TtC16MomentsUIService30MOSuggestionPickerPrivacyBadge)initWithCoder:(id)a3;
- (_TtC16MomentsUIService30MOSuggestionPickerPrivacyBadge)initWithEffect:(id)a3;
- (_TtC16MomentsUIService30MOSuggestionPickerPrivacyBadge)initWithFrame:(CGRect)a3;
@end

@implementation MOSuggestionPickerPrivacyBadge

- (_TtC16MomentsUIService30MOSuggestionPickerPrivacyBadge)initWithFrame:(CGRect)a3
{
  return (_TtC16MomentsUIService30MOSuggestionPickerPrivacyBadge *)specialized MOSuggestionPickerPrivacyBadge.init(frame:)();
}

- (_TtC16MomentsUIService30MOSuggestionPickerPrivacyBadge)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC16MomentsUIService30MOSuggestionPickerPrivacyBadge_iconView;
  double v6 = CGRectMake();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = (objc_class *)type metadata accessor for MOSuggestionPickerBadgeIconView();
  id v14 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)[objc_allocWithZone(v13) initWithFrame:v6, v8, v10, v12];
  uint64_t v15 = OBJC_IVAR____TtC16MomentsUIService30MOSuggestionPickerPrivacyBadge_label;
  closure #1 in variable initialization expression of MOSuggestionPickerPrivacyBadge.label();
  *(Class *)((char *)&self->super.super.super.super.isa + v15) = v16;

  result = (_TtC16MomentsUIService30MOSuggestionPickerPrivacyBadge *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC16MomentsUIService30MOSuggestionPickerPrivacyBadge)initWithEffect:(id)a3
{
  id v3 = a3;
  result = (_TtC16MomentsUIService30MOSuggestionPickerPrivacyBadge *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionPickerPrivacyBadge_iconView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MomentsUIService30MOSuggestionPickerPrivacyBadge_label);
}

@end