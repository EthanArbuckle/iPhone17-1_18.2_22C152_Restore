@interface NSLayoutConstraint(GKAdditions)
+ (id)_gkConstraintWithItem:()GKAdditions attribute:relatedBy:toItem:attribute:multiplier:leading:fontTextStyle:;
+ (id)_gkConstraintsForView:()GKAdditions centeredXInView:enforceMargin:;
+ (id)_gkConstraintsForView:()GKAdditions withinView:insets:;
+ (id)_gkConstraintsForViews:()GKAdditions alignedByAttribute:;
+ (id)_gkConstraintsForViews:()GKAdditions contiguouslyLaidOutVertically:overlap:withinView:insets:applyOrthogonalConstraints:;
+ (uint64_t)_gkConstraintForView:()GKAdditions baselineAlignedUnderView:offsetBy:;
+ (uint64_t)_gkConstraintForView:()GKAdditions centeredXInView:;
+ (uint64_t)_gkConstraintForView:()GKAdditions centeredYInView:;
+ (uint64_t)_gkConstraintForView:()GKAdditions equalsAttribute:ofView:;
+ (uint64_t)_gkConstraintForView:()GKAdditions withConstantHeight:;
+ (uint64_t)_gkConstraintForView:()GKAdditions withConstantWidth:;
+ (uint64_t)_gkConstraintForView:()GKAdditions withHeightDerivedFromView:insetBy:;
+ (uint64_t)_gkConstraintForView:()GKAdditions withWidthDerivedFromView:insetBy:;
+ (uint64_t)_gkConstraintsForViews:()GKAdditions contiguouslyLaidOutVertically:overlap:withinView:insets:;
+ (uint64_t)_gkInstallEdgeConstraintsForView:()GKAdditions containedWithinParentView:;
+ (void)_gkInstallEdgeConstraintsForLayoutGuide:()GKAdditions containedWithinParentView:;
+ (void)_gkInstallEdgeConstraintsForView:()GKAdditions containedWithinParentView:edgeInsets:;
+ (void)_gkInstallEdgeConstraintsForView:()GKAdditions containedWithinParentView:margin:;
@end

@implementation NSLayoutConstraint(GKAdditions)

+ (id)_gkConstraintWithItem:()GKAdditions attribute:relatedBy:toItem:attribute:multiplier:leading:fontTextStyle:
{
  v16 = (void *)MEMORY[0x1E4F28DC8];
  id v17 = a10;
  v18 = [v16 constraintWithItem:a5 attribute:a6 relatedBy:a7 toItem:a8 attribute:a9 multiplier:1.0 constant:0.0];
  v19 = +[GKConstraintUpdateController sharedController];
  [v19 registerConstraint:v18 leading:v17 forFontTextStyle:a2];

  return v18;
}

+ (uint64_t)_gkConstraintForView:()GKAdditions equalsAttribute:ofView:
{
  return [MEMORY[0x1E4F28DC8] constraintWithItem:a3 attribute:a4 relatedBy:0 toItem:a5 attribute:a4 multiplier:1.0 constant:0.0];
}

+ (uint64_t)_gkConstraintForView:()GKAdditions centeredYInView:
{
  return [MEMORY[0x1E4F28DC8] constraintWithItem:a3 attribute:10 relatedBy:0 toItem:a4 attribute:10 multiplier:1.0 constant:0.0];
}

+ (uint64_t)_gkConstraintForView:()GKAdditions centeredXInView:
{
  return [MEMORY[0x1E4F28DC8] constraintWithItem:a3 attribute:9 relatedBy:0 toItem:a4 attribute:9 multiplier:1.0 constant:0.0];
}

+ (id)_gkConstraintsForView:()GKAdditions centeredXInView:enforceMargin:
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v7 = (void *)MEMORY[0x1E4F28DC8];
  id v8 = a5;
  id v9 = a4;
  v10 = [v7 constraintWithItem:v9 attribute:9 relatedBy:0 toItem:v8 attribute:9 multiplier:1.0 constant:0.0];
  v11 = [MEMORY[0x1E4F28DC8] constraintWithItem:v9 attribute:1 relatedBy:1 toItem:v8 attribute:1 multiplier:1.0 constant:a1];
  v12 = [MEMORY[0x1E4F28DC8] constraintWithItem:v9 attribute:2 relatedBy:-1 toItem:v8 attribute:2 multiplier:1.0 constant:-a1];

  v15[0] = v10;
  v15[1] = v11;
  v15[2] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:3];

  return v13;
}

