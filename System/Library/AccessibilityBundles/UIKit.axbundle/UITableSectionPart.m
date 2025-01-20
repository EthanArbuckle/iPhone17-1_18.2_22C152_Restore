@interface UITableSectionPart
- (CGRect)accessibilityFrame;
@end

@implementation UITableSectionPart

- (CGRect)accessibilityFrame
{
  id v10 = (id)[(UITableSectionPart *)self accessibilityContainer];
  [v10 accessibilityFrame];
  double v11 = v2;
  double v12 = v3;
  double v13 = v4;
  double v14 = v5;

  double v6 = v11;
  double v7 = v12;
  double v8 = v13;
  double v9 = v14;
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

@end