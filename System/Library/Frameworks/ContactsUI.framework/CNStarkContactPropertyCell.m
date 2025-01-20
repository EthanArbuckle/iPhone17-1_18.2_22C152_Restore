@interface CNStarkContactPropertyCell
+ (BOOL)wantsHorizontalLayout;
+ (double)contentViewBottomAnchorConstraintConstant;
+ (double)labelViewFirstBaselineAnchorConstraintConstant;
+ (double)minimumContentHeight;
+ (double)valueLabelFirstBaselineAnchorConstraintConstant;
- (BOOL)allowsFocus;
- (BOOL)shouldShowStar;
- (BOOL)supportsTintColorValue;
- (BOOL)supportsValueColorUsesLabelColor;
- (CNStarkActionView)actionView1;
- (CNStarkActionView)actionView2;
- (CNStarkContactPropertyCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSLayoutConstraint)contentViewBottomAnchorConstraint;
- (NSLayoutConstraint)labelViewFirstBaselineAnchorConstraint;
- (NSLayoutConstraint)valueViewFirstBaselineAnchorConstraint;
- (UIEdgeInsets)contentInsets;
- (id)constantConstraints;
- (id)variableConstraints;
- (int64_t)transportTypeForActionType:(id)a3;
- (void)_cnui_applyContactStyle;
- (void)actionViewTapped:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)performActionForMessage;
- (void)performDefaultAction;
- (void)setAllowsFocus:(BOOL)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setContentViewBottomAnchorConstraint:(id)a3;
- (void)setLabelViewFirstBaselineAnchorConstraint:(id)a3;
- (void)setSeparatorStyle:(int64_t)a3;
- (void)setValueViewFirstBaselineAnchorConstraint:(id)a3;
- (void)updateTransportButtons;
@end

@implementation CNStarkContactPropertyCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewBottomAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_valueViewFirstBaselineAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_labelViewFirstBaselineAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_actionView2, 0);

  objc_storeStrong((id *)&self->_actionView1, 0);
}

- (void)setContentViewBottomAnchorConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentViewBottomAnchorConstraint
{
  return self->_contentViewBottomAnchorConstraint;
}

- (void)setValueViewFirstBaselineAnchorConstraint:(id)a3
{
}

- (NSLayoutConstraint)valueViewFirstBaselineAnchorConstraint
{
  return self->_valueViewFirstBaselineAnchorConstraint;
}

- (void)setLabelViewFirstBaselineAnchorConstraint:(id)a3
{
}

- (NSLayoutConstraint)labelViewFirstBaselineAnchorConstraint
{
  return self->_labelViewFirstBaselineAnchorConstraint;
}

- (void)setAllowsFocus:(BOOL)a3
{
  self->_allowsFocus = a3;
}

- (BOOL)allowsFocus
{
  return self->_allowsFocus;
}

- (CNStarkActionView)actionView2
{
  return self->_actionView2;
}

- (CNStarkActionView)actionView1
{
  return self->_actionView1;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)performActionForMessage
{
  v3 = [(CNPropertyCell *)self propertyItem];
  v4 = [v3 contact];

  v5 = [MEMORY[0x1E4F5A730] targetForTextWithMessages];
  v6 = [v5 actionsForContact:v4 discoveringEnvironment:0];
  v7 = [v6 allObjects:0];
  v8 = [v7 firstObject];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __53__CNStarkContactPropertyCell_performActionForMessage__block_invoke;
  v13[3] = &unk_1E549A490;
  v13[4] = self;
  v9 = objc_msgSend(v8, "_cn_firstObjectPassingTest:", v13);
  id v10 = objc_alloc_init(MEMORY[0x1E4F5A708]);
  v11 = [(objc_class *)getFBSOpenApplicationServiceClass_50885() dashboardEndpoint];
  [v10 setConnectionEndpoint:v11];

  id v12 = (id)[v9 performActionWithContext:v10 shouldCurateIfPerformed:0];
}

uint64_t __53__CNStarkContactPropertyCell_performActionForMessage__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 propertyItem];
  v5 = [v4 labeledValue];
  v6 = [v5 identifier];
  v7 = [v3 contactProperty];

  v8 = [v7 identifier];
  uint64_t v9 = [v6 isEqualToString:v8];

  return v9;
}