+ (uint64_t)_gkConstraintForView:()GKAdditions withConstantWidth:
{
  return [MEMORY[0x1E4F28DC8] constraintWithItem:a4 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:a1];
}

+ (uint64_t)_gkConstraintForView:()GKAdditions withConstantHeight:
{
  return [MEMORY[0x1E4F28DC8] constraintWithItem:a4 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:0.0 constant:a1];
}

+ (uint64_t)_gkConstraintForView:()GKAdditions baselineAlignedUnderView:offsetBy:
{
  return [MEMORY[0x1E4F28DC8] constraintWithItem:a4 attribute:11 relatedBy:0 toItem:a5 attribute:11 multiplier:1.0 constant:a1];
}

+ (uint64_t)_gkConstraintForView:()GKAdditions withWidthDerivedFromView:insetBy:
{
  return [MEMORY[0x1E4F28DC8] constraintWithItem:a4 attribute:7 relatedBy:0 toItem:a5 attribute:7 multiplier:1.0 constant:-a1];
}

+ (uint64_t)_gkConstraintForView:()GKAdditions withHeightDerivedFromView:insetBy:
{
  return [MEMORY[0x1E4F28DC8] constraintWithItem:a4 attribute:8 relatedBy:0 toItem:a5 attribute:8 multiplier:1.0 constant:-a1];
}

+ (id)_gkConstraintsForView:()GKAdditions withinView:insets:
{
  v22[4] = *MEMORY[0x1E4F143B8];
  v13 = (void *)MEMORY[0x1E4F28DC8];
  id v14 = a8;
  id v15 = a7;
  v16 = [v13 constraintWithItem:v14 attribute:1 relatedBy:0 toItem:v15 attribute:1 multiplier:1.0 constant:a2];
  id v17 = [MEMORY[0x1E4F28DC8] constraintWithItem:v14 attribute:2 relatedBy:0 toItem:v15 attribute:2 multiplier:1.0 constant:-a4];
  v18 = [MEMORY[0x1E4F28DC8] constraintWithItem:v14 attribute:3 relatedBy:0 toItem:v15 attribute:3 multiplier:1.0 constant:a1];
  v19 = [MEMORY[0x1E4F28DC8] constraintWithItem:v14 attribute:4 relatedBy:0 toItem:v15 attribute:4 multiplier:1.0 constant:-a3];

  v22[0] = v18;
  v22[1] = v16;
  v22[2] = v19;
  v22[3] = v17;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];

  return v20;
}

+ (uint64_t)_gkInstallEdgeConstraintsForView:()GKAdditions containedWithinParentView:
{
  return objc_msgSend(a1, "_gkInstallEdgeConstraintsForView:containedWithinParentView:margin:", 0.0);
}

+ (void)_gkInstallEdgeConstraintsForView:()GKAdditions containedWithinParentView:margin:
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [v8 leadingAnchor];
  v10 = [v7 leadingAnchor];
  v11 = [v9 constraintEqualToAnchor:v10 constant:a1];
  [v11 setActive:1];

  v12 = [v8 trailingAnchor];
  v13 = [v7 trailingAnchor];
  id v14 = [v12 constraintEqualToAnchor:v13 constant:a1];
  [v14 setActive:1];

  id v15 = [v8 topAnchor];
  v16 = [v7 topAnchor];
  id v17 = [v15 constraintEqualToAnchor:v16 constant:a1];
  [v17 setActive:1];

  id v20 = [v8 bottomAnchor];

  v18 = [v7 bottomAnchor];

  v19 = [v20 constraintEqualToAnchor:v18 constant:a1];
  [v19 setActive:1];
}

+ (void)_gkInstallEdgeConstraintsForView:()GKAdditions containedWithinParentView:edgeInsets:
{
  id v13 = a8;
  id v14 = a7;
  id v15 = [v14 leadingAnchor];
  v16 = [v13 leadingAnchor];
  id v17 = [v15 constraintEqualToAnchor:v16 constant:a2];
  [v17 setActive:1];

  v18 = [v14 trailingAnchor];
  v19 = [v13 trailingAnchor];
  id v20 = [v18 constraintEqualToAnchor:v19 constant:a4];
  [v20 setActive:1];

  v21 = [v14 topAnchor];
  v22 = [v13 topAnchor];
  v23 = [v21 constraintEqualToAnchor:v22 constant:a1];
  [v23 setActive:1];

  id v26 = [v14 bottomAnchor];

  v24 = [v13 bottomAnchor];

  v25 = [v26 constraintEqualToAnchor:v24 constant:a3];
  [v25 setActive:1];
}

