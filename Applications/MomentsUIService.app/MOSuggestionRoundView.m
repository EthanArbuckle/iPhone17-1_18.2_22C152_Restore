@interface MOSuggestionRoundView
- (_TtC16MomentsUIService21MOSuggestionRoundView)initWithCoder:(id)a3;
- (_TtC16MomentsUIService21MOSuggestionRoundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MOSuggestionRoundView

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MOSuggestionRoundView();
  id v2 = v3.receiver;
  [(MOSuggestionRoundView *)&v3 layoutSubviews];
  [v2 setClipsToBounds:1];
  [v2 bounds];
  [v2 _setCornerRadius:CGRectGetHeight(v4) * 0.5];
}

- (_TtC16MomentsUIService21MOSuggestionRoundView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MOSuggestionRoundView();
  return -[MOSuggestionRoundView initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC16MomentsUIService21MOSuggestionRoundView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MOSuggestionRoundView();
  return [(MOSuggestionRoundView *)&v5 initWithCoder:a3];
}

@end