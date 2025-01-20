@interface CNLabeledCell
+ (BOOL)wantsChevron;
+ (BOOL)wantsHorizontalLayout;
+ (BOOL)wantsStandardConstraints;
- (ABText)labelView;
- (ABText)valueView;
- (BOOL)allowsCellSelection;
- (BOOL)labelViewNeedsHuggingContent;
- (BOOL)valueViewNeedsHuggingContent;
- (CNLabeledCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSDictionary)labelTextAttributes;
- (NSDictionary)valueTextAttributes;
- (NSString)labelString;
- (NSString)valueString;
- (UIImageView)chevron;
- (UILabel)standardLabelView;
- (UILabel)standardValueView;
- (UIView)rightMostView;
- (double)chevronWidth;
- (double)minCellHeight;
- (double)valueViewBottomMargin;
- (id)constantConstraints;
- (id)constantConstraintsForHorizontalLayout;
- (id)constantConstraintsForStandardLayout;
- (id)constantConstraintsForVerticalLayout;
- (id)variableConstraints;
- (id)variableConstraintsForHorizontalLayout;
- (id)variableConstraintsForStandardLayout;
- (id)variableConstraintsForVerticalLayout;
- (void)addChevron;
- (void)removeChevron;
- (void)setLabelTextAttributes:(id)a3;
- (void)setLabelViewNeedsHuggingContent:(BOOL)a3;
- (void)setValueTextAttributes:(id)a3;
- (void)setValueViewNeedsHuggingContent:(BOOL)a3;
- (void)tintColorDidChange;
@end

@implementation CNLabeledCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chevron, 0);
  objc_storeStrong((id *)&self->_valueTextAttributes, 0);

  objc_storeStrong((id *)&self->_labelTextAttributes, 0);
}

- (UIImageView)chevron
{
  return self->_chevron;
}

- (BOOL)valueViewNeedsHuggingContent
{
  return self->_valueViewNeedsHuggingContent;
}

- (BOOL)labelViewNeedsHuggingContent
{
  return self->_labelViewNeedsHuggingContent;
}

- (void)tintColorDidChange
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)CNLabeledCell;
  [(CNLabeledCell *)&v6 tintColorDidChange];
  uint64_t v7 = *MEMORY[0x1E4FB0700];
  v3 = +[CNContactStyle currentStyle];
  v4 = [v3 textColor];
  v8[0] = v4;
  v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [self cn_updateDictionaryForKey:@"labelTextAttributes" withChanges:v5];
}

- (NSDictionary)valueTextAttributes
{
  return self->_valueTextAttributes;
}

- (void)setValueTextAttributes:(id)a3
{
  objc_super v6 = (NSDictionary *)a3;
  if (self->_valueTextAttributes != v6)
  {
    objc_storeStrong((id *)&self->_valueTextAttributes, a3);
    v5 = [(CNLabeledCell *)self valueView];
    objc_msgSend(v5, "setAb_textAttributes:", v6);
  }
}

- (NSDictionary)labelTextAttributes
{
  return self->_labelTextAttributes;
}

- (void)setLabelTextAttributes:(id)a3
{
  objc_super v6 = (NSDictionary *)a3;
  if (self->_labelTextAttributes != v6)
  {
    objc_storeStrong((id *)&self->_labelTextAttributes, a3);
    v5 = [(CNLabeledCell *)self labelView];
    objc_msgSend(v5, "setAb_textAttributes:", v6);
  }
}

- (NSString)valueString
{
  return 0;
}

- (NSString)labelString
{
  return 0;
}

