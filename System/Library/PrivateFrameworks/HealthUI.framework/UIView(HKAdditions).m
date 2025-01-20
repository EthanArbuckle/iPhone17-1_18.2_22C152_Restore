@interface UIView(HKAdditions)
- (BOOL)hk_isLeftToRight;
- (double)hk_layoutHeightFittingWidth:()HKAdditions;
- (id)hk_addConstraintsWithFormat:()HKAdditions options:metrics:views:;
- (id)hk_addEqualsConstraintWithItem:()HKAdditions attribute:relatedTo:attribute:constant:;
- (id)hk_addEqualsConstraintWithItem:()HKAdditions attribute:relatedTo:constant:;
- (uint64_t)hk_addConstraintsWithFormat:()HKAdditions options:views:;
- (uint64_t)hk_alignCenterConstraintsWithView:()HKAdditions;
- (uint64_t)hk_alignConstraintsWithGuide:()HKAdditions;
- (uint64_t)hk_alignConstraintsWithView:()HKAdditions;
- (uint64_t)hk_alignConstraintsWithView:()HKAdditions insets:;
- (uint64_t)hk_alignConstraintsWithViewController:()HKAdditions;
- (uint64_t)hk_alignHorizontalConstraintsWithGuide:()HKAdditions insets:;
- (uint64_t)hk_alignHorizontalConstraintsWithView:()HKAdditions insets:;
- (uint64_t)hk_alignHorizontalConstraintsWithView:()HKAdditions margin:;
- (uint64_t)hk_alignVerticalConstraintsWithGuide:()HKAdditions insets:;
- (uint64_t)hk_alignVerticalConstraintsWithView:()HKAdditions insets:;
- (uint64_t)hk_alignVerticalConstraintsWithView:()HKAdditions margin:;
- (uint64_t)hk_maskAllCornersWithRadius:()HKAdditions;
- (uint64_t)hk_trailingTextAlignmentAtOrBelowSizeCategory:()HKAdditions;
- (void)hk_alignConstraintsWithLeadingAnchor:()HKAdditions trailingAnchor:insets:;
- (void)hk_alignConstraintsWithTopAnchor:()HKAdditions bottomAnchor:insets:;
- (void)hk_constrainToSuperviewAlongEdges:()HKAdditions constant:;
- (void)hk_constrainToView:()HKAdditions fromEdge:toEdge:constant:;
- (void)hk_constraintAspectRatioFromSize:()HKAdditions;
- (void)hk_maskCorners:()HKAdditions radius:;
@end

@implementation UIView(HKAdditions)

