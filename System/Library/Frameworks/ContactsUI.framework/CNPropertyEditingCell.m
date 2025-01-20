@interface CNPropertyEditingCell
+ (BOOL)wantsChevron;
+ (BOOL)wantsStandardConstraints;
- (CNPropertyEditingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (CNRepeatingGradientSeparatorView)vseparator;
- (UIButton)labelButton;
- (double)effectiveLabelWidth;
- (double)leftValueMargin;
- (double)minCellHeight;
- (id)constantConstraints;
- (id)labelView;
- (id)valueString;
- (id)variableConstraints;
- (void)dealloc;
- (void)labelButtonClicked:(id)a3;
- (void)picker:(id)a3 didDeleteItem:(id)a4;
- (void)picker:(id)a3 didPickItem:(id)a4;
- (void)pickerDidCancel:(id)a3;
- (void)regainFocus;
- (void)setValueTextAttributes:(id)a3;
- (void)setVseparator:(id)a3;
- (void)setVseparatorHidden:(BOOL)a3;
- (void)updateWithPropertyItem:(id)a3;
@end

@implementation CNPropertyEditingCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vseparator, 0);

  objc_storeStrong((id *)&self->_labelButton, 0);
}

- (void)setVseparator:(id)a3
{
}

- (CNRepeatingGradientSeparatorView)vseparator
{
  return self->_vseparator;
}

- (UIButton)labelButton
{
  return self->_labelButton;
}

- (void)regainFocus
{
  id v2 = [(CNLabeledCell *)self valueView];
  [v2 becomeFirstResponder];
}

- (void)picker:(id)a3 didDeleteItem:(id)a4
{
  id v5 = a4;
  id v8 = [(CNPropertyCell *)self delegate];
  v6 = [(CNPropertyCell *)self propertyItem];
  v7 = [v6 group];
  [v8 propertyCell:self didDeleteLabel:v5 forGroup:v7];
}

- (void)picker:(id)a3 didPickItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CNPropertyCell *)self delegate];
  v9 = [(CNPropertyCell *)self propertyItem];
  [v8 propertyCell:self didUpdateItem:v9 withNewLabel:v6];

  v10 = [(CNPropertyCell *)self presentingDelegate];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __44__CNPropertyEditingCell_picker_didPickItem___block_invoke;
  v11[3] = &unk_1E549B488;
  v11[4] = self;
  [v10 sender:self dismissViewController:v7 completionHandler:v11];
}

uint64_t __44__CNPropertyEditingCell_picker_didPickItem___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) regainFocus];
}

- (void)pickerDidCancel:(id)a3
{
  id v4 = a3;
  id v5 = [(CNPropertyCell *)self presentingDelegate];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__CNPropertyEditingCell_pickerDidCancel___block_invoke;
  v6[3] = &unk_1E549B488;
  v6[4] = self;
  [v5 sender:self dismissViewController:v4 completionHandler:v6];
}

uint64_t __41__CNPropertyEditingCell_pickerDidCancel___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) regainFocus];
}