- (void)setValueViewNeedsHuggingContent:(BOOL)a3
{
  BOOL v3 = a3;
  self->_valueViewNeedsHuggingContent = a3;
  objc_opt_class();
  id v7 = [(CNLabeledCell *)self valueView];
  if (objc_opt_isKindOfClass()) {
    v5 = v7;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  CNSetLabelNeedsHuggingContent(v6, v3);
}

- (void)setLabelViewNeedsHuggingContent:(BOOL)a3
{
  BOOL v3 = a3;
  self->_labelViewNeedsHuggingContent = a3;
  objc_opt_class();
  id v7 = [(CNLabeledCell *)self labelView];
  if (objc_opt_isKindOfClass()) {
    v5 = v7;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  CNSetLabelNeedsHuggingContent(v6, v3);
}

- (UILabel)standardValueView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1930]);
  v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 setTextAlignment:4];
  LODWORD(v5) = 1148829696;
  [v4 setContentHuggingPriority:1 forAxis:v5];
  [v4 _setWantsUnderlineForAccessibilityButtonShapesEnabled:1];
  objc_msgSend(v4, "setNumberOfLines:", objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory") ^ 1);
  CNSetLabelNeedsHuggingContent(v4, [(CNLabeledCell *)self valueViewNeedsHuggingContent]);

  return (UILabel *)v4;
}

- (UILabel)standardLabelView
{
  id v3 = objc_alloc(MEMORY[0x1E4FB1930]);
  v4 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 setTextAlignment:4];
  objc_msgSend(v4, "setNumberOfLines:", objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory") ^ 1);
  CNSetLabelNeedsHuggingContent(v4, [(CNLabeledCell *)self labelViewNeedsHuggingContent]);

  return (UILabel *)v4;
}

- (UIView)rightMostView
{
  id v3 = [(CNLabeledCell *)self chevron];
  v4 = [v3 superview];

  if (v4)
  {
    double v5 = [(CNLabeledCell *)self chevron];
  }
  else
  {
    id v6 = [(CNLabeledCell *)self valueView];

    if (v6) {
      [(CNLabeledCell *)self valueView];
    }
    else {
    double v5 = [(CNLabeledCell *)self labelView];
    }
  }

  return (UIView *)v5;
}

- (ABText)valueView
{
  return 0;
}

- (ABText)labelView
{
  return 0;
}

- (id)variableConstraintsForHorizontalLayout
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  v13.receiver = self;
  v13.super_class = (Class)CNLabeledCell;
  v4 = [(CNContactCell *)&v13 variableConstraints];
  double v5 = [v3 arrayWithArray:v4];

  id v6 = [(CNLabeledCell *)self chevron];
  id v7 = [v6 superview];

  if (!v7)
  {
    v8 = (void *)MEMORY[0x1E4F28DC8];
    v9 = [(CNLabeledCell *)self rightMostView];
    v10 = [(CNLabeledCell *)self contentView];
    v11 = [v8 constraintWithItem:v9 attribute:6 relatedBy:0 toItem:v10 attribute:18 multiplier:1.0 constant:0.0];
    [v5 addObject:v11];
  }

  return v5;
}

