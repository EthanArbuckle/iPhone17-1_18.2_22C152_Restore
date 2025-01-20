@interface NSLayoutAnchor(NSLayoutAnchor_AVKitAdditions)
- (id)avkit_constraintEqualToAnchor:()NSLayoutAnchor_AVKitAdditions constant:priority:;
- (id)avkit_constraintEqualToAnchor:()NSLayoutAnchor_AVKitAdditions priority:;
- (id)avkit_constraintGreaterThanOrEqualToAnchor:()NSLayoutAnchor_AVKitAdditions constant:priority:;
- (id)avkit_constraintGreaterThanOrEqualToAnchor:()NSLayoutAnchor_AVKitAdditions priority:;
- (id)avkit_constraintLessThanOrEqualToAnchor:()NSLayoutAnchor_AVKitAdditions constant:priority:;
- (id)avkit_constraintLessThanOrEqualToAnchor:()NSLayoutAnchor_AVKitAdditions priority:;
@end

@implementation NSLayoutAnchor(NSLayoutAnchor_AVKitAdditions)

- (id)avkit_constraintLessThanOrEqualToAnchor:()NSLayoutAnchor_AVKitAdditions constant:priority:
{
  v4 = objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:constant:");
  *(float *)&double v5 = a3;
  [v4 setPriority:v5];

  return v4;
}

- (id)avkit_constraintGreaterThanOrEqualToAnchor:()NSLayoutAnchor_AVKitAdditions constant:priority:
{
  v4 = objc_msgSend(a1, "constraintGreaterThanOrEqualToAnchor:constant:");
  *(float *)&double v5 = a3;
  [v4 setPriority:v5];

  return v4;
}

- (id)avkit_constraintEqualToAnchor:()NSLayoutAnchor_AVKitAdditions constant:priority:
{
  v4 = objc_msgSend(a1, "constraintEqualToAnchor:constant:");
  *(float *)&double v5 = a3;
  [v4 setPriority:v5];

  return v4;
}

- (id)avkit_constraintLessThanOrEqualToAnchor:()NSLayoutAnchor_AVKitAdditions priority:
{
  v3 = objc_msgSend(a1, "constraintLessThanOrEqualToAnchor:");
  *(float *)&double v4 = a2;
  [v3 setPriority:v4];

  return v3;
}

- (id)avkit_constraintGreaterThanOrEqualToAnchor:()NSLayoutAnchor_AVKitAdditions priority:
{
  v3 = objc_msgSend(a1, "constraintGreaterThanOrEqualToAnchor:");
  *(float *)&double v4 = a2;
  [v3 setPriority:v4];

  return v3;
}

- (id)avkit_constraintEqualToAnchor:()NSLayoutAnchor_AVKitAdditions priority:
{
  v3 = objc_msgSend(a1, "constraintEqualToAnchor:");
  *(float *)&double v4 = a2;
  [v3 setPriority:v4];

  return v3;
}

@end