- (uint64_t)hk_alignConstraintsWithView:()HKAdditions
{
  id v4 = a3;
  v5 = [a1 leadingAnchor];
  v6 = [v4 leadingAnchor];
  v7 = [v5 constraintEqualToAnchor:v6];
  [v7 setActive:1];

  v8 = [a1 trailingAnchor];
  v9 = [v4 trailingAnchor];
  v10 = [v8 constraintEqualToAnchor:v9];
  [v10 setActive:1];

  v11 = [a1 topAnchor];
  v12 = [v4 topAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  [v13 setActive:1];

  v14 = [a1 bottomAnchor];
  v15 = [v4 bottomAnchor];

  v16 = [v14 constraintEqualToAnchor:v15];
  [v16 setActive:1];

  return [a1 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (id)hk_addEqualsConstraintWithItem:()HKAdditions attribute:relatedTo:constant:
{
  if (a6) {
    uint64_t v7 = a5;
  }
  else {
    uint64_t v7 = 0;
  }
  v8 = [MEMORY[0x1E4F28DC8] constraintWithItem:a4 attribute:a5 relatedBy:0 toItem:a6 attribute:v7 multiplier:1.0 constant:a2];
  [a1 addConstraint:v8];
  return v8;
}

- (id)hk_addEqualsConstraintWithItem:()HKAdditions attribute:relatedTo:attribute:constant:
{
  if (a6) {
    uint64_t v8 = a7;
  }
  else {
    uint64_t v8 = 0;
  }
  v9 = [MEMORY[0x1E4F28DC8] constraintWithItem:a4 attribute:a5 relatedBy:0 toItem:a6 attribute:v8 multiplier:1.0 constant:a2];
  [a1 addConstraint:v9];
  return v9;
}

- (id)hk_addConstraintsWithFormat:()HKAdditions options:metrics:views:
{
  v2 = objc_msgSend(MEMORY[0x1E4F28DC8], "constraintsWithVisualFormat:options:metrics:views:");
  [a1 addConstraints:v2];
  return v2;
}

- (uint64_t)hk_addConstraintsWithFormat:()HKAdditions options:views:
{
  return objc_msgSend(a1, "hk_addConstraintsWithFormat:options:metrics:views:", a3, a4, 0, a5);
}

- (BOOL)hk_isLeftToRight
{
  uint64_t v1 = [a1 semanticContentAttribute];
  return [MEMORY[0x1E4FB1EB0] userInterfaceLayoutDirectionForSemanticContentAttribute:v1] == 0;
}

- (uint64_t)hk_trailingTextAlignmentAtOrBelowSizeCategory:()HKAdditions
{
  if (HKUIApplicationContentSizeCategoryIsLargerThanSizeCategory(a3)) {
    return 4;
  }
  if (objc_msgSend(a1, "hk_isLeftToRight")) {
    return 2;
  }
  return 0;
}

- (void)hk_constrainToView:()HKAdditions fromEdge:toEdge:constant:
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v7 = [MEMORY[0x1E4F28DC8] constraintWithItem:a1 attribute:a5 relatedBy:0 toItem:a4 attribute:a6 multiplier:1.0 constant:a2];
  uint64_t v8 = (void *)MEMORY[0x1E4F28DC8];
  v10[0] = v7;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  [v8 activateConstraints:v9];

  [a1 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)hk_constrainToSuperviewAlongEdges:()HKAdditions constant:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [a1 superview];
  if (!v7) {
    goto LABEL_21;
  }
  uint64_t v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v6, "count"));
  v9 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v10) {
    goto LABEL_18;
  }
  uint64_t v11 = v10;
  uint64_t v12 = *(void *)v23;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v23 != v12) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = [*(id *)(*((void *)&v22 + 1) + 8 * i) integerValue];
      uint64_t v15 = v14;
      if ((v14 & 0xFFFFFFFFFFFFFFFDLL) == 1)
      {
        v16 = (void *)MEMORY[0x1E4F28DC8];
        double v17 = 1.0;
        v18 = a1;
        v19 = v7;
LABEL_15:
        v21 = [v16 constraintWithItem:v18 attribute:v15 relatedBy:0 toItem:v19 attribute:v15 multiplier:v17 constant:a2];
        [v8 addObject:v21];

        continue;
      }
      if (v14 == 4 || v14 == 2)
      {
        v16 = (void *)MEMORY[0x1E4F28DC8];
        double v17 = 1.0;
        v18 = v7;
        v19 = a1;
        goto LABEL_15;
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  }
  while (v11);
LABEL_18:
  if ([v8 count])
  {
    [MEMORY[0x1E4F28DC8] activateConstraints:v8];
    [a1 setTranslatesAutoresizingMaskIntoConstraints:0];
  }

LABEL_21:
}