- (id)variableConstraints
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  v49.receiver = self;
  v49.super_class = (Class)CNPropertyEditingCell;
  id v4 = [(CNLabeledCell *)&v49 variableConstraints];
  id v5 = [v3 arrayWithArray:v4];

  LODWORD(v4) = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
  id v6 = (void *)MEMORY[0x1E4F28DC8];
  id v7 = [(CNPropertyEditingCell *)self labelButton];
  [(CNPropertyEditingCell *)self effectiveLabelWidth];
  v9 = [v6 constraintWithItem:v7 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v8];
  [v5 addObject:v9];

  v10 = [v5 lastObject];
  LODWORD(v11) = 1148846080;
  [v10 setPriority:v11];

  v12 = (void *)MEMORY[0x1E4F28DC8];
  if (v4)
  {
    v13 = [(CNLabeledCell *)self valueView];
    v14 = [(CNPropertyEditingCell *)self contentView];
    v15 = [v12 constraintWithItem:v13 attribute:5 relatedBy:0 toItem:v14 attribute:17 multiplier:1.0 constant:0.0];
    [v5 addObject:v15];

    v16 = (void *)MEMORY[0x1E4F28DC8];
    v17 = [(CNPropertyEditingCell *)self labelButton];
    v18 = [(CNPropertyEditingCell *)self contentView];
    v19 = [v16 constraintWithItem:v17 attribute:3 relatedBy:0 toItem:v18 attribute:15 multiplier:1.0 constant:0.0];
    [v5 addObject:v19];

    if ([(id)objc_opt_class() wantsChevron])
    {
      v20 = (void *)MEMORY[0x1E4F28DC8];
      v21 = [(CNLabeledCell *)self chevron];
      v22 = [(CNPropertyEditingCell *)self labelButton];
      v23 = [v20 constraintWithItem:v21 attribute:10 relatedBy:0 toItem:v22 attribute:10 multiplier:1.0 constant:0.0];
      [v5 addObject:v23];
    }
    v24 = [(CNPropertyEditingCell *)self labelButton];
    v25 = [v24 titleLabel];
    [(CNPropertyCell *)self labelWidth];
    objc_msgSend(v25, "setPreferredMaxLayoutWidth:");

    v26 = [(CNPropertyEditingCell *)self labelButton];
    v27 = [v26 titleLabel];
    LODWORD(v28) = 1148846080;
    [v27 setContentCompressionResistancePriority:1 forAxis:v28];
  }
  else
  {
    v29 = [(CNPropertyEditingCell *)self vseparator];
    v30 = [(CNPropertyEditingCell *)self labelButton];
    v31 = [v12 constraintWithItem:v29 attribute:5 relatedBy:0 toItem:v30 attribute:6 multiplier:1.0 constant:8.0];
    [v5 addObject:v31];

    v32 = (void *)MEMORY[0x1E4F28DC8];
    v33 = [(CNLabeledCell *)self valueView];
    v34 = [(CNPropertyEditingCell *)self vseparator];
    [(CNPropertyEditingCell *)self leftValueMargin];
    v36 = [v32 constraintWithItem:v33 attribute:5 relatedBy:0 toItem:v34 attribute:6 multiplier:1.0 constant:v35];
    [v5 addObject:v36];

    if ([(id)objc_opt_class() wantsChevron])
    {
      v37 = (void *)MEMORY[0x1E4F28DC8];
      v38 = [(CNLabeledCell *)self chevron];
      v39 = [(CNPropertyEditingCell *)self contentView];
      v40 = [v37 constraintWithItem:v38 attribute:10 relatedBy:0 toItem:v39 attribute:10 multiplier:1.0 constant:0.0];
      [v5 addObject:v40];
    }
    v41 = (void *)MEMORY[0x1E4F28DC8];
    v42 = _NSDictionaryOfVariableBindings(&cfstr_Labelbutton.isa, self->_labelButton, 0);
    v43 = [v41 constraintsWithVisualFormat:@"V:|[_labelButton]|" options:0 metrics:0 views:v42];
    [v5 addObjectsFromArray:v43];

    v44 = (void *)MEMORY[0x1E4F28DC8];
    v45 = _NSDictionaryOfVariableBindings(&cfstr_Vseparator.isa, self->_vseparator, 0);
    v46 = [v44 constraintsWithVisualFormat:@"V:|[_vseparator]|" options:0 metrics:0 views:v45];
    [v5 addObjectsFromArray:v46];

    v26 = [(CNLabeledCell *)self valueView];
    LODWORD(v47) = 1144733696;
    [v26 setContentCompressionResistancePriority:0 forAxis:v47];
  }

  return v5;
}