+ (void)_gkInstallEdgeConstraintsForLayoutGuide:()GKAdditions containedWithinParentView:
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v6 leadingAnchor];
  id v8 = [v5 leadingAnchor];
  id v9 = [v7 constraintEqualToAnchor:v8];
  [v9 setActive:1];

  v10 = [v6 trailingAnchor];
  v11 = [v5 trailingAnchor];
  v12 = [v10 constraintEqualToAnchor:v11];
  [v12 setActive:1];

  id v13 = [v6 topAnchor];
  id v14 = [v5 topAnchor];
  id v15 = [v13 constraintEqualToAnchor:v14];
  [v15 setActive:1];

  id v18 = [v6 bottomAnchor];

  v16 = [v5 bottomAnchor];

  id v17 = [v18 constraintEqualToAnchor:v16];
  [v17 setActive:1];
}

+ (id)_gkConstraintsForViews:()GKAdditions alignedByAttribute:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    id v10 = 0;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      id v13 = v10;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v7);
        }
        id v14 = *(void **)(*((void *)&v17 + 1) + 8 * v12);
        if (v13)
        {
          id v15 = objc_msgSend(MEMORY[0x1E4F28DC8], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", *(void *)(*((void *)&v17 + 1) + 8 * v12), a4, 0, v13, a4, 1.0, 0.0, (void)v17);
          [v6 addObject:v15];
        }
        id v10 = v14;

        ++v12;
        id v13 = v10;
      }
      while (v9 != v12);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (uint64_t)_gkConstraintsForViews:()GKAdditions contiguouslyLaidOutVertically:overlap:withinView:insets:
{
  return objc_msgSend(a1, "_gkConstraintsForViews:contiguouslyLaidOutVertically:overlap:withinView:insets:applyOrthogonalConstraints:", a3, a4, a5, 1);
}

+ (id)_gkConstraintsForViews:()GKAdditions contiguouslyLaidOutVertically:overlap:withinView:insets:applyOrthogonalConstraints:
{
  id v19 = a8;
  id v20 = a10;
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy__11;
  v49[4] = __Block_byref_object_dispose__11;
  id v50 = 0;
  v21 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v19, "count"));
  if ([v19 count])
  {
    v36 = [v19 objectAtIndex:0];
    char v35 = a11;
    uint64_t v22 = [v19 lastObject];
    if (a9) {
      uint64_t v23 = 3;
    }
    else {
      uint64_t v23 = 1;
    }
    if (a9) {
      uint64_t v24 = 4;
    }
    else {
      uint64_t v24 = 2;
    }
    if (a9) {
      uint64_t v25 = 1;
    }
    else {
      uint64_t v25 = 3;
    }
    if (a9) {
      uint64_t v26 = 2;
    }
    else {
      uint64_t v26 = 4;
    }
    if (a9) {
      double v27 = a2;
    }
    else {
      double v27 = a3;
    }
    if (a9) {
      double v28 = a4;
    }
    else {
      double v28 = a5;
    }
    if (!a9)
    {
      a3 = a2;
      a5 = a4;
    }
    v29 = [MEMORY[0x1E4F28DC8] constraintWithItem:v36 attribute:v23 relatedBy:0 toItem:v20 attribute:v23 multiplier:1.0 constant:v27];
    [v21 addObject:v29];
    v30 = [MEMORY[0x1E4F28DC8] constraintWithItem:v22 attribute:v24 relatedBy:0 toItem:v20 attribute:v24 multiplier:1.0 constant:-v28];
    [v21 addObject:v30];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __141__NSLayoutConstraint_GKAdditions___gkConstraintsForViews_contiguouslyLaidOutVertically_overlap_withinView_insets_applyOrthogonalConstraints___block_invoke;
    v37[3] = &unk_1E5F662F8;
    v40 = v49;
    uint64_t v41 = v23;
    uint64_t v42 = v24;
    double v43 = a1;
    id v31 = v21;
    char v48 = v35;
    id v38 = v31;
    uint64_t v44 = v25;
    id v39 = v20;
    double v45 = a3;
    uint64_t v46 = v26;
    double v47 = a5;
    [v19 enumerateObjectsUsingBlock:v37];
    v32 = v39;
    id v33 = v31;
  }
  _Block_object_dispose(v49, 8);

  return v21;
}

@end