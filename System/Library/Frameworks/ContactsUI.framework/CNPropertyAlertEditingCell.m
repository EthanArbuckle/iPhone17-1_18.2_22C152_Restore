@interface CNPropertyAlertEditingCell
+ (BOOL)wantsHorizontalLayout;
- (BOOL)allowsCellSelection;
- (double)minCellHeight;
- (id)variableConstraints;
@end

@implementation CNPropertyAlertEditingCell

- (id)variableConstraints
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  v11.receiver = self;
  v11.super_class = (Class)CNPropertyAlertEditingCell;
  v4 = [(CNLabeledCell *)&v11 variableConstraints];
  v5 = [v3 arrayWithArray:v4];

  if ((objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory") & 1) == 0)
  {
    v6 = (void *)MEMORY[0x1E4F28DC8];
    v7 = [(CNPropertySimpleCell *)self labelView];
    v8 = [(CNPropertyAlertEditingCell *)self contentView];
    v9 = [v6 constraintWithItem:v7 attribute:10 relatedBy:0 toItem:v8 attribute:10 multiplier:1.0 constant:0.0];
    [v5 addObject:v9];
  }

  return v5;
}

- (double)minCellHeight
{
  return 44.0;
}

- (BOOL)allowsCellSelection
{
  return 1;
}

+ (BOOL)wantsHorizontalLayout
{
  return objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory") ^ 1;
}

@end