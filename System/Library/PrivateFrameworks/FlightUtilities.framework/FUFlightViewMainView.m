@interface FUFlightViewMainView
- (CGSize)intrinsicContentSize;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
@end

@implementation FUFlightViewMainView

- (CGSize)intrinsicContentSize
{
  v2 = [(FUFlightViewMainView *)self subviews];
  v3 = [v2 firstObject];

  [v3 intrinsicContentSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = v5;
  double v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  if (a3.height <= 1500.0) {
    double height = a3.height;
  }
  else {
    double height = 1500.0;
  }
  if (a3.width <= 500.0) {
    double width = a3.width;
  }
  else {
    double width = 500.0;
  }
  double v9 = [(FUFlightViewMainView *)self subviews];
  v10 = [v9 firstObject];

  *(float *)&double v11 = a4;
  *(float *)&double v12 = a5;
  objc_msgSend(v10, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", width, height, v11, v12);
  double v14 = v13;
  double v16 = v15;

  double v17 = v14;
  double v18 = v16;
  result.double height = v18;
  result.double width = v17;
  return result;
}

@end