- (id)constantConstraints
{
  v3 = (void *)MEMORY[0x1E4F1CA48];
  v21.receiver = self;
  v21.super_class = (Class)CNPropertyEditingCell;
  id v4 = [(CNLabeledCell *)&v21 constantConstraints];
  id v5 = [v3 arrayWithArray:v4];

  id v6 = (void *)MEMORY[0x1E4F28DC8];
  id v7 = [(CNPropertyEditingCell *)self labelButton];
  double v8 = [(CNPropertyEditingCell *)self contentView];
  v9 = [v6 constraintWithItem:v7 attribute:5 relatedBy:0 toItem:v8 attribute:17 multiplier:1.0 constant:0.0];
  [v5 addObject:v9];

  v10 = (void *)MEMORY[0x1E4F28DC8];
  double v11 = [(CNLabeledCell *)self valueView];
  v12 = [(CNPropertyEditingCell *)self contentView];
  v13 = [v10 constraintWithItem:v11 attribute:6 relatedBy:0 toItem:v12 attribute:18 multiplier:1.0 constant:0.0];
  [v5 addObject:v13];

  v14 = [v5 lastObject];
  LODWORD(v15) = 1148846080;
  [v14 setPriority:v15];

  if ([(id)objc_opt_class() wantsChevron])
  {
    v16 = (void *)MEMORY[0x1E4F28DC8];
    v17 = [(CNLabeledCell *)self chevron];
    v18 = [(CNPropertyEditingCell *)self labelView];
    v19 = [v16 constraintWithItem:v17 attribute:6 relatedBy:0 toItem:v18 attribute:6 multiplier:1.0 constant:0.0];
    [v5 addObject:v19];
  }

  return v5;
}

- (void)setVseparatorHidden:(BOOL)a3
{
}

- (double)effectiveLabelWidth
{
  [(CNPropertyCell *)self labelWidth];
  double v4 = v3;
  [(UIButton *)self->_labelButton titleEdgeInsets];
  double v6 = v4 + v5;
  [(UIButton *)self->_labelButton titleEdgeInsets];
  return v6 + v7;
}

- (double)minCellHeight
{
  return 44.0;
}

- (double)leftValueMargin
{
  int v2 = objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory");
  double result = 16.0;
  if (v2) {
    return 0.0;
  }
  return result;
}

- (id)valueString
{
  int v2 = [(CNPropertyCell *)self propertyItem];
  double v3 = [v2 editingStringValue];

  return v3;
}

- (void)setValueTextAttributes:(id)a3
{
  id v4 = a3;
  double v5 = [(CNPropertyCell *)self propertyItem];
  int v6 = [v5 isReadonly];

  if (v6)
  {
    double v7 = (void *)[v4 mutableCopy];
    double v8 = +[CNUIColorRepository contactStyleDefaultReadOnlyTextColor];
    [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4FB0700]];

    v15.receiver = self;
    v15.super_class = (Class)CNPropertyEditingCell;
    [(CNLabeledCell *)&v15 setValueTextAttributes:v7];
  }
  else
  {
    v9 = [(CNPropertyCell *)self propertyItem];
    int v10 = [v9 showValueWithLabelStyle];

    if (!v10)
    {
      v13.receiver = self;
      v13.super_class = (Class)CNPropertyEditingCell;
      [(CNLabeledCell *)&v13 setValueTextAttributes:v4];
      goto LABEL_7;
    }
    double v7 = (void *)[v4 mutableCopy];
    double v11 = +[CNContactStyle currentStyle];
    v12 = [v11 textColor];
    [v7 setObject:v12 forKeyedSubscript:*MEMORY[0x1E4FB0700]];

    v14.receiver = self;
    v14.super_class = (Class)CNPropertyEditingCell;
    [(CNLabeledCell *)&v14 setValueTextAttributes:v7];
  }

LABEL_7:
}

