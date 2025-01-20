@interface NSLayoutConstraint(ASNSLayoutConstraintExtras)
+ (id)as_constraintsMatchingFrameOfView:()ASNSLayoutConstraintExtras withFrameOfView:edgeInsets:;
+ (uint64_t)as_constraintsMatchingFrameOfView:()ASNSLayoutConstraintExtras withFrameOfView:;
@end

@implementation NSLayoutConstraint(ASNSLayoutConstraintExtras)

+ (uint64_t)as_constraintsMatchingFrameOfView:()ASNSLayoutConstraintExtras withFrameOfView:
{
  return objc_msgSend(a1, "as_constraintsMatchingFrameOfView:withFrameOfView:edgeInsets:", 0.0, 0.0, 0.0, 0.0);
}

+ (id)as_constraintsMatchingFrameOfView:()ASNSLayoutConstraintExtras withFrameOfView:edgeInsets:
{
  v22[4] = *MEMORY[0x263EF8340];
  id v14 = a8;
  id v15 = a7;
  v16 = [a1 constraintWithItem:v15 attribute:3 relatedBy:0 toItem:v14 attribute:3 multiplier:1.0 constant:a2];
  v22[0] = v16;
  v17 = [a1 constraintWithItem:v15 attribute:4 relatedBy:0 toItem:v14 attribute:4 multiplier:1.0 constant:-a4];
  v22[1] = v17;
  v18 = [a1 constraintWithItem:v15 attribute:5 relatedBy:0 toItem:v14 attribute:5 multiplier:1.0 constant:a3];
  v22[2] = v18;
  v19 = [a1 constraintWithItem:v15 attribute:6 relatedBy:0 toItem:v14 attribute:6 multiplier:1.0 constant:-a5];

  v22[3] = v19;
  v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:4];

  return v20;
}

@end