- (id)constantConstraintsForHorizontalLayout
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  v67.receiver = self;
  v67.super_class = (Class)CNLabeledCell;
  v4 = [(CNContactCell *)&v67 constantConstraints];
  double v5 = [v3 arrayWithArray:v4];

  id v6 = (void *)MEMORY[0x1E4F28DC8];
  id v7 = [(CNLabeledCell *)self labelView];
  v8 = [(CNLabeledCell *)self contentView];
  v9 = [v6 constraintWithItem:v7 attribute:5 relatedBy:0 toItem:v8 attribute:17 multiplier:1.0 constant:0.0];
  [v5 addObject:v9];

  v10 = (void *)MEMORY[0x1E4F28DC8];
  v11 = [(CNLabeledCell *)self labelView];
  v12 = [v10 constraintWithItem:v11 attribute:7 relatedBy:1 toItem:0 attribute:0 multiplier:0.0 constant:44.0];
  [v5 addObject:v12];

  objc_super v13 = [(CNLabeledCell *)self valueView];

  if (v13)
  {
    v14 = (void *)MEMORY[0x1E4F28DC8];
    v15 = [(CNLabeledCell *)self valueView];
    v16 = [(CNLabeledCell *)self labelView];
    v17 = [v14 constraintWithItem:v15 attribute:5 relatedBy:0 toItem:v16 attribute:6 multiplier:1.0 constant:16.0];
    [v5 addObject:v17];
  }
  v18 = [(CNLabeledCell *)self chevron];
  v19 = [v18 superview];

  if (v19)
  {
    v20 = (void *)MEMORY[0x1E4F28DC8];
    v21 = [(CNLabeledCell *)self chevron];
    v22 = [(CNLabeledCell *)self contentView];
    v23 = [v20 constraintWithItem:v21 attribute:10 relatedBy:0 toItem:v22 attribute:10 multiplier:1.0 constant:0.0];
    [v5 addObject:v23];

    v24 = (void *)MEMORY[0x1E4F28DC8];
    v25 = [(CNLabeledCell *)self chevron];
    v26 = [(CNLabeledCell *)self valueView];
    v27 = [v24 constraintWithItem:v25 attribute:5 relatedBy:1 toItem:v26 attribute:6 multiplier:1.0 constant:16.0];
    [v5 addObject:v27];

    v28 = (void *)MEMORY[0x1E4F28DC8];
    v29 = [(CNLabeledCell *)self chevron];
    v30 = [(CNLabeledCell *)self contentView];
    v31 = [v28 constraintWithItem:v29 attribute:6 relatedBy:0 toItem:v30 attribute:18 multiplier:1.0 constant:0.0];
    [v5 addObject:v31];
  }
  v32 = [(CNLabeledCell *)self valueView];

  v33 = (void *)MEMORY[0x1E4F28DC8];
  if (v32)
  {
    v34 = [(CNLabeledCell *)self valueView];
    v35 = [(CNLabeledCell *)self contentView];
    v36 = [v33 constraintWithItem:v34 attribute:3 relatedBy:0 toItem:v35 attribute:15 multiplier:1.0 constant:0.0];
    [v5 addObject:v36];

    v37 = [v5 lastObject];
    LODWORD(v38) = 1148813312;
    [v37 setPriority:v38];

    v39 = (void *)MEMORY[0x1E4F28DC8];
    v40 = [(CNLabeledCell *)self contentView];
    v41 = [(CNLabeledCell *)self valueView];
    v42 = [v39 constraintWithItem:v40 attribute:16 relatedBy:0 toItem:v41 attribute:4 multiplier:1.0 constant:0.0];
    [v5 addObject:v42];

    v43 = [v5 lastObject];
    LODWORD(v44) = 1148813312;
    [v43 setPriority:v44];

    v45 = (void *)MEMORY[0x1E4F28DC8];
    v46 = [(CNLabeledCell *)self labelView];
    v47 = [(CNLabeledCell *)self valueView];
    v48 = [v45 constraintWithItem:v46 attribute:11 relatedBy:0 toItem:v47 attribute:11 multiplier:1.0 constant:0.0];
    [v5 addObject:v48];

    v49 = (void *)MEMORY[0x1E4F28DC8];
    [(CNLabeledCell *)self valueView];
  }
  else
  {
    v50 = [(CNLabeledCell *)self labelView];
    v51 = [(CNLabeledCell *)self contentView];
    v52 = [v33 constraintWithItem:v50 attribute:3 relatedBy:0 toItem:v51 attribute:15 multiplier:1.0 constant:0.0];
    [v5 addObject:v52];

    v53 = [v5 lastObject];
    LODWORD(v54) = 1148813312;
    [v53 setPriority:v54];

    v55 = (void *)MEMORY[0x1E4F28DC8];
    v56 = [(CNLabeledCell *)self contentView];
    v57 = [(CNLabeledCell *)self labelView];
    v58 = [v55 constraintWithItem:v56 attribute:16 relatedBy:0 toItem:v57 attribute:4 multiplier:1.0 constant:0.0];
    [v5 addObject:v58];

    v59 = [v5 lastObject];
    LODWORD(v60) = 1148813312;
    [v59 setPriority:v60];

    v49 = (void *)MEMORY[0x1E4F28DC8];
    [(CNLabeledCell *)self labelView];
  v61 = };
  v62 = [(CNLabeledCell *)self contentView];
  v63 = [v49 constraintWithItem:v61 attribute:10 relatedBy:0 toItem:v62 attribute:10 multiplier:1.0 constant:0.0];
  [v5 addObject:v63];

  v64 = [v5 lastObject];
  LODWORD(v65) = 1148796928;
  [v64 setPriority:v65];

  return v5;
}

