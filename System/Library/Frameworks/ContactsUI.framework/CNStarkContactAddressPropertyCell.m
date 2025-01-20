@interface CNStarkContactAddressPropertyCell
- (BOOL)shouldShowStar;
- (BOOL)supportsTintColorValue;
- (BOOL)supportsValueColorUsesLabelColor;
- (CNStarkActionView)actionView;
- (CNStarkContactAddressPropertyCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSLayoutConstraint)contentViewBottomAnchorConstraint;
- (NSLayoutConstraint)labelViewFirstBaselineAnchorConstraint;
- (NSLayoutConstraint)valueViewFirstBaselineAnchorConstraint;
- (id)constantConstraints;
- (id)variableConstraints;
- (void)_cnui_applyContactStyle;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)performDefaultAction;
- (void)setContentViewBottomAnchorConstraint:(id)a3;
- (void)setLabelViewFirstBaselineAnchorConstraint:(id)a3;
- (void)setSeparatorStyle:(int64_t)a3;
- (void)setValueViewFirstBaselineAnchorConstraint:(id)a3;
@end

@implementation CNStarkContactAddressPropertyCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewBottomAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_valueViewFirstBaselineAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_labelViewFirstBaselineAnchorConstraint, 0);

  objc_storeStrong((id *)&self->_actionView, 0);
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

- (CNStarkActionView)actionView
{
  return self->_actionView;
}

- (BOOL)shouldShowStar
{
  return 0;
}

- (void)performDefaultAction
{
  v3 = [(CNPropertyCell *)self propertyItem];
  v4 = [v3 contact];

  v5 = [MEMORY[0x1E4F5A730] targetForDirections];
  v6 = [v5 actionsForContact:v4 discoveringEnvironment:0];
  v7 = [v6 allObjects:0];
  v8 = [v7 firstObject];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__CNStarkContactAddressPropertyCell_performDefaultAction__block_invoke;
  v13[3] = &unk_1E549A490;
  v13[4] = self;
  v9 = objc_msgSend(v8, "_cn_firstObjectPassingTest:", v13);
  id v10 = objc_alloc_init(MEMORY[0x1E4F5A708]);
  v11 = [(objc_class *)getFBSOpenApplicationServiceClass_49505() dashboardEndpoint];
  [v10 setConnectionEndpoint:v11];

  id v12 = (id)[v9 performActionWithContext:v10 shouldCurateIfPerformed:0];
}

uint64_t __57__CNStarkContactAddressPropertyCell_performDefaultAction__block_invoke(uint64_t a1, void *a2)
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

- (BOOL)supportsValueColorUsesLabelColor
{
  return 0;
}

- (BOOL)supportsTintColorValue
{
  return 0;
}