- (int64_t)transportTypeForActionType:(id)a3
{
  v11[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F1AD48];
  v10[0] = *MEMORY[0x1E4F1AD20];
  v10[1] = v3;
  v11[0] = &unk_1ED915938;
  v11[1] = &unk_1ED915950;
  v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  v6 = [v4 dictionaryWithObjects:v11 forKeys:v10 count:2];
  v7 = [v6 objectForKeyedSubscript:v5];

  int64_t v8 = [v7 integerValue];
  return v8;
}

- (void)actionViewTapped:(id)a3
{
  v4 = [a3 actionType];
  int64_t v5 = [(CNStarkContactPropertyCell *)self transportTypeForActionType:v4];

  if (v5)
  {
    if (v5 == 2)
    {
      [(CNStarkContactPropertyCell *)self performActionForMessage];
    }
    else
    {
      id v7 = [(CNPropertyCell *)self delegate];
      v6 = [(CNPropertyCell *)self propertyItem];
      [v7 propertyCell:self performActionForItem:v6 withTransportType:v5];
    }
  }
}

- (void)updateTransportButtons
{
  if (![(CNPropertySimpleTransportCell *)self allowsActions]) {
    return;
  }
  uint64_t v3 = [(CNPropertyCell *)self propertyItem];
  int v4 = [v3 allowsPhone];

  int64_t v5 = [(CNPropertyCell *)self propertyItem];
  unsigned int v6 = [v5 allowsIMessage];

  if (!v4)
  {
    if (!v6)
    {
      v13 = [(CNStarkContactPropertyCell *)self actionView1];
      [v13 setActionType:0];

      id v10 = [(CNStarkContactPropertyCell *)self actionView2];
      v11 = v10;
      uint64_t v12 = 0;
      goto LABEL_9;
    }
    uint64_t v9 = *MEMORY[0x1E4F1AD48];
    id v10 = [(CNStarkContactPropertyCell *)self actionView1];
LABEL_7:
    v11 = v10;
    uint64_t v12 = v9;
LABEL_9:
    [v10 setActionType:v12];

    goto LABEL_10;
  }
  uint64_t v7 = *MEMORY[0x1E4F1AD20];
  int64_t v8 = [(CNStarkContactPropertyCell *)self actionView1];
  [v8 setActionType:v7];

  if (v6)
  {
    uint64_t v9 = *MEMORY[0x1E4F1AD48];
    id v10 = [(CNStarkContactPropertyCell *)self actionView2];
    goto LABEL_7;
  }
LABEL_10:
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __52__CNStarkContactPropertyCell_updateTransportButtons__block_invoke;
  v20[3] = &unk_1E549A468;
  v20[4] = self;
  v20[5] = &v21;
  v14 = (void (**)(void *, void *))_Block_copy(v20);
  v15 = [(CNStarkContactPropertyCell *)self actionView1];
  v14[2](v14, v15);

  v16 = [(CNStarkContactPropertyCell *)self actionView2];
  v14[2](v14, v16);

  if (*((unsigned char *)v22 + 24))
  {
    v17 = [(CNStarkContactPropertyCell *)self actionView1];
    uint64_t v18 = v4 & v6;
    [v17 setEnabled:v18];

    v19 = [(CNStarkContactPropertyCell *)self actionView2];
    [v19 setEnabled:v18];

    [(CNStarkContactPropertyCell *)self setAllowsFocus:v18 ^ 1];
    [(CNStarkContactPropertyCell *)self setNeedsUpdateConstraints];
  }

  _Block_object_dispose(&v21, 8);
}

void __52__CNStarkContactPropertyCell_updateTransportButtons__block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  uint64_t v3 = [v10 actionType];
  if (v3)
  {
    int v4 = (void *)v3;
    int64_t v5 = [v10 superview];

    if (!v5)
    {
      uint64_t v9 = [*(id *)(a1 + 32) contentView];
      [v9 addSubview:v10];

      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      goto LABEL_8;
    }
  }
  unsigned int v6 = [v10 actionType];
  if (v6)
  {

LABEL_8:
    int64_t v8 = v10;
    goto LABEL_9;
  }
  uint64_t v7 = [v10 superview];

  int64_t v8 = v10;
  if (v7)
  {
    [v10 removeFromSuperview];
    int64_t v8 = v10;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
LABEL_9:
}

- (BOOL)shouldShowStar
{
  return 0;
}

- (BOOL)supportsValueColorUsesLabelColor
{
  return 0;
}

- (BOOL)supportsTintColorValue
{
  return 0;
}

