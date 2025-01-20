@interface MOSuggestionSheetOversizedBoundsButton
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (_TtC16MomentsUIService38MOSuggestionSheetOversizedBoundsButton)initWithCoder:(id)a3;
- (_TtC16MomentsUIService38MOSuggestionSheetOversizedBoundsButton)initWithFrame:(CGRect)a3;
@end

@implementation MOSuggestionSheetOversizedBoundsButton

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  id v7 = a4;
  v8 = self;
  [(MOSuggestionSheetOversizedBoundsButton *)v8 bounds];
  double v10 = v9;
  [(MOSuggestionSheetOversizedBoundsButton *)v8 bounds];
  double v12 = v11;
  [(MOSuggestionSheetOversizedBoundsButton *)v8 bounds];
  CGRect v17 = CGRectInset(v16, v10 * -1.5, v12 * -1.5);
  v15.CGFloat x = x;
  v15.CGFloat y = y;
  BOOL v13 = CGRectContainsPoint(v17, v15);

  return v13;
}

- (_TtC16MomentsUIService38MOSuggestionSheetOversizedBoundsButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for MOSuggestionSheetOversizedBoundsButton();
  return -[MOSuggestionSheetOversizedBoundsButton initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC16MomentsUIService38MOSuggestionSheetOversizedBoundsButton)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for MOSuggestionSheetOversizedBoundsButton();
  return [(MOSuggestionSheetOversizedBoundsButton *)&v5 initWithCoder:a3];
}

@end