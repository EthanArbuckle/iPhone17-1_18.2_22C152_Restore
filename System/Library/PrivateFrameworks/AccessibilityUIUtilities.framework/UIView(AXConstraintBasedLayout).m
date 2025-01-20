@interface UIView(AXConstraintBasedLayout)
- (id)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout relatedBy:toItem:attribute:multiplier:constant:priority:;
- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asEqualToConstant:;
- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asEqualToConstant:priority:;
- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asEqualToLayoutAttribute:ofView:;
- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asEqualToLayoutAttribute:ofView:withOffset:;
- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asEqualToLayoutAttribute:ofView:withOffset:priority:;
- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asEqualToValueOfView:;
- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asEqualToValueOfView:priority:;
- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asEqualToValueOfView:withOffset:;
- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asEqualToValueOfView:withOffset:priority:;
- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToConstant:;
- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToConstant:priority:;
- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToLayoutAttribute:ofView:withOffset:;
- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToLayoutAttribute:ofView:withOffset:priority:;
- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToValueOfView:;
- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToValueOfView:withOffset:;
- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToValueOfView:withOffset:priority:;
- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToConstant:;
- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToConstant:priority:;
- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToLayoutAttribute:ofView:withOffset:;
- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToLayoutAttribute:ofView:withOffset:priority:;
- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToValueOfView:;
- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToValueOfView:withOffset:;
- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToValueOfView:withOffset:priority:;
- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout relatedBy:toItem:attribute:multiplier:constant:;
- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout relatedBy:toItem:attribute:multiplier:constant:priority:;
- (id)ax_firstCommonAncestorWithView:()AXConstraintBasedLayout;
- (id)ax_pinConstraintsInAllDimensionsToView:()AXConstraintBasedLayout;
- (uint64_t)_ax_depth;
- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asEqualToConstant:;
- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asEqualToConstant:priority:;
- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asEqualToLayoutAttribute:ofView:;
- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asEqualToLayoutAttribute:ofView:withOffset:;
- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asEqualToLayoutAttribute:ofView:withOffset:priority:;
- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asEqualToValueOfView:;
- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asEqualToValueOfView:priority:;
- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asEqualToValueOfView:withOffset:;
- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asEqualToValueOfView:withOffset:priority:;
- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToConstant:;
- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToConstant:priority:;
- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToLayoutAttribute:ofView:withOffset:;
- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToLayoutAttribute:ofView:withOffset:priority:;
- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToValueOfView:;
- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToValueOfView:withOffset:;
- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToValueOfView:withOffset:priority:;
- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToConstant:;
- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToConstant:priority:;
- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToLayoutAttribute:ofView:withOffset:;
- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToLayoutAttribute:ofView:withOffset:priority:;
- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToValueOfView:;
- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToValueOfView:withOffset:;
- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToValueOfView:withOffset:priority:;
- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout relatedBy:toItem:attribute:multiplier:constant:;
- (void)ax_setContentHuggingAndCompressionResistance:()AXConstraintBasedLayout;
@end