- (void)performDefaultAction
{
  uint64_t v3 = [(CNPropertyCell *)self propertyItem];
  int v4 = [v3 property];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F1ADC8]];

  if (v5)
  {
    [(CNStarkContactPropertyCell *)self performActionForMessage];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)CNStarkContactPropertyCell;
    [(CNPropertyCell *)&v6 performDefaultAction];
  }
}

- (void)setSeparatorStyle:(int64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CNStarkContactPropertyCell;
  [(CNStarkContactPropertyCell *)&v3 setSeparatorStyle:0];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNStarkContactPropertyCell;
  [(CNStarkContactPropertyCell *)&v14 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  uint64_t v7 = [v6 nextFocusedView];
  if (v7 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    int64_t v8 = [v6 previouslyFocusedView];
    BOOL v9 = v8 == self;
  }
  id v10 = [v6 nextFocusedView];

  if (v9)
  {
    BOOL v11 = v10 == self;
    uint64_t v12 = [(CNStarkContactPropertyCell *)self actionView1];
    [v12 updateForFocusedState:v11];

    v13 = [(CNStarkContactPropertyCell *)self actionView2];
    [v13 updateForFocusedState:v11];
  }
}

- (id)variableConstraints
{
  v33[4] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  v32[0] = @"label";
  int v4 = [(CNPropertySimpleCell *)self labelLabel];
  v33[0] = v4;
  v32[1] = @"value";
  int v5 = [(CNPropertySimpleCell *)self valueLabel];
  v33[1] = v5;
  v32[2] = @"actionView1";
  id v6 = [(CNStarkContactPropertyCell *)self actionView1];
  v33[2] = v6;
  v32[3] = @"actionView2";
  uint64_t v7 = [(CNStarkContactPropertyCell *)self actionView2];
  v33[3] = v7;
  int64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:v32 count:4];

  BOOL v9 = [(CNStarkContactPropertyCell *)self actionView2];
  id v10 = [v9 superview];

  if (v10)
  {
    BOOL v11 = @"H:|-(12)-[actionView2(==36)]-(16)-[actionView1(==36)]-(12)-[label]-(>=12)-|";
  }
  else
  {
    uint64_t v12 = [(CNStarkContactPropertyCell *)self actionView1];
    v13 = [v12 superview];

    if (!v13) {
      goto LABEL_6;
    }
    BOOL v11 = @"H:|-(64)-[actionView1(==36)]-(12)-[label]-(>=12)-|";
  }
  objc_super v14 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:v11 options:0 metrics:0 views:v8];
  [v3 addObjectsFromArray:v14];

LABEL_6:
  v15 = [(CNStarkContactPropertyCell *)self actionView1];
  v16 = [v15 superview];

  if (v16)
  {
    v17 = [(CNStarkContactPropertyCell *)self actionView1];
    uint64_t v18 = [v17 centerYAnchor];
    v19 = [(CNStarkContactPropertyCell *)self contentView];
    v20 = [v19 safeAreaLayoutGuide];
    uint64_t v21 = [v20 centerYAnchor];
    v22 = [v18 constraintEqualToAnchor:v21];
    [v3 addObject:v22];
  }
  uint64_t v23 = [(CNStarkContactPropertyCell *)self actionView2];
  char v24 = [v23 superview];

  if (v24)
  {
    v25 = [(CNStarkContactPropertyCell *)self actionView2];
    v26 = [v25 centerYAnchor];
    v27 = [(CNStarkContactPropertyCell *)self contentView];
    v28 = [v27 safeAreaLayoutGuide];
    v29 = [v28 centerYAnchor];
    v30 = [v26 constraintEqualToAnchor:v29];
    [v3 addObject:v30];
  }

  return v3;
}