- (id)variableConstraintsForVerticalLayout
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  v20.receiver = self;
  v20.super_class = (Class)CNLabeledCell;
  v4 = [(CNContactCell *)&v20 variableConstraints];
  double v5 = [v3 arrayWithArray:v4];

  int v6 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
  id v7 = [(CNLabeledCell *)self chevron];
  v8 = [v7 superview];

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E4F28DC8];
    v10 = [(CNLabeledCell *)self chevron];
    if (v6)
    {
      v11 = [(CNLabeledCell *)self labelView];
      v12 = [v9 constraintWithItem:v10 attribute:10 relatedBy:0 toItem:v11 attribute:10 multiplier:1.0 constant:0.0];
      [v5 addObject:v12];

      objc_super v13 = (void *)MEMORY[0x1E4F28DC8];
      v14 = [(CNLabeledCell *)self chevron];
      [(CNLabeledCell *)self labelView];
    }
    else
    {
      v15 = [(CNLabeledCell *)self contentView];
      v16 = [v9 constraintWithItem:v10 attribute:10 relatedBy:0 toItem:v15 attribute:10 multiplier:1.0 constant:0.0];
      [v5 addObject:v16];

      objc_super v13 = (void *)MEMORY[0x1E4F28DC8];
      v14 = [(CNLabeledCell *)self chevron];
      [(CNLabeledCell *)self valueView];
    v17 = };
    v18 = [v13 constraintWithItem:v14 attribute:5 relatedBy:0 toItem:v17 attribute:6 multiplier:1.0 constant:16.0];
    [v5 addObject:v18];
  }

  return v5;
}

