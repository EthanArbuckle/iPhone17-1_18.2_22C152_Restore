@interface NSLayoutAnchor(ITK)
- (id)itk_constraintEqualToAnchor:()ITK constant:priority:;
- (id)itk_constraintEqualToAnchor:()ITK priority:;
- (id)itk_constraintGreaterThanOrEqualToAnchor:()ITK constant:priority:;
- (id)itk_constraintGreaterThanOrEqualToAnchor:()ITK priority:;
- (id)itk_constraintLessThanOrEqualToAnchor:()ITK constant:priority:;
- (id)itk_constraintLessThanOrEqualToAnchor:()ITK priority:;
@end

@implementation NSLayoutAnchor(ITK)

- (id)itk_constraintEqualToAnchor:()ITK priority:
{
  v3 = objc_msgSend(a1, "constraintEqualToAnchor:");
  *(float *)&double v4 = a2;
  [v3 setPriority:v4];
  return v3;
}

- (id)itk_constraintGreaterThanOrEqualToAnchor:()ITK priority:
{
  v3 = objc_msgSend(a1, "constraintGreaterThanOrEqualToAnchor:");
  *(float *)&double v4 = a2;
  [v3 setPriority:v4];
  return v3;
}

- (id)itk_constraintLessThanOrEqualToAnchor:()ITK priority:
{
  v3 = objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:");
  *(float *)&double v4 = a2;
  [v3 setPriority:v4];
  return v3;
}

- (id)itk_constraintEqualToAnchor:()ITK constant:priority:
{
  double v4 = objc_msgSend(a1, "constraintEqualToAnchor:constant:");
  *(float *)&double v5 = a3;
  [v4 setPriority:v5];
  return v4;
}

- (id)itk_constraintGreaterThanOrEqualToAnchor:()ITK constant:priority:
{
  double v4 = objc_msgSend(a1, "constraintGreaterThanOrEqualToAnchor:constant:");
  *(float *)&double v5 = a3;
  [v4 setPriority:v5];
  return v4;
}

- (id)itk_constraintLessThanOrEqualToAnchor:()ITK constant:priority:
{
  double v4 = objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:constant:");
  *(float *)&double v5 = a3;
  [v4 setPriority:v5];
  return v4;
}

@end