@implementation UIView(AXConstraintBasedLayout)

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asEqualToConstant:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asEqualToConstant:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asEqualToConstant:priority:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asEqualToConstant:priority:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asEqualToValueOfView:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asEqualToValueOfView:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asEqualToValueOfView:priority:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asEqualToValueOfView:priority:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asEqualToValueOfView:withOffset:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asEqualToValueOfView:withOffset:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asEqualToValueOfView:withOffset:priority:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asEqualToValueOfView:withOffset:priority:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asEqualToLayoutAttribute:ofView:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofView:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asEqualToLayoutAttribute:ofView:withOffset:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofView:withOffset:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asEqualToLayoutAttribute:ofView:withOffset:priority:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofView:withOffset:priority:");
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asEqualToConstant:
{
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:", a3, 0, 0, 0, 1.0, a4);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asEqualToConstant:priority:
{
  *(float *)&a6 = a5;
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:priority:", a3, 0, 0, 0, 1.0, a4, a6);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asEqualToValueOfView:
{
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asEqualToValueOfView:withOffset:", 0.0);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asEqualToValueOfView:priority:
{
  *(float *)&a4 = a3;
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asEqualToValueOfView:withOffset:priority:", 0.0, a4);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asEqualToValueOfView:withOffset:
{
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofView:withOffset:", a3, a3, a4);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asEqualToValueOfView:withOffset:priority:
{
  *(float *)&a7 = a6;
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:priority:", a3, 0, a4, a3, 1.0, a5, a7);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asEqualToLayoutAttribute:ofView:
{
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofView:withOffset:", 0.0);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asEqualToLayoutAttribute:ofView:withOffset:
{
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:", a3, 0, a5, a4, 1.0, a6);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asEqualToLayoutAttribute:ofView:withOffset:priority:
{
  *(float *)&a8 = a7;
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:priority:", a3, 0, a5, a4, 1.0, a6, a8);
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToConstant:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asLessThanOrEqualToConstant:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToConstant:priority:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asLessThanOrEqualToConstant:priority:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToValueOfView:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asLessThanOrEqualToValueOfView:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToValueOfView:withOffset:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asLessThanOrEqualToValueOfView:withOffset:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToValueOfView:withOffset:priority:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asLessThanOrEqualToValueOfView:withOffset:priority:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToLayoutAttribute:ofView:withOffset:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asLessThanOrEqualToLayoutAttribute:ofView:withOffset:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToLayoutAttribute:ofView:withOffset:priority:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asLessThanOrEqualToLayoutAttribute:ofView:withOffset:priority:");
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToConstant:
{
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:", a3, -1, 0, 0, 1.0, a4);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToConstant:priority:
{
  *(float *)&a6 = a5;
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:priority:", a3, -1, 0, 0, 1.0, a4, a6);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToValueOfView:
{
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asLessThanOrEqualToValueOfView:withOffset:", 0.0);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToValueOfView:withOffset:
{
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:", a3, -1, a4, a3, 1.0, a5);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToValueOfView:withOffset:priority:
{
  *(float *)&a7 = a6;
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:priority:", a3, -1, a4, a3, 1.0, a5, a7);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToLayoutAttribute:ofView:withOffset:
{
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:", a3, -1, a5, a4, 1.0, a6);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asLessThanOrEqualToLayoutAttribute:ofView:withOffset:priority:
{
  *(float *)&a8 = a7;
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:priority:", a3, -1, a5, a4, 1.0, a6, a8);
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToConstant:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asGreaterThanOrEqualToConstant:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToConstant:priority:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asGreaterThanOrEqualToConstant:priority:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToValueOfView:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asGreaterThanOrEqualToValueOfView:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToValueOfView:withOffset:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asGreaterThanOrEqualToValueOfView:withOffset:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToValueOfView:withOffset:priority:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asGreaterThanOrEqualToValueOfView:withOffset:priority:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToLayoutAttribute:ofView:withOffset:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asGreaterThanOrEqualToLayoutAttribute:ofView:withOffset:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToLayoutAttribute:ofView:withOffset:priority:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asGreaterThanOrEqualToLayoutAttribute:ofView:withOffset:priority:");
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToConstant:
{
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:", a3, 1, 0, 0, 1.0, a4);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToConstant:priority:
{
  *(float *)&a6 = a5;
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:priority:", a3, 1, 0, 0, 1.0, a4, a6);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToValueOfView:
{
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asGreaterThanOrEqualToValueOfView:withOffset:", 0.0);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToValueOfView:withOffset:
{
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:", a3, 1, a4, a3, 1.0, a5);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToValueOfView:withOffset:priority:
{
  *(float *)&a7 = a6;
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:priority:", a3, 1, a4, a3, 1.0, a5, a7);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToLayoutAttribute:ofView:withOffset:
{
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:", a3, 1, a5, a4, 1.0, a6);
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout asGreaterThanOrEqualToLayoutAttribute:ofView:withOffset:priority:
{
  *(float *)&a8 = a7;
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:priority:", a3, 1, a5, a4, 1.0, a6, a8);
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout relatedBy:toItem:attribute:multiplier:constant:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:");
}

- (id)ax_constrainLayoutAttribute:()AXConstraintBasedLayout relatedBy:toItem:attribute:multiplier:constant:priority:
{
  return (id)objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:priority:");
}

- (uint64_t)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout relatedBy:toItem:attribute:multiplier:constant:
{
  LODWORD(a5) = 1148846080;
  return objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:relatedBy:toItem:attribute:multiplier:constant:priority:", a3, a4, a5);
}

- (id)ax_addedConstraintForLayoutAttribute:()AXConstraintBasedLayout relatedBy:toItem:attribute:multiplier:constant:priority:
{
  id v16 = a8;
  v17 = [MEMORY[0x1E4F28DC8] constraintWithItem:a1 attribute:a6 relatedBy:a7 toItem:v16 attribute:a9 multiplier:a2 constant:a3];
  *(float *)&double v18 = a4;
  [v17 setPriority:v18];
  if (v17)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = objc_msgSend(a1, "ax_firstCommonAncestorWithView:", v16);
      [v19 addConstraint:v17];
    }
    else
    {
      [a1 addConstraint:v17];
    }
  }

  return v17;
}

- (uint64_t)_ax_depth
{
  id v1 = a1;
  if (!v1) {
    return -1;
  }
  v2 = v1;
  uint64_t v3 = -1;
  do
  {
    uint64_t v4 = [v2 superview];

    ++v3;
    v2 = (void *)v4;
  }
  while (v4);
  return v3;
}

- (id)ax_firstCommonAncestorWithView:()AXConstraintBasedLayout
{
  id v4 = a3;
  id v5 = a1;
  id v6 = v4;
  unint64_t v7 = objc_msgSend(v5, "_ax_depth");
  unint64_t v8 = objc_msgSend(v6, "_ax_depth");
  if (v8 < v7) {
    unint64_t v9 = v8;
  }
  else {
    unint64_t v9 = v7;
  }
  if (v8 < v7) {
    unint64_t v10 = v7;
  }
  else {
    unint64_t v10 = v8;
  }
  if (v8 < v7) {
    v11 = v5;
  }
  else {
    v11 = v6;
  }
  if (v8 < v7) {
    v12 = v6;
  }
  else {
    v12 = v5;
  }
  if (v9 >= v10)
  {
    v13 = v11;
  }
  else
  {
    do
    {
      v13 = [v11 superview];

      --v10;
      v11 = v13;
    }
    while (v9 < v10);
  }
  v14 = 0;
  if (v12 && v13)
  {
    while (v12 != v13)
    {
      v15 = [v12 superview];

      id v16 = [v13 superview];

      v14 = 0;
      if (v15)
      {
        v12 = v15;
        v13 = v16;
        if (v16) {
          continue;
        }
      }
      goto LABEL_25;
    }
    id v16 = v12;
    v15 = v16;
    v14 = v16;
  }
  else
  {
    id v16 = v13;
    v15 = v12;
  }
LABEL_25:

  return v14;
}

- (id)ax_pinConstraintsInAllDimensionsToView:()AXConstraintBasedLayout
{
  id v4 = (void *)MEMORY[0x1E4F1CA48];
  id v5 = a3;
  id v6 = [v4 arrayWithCapacity:4];
  unint64_t v7 = objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofView:", 3, 3, v5);
  [v6 addObject:v7];

  unint64_t v8 = objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofView:", 2, 2, v5);
  [v6 addObject:v8];

  unint64_t v9 = objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofView:", 4, 4, v5);
  [v6 addObject:v9];

  unint64_t v10 = objc_msgSend(a1, "ax_addedConstraintForLayoutAttribute:asEqualToLayoutAttribute:ofView:", 1, 1, v5);

  [v6 addObject:v10];
  return v6;
}

- (void)ax_setContentHuggingAndCompressionResistance:()AXConstraintBasedLayout
{
  unint64_t v8 = result;
  float v9 = *(float *)&AXLayoutPriorityIgnored;
  if (*(float *)&a2 > *(float *)&AXLayoutPriorityIgnored)
  {
    result = objc_msgSend(result, "setContentHuggingPriority:forAxis:", 0);
    float v9 = *(float *)&AXLayoutPriorityIgnored;
  }
  if (a3 > v9)
  {
    *(float *)&a2 = a3;
    result = (void *)[v8 setContentHuggingPriority:1 forAxis:a2];
    float v9 = *(float *)&AXLayoutPriorityIgnored;
  }
  if (a4 > v9)
  {
    *(float *)&a2 = a4;
    result = (void *)[v8 setContentCompressionResistancePriority:0 forAxis:a2];
    float v9 = *(float *)&AXLayoutPriorityIgnored;
  }
  if (a5 > v9)
  {
    *(float *)&a2 = a4;
    return (void *)[v8 setContentCompressionResistancePriority:1 forAxis:a2];
  }
  return result;
}

@end