- (id)constantConstraintsForVerticalLayout
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  v58.receiver = self;
  v58.super_class = (Class)CNLabeledCell;
  v4 = [(CNContactCell *)&v58 constantConstraints];
  double v5 = [v3 arrayWithArray:v4];

  int v6 = (void *)MEMORY[0x1E4F28DC8];
  id v7 = [(CNLabeledCell *)self labelView];
  v8 = [(CNLabeledCell *)self contentView];
  v9 = [v6 constraintWithItem:v7 attribute:5 relatedBy:0 toItem:v8 attribute:17 multiplier:1.0 constant:0.0];
  [v5 addObject:v9];

  v10 = (void *)MEMORY[0x1E4F28DC8];
  v11 = [(CNLabeledCell *)self labelView];
  v12 = [(CNLabeledCell *)self contentView];
  objc_super v13 = [v10 constraintWithItem:v11 attribute:6 relatedBy:-1 toItem:v12 attribute:18 multiplier:1.0 constant:0.0];
  [v5 addObject:v13];

  v14 = (void *)MEMORY[0x1E4F28DC8];
  v15 = [(CNLabeledCell *)self labelView];
  v16 = [(CNLabeledCell *)self valueView];
  v17 = [v14 constraintWithItem:v15 attribute:6 relatedBy:0 toItem:v16 attribute:6 multiplier:1.0 constant:0.0];
  [v5 addObject:v17];

  v18 = [v5 lastObject];
  LODWORD(v19) = 1144750080;
  [v18 setPriority:v19];

  objc_super v20 = (void *)MEMORY[0x1E4F28DC8];
  v21 = [(CNLabeledCell *)self valueView];
  v22 = [(CNLabeledCell *)self labelView];
  v23 = [v20 constraintWithItem:v21 attribute:5 relatedBy:0 toItem:v22 attribute:5 multiplier:1.0 constant:0.0];
  [v5 addObject:v23];

  v24 = [(CNLabeledCell *)self rightMostView];
  v25 = [(CNLabeledCell *)self valueView];

  if (v24 == v25)
  {
    v26 = (void *)MEMORY[0x1E4F28DC8];
    v27 = [(CNLabeledCell *)self valueView];
    v28 = [(CNLabeledCell *)self contentView];
    v29 = [v26 constraintWithItem:v27 attribute:6 relatedBy:0 toItem:v28 attribute:18 multiplier:1.0 constant:0.0];
    [v5 addObject:v29];

    v30 = [v5 lastObject];
    LODWORD(v31) = 1144750080;
    [v30 setPriority:v31];
  }
  v32 = (void *)MEMORY[0x1E4F28DC8];
  v33 = [(CNLabeledCell *)self rightMostView];
  v34 = [(CNLabeledCell *)self contentView];
  v35 = [v32 constraintWithItem:v33 attribute:6 relatedBy:0 toItem:v34 attribute:18 multiplier:1.0 constant:0.0];
  [v5 addObject:v35];

  v36 = [v5 lastObject];
  LODWORD(v37) = 1144750080;
  [v36 setPriority:v37];

  double v38 = (void *)MEMORY[0x1E4F28DC8];
  v39 = [(CNLabeledCell *)self labelView];
  v40 = [(CNLabeledCell *)self contentView];
  v41 = [v38 constraintWithItem:v39 attribute:3 relatedBy:0 toItem:v40 attribute:15 multiplier:1.0 constant:0.0];
  [v5 addObject:v41];

  v42 = [v5 lastObject];
  LODWORD(v43) = 1148829696;
  [v42 setPriority:v43];

  double v44 = (void *)MEMORY[0x1E4F28DC8];
  v45 = [(CNLabeledCell *)self valueView];
  v46 = [(CNLabeledCell *)self labelView];
  v47 = [v44 constraintWithItem:v45 attribute:3 relatedBy:0 toItem:v46 attribute:4 multiplier:1.0 constant:4.0];
  [v5 addObject:v47];

  v48 = [v5 lastObject];
  LODWORD(v49) = 1148846080;
  [v48 setPriority:v49];

  v50 = (void *)MEMORY[0x1E4F28DC8];
  v51 = [(CNLabeledCell *)self contentView];
  v52 = [(CNLabeledCell *)self valueView];
  [(CNLabeledCell *)self valueViewBottomMargin];
  double v54 = [v50 constraintWithItem:v51 attribute:16 relatedBy:0 toItem:v52 attribute:4 multiplier:1.0 constant:v53];
  [v5 addObject:v54];

  v55 = [v5 lastObject];
  LODWORD(v56) = 1132003328;
  [v55 setPriority:v56];

  return v5;
}