- (uint64_t)hk_alignConstraintsWithGuide:()HKAdditions
{
  id v4 = a3;
  v5 = [a1 topAnchor];
  id v6 = [v4 topAnchor];
  uint64_t v7 = [v5 constraintEqualToAnchor:v6];
  [v7 setActive:1];

  uint64_t v8 = [a1 trailingAnchor];
  v9 = [v4 trailingAnchor];
  uint64_t v10 = [v8 constraintEqualToAnchor:v9];
  [v10 setActive:1];

  uint64_t v11 = [a1 bottomAnchor];
  uint64_t v12 = [v4 bottomAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  [v13 setActive:1];

  uint64_t v14 = [a1 leadingAnchor];
  uint64_t v15 = [v4 leadingAnchor];

  v16 = [v14 constraintEqualToAnchor:v15];
  [v16 setActive:1];

  return [a1 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (uint64_t)hk_alignVerticalConstraintsWithView:()HKAdditions margin:
{
  id v6 = a4;
  uint64_t v7 = [a1 topAnchor];
  uint64_t v8 = [v6 topAnchor];
  v9 = [v7 constraintEqualToAnchor:v8 constant:a2];
  [v9 setActive:1];

  uint64_t v10 = [a1 bottomAnchor];
  uint64_t v11 = [v6 bottomAnchor];

  uint64_t v12 = [v10 constraintEqualToAnchor:v11 constant:-a2];
  [v12 setActive:1];

  return [a1 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (uint64_t)hk_alignHorizontalConstraintsWithView:()HKAdditions margin:
{
  id v6 = a4;
  uint64_t v7 = [a1 leadingAnchor];
  uint64_t v8 = [v6 leadingAnchor];
  v9 = [v7 constraintEqualToAnchor:v8 constant:a2];
  [v9 setActive:1];

  uint64_t v10 = [a1 trailingAnchor];
  uint64_t v11 = [v6 trailingAnchor];

  uint64_t v12 = [v10 constraintEqualToAnchor:v11 constant:-a2];
  [v12 setActive:1];

  return [a1 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (uint64_t)hk_alignCenterConstraintsWithView:()HKAdditions
{
  id v4 = a3;
  v5 = [a1 centerXAnchor];
  id v6 = [v4 centerXAnchor];
  uint64_t v7 = [v5 constraintEqualToAnchor:v6];
  [v7 setActive:1];

  uint64_t v8 = [a1 centerYAnchor];
  v9 = [v4 centerYAnchor];

  uint64_t v10 = [v8 constraintEqualToAnchor:v9];
  [v10 setActive:1];

  return [a1 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (uint64_t)hk_alignConstraintsWithViewController:()HKAdditions
{
  id v4 = a3;
  v5 = [a1 leadingAnchor];
  id v6 = [v4 view];
  uint64_t v7 = [v6 leadingAnchor];
  uint64_t v8 = [v5 constraintEqualToAnchor:v7];
  [v8 setActive:1];

  v9 = [a1 trailingAnchor];
  uint64_t v10 = [v4 view];
  uint64_t v11 = [v10 trailingAnchor];
  uint64_t v12 = [v9 constraintEqualToAnchor:v11];
  [v12 setActive:1];

  v13 = [a1 topAnchor];
  uint64_t v14 = [v4 view];
  uint64_t v15 = [v14 safeAreaLayoutGuide];
  v16 = [v15 topAnchor];
  double v17 = [v13 constraintEqualToAnchor:v16];
  [v17 setActive:1];

  v18 = [a1 bottomAnchor];
  v19 = [v4 view];

  v20 = [v19 safeAreaLayoutGuide];
  v21 = [v20 bottomAnchor];
  long long v22 = [v18 constraintEqualToAnchor:v21];
  [v22 setActive:1];

  return [a1 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)hk_alignConstraintsWithLeadingAnchor:()HKAdditions trailingAnchor:insets:
{
  id v12 = a8;
  id v13 = a7;
  uint64_t v14 = [a1 leadingAnchor];
  uint64_t v15 = [v14 constraintEqualToAnchor:v13 constant:a3];

  [v15 setActive:1];
  id v17 = [a1 trailingAnchor];
  v16 = [v17 constraintEqualToAnchor:v12 constant:-a5];

  [v16 setActive:1];
}

- (void)hk_alignConstraintsWithTopAnchor:()HKAdditions bottomAnchor:insets:
{
  id v11 = a7;
  id v12 = a6;
  id v13 = [a1 topAnchor];
  uint64_t v14 = [v13 constraintEqualToAnchor:v12 constant:a2];

  [v14 setActive:1];
  id v16 = [a1 bottomAnchor];
  uint64_t v15 = [v16 constraintEqualToAnchor:v11 constant:-a4];

  [v15 setActive:1];
}

- (uint64_t)hk_alignConstraintsWithView:()HKAdditions insets:
{
  id v12 = a7;
  id v13 = [v12 topAnchor];
  uint64_t v14 = [v12 bottomAnchor];
  objc_msgSend(a1, "hk_alignConstraintsWithTopAnchor:bottomAnchor:insets:", v13, v14, a2, a3, a4, a5);

  uint64_t v15 = [v12 leadingAnchor];
  id v16 = [v12 trailingAnchor];

  objc_msgSend(a1, "hk_alignConstraintsWithLeadingAnchor:trailingAnchor:insets:", v15, v16, a2, a3, a4, a5);
  return [a1 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (uint64_t)hk_alignHorizontalConstraintsWithView:()HKAdditions insets:
{
  id v12 = a7;
  id v13 = [v12 leadingAnchor];
  uint64_t v14 = [v12 trailingAnchor];

  objc_msgSend(a1, "hk_alignConstraintsWithLeadingAnchor:trailingAnchor:insets:", v13, v14, a2, a3, a4, a5);
  return [a1 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (uint64_t)hk_alignVerticalConstraintsWithView:()HKAdditions insets:
{
  id v12 = a7;
  id v13 = [v12 topAnchor];
  uint64_t v14 = [v12 bottomAnchor];

  objc_msgSend(a1, "hk_alignConstraintsWithTopAnchor:bottomAnchor:insets:", v13, v14, a2, a3, a4, a5);
  return [a1 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (uint64_t)hk_alignHorizontalConstraintsWithGuide:()HKAdditions insets:
{
  id v12 = a7;
  id v13 = [v12 leadingAnchor];
  uint64_t v14 = [v12 trailingAnchor];

  objc_msgSend(a1, "hk_alignConstraintsWithLeadingAnchor:trailingAnchor:insets:", v13, v14, a2, a3, a4, a5);
  return [a1 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (uint64_t)hk_alignVerticalConstraintsWithGuide:()HKAdditions insets:
{
  id v12 = a7;
  id v13 = [v12 topAnchor];
  uint64_t v14 = [v12 bottomAnchor];

  objc_msgSend(a1, "hk_alignConstraintsWithTopAnchor:bottomAnchor:insets:", v13, v14, a2, a3, a4, a5);
  return [a1 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)hk_constraintAspectRatioFromSize:()HKAdditions
{
  id v4 = [MEMORY[0x1E4F28DC8] constraintWithItem:a1 attribute:8 relatedBy:0 toItem:a1 attribute:7 multiplier:a3 / a2 constant:0.0];
  [a1 addConstraint:v4];
}

- (void)hk_maskCorners:()HKAdditions radius:
{
  uint64_t v6 = a4 & 0xF;
  uint64_t v7 = [a1 layer];
  [v7 setCornerRadius:a2];

  uint64_t v8 = [a1 layer];
  [v8 setMaskedCorners:v6];

  id v9 = [a1 layer];
  [v9 setMasksToBounds:1];
}

- (uint64_t)hk_maskAllCornersWithRadius:()HKAdditions
{
  return objc_msgSend(a1, "hk_maskCorners:radius:", -1);
}

- (double)hk_layoutHeightFittingWidth:()HKAdditions
{
  LODWORD(a4) = 1148846080;
  LODWORD(a5) = 1112014848;
  objc_msgSend(a1, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a2, 0.0, a4, a5);
  return v5;
}

@end