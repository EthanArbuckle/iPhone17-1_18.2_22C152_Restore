@interface HUNameAndIconEditorCell
- (BOOL)hideIconButton;
- (BOOL)isDisabled;
- (HFItem)item;
- (HUIconButton)iconButton;
- (HUNameAndIconEditorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HUNameAndIconEditorCellDelegate)delegate;
- (NSLayoutConstraint)textFieldLeadingConstraint;
- (UIFont)textFieldFont;
- (UITextField)textField;
- (UIView)containerView;
- (void)_handleIconButtonTap:(id)a3;
- (void)_setupConstraints;
- (void)_updateDisabled;
- (void)_updateTextFieldInset;
- (void)prepareForReuse;
- (void)setContainerView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setHideIconButton:(BOOL)a3;
- (void)setIconButton:(id)a3;
- (void)setItem:(id)a3;
- (void)setTextField:(id)a3;
- (void)setTextFieldFont:(id)a3;
- (void)setTextFieldLeadingConstraint:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUNameAndIconEditorCell

- (HUNameAndIconEditorCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v34.receiver = self;
  v34.super_class = (Class)HUNameAndIconEditorCell;
  v4 = [(HUNameAndIconEditorCell *)&v34 initWithStyle:0 reuseIdentifier:a4];
  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F42FF0]);
    double v6 = *MEMORY[0x1E4F1DB28];
    double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    v10 = objc_msgSend(v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], v7, v8, v9);
    [(HUNameAndIconEditorCell *)v4 setContainerView:v10];

    v11 = [(HUNameAndIconEditorCell *)v4 containerView];
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

    v12 = [(HUNameAndIconEditorCell *)v4 contentView];
    v13 = [(HUNameAndIconEditorCell *)v4 containerView];
    [v12 addSubview:v13];

    v14 = -[HUIconButton initWithFrame:]([HUIconButton alloc], "initWithFrame:", v6, v7, v8, v9);
    [(HUNameAndIconEditorCell *)v4 setIconButton:v14];

    v15 = [(HUNameAndIconEditorCell *)v4 iconButton];
    [v15 addTarget:v4 action:sel__handleIconButtonTap_ forControlEvents:64];

    v16 = [(HUNameAndIconEditorCell *)v4 iconButton];
    [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

    v17 = [(HUNameAndIconEditorCell *)v4 containerView];
    v18 = [(HUNameAndIconEditorCell *)v4 iconButton];
    [v17 addSubview:v18];

    v19 = [(HUNameAndIconEditorCell *)v4 iconButton];
    [v19 setContentMode:1];

    v20 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42F10]), "initWithFrame:", v6, v7, v8, v9);
    [(HUNameAndIconEditorCell *)v4 setTextField:v20];

    v21 = [MEMORY[0x1E4F42A40] metricsForTextStyle:*MEMORY[0x1E4F43870]];
    v22 = (void *)MEMORY[0x1E4F42A30];
    [v21 scaledValueForValue:17.0];
    v23 = objc_msgSend(v22, "systemFontOfSize:weight:");
    v24 = [(HUNameAndIconEditorCell *)v4 textField];
    [v24 setFont:v23];

    v25 = [(HUNameAndIconEditorCell *)v4 textField];
    [v25 setReturnKeyType:9];

    v26 = [(HUNameAndIconEditorCell *)v4 textField];
    [v26 setClearButtonMode:1];

    v27 = [(HUNameAndIconEditorCell *)v4 textField];
    [v27 setAutocapitalizationType:1];

    v28 = [(HUNameAndIconEditorCell *)v4 textField];
    [v28 setContentVerticalAlignment:0];

    v29 = [(HUNameAndIconEditorCell *)v4 textField];
    [v29 setTranslatesAutoresizingMaskIntoConstraints:0];

    v30 = [(HUNameAndIconEditorCell *)v4 textField];
    [v30 setAdjustsFontForContentSizeCategory:1];

    v31 = [(HUNameAndIconEditorCell *)v4 containerView];
    v32 = [(HUNameAndIconEditorCell *)v4 textField];
    [v31 addSubview:v32];

    [(HUNameAndIconEditorCell *)v4 setHideIconButton:0];
    [(HUNameAndIconEditorCell *)v4 _setupConstraints];
  }
  return v4;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)HUNameAndIconEditorCell;
  [(HUNameAndIconEditorCell *)&v3 prepareForReuse];
  [(HUNameAndIconEditorCell *)self setDisabled:0];
}

