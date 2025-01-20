@interface MOSuggestionSheetOnboardingTipCell
- (_TtC16MomentsUIService34MOSuggestionSheetOnboardingTipCell)initWithCoder:(id)a3;
- (_TtC16MomentsUIService34MOSuggestionSheetOnboardingTipCell)initWithFrame:(CGRect)a3;
@end

@implementation MOSuggestionSheetOnboardingTipCell

- (_TtC16MomentsUIService34MOSuggestionSheetOnboardingTipCell)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionSheetOnboardingTipCell_tipModel) = 0;
  id v4 = a3;

  result = (_TtC16MomentsUIService34MOSuggestionSheetOnboardingTipCell *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC16MomentsUIService34MOSuggestionSheetOnboardingTipCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC16MomentsUIService34MOSuggestionSheetOnboardingTipCell_tipModel) = 0;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for MOSuggestionSheetOnboardingTipCell();
  v7 = -[MOSuggestionSheetOnboardingTipCell initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
  v8 = *(void (**)(void))((swift_isaMask & (uint64_t)v7->super.super.super.super.isa) + 0x70);
  v9 = v7;
  v8();

  return v9;
}

- (void).cxx_destruct
{
}

@end