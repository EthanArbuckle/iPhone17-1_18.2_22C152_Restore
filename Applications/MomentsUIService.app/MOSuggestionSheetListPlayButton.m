@interface MOSuggestionSheetListPlayButton
- (_TtC16MomentsUIService31MOSuggestionSheetListPlayButton)initWithCoder:(id)a3;
- (_TtC16MomentsUIService31MOSuggestionSheetListPlayButton)initWithFrame:(CGRect)a3;
@end

@implementation MOSuggestionSheetListPlayButton

- (_TtC16MomentsUIService31MOSuggestionSheetListPlayButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC16MomentsUIService31MOSuggestionSheetListPlayButton_mediaAssetID);
  v9 = (objc_class *)type metadata accessor for MOSuggestionSheetListPlayButton();
  void *v8 = 0;
  v8[1] = 0;
  v12.receiver = self;
  v12.super_class = v9;
  v10 = -[MOSuggestionSheetOversizedBoundsButton initWithFrame:](&v12, "initWithFrame:", x, y, width, height);
  MOSuggestionSheetListPlayButton.sharedInit()();

  return v10;
}

- (_TtC16MomentsUIService31MOSuggestionSheetListPlayButton)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC16MomentsUIService31MOSuggestionSheetListPlayButton_mediaAssetID);
  void *v4 = 0;
  v4[1] = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for MOSuggestionSheetListPlayButton();
  id v5 = a3;
  v6 = [(MOSuggestionSheetOversizedBoundsButton *)&v10 initWithCoder:v5];
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    MOSuggestionSheetListPlayButton.sharedInit()();
  }
  return v7;
}

- (void).cxx_destruct
{
}

@end