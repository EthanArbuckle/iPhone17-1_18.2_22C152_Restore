@interface NSLayoutYAxisAnchor(ITK)
- (id)itk_constraintEqualToSystemSpacingBelowAnchor:()ITK multiplier:priority:;
- (id)itk_constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:()ITK multiplier:priority:;
- (id)itk_constraintLessThanOrEqualToSystemSpacingBelowAnchor:()ITK multiplier:priority:;
@end

@implementation NSLayoutYAxisAnchor(ITK)

- (id)itk_constraintEqualToSystemSpacingBelowAnchor:()ITK multiplier:priority:
{
  v4 = objc_msgSend(a1, "constraintEqualToSystemSpacingBelowAnchor:multiplier:");
  *(float *)&double v5 = a3;
  [v4 setPriority:v5];
  return v4;
}

- (id)itk_constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:()ITK multiplier:priority:
{
  v4 = objc_msgSend(a1, "constraintGreaterThanOrEqualToSystemSpacingBelowAnchor:multiplier:");
  *(float *)&double v5 = a3;
  [v4 setPriority:v5];
  return v4;
}

- (id)itk_constraintLessThanOrEqualToSystemSpacingBelowAnchor:()ITK multiplier:priority:
{
  v4 = objc_msgSend(a1, "constraintLessThanOrEqualToSystemSpacingBelowAnchor:multiplier:");
  *(float *)&double v5 = a3;
  [v4 setPriority:v5];
  return v4;
}

@end