- (void)setSeparatorStyle:(int64_t)a3
{
  v3.receiver = self;
  v3.super_class = (Class)CNStarkContactAddressPropertyCell;
  [(CNStarkContactAddressPropertyCell *)&v3 setSeparatorStyle:0];
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNStarkContactAddressPropertyCell;
  [(CNStarkContactAddressPropertyCell *)&v13 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  v7 = [v6 nextFocusedView];
  if (v7 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    v8 = [v6 previouslyFocusedView];
    BOOL v9 = v8 == self;
  }
  id v10 = [v6 nextFocusedView];

  if (v9)
  {
    BOOL v11 = v10 == self;
    id v12 = [(CNStarkContactAddressPropertyCell *)self actionView];
    [v12 updateForFocusedState:v11];
  }
}

- (id)variableConstraints
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)constantConstraints
{
  v48[2] = *MEMORY[0x1E4F143B8];
  v44 = [MEMORY[0x1E4F1CA48] array];
  v47[0] = @"label";
  objc_super v3 = [(CNPropertySimpleCell *)self labelLabel];
  v48[0] = v3;
  v47[1] = @"actionView";
  v4 = [(CNStarkContactAddressPropertyCell *)self actionView];
  v48[1] = v4;
  v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v48 forKeys:v47 count:2];

  v5 = [(CNPropertySimpleCell *)self labelView];
  id v6 = [v5 firstBaselineAnchor];
  v7 = [(CNStarkContactAddressPropertyCell *)self contentView];
  v8 = [v7 safeAreaLayoutGuide];
  BOOL v9 = [v8 topAnchor];
  +[CNStarkContactPropertyCell labelViewFirstBaselineAnchorConstraintConstant];
  id v10 = objc_msgSend(v6, "constraintEqualToAnchor:constant:", v9);
  [(CNStarkContactAddressPropertyCell *)self setLabelViewFirstBaselineAnchorConstraint:v10];

  BOOL v11 = [(CNPropertySimpleCell *)self valueView];
  id v12 = [v11 firstBaselineAnchor];
  objc_super v13 = [(CNPropertySimpleCell *)self labelView];
  v14 = [v13 firstBaselineAnchor];
  +[CNStarkContactPropertyCell valueLabelFirstBaselineAnchorConstraintConstant];
  v15 = objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14);
  [(CNStarkContactAddressPropertyCell *)self setValueViewFirstBaselineAnchorConstraint:v15];

  v16 = [(CNPropertySimpleCell *)self valueView];
  v17 = [v16 lastBaselineAnchor];
  v18 = [(CNStarkContactAddressPropertyCell *)self contentView];
  v19 = [v18 safeAreaLayoutGuide];
  v20 = [v19 bottomAnchor];
  +[CNStarkContactPropertyCell contentViewBottomAnchorConstraintConstant];
  v21 = objc_msgSend(v17, "constraintEqualToAnchor:constant:", v20);
  [(CNStarkContactAddressPropertyCell *)self setContentViewBottomAnchorConstraint:v21];

  v43 = [(CNStarkContactAddressPropertyCell *)self labelViewFirstBaselineAnchorConstraint];
  v46[0] = v43;
  v42 = [(CNStarkContactAddressPropertyCell *)self valueViewFirstBaselineAnchorConstraint];
  v46[1] = v42;
  v41 = [(CNStarkContactAddressPropertyCell *)self contentViewBottomAnchorConstraint];
  v46[2] = v41;
  v40 = [(CNPropertySimpleCell *)self valueView];
  v38 = [v40 leadingAnchor];
  v39 = [(CNPropertySimpleCell *)self labelView];
  v22 = [v39 leadingAnchor];
  v23 = [v38 constraintEqualToAnchor:v22];
  v46[3] = v23;
  v24 = [(CNPropertySimpleCell *)self valueView];
  v25 = [v24 trailingAnchor];
  v26 = [(CNPropertySimpleCell *)self labelView];
  v27 = [v26 trailingAnchor];
  v28 = [v25 constraintLessThanOrEqualToAnchor:v27];
  v46[4] = v28;
  v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:5];
  [v44 addObjectsFromArray:v29];

  v30 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|-(64)-[actionView(==36)]-(12)-[label]-(>=12)-|" options:0 metrics:0 views:v45];
  [v44 addObjectsFromArray:v30];

  v31 = [(CNStarkContactAddressPropertyCell *)self actionView];
  v32 = [v31 topAnchor];
  v33 = [(CNStarkContactAddressPropertyCell *)self contentView];
  v34 = [v33 safeAreaLayoutGuide];
  v35 = [v34 topAnchor];
  v36 = [v32 constraintEqualToAnchor:v35 constant:4.0];
  [v44 addObject:v36];

  return v44;
}

- (void)_cnui_applyContactStyle
{
  id v3 = +[CNUIColorRepository carPlayTableViewCellBackgroundColor];
  [(CNStarkContactAddressPropertyCell *)self setBackgroundColor:v3];
}

- (CNStarkContactAddressPropertyCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)CNStarkContactAddressPropertyCell;
  v4 = [(CNPropertyPostalAddressCell *)&v14 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    id v6 = [(CNPropertySimpleCell *)v4 labelLabel];
    [v6 setTextAlignment:4];

    v7 = [(CNPropertySimpleCell *)v5 valueLabel];
    [v7 setTextAlignment:4];

    v8 = [(CNPropertySimpleCell *)v5 labelView];
    [v8 setContentHuggingPriority:0 forAxis:0.0];

    uint64_t v9 = +[CNStarkActionView propertyTransportButtonWithDelegate:v5];
    actionView = v5->_actionView;
    v5->_actionView = (CNStarkActionView *)v9;

    [(CNStarkActionView *)v5->_actionView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CNStarkActionView *)v5->_actionView setActionType:*MEMORY[0x1E4F1AD28]];
    [(CNStarkActionView *)v5->_actionView setEnabled:0];
    BOOL v11 = [(CNStarkContactAddressPropertyCell *)v5 contentView];
    [v11 addSubview:v5->_actionView];

    id v12 = v5;
  }

  return v5;
}

@end