- (id)constantConstraints
{
  v30[4] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(CNPropertySimpleCell *)self labelView];
  int v4 = [v3 firstBaselineAnchor];
  int v5 = [(CNStarkContactPropertyCell *)self contentView];
  id v6 = [v5 safeAreaLayoutGuide];
  uint64_t v7 = [v6 topAnchor];
  [(id)objc_opt_class() labelViewFirstBaselineAnchorConstraintConstant];
  int64_t v8 = objc_msgSend(v4, "constraintEqualToAnchor:constant:", v7);
  [(CNStarkContactPropertyCell *)self setLabelViewFirstBaselineAnchorConstraint:v8];

  BOOL v9 = [(CNPropertySimpleCell *)self valueView];
  id v10 = [v9 firstBaselineAnchor];
  BOOL v11 = [(CNPropertySimpleCell *)self labelView];
  uint64_t v12 = [v11 firstBaselineAnchor];
  [(id)objc_opt_class() valueLabelFirstBaselineAnchorConstraintConstant];
  v13 = objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12);
  [(CNStarkContactPropertyCell *)self setValueViewFirstBaselineAnchorConstraint:v13];

  objc_super v14 = [(CNPropertySimpleCell *)self valueView];
  v15 = [v14 firstBaselineAnchor];
  v16 = [(CNStarkContactPropertyCell *)self contentView];
  v17 = [v16 safeAreaLayoutGuide];
  uint64_t v18 = [v17 bottomAnchor];
  [(id)objc_opt_class() contentViewBottomAnchorConstraintConstant];
  v19 = objc_msgSend(v15, "constraintEqualToAnchor:constant:", v18);
  [(CNStarkContactPropertyCell *)self setContentViewBottomAnchorConstraint:v19];

  v20 = [(CNStarkContactPropertyCell *)self labelViewFirstBaselineAnchorConstraint];
  v30[0] = v20;
  uint64_t v21 = [(CNStarkContactPropertyCell *)self valueViewFirstBaselineAnchorConstraint];
  v30[1] = v21;
  v22 = [(CNPropertySimpleCell *)self valueView];
  uint64_t v23 = [v22 leadingAnchor];
  char v24 = [(CNPropertySimpleCell *)self labelView];
  v25 = [v24 leadingAnchor];
  v26 = [v23 constraintEqualToAnchor:v25];
  v30[2] = v26;
  v27 = [(CNStarkContactPropertyCell *)self contentViewBottomAnchorConstraint];
  v30[3] = v27;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];

  return v28;
}

- (void)_cnui_applyContactStyle
{
  id v3 = +[CNUIColorRepository carPlayTableViewCellBackgroundColor];
  [(CNStarkContactPropertyCell *)self setBackgroundColor:v3];
}

- (CNStarkContactPropertyCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)CNStarkContactPropertyCell;
  int v4 = [(CNPropertyPhoneNumberCell *)&v15 initWithStyle:a3 reuseIdentifier:a4];
  int v5 = v4;
  if (v4)
  {
    [(CNStarkContactPropertyCell *)v4 setAllowsFocus:1];
    id v6 = [(CNPropertySimpleCell *)v5 labelLabel];
    [v6 setTextAlignment:4];

    uint64_t v7 = [(CNPropertySimpleCell *)v5 valueLabel];
    [v7 setTextAlignment:4];

    int64_t v8 = [(CNPropertySimpleCell *)v5 labelView];
    [v8 setContentHuggingPriority:0 forAxis:0.0];

    uint64_t v9 = +[CNStarkActionView propertyTransportButtonWithDelegate:v5];
    actionView1 = v5->_actionView1;
    v5->_actionView1 = (CNStarkActionView *)v9;

    [(CNStarkActionView *)v5->_actionView1 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v11 = +[CNStarkActionView propertyTransportButtonWithDelegate:v5];
    actionView2 = v5->_actionView2;
    v5->_actionView2 = (CNStarkActionView *)v11;

    [(CNStarkActionView *)v5->_actionView2 setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = v5;
  }

  return v5;
}

+ (double)contentViewBottomAnchorConstraintConstant
{
  v2 = +[CNUIFontRepository carPlayTableViewCellSubtitleFont];
  [v2 _scaledValueForValue:-8.0];
  double v4 = ceil(v3);

  return v4;
}

+ (double)valueLabelFirstBaselineAnchorConstraintConstant
{
  v2 = +[CNUIFontRepository carPlayTableViewCellTitleFont];
  [v2 _scaledValueForValue:18.0];
  double v4 = ceil(v3);

  return v4;
}

+ (double)labelViewFirstBaselineAnchorConstraintConstant
{
  v2 = +[CNUIFontRepository carPlayTableViewCellTitleFont];
  [v2 _scaledValueForValue:18.0];
  double v4 = ceil(v3);

  return v4;
}

+ (double)minimumContentHeight
{
  [a1 labelViewFirstBaselineAnchorConstraintConstant];
  double v4 = v3;
  [a1 valueLabelFirstBaselineAnchorConstraintConstant];
  double v6 = v4 + v5;
  [a1 contentViewBottomAnchorConstraintConstant];
  return v6 - v7;
}

+ (BOOL)wantsHorizontalLayout
{
  return 1;
}

@end