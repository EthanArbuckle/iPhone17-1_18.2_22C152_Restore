@interface NSLayoutDimension(HUAdditions)
- (id)hu_constraintsLessThanOrEqualToConstant:()HUAdditions equalityPriority:;
@end

@implementation NSLayoutDimension(HUAdditions)

- (id)hu_constraintsLessThanOrEqualToConstant:()HUAdditions equalityPriority:
{
  v12[2] = *MEMORY[0x1E4F143B8];
  v6 = objc_msgSend(a1, "constraintLessThanOrEqualToConstant:");
  v12[0] = v6;
  v7 = [a1 constraintEqualToConstant:a2];
  *(float *)&double v8 = a3;
  v9 = objc_msgSend(v7, "hu_constraintWithPriority:", v8);
  v12[1] = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];

  return v10;
}

@end