- (void)_setupConstraints
{
  id v60 = [MEMORY[0x1E4F1CA48] array];
  objc_super v3 = [(HUNameAndIconEditorCell *)self containerView];
  v4 = [v3 leadingAnchor];
  id v5 = [(HUNameAndIconEditorCell *)self contentView];
  double v6 = [v5 leadingAnchor];
  double v7 = [v4 constraintEqualToAnchor:v6];
  [v60 addObject:v7];

  double v8 = [(HUNameAndIconEditorCell *)self containerView];
  double v9 = [v8 trailingAnchor];
  v10 = [(HUNameAndIconEditorCell *)self contentView];
  v11 = [v10 trailingAnchor];
  v12 = [v9 constraintEqualToAnchor:v11];
  [v60 addObject:v12];

  v13 = [(HUNameAndIconEditorCell *)self containerView];
  v14 = [v13 topAnchor];
  v15 = [(HUNameAndIconEditorCell *)self contentView];
  v16 = [v15 topAnchor];
  v17 = [v14 constraintEqualToAnchor:v16];
  [v60 addObject:v17];

  v18 = [(HUNameAndIconEditorCell *)self containerView];
  v19 = [v18 bottomAnchor];
  v20 = [(HUNameAndIconEditorCell *)self contentView];
  v21 = [v20 bottomAnchor];
  v22 = [v19 constraintEqualToAnchor:v21];
  [v60 addObject:v22];

  v23 = [(HUNameAndIconEditorCell *)self iconButton];
  v24 = [v23 leadingAnchor];
  v25 = [(HUNameAndIconEditorCell *)self containerView];
  v26 = [v25 leadingAnchor];
  v27 = [v24 constraintEqualToAnchor:v26 constant:6.0];
  [v60 addObject:v27];

  v28 = [(HUNameAndIconEditorCell *)self iconButton];
  v29 = [v28 topAnchor];
  v30 = [(HUNameAndIconEditorCell *)self containerView];
  v31 = [v30 topAnchor];
  v32 = [v29 constraintEqualToAnchor:v31 constant:6.5];
  [v60 addObject:v32];

  v33 = [(HUNameAndIconEditorCell *)self iconButton];
  objc_super v34 = [v33 bottomAnchor];
  v35 = [(HUNameAndIconEditorCell *)self containerView];
  v36 = [v35 bottomAnchor];
  v37 = [v34 constraintEqualToAnchor:v36 constant:-6.5];
  [v60 addObject:v37];

  v38 = [(HUNameAndIconEditorCell *)self iconButton];
  LODWORD(v39) = 1148846080;
  [v38 setContentHuggingPriority:0 forAxis:v39];

  v40 = [(HUNameAndIconEditorCell *)self iconButton];
  LODWORD(v41) = 1148846080;
  [v40 setContentHuggingPriority:1 forAxis:v41];

  v42 = [(HUNameAndIconEditorCell *)self iconButton];
  LODWORD(v43) = 1148846080;
  [v42 setContentCompressionResistancePriority:0 forAxis:v43];

  [(HUNameAndIconEditorCell *)self _updateTextFieldInset];
  v44 = [(HUNameAndIconEditorCell *)self textField];
  v45 = [v44 trailingAnchor];
  v46 = [(HUNameAndIconEditorCell *)self containerView];
  v47 = [v46 layoutMarginsGuide];
  v48 = [v47 trailingAnchor];
  v49 = [v45 constraintEqualToAnchor:v48];
  [v60 addObject:v49];

  v50 = [(HUNameAndIconEditorCell *)self textField];
  v51 = [v50 topAnchor];
  v52 = [(HUNameAndIconEditorCell *)self containerView];
  v53 = [v52 topAnchor];
  v54 = [v51 constraintEqualToAnchor:v53];
  [v60 addObject:v54];

  v55 = [(HUNameAndIconEditorCell *)self textField];
  v56 = [v55 bottomAnchor];
  v57 = [(HUNameAndIconEditorCell *)self containerView];
  v58 = [v57 bottomAnchor];
  v59 = [v56 constraintEqualToAnchor:v58];
  [v60 addObject:v59];

  [MEMORY[0x1E4F28DC8] activateConstraints:v60];
}

- (void)setDisabled:(BOOL)a3
{
  if (self->_disabled != a3)
  {
    self->_disabled = a3;
    [(HUNameAndIconEditorCell *)self _updateDisabled];
  }
}

- (UIFont)textFieldFont
{
  v2 = [(HUNameAndIconEditorCell *)self textField];
  objc_super v3 = [v2 font];

  return (UIFont *)v3;
}

- (void)setTextFieldFont:(id)a3
{
  id v4 = a3;
  id v5 = [(HUNameAndIconEditorCell *)self textField];
  [v5 setFont:v4];
}