- (id)variableConstraintsForStandardLayout
{
  if (([(id)objc_opt_class() wantsHorizontalLayout] & 1) != 0
    || ([(CNLabeledCell *)self valueView],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    v4 = [(CNLabeledCell *)self variableConstraintsForHorizontalLayout];
  }
  else
  {
    v4 = [(CNLabeledCell *)self variableConstraintsForVerticalLayout];
  }

  return v4;
}

- (id)constantConstraintsForStandardLayout
{
  if (([(id)objc_opt_class() wantsHorizontalLayout] & 1) != 0
    || ([(CNLabeledCell *)self valueView],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    v4 = [(CNLabeledCell *)self constantConstraintsForHorizontalLayout];
  }
  else
  {
    v4 = [(CNLabeledCell *)self constantConstraintsForVerticalLayout];
  }

  return v4;
}

- (id)variableConstraints
{
  if ([(id)objc_opt_class() wantsStandardConstraints])
  {
    v8.receiver = self;
    v8.super_class = (Class)CNLabeledCell;
    id v3 = [(CNContactCell *)&v8 variableConstraints];
    v4 = [(CNLabeledCell *)self variableConstraintsForStandardLayout];
    double v5 = [v3 arrayByAddingObjectsFromArray:v4];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CNLabeledCell;
    double v5 = [(CNContactCell *)&v7 variableConstraints];
  }

  return v5;
}

- (id)constantConstraints
{
  if ([(id)objc_opt_class() wantsStandardConstraints])
  {
    v8.receiver = self;
    v8.super_class = (Class)CNLabeledCell;
    id v3 = [(CNContactCell *)&v8 constantConstraints];
    v4 = [(CNLabeledCell *)self constantConstraintsForStandardLayout];
    double v5 = [v3 arrayByAddingObjectsFromArray:v4];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)CNLabeledCell;
    double v5 = [(CNContactCell *)&v7 constantConstraints];
  }

  return v5;
}

- (double)valueViewBottomMargin
{
  return 0.0;
}

- (double)chevronWidth
{
  return 16.0;
}

- (double)minCellHeight
{
  int v2 = [(id)objc_opt_class() wantsHorizontalLayout];
  double result = 60.0;
  if (v2) {
    return 44.0;
  }
  return result;
}

- (void)removeChevron
{
  id v3 = [(CNLabeledCell *)self chevron];

  if (v3)
  {
    v4 = [(CNLabeledCell *)self chevron];
    double v5 = [v4 superview];

    if (v5)
    {
      int v6 = [(CNLabeledCell *)self chevron];
      [v6 removeFromSuperview];

      [(CNLabeledCell *)self needsUpdateConstraints];
    }
  }
}

- (void)addChevron
{
  id v3 = [(CNLabeledCell *)self chevron];

  if (v3)
  {
    v4 = [(CNLabeledCell *)self chevron];
    double v5 = [v4 superview];

    if (!v5)
    {
      int v6 = [(CNLabeledCell *)self contentView];
      objc_super v7 = [(CNLabeledCell *)self chevron];
      [v6 addSubview:v7];

      [(CNLabeledCell *)self needsUpdateConstraints];
    }
  }
}

- (CNLabeledCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v16.receiver = self;
  v16.super_class = (Class)CNLabeledCell;
  v4 = [(CNContactCell *)&v16 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v4->_labelViewNeedsHuggingContent = [(id)objc_opt_class() wantsHorizontalLayout];
    v4->_valueViewNeedsHuggingContent = [(id)objc_opt_class() wantsHorizontalLayout];
    double v5 = [(CNLabeledCell *)v4 contentView];
    int v6 = [(CNLabeledCell *)v4 labelView];
    [v5 addSubview:v6];

    objc_super v7 = [(CNLabeledCell *)v4 valueView];
    if (v7)
    {
      objc_super v8 = [(CNLabeledCell *)v4 contentView];
      v9 = [(CNLabeledCell *)v4 valueView];
      [v8 addSubview:v9];
    }
    if ([(id)objc_opt_class() wantsChevron])
    {
      v10 = objc_msgSend(MEMORY[0x1E4FB1818], "cnui_symbolImageForContactCardChevron");
      uint64_t v11 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v10];
      chevron = v4->_chevron;
      v4->_chevron = (UIImageView *)v11;

      [(UIImageView *)v4->_chevron setTranslatesAutoresizingMaskIntoConstraints:0];
      LODWORD(v13) = 1148846080;
      [(UIImageView *)v4->_chevron setContentHuggingPriority:0 forAxis:v13];
      LODWORD(v14) = 1148846080;
      [(UIImageView *)v4->_chevron setContentCompressionResistancePriority:0 forAxis:v14];
      [(CNLabeledCell *)v4 addChevron];
    }
  }
  return v4;
}

- (BOOL)allowsCellSelection
{
  return 1;
}

+ (BOOL)wantsHorizontalLayout
{
  return 0;
}

+ (BOOL)wantsStandardConstraints
{
  return 1;
}

+ (BOOL)wantsChevron
{
  return 0;
}

@end