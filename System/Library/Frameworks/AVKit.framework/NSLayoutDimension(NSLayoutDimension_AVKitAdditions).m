@interface NSLayoutDimension(NSLayoutDimension_AVKitAdditions)
- (id)avkit_constraintEqualToConstant:()NSLayoutDimension_AVKitAdditions priority:;
- (id)avkit_constraintGreaterThanOrEqualToConstant:()NSLayoutDimension_AVKitAdditions priority:;
- (id)avkit_constraintLessThanOrEqualToConstant:()NSLayoutDimension_AVKitAdditions priority:;
@end

@implementation NSLayoutDimension(NSLayoutDimension_AVKitAdditions)

- (id)avkit_constraintLessThanOrEqualToConstant:()NSLayoutDimension_AVKitAdditions priority:
{
  v4 = objc_msgSend(a1, "constraintLessThanOrEqualToConstant:");
  *(float *)&double v5 = a3;
  [v4 setPriority:v5];

  return v4;
}

- (id)avkit_constraintGreaterThanOrEqualToConstant:()NSLayoutDimension_AVKitAdditions priority:
{
  v4 = objc_msgSend(a1, "constraintGreaterThanOrEqualToConstant:");
  *(float *)&double v5 = a3;
  [v4 setPriority:v5];

  return v4;
}

- (id)avkit_constraintEqualToConstant:()NSLayoutDimension_AVKitAdditions priority:
{
  v4 = objc_msgSend(a1, "constraintEqualToConstant:");
  *(float *)&double v5 = a3;
  [v4 setPriority:v5];

  return v4;
}

@end