- (void)updateWithPropertyItem:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CNPropertyEditingCell;
  [(CNPropertyCell *)&v18 updateWithPropertyItem:v4];
  labelButton = self->_labelButton;
  int v6 = [(CNPropertyCell *)self propertyItem];
  double v7 = [v6 displayLabel];
  [(UIButton *)labelButton setTitle:v7 forState:0];

  double v8 = [(UIButton *)self->_labelButton titleLabel];
  [(CNPropertyCell *)self labelWidth];
  objc_msgSend(v8, "setPreferredMaxLayoutWidth:");

  v9 = [(CNPropertyCell *)self propertyItem];
  int v10 = [v9 extendedLabels];
  unint64_t v11 = [v10 count];

  if (v11 > 1)
  {
    objc_super v15 = objc_msgSend(MEMORY[0x1E4FB1818], "cnui_symbolImageForContactCardChevron");
    v16 = [(CNLabeledCell *)self chevron];
    [v16 setImage:v15];

    v12 = [(CNLabeledCell *)self chevron];
    objc_super v13 = v12;
    uint64_t v14 = 0;
  }
  else
  {
    v12 = [(CNLabeledCell *)self chevron];
    objc_super v13 = v12;
    uint64_t v14 = 1;
  }
  [v12 setHidden:v14];

  if ([v4 isReadonly]) {
    uint64_t v17 = 0;
  }
  else {
    uint64_t v17 = [v4 shouldDisableLabelButton] ^ 1;
  }
  [(UIButton *)self->_labelButton setUserInteractionEnabled:v17];
  -[UIButton setEnabled:](self->_labelButton, "setEnabled:", [v4 shouldDisableLabelButton] ^ 1);
}

- (void)labelButtonClicked:(id)a3
{
  id v12 = a3;
  id v4 = [(CNPropertyCell *)self propertyItem];
  double v5 = [v4 extendedLabels];
  unint64_t v6 = [v5 count];

  if (v6 >= 2)
  {
    double v7 = [CNLabelPickerController alloc];
    double v8 = [(CNPropertyCell *)self propertyItem];
    id v9 = [(CNLabelPickerController *)v7 initForPropertyItem:v8];

    [v9 setDelegate:self];
    int v10 = (void *)[objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:v9];
    unint64_t v11 = [(CNPropertyCell *)self presentingDelegate];
    [v11 sender:v12 presentViewController:v10];
  }
}

- (id)labelView
{
  labelButton = self->_labelButton;
  if (!labelButton)
  {
    id v4 = +[CNPropertyLabelButton propertyLabelButton];
    double v5 = self->_labelButton;
    self->_labelButton = v4;

    LODWORD(v6) = 1112014848;
    [(UIButton *)self->_labelButton setContentHuggingPriority:1 forAxis:v6];
    double v7 = *MEMORY[0x1E4FB2848];
    double v8 = *(double *)(MEMORY[0x1E4FB2848] + 8);
    double v9 = *(double *)(MEMORY[0x1E4FB2848] + 16);
    double v10 = *(double *)(MEMORY[0x1E4FB2848] + 24);
    if ([(id)objc_opt_class() wantsChevron])
    {
      uint64_t v11 = [(id)*MEMORY[0x1E4FB2608] userInterfaceLayoutDirection];
      [(CNLabeledCell *)self chevronWidth];
      if (v11 == 1) {
        double v8 = v12;
      }
      else {
        double v10 = v12;
      }
    }
    -[UIButton setTitleEdgeInsets:](self->_labelButton, "setTitleEdgeInsets:", v7, v8, v9, v10);
    [(UIButton *)self->_labelButton addTarget:self action:sel_labelButtonClicked_ forControlEvents:64];
    labelButton = self->_labelButton;
  }

  return labelButton;
}

- (void)dealloc
{
  double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CNPropertyEditingCell;
  [(CNContactCell *)&v4 dealloc];
}

- (CNPropertyEditingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)CNPropertyEditingCell;
  objc_super v4 = [(CNPropertyCell *)&v10 initWithStyle:a3 reuseIdentifier:a4];
  double v5 = [CNRepeatingGradientSeparatorView alloc];
  uint64_t v6 = -[CNRepeatingGradientSeparatorView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  vseparator = v4->_vseparator;
  v4->_vseparator = (CNRepeatingGradientSeparatorView *)v6;

  [(CNRepeatingGradientSeparatorView *)v4->_vseparator setTranslatesAutoresizingMaskIntoConstraints:0];
  double v8 = [(CNPropertyEditingCell *)v4 contentView];
  [v8 addSubview:v4->_vseparator];

  return v4;
}

+ (BOOL)wantsStandardConstraints
{
  return 0;
}

+ (BOOL)wantsChevron
{
  return 1;
}

@end