@interface NSLayoutConstraint(NSLayoutConstraint_AVKitAdditions)
+ (id)avkit_constraintsFromEdgesOfItem:()NSLayoutConstraint_AVKitAdditions toEdgesOfItem:;
+ (id)avkit_constraintsFromEdgesOfItem:()NSLayoutConstraint_AVKitAdditions toLeadingAnchor:topAnchor:trailingAnchor:bottomAnchor:priority:;
+ (id)avkit_constraintsFromLeadingAndTrailingEdgesOfItem:()NSLayoutConstraint_AVKitAdditions toEdgesOfItem:;
+ (id)avkit_constraintsFromTopAndBottomEdgesOfItem:()NSLayoutConstraint_AVKitAdditions toEdgesOfItem:;
@end

@implementation NSLayoutConstraint(NSLayoutConstraint_AVKitAdditions)

+ (id)avkit_constraintsFromTopAndBottomEdgesOfItem:()NSLayoutConstraint_AVKitAdditions toEdgesOfItem:
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 topAnchor];
  v8 = [v5 topAnchor];
  v9 = [v7 constraintEqualToAnchor:v8];
  v15[0] = v9;
  v10 = [v6 bottomAnchor];

  v11 = [v5 bottomAnchor];

  v12 = [v10 constraintEqualToAnchor:v11];
  v15[1] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];

  return v13;
}

+ (id)avkit_constraintsFromLeadingAndTrailingEdgesOfItem:()NSLayoutConstraint_AVKitAdditions toEdgesOfItem:
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  v7 = [v6 leadingAnchor];
  v8 = [v5 leadingAnchor];
  v9 = [v7 constraintEqualToAnchor:v8];
  v15[0] = v9;
  v10 = [v6 trailingAnchor];

  v11 = [v5 trailingAnchor];

  v12 = [v10 constraintEqualToAnchor:v11];
  v15[1] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];

  return v13;
}

+ (id)avkit_constraintsFromEdgesOfItem:()NSLayoutConstraint_AVKitAdditions toEdgesOfItem:
{
  v21[4] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  v20 = [v6 leadingAnchor];
  v19 = [v5 leadingAnchor];
  v18 = [v20 constraintEqualToAnchor:v19];
  v21[0] = v18;
  v7 = [v6 topAnchor];
  v8 = [v5 topAnchor];
  v9 = [v7 constraintEqualToAnchor:v8];
  v21[1] = v9;
  v10 = [v6 trailingAnchor];
  v11 = [v5 trailingAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  v21[2] = v12;
  v13 = [v6 bottomAnchor];

  v14 = [v5 bottomAnchor];

  v15 = [v13 constraintEqualToAnchor:v14];
  v21[3] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];

  return v16;
}

+ (id)avkit_constraintsFromEdgesOfItem:()NSLayoutConstraint_AVKitAdditions toLeadingAnchor:topAnchor:trailingAnchor:bottomAnchor:priority:
{
  v32[4] = *MEMORY[0x1E4F143B8];
  id v13 = a8;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  v18 = [v17 leadingAnchor];
  *(float *)&double v19 = a1;
  v20 = objc_msgSend(v18, "avkit_constraintEqualToAnchor:priority:", v16, v19);

  v32[0] = v20;
  v21 = [v17 topAnchor];
  *(float *)&double v22 = a1;
  v23 = objc_msgSend(v21, "avkit_constraintEqualToAnchor:priority:", v15, v22);

  v32[1] = v23;
  v24 = [v17 trailingAnchor];
  *(float *)&double v25 = a1;
  v26 = objc_msgSend(v24, "avkit_constraintEqualToAnchor:priority:", v14, v25);

  v32[2] = v26;
  v27 = [v17 bottomAnchor];

  *(float *)&double v28 = a1;
  v29 = objc_msgSend(v27, "avkit_constraintEqualToAnchor:priority:", v13, v28);

  v32[3] = v29;
  v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:4];

  return v30;
}

@end