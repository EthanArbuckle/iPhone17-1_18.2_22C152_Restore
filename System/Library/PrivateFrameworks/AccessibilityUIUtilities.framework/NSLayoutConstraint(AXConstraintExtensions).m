@interface NSLayoutConstraint(AXConstraintExtensions)
- (id)ax_copyWithPriority:()AXConstraintExtensions;
@end

@implementation NSLayoutConstraint(AXConstraintExtensions)

- (id)ax_copyWithPriority:()AXConstraintExtensions
{
  v4 = (void *)MEMORY[0x1E4F28DC8];
  v5 = [a1 firstItem];
  uint64_t v6 = [a1 firstAttribute];
  uint64_t v7 = [a1 relation];
  v8 = [a1 secondItem];
  uint64_t v9 = [a1 secondAttribute];
  [a1 multiplier];
  double v11 = v10;
  [a1 constant];
  v13 = [v4 constraintWithItem:v5 attribute:v6 relatedBy:v7 toItem:v8 attribute:v9 multiplier:v11 constant:v12];

  *(float *)&double v14 = a2;
  [v13 setPriority:v14];
  return v13;
}

@end