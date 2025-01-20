@interface NSLayoutDimension(ITK)
- (id)itk_constraintEqualToAnchor:()ITK multiplier:constant:priority:;
- (id)itk_constraintEqualToAnchor:()ITK multiplier:priority:;
- (id)itk_constraintEqualToConstant:()ITK priority:;
- (id)itk_constraintGreaterThanOrEqualToAnchor:()ITK multiplier:constant:priority:;
- (id)itk_constraintGreaterThanOrEqualToAnchor:()ITK multiplier:priority:;
- (id)itk_constraintGreaterThanOrEqualToConstant:()ITK priority:;
- (id)itk_constraintLessThanOrEqualToAnchor:()ITK multiplier:constant:priority:;
- (id)itk_constraintLessThanOrEqualToAnchor:()ITK multiplier:priority:;
- (id)itk_constraintLessThanOrEqualToConstant:()ITK priority:;
@end

@implementation NSLayoutDimension(ITK)

- (id)itk_constraintEqualToConstant:()ITK priority:
{
  v4 = objc_msgSend(a1, "constraintEqualToConstant:");
  *(float *)&double v5 = a3;
  [v4 setPriority:v5];
  return v4;
}

- (id)itk_constraintGreaterThanOrEqualToConstant:()ITK priority:
{
  v4 = objc_msgSend(a1, "constraintGreaterThanOrEqualToConstant:");
  *(float *)&double v5 = a3;
  [v4 setPriority:v5];
  return v4;
}

- (id)itk_constraintLessThanOrEqualToConstant:()ITK priority:
{
  v4 = objc_msgSend(a1, "constraintLessThanOrEqualToConstant:");
  *(float *)&double v5 = a3;
  [v4 setPriority:v5];
  return v4;
}

- (id)itk_constraintEqualToAnchor:()ITK multiplier:priority:
{
  v4 = objc_msgSend(a1, "constraintEqualToAnchor:multiplier:");
  *(float *)&double v5 = a3;
  [v4 setPriority:v5];
  return v4;
}

- (id)itk_constraintGreaterThanOrEqualToAnchor:()ITK multiplier:priority:
{
  v4 = objc_msgSend(a1, "constraintGreaterThanOrEqualToAnchor:multiplier:");
  *(float *)&double v5 = a3;
  [v4 setPriority:v5];
  return v4;
}

- (id)itk_constraintLessThanOrEqualToAnchor:()ITK multiplier:priority:
{
  v4 = objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:multiplier:");
  *(float *)&double v5 = a3;
  [v4 setPriority:v5];
  return v4;
}

- (id)itk_constraintEqualToAnchor:()ITK multiplier:constant:priority:
{
  double v5 = objc_msgSend(a1, "constraintEqualToAnchor:multiplier:constant:");
  *(float *)&double v6 = a4;
  [v5 setPriority:v6];
  return v5;
}

- (id)itk_constraintGreaterThanOrEqualToAnchor:()ITK multiplier:constant:priority:
{
  double v5 = objc_msgSend(a1, "constraintGreaterThanOrEqualToAnchor:multiplier:constant:");
  *(float *)&double v6 = a4;
  [v5 setPriority:v6];
  return v5;
}

- (id)itk_constraintLessThanOrEqualToAnchor:()ITK multiplier:constant:priority:
{
  double v5 = objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:multiplier:constant:");
  *(float *)&double v6 = a4;
  [v5 setPriority:v6];
  return v5;
}

@end