- (void)setHideIconButton:(BOOL)a3
{
  if (self->_hideIconButton != a3)
  {
    self->_hideIconButton = a3;
    [(HUNameAndIconEditorCell *)self _updateTextFieldInset];
  }
}

- (void)_updateTextFieldInset
{
  v17[1] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(HUNameAndIconEditorCell *)self textFieldLeadingConstraint];

  if (v3)
  {
    id v4 = (void *)MEMORY[0x1E4F28DC8];
    id v5 = [(HUNameAndIconEditorCell *)self textFieldLeadingConstraint];
    v17[0] = v5;
    double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
    [v4 deactivateConstraints:v6];
  }
  if ([(HUNameAndIconEditorCell *)self hideIconButton])
  {
    double v7 = [(HUNameAndIconEditorCell *)self containerView];
    [v7 leadingAnchor];
  }
  else
  {
    double v7 = [(HUNameAndIconEditorCell *)self iconButton];
    [v7 trailingAnchor];
  double v8 = };

  if ([(HUNameAndIconEditorCell *)self hideIconButton]) {
    double v9 = 18.0;
  }
  else {
    double v9 = 12.0;
  }
  v10 = [(HUNameAndIconEditorCell *)self textField];
  v11 = [v10 leadingAnchor];
  v12 = [v11 constraintEqualToAnchor:v8 constant:v9];
  [(HUNameAndIconEditorCell *)self setTextFieldLeadingConstraint:v12];

  v13 = (void *)MEMORY[0x1E4F28DC8];
  v14 = [(HUNameAndIconEditorCell *)self textFieldLeadingConstraint];
  v16 = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
  [v13 activateConstraints:v15];
}

- (void)traitCollectionDidChange:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)HUNameAndIconEditorCell;
  [(HUNameAndIconEditorCell *)&v3 traitCollectionDidChange:a3];
}

- (void)_handleIconButtonTap:(id)a3
{
  id v4 = [(HUNameAndIconEditorCell *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(HUNameAndIconEditorCell *)self delegate];
    [v6 nameAndIconEditorCellDidTapIcon:self];
  }
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  char v5 = [(HUNameAndIconEditorCell *)self item];
  id v12 = [v5 latestResults];

  id v6 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F689E8]];
  double v7 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F68A00]];
  double v8 = [MEMORY[0x1E4F69548] displayIconDescriptorFromIconDescriptor:v6 symbolName:v7];

  [(HUNameAndIconEditorCell *)self _updateDisabled];
  double v9 = [(HUNameAndIconEditorCell *)self iconButton];
  [v9 updateWithIconDescriptor:v8 animated:v3];

  if ([v7 isEqualToString:*MEMORY[0x1E4F68CE8]])
  {
    v10 = [MEMORY[0x1E4F428B8] systemGrayColor];
    v11 = [(HUNameAndIconEditorCell *)self iconButton];
    [v11 setTintColor:v10];
  }
  else
  {
    v10 = [(HUNameAndIconEditorCell *)self iconButton];
    [v10 setTintColor:0];
  }
}

- (void)_updateDisabled
{
  if ([(HUNameAndIconEditorCell *)self isDisabled])
  {
    uint64_t v3 = 0;
  }
  else
  {
    id v4 = [(HUNameAndIconEditorCell *)self item];
    char v5 = [v4 latestResults];
    id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68A08]];
    uint64_t v3 = [v6 BOOLValue] ^ 1;
  }
  [(HUNameAndIconEditorCell *)self setUserInteractionEnabled:v3];
  double v7 = [(HUNameAndIconEditorCell *)self iconButton];
  [v7 setEnabled:v3];

  double v8 = [(HUNameAndIconEditorCell *)self textField];
  [v8 setEnabled:v3];

  if ([(HUNameAndIconEditorCell *)self isDisabled]) {
    [MEMORY[0x1E4F428B8] systemGrayColor];
  }
  else {
  double v9 = [MEMORY[0x1E4F428B8] labelColor];
  }
  v10 = [(HUNameAndIconEditorCell *)self textField];
  [v10 setTextColor:v9];

  id v11 = [(HUNameAndIconEditorCell *)self textField];
  [v11 setClearButtonMode:v3];
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (HUNameAndIconEditorCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUNameAndIconEditorCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HUIconButton)iconButton
{
  return self->_iconButton;
}

- (void)setIconButton:(id)a3
{
}

- (BOOL)hideIconButton
{
  return self->_hideIconButton;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
}

- (UITextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
}

- (NSLayoutConstraint)textFieldLeadingConstraint
{
  return self->_textFieldLeadingConstraint;
}

- (void)setTextFieldLeadingConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFieldLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_iconButton, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_item, 0);
}

@end