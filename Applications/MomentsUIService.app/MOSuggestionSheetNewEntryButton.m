@interface MOSuggestionSheetNewEntryButton
- (_TtC16MomentsUIService31MOSuggestionSheetNewEntryButton)initWithCoder:(id)a3;
- (_TtC16MomentsUIService31MOSuggestionSheetNewEntryButton)initWithFrame:(CGRect)a3;
@end

@implementation MOSuggestionSheetNewEntryButton

- (_TtC16MomentsUIService31MOSuggestionSheetNewEntryButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for MOSuggestionSheetNewEntryButton();
  v7 = -[MOSuggestionSheetNewEntryButton initWithFrame:](&v9, "initWithFrame:", x, y, width, height);
  MOSuggestionSheetNewEntryButton.sharedInit()();

  return v7;
}

- (_TtC16MomentsUIService31MOSuggestionSheetNewEntryButton)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for MOSuggestionSheetNewEntryButton();
  id v4 = a3;
  v5 = [(MOSuggestionSheetNewEntryButton *)&v9 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    MOSuggestionSheetNewEntryButton.sharedInit()();
  }
  return v6;
}

@end