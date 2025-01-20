@interface HUEditableCheckmarkTextCell
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)allowCheckmarkSelectionWhileDisabled;
- (BOOL)disableCheckmark;
- (BOOL)isChecked;
- (BOOL)isDisabled;
- (BOOL)removeCheckmark;
- (HFItem)item;
- (HUCheckmarkAccessoryView)checkmarkView;
- (HUEditableCheckmarkDelegate)delegate;
- (HUEditableCheckmarkTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSArray)dynamicConstraints;
- (NSArray)staticConstraints;
- (UITapGestureRecognizer)checkmarkTapRecognizer;
- (UITextField)textField;
- (id)accessoryView;
- (void)_checkmarkTapped:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAccessoryView:(id)a3;
- (void)setAllowCheckmarkSelectionWhileDisabled:(BOOL)a3;
- (void)setChecked:(BOOL)a3;
- (void)setCheckmarkTapRecognizer:(id)a3;
- (void)setCheckmarkView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableCheckmark:(BOOL)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setDynamicConstraints:(id)a3;
- (void)setItem:(id)a3;
- (void)setRemoveCheckmark:(BOOL)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setStaticConstraints:(id)a3;
- (void)updateConstraints;
@end

@implementation HUEditableCheckmarkTextCell

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUEditableCheckmarkTextCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v21.receiver = self;
  v21.super_class = (Class)HUEditableCheckmarkTextCell;
  v4 = [(HUEditableCheckmarkTextCell *)&v21 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v4->_disableCheckmark = 0;
    v4->_removeCheckmark = 0;
    v4->_isChecked = 0;
    v4->_allowCheckmarkSelectionWhileDisabled = 0;
    id v6 = objc_alloc(MEMORY[0x1E4F42F10]);
    double v7 = *MEMORY[0x1E4F1DB28];
    double v8 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v11 = objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], v8, v9, v10);
    textField = v5->_textField;
    v5->_textField = (UITextField *)v11;

    [(UITextField *)v5->_textField setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    [(UITextField *)v5->_textField setFont:v13];

    [(UITextField *)v5->_textField setAdjustsFontForContentSizeCategory:1];
    [(UITextField *)v5->_textField setReturnKeyType:9];
    [(UITextField *)v5->_textField setClearButtonMode:3];
    [(UITextField *)v5->_textField setTranslatesAutoresizingMaskIntoConstraints:0];
    v14 = [(HUEditableCheckmarkTextCell *)v5 contentView];
    [v14 addSubview:v5->_textField];

    v15 = -[HUCheckmarkAccessoryView initWithFrame:]([HUCheckmarkAccessoryView alloc], "initWithFrame:", v7, v8, v9, v10);
    checkmarkView = v5->_checkmarkView;
    v5->_checkmarkView = v15;

    [(HUCheckmarkAccessoryView *)v5->_checkmarkView sizeToFit];
    [(HUCheckmarkAccessoryView *)v5->_checkmarkView setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = [(HUEditableCheckmarkTextCell *)v5 contentView];
    [v17 addSubview:v5->_checkmarkView];

    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:v5 action:sel__checkmarkTapped_];
    checkmarkTapRecognizer = v5->_checkmarkTapRecognizer;
    v5->_checkmarkTapRecognizer = (UITapGestureRecognizer *)v18;

    [(UITapGestureRecognizer *)v5->_checkmarkTapRecognizer setCancelsTouchesInView:1];
    [(UITapGestureRecognizer *)v5->_checkmarkTapRecognizer setDelegate:v5];
    [(HUCheckmarkAccessoryView *)v5->_checkmarkView setUserInteractionEnabled:1];
    [(HUCheckmarkAccessoryView *)v5->_checkmarkView addGestureRecognizer:v5->_checkmarkTapRecognizer];
  }
  return v5;
}

- (void)layoutSubviews
{
  v3 = [(HUEditableCheckmarkTextCell *)self contentView];
  [v3 layoutMargins];
  double v5 = v4;

  id v6 = [(HUEditableCheckmarkTextCell *)self checkmarkView];
  double v7 = [v6 superview];
  double v8 = [(HUEditableCheckmarkTextCell *)self contentView];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    double v10 = [(HUEditableCheckmarkTextCell *)self checkmarkView];
    [v10 frame];
    double v5 = v5 + v11 + 0.0 + 12.0;
  }
  -[HUEditableCheckmarkTextCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v5, 0.0, 0.0);
  [(HUEditableCheckmarkTextCell *)self separatorInset];
  if (v5 != v15 || v12 != 0.0 || v14 != 0.0 || v13 != 0.0)
  {
    [(HUEditableCheckmarkTextCell *)self separatorInset];
    -[HUEditableCheckmarkTextCell setSeparatorInset:](self, "setSeparatorInset:", 0.0, v5 + v5 - v16, 0.0, 0.0);
  }
  v17.receiver = self;
  v17.super_class = (Class)HUEditableCheckmarkTextCell;
  [(HUEditableCheckmarkTextCell *)&v17 layoutSubviews];
}

- (void)prepareForReuse
{
  v9.receiver = self;
  v9.super_class = (Class)HUEditableCheckmarkTextCell;
  [(HUEditableCheckmarkTextCell *)&v9 prepareForReuse];
  v3 = [(HUEditableCheckmarkTextCell *)self textField];
  [v3 setText:0];

  double v4 = [(HUEditableCheckmarkTextCell *)self textField];
  [v4 setPlaceholder:0];

  double v5 = [(HUEditableCheckmarkTextCell *)self textField];
  [v5 setDelegate:0];

  id v6 = [(HUEditableCheckmarkTextCell *)self textField];
  [v6 setEnabled:1];

  double v7 = [(HUEditableCheckmarkTextCell *)self textField];
  [v7 endEditing:1];

  [(HUEditableCheckmarkTextCell *)self setDisableCheckmark:0];
  [(HUEditableCheckmarkTextCell *)self setChecked:0];
  [(HUEditableCheckmarkTextCell *)self setAllowCheckmarkSelectionWhileDisabled:0];
  double v8 = [(HUEditableCheckmarkTextCell *)self checkmarkTapRecognizer];
  [v8 setEnabled:0];
}

- (void)setAccessoryView:(id)a3
{
  double v5 = (UIView *)a3;
  p_accessoryView = &self->_accessoryView;
  accessoryView = self->_accessoryView;
  if (accessoryView != v5)
  {
    objc_super v9 = v5;
    [(UIView *)accessoryView removeFromSuperview];
    objc_storeStrong((id *)&self->_accessoryView, a3);
    [(UIView *)*p_accessoryView setTranslatesAutoresizingMaskIntoConstraints:0];
    double v8 = [(HUEditableCheckmarkTextCell *)self contentView];
    [v8 addSubview:*p_accessoryView];

    double v5 = v9;
  }
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  if (a3)
  {
    id v4 = [(HUEditableCheckmarkTextCell *)self textField];
    [v4 becomeFirstResponder];
  }
}

- (void)setDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = !a3
    || [(HUEditableCheckmarkTextCell *)self allowCheckmarkSelectionWhileDisabled];
  BOOL v6 = !v3;
  double v7 = [(HUEditableCheckmarkTextCell *)self textField];
  [v7 setEnabled:v6];

  if (v6) {
    [MEMORY[0x1E4F428B8] labelColor];
  }
  else {
  double v8 = [MEMORY[0x1E4F428B8] systemGrayColor];
  }
  objc_super v9 = [(HUEditableCheckmarkTextCell *)self textField];
  [v9 setTextColor:v8];

  double v10 = [(HUEditableCheckmarkTextCell *)self textField];
  [v10 setClearButtonMode:v6];

  id v11 = [(HUEditableCheckmarkTextCell *)self checkmarkTapRecognizer];
  [v11 setEnabled:v5];
}

- (void)setChecked:(BOOL)a3
{
  if (self->_isChecked != a3)
  {
    BOOL v3 = a3;
    self->_isChecked = a3;
    id v4 = [(HUEditableCheckmarkTextCell *)self checkmarkView];
    [v4 setChecked:v3];
  }
}

- (void)setDisableCheckmark:(BOOL)a3
{
  if (self->_disableCheckmark != a3)
  {
    self->_disableCheckmark = a3;
    BOOL v4 = [(HUEditableCheckmarkTextCell *)self disableCheckmark];
    BOOL v5 = [(HUEditableCheckmarkTextCell *)self checkmarkView];
    BOOL v6 = v5;
    if (v4)
    {
      [v5 setDisabled:1];

      double v7 = [(HUEditableCheckmarkTextCell *)self checkmarkTapRecognizer];
      double v8 = v7;
      uint64_t v9 = 0;
    }
    else
    {
      [v5 setDisabled:0];

      double v7 = [(HUEditableCheckmarkTextCell *)self checkmarkTapRecognizer];
      double v8 = v7;
      uint64_t v9 = 1;
    }
    [v7 setEnabled:v9];

    id v10 = [(HUEditableCheckmarkTextCell *)self checkmarkView];
    objc_msgSend(v10, "setHidden:", -[HUEditableCheckmarkTextCell disableCheckmark](self, "disableCheckmark"));
  }
}

- (void)setRemoveCheckmark:(BOOL)a3
{
  if (self->_removeCheckmark != a3)
  {
    self->_removeCheckmark = a3;
    if ([(HUEditableCheckmarkTextCell *)self removeCheckmark])
    {
      BOOL v4 = [(HUEditableCheckmarkTextCell *)self checkmarkView];
      [v4 removeFromSuperview];
    }
    else
    {
      BOOL v5 = [(HUEditableCheckmarkTextCell *)self contentView];
      BOOL v6 = [(HUEditableCheckmarkTextCell *)self checkmarkView];
      [v5 addSubview:v6];

      BOOL v4 = [(HUEditableCheckmarkTextCell *)self checkmarkView];
      [v4 sizeToFit];
    }

    [(HUEditableCheckmarkTextCell *)self setNeedsUpdateConstraints];
    [(HUEditableCheckmarkTextCell *)self updateConstraintsIfNeeded];
  }
}

- (void)_checkmarkTapped:(id)a3
{
  BOOL v4 = [(HUEditableCheckmarkTextCell *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v7 = [(HUEditableCheckmarkTextCell *)self delegate];
    BOOL v6 = [(HUEditableCheckmarkTextCell *)self item];
    [v7 checkmarkTappedInCell:self forItem:v6];
  }
}

- (void)updateConstraints
{
  v85[3] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HUEditableCheckmarkTextCell *)self contentView];
  BOOL v4 = [v3 layoutMarginsGuide];

  char v5 = [(HUEditableCheckmarkTextCell *)self staticConstraints];

  v79 = v4;
  if (!v5)
  {
    BOOL v6 = [(HUEditableCheckmarkTextCell *)self contentView];
    id v7 = [v6 heightAnchor];
    double v8 = [v7 constraintGreaterThanOrEqualToConstant:44.0];

    LODWORD(v9) = 1148829696;
    v77 = v8;
    [v8 setPriority:v9];
    v85[0] = v8;
    id v10 = [(HUEditableCheckmarkTextCell *)self textField];
    id v11 = [v10 topAnchor];
    double v12 = [v4 topAnchor];
    double v13 = [v11 constraintEqualToAnchor:v12];
    v85[1] = v13;
    double v14 = [(HUEditableCheckmarkTextCell *)self textField];
    double v15 = [v14 bottomAnchor];
    double v16 = [v79 bottomAnchor];
    objc_super v17 = [v15 constraintEqualToAnchor:v16];
    v85[2] = v17;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v85 count:3];
    [(HUEditableCheckmarkTextCell *)self setStaticConstraints:v18];

    BOOL v4 = v79;
    v19 = (void *)MEMORY[0x1E4F28DC8];
    v20 = [(HUEditableCheckmarkTextCell *)self staticConstraints];
    [v19 activateConstraints:v20];

    objc_super v21 = [(HUEditableCheckmarkTextCell *)self textField];
    LODWORD(v22) = 1132068864;
    [v21 setContentHuggingPriority:0 forAxis:v22];

    v23 = [(HUEditableCheckmarkTextCell *)self contentView];
    LODWORD(v24) = 1132068864;
    [v23 setContentCompressionResistancePriority:0 forAxis:v24];
  }
  v25 = objc_opt_new();
  v26 = [(HUEditableCheckmarkTextCell *)self checkmarkView];
  v27 = [v26 superview];
  v28 = [(HUEditableCheckmarkTextCell *)self contentView];
  int v29 = [v27 isEqual:v28];

  v30 = [(HUEditableCheckmarkTextCell *)self textField];
  v31 = [v30 leadingAnchor];
  v78 = v25;
  if (v29)
  {
    v69 = [(HUEditableCheckmarkTextCell *)self checkmarkView];
    uint64_t v65 = [v69 trailingAnchor];
    v32 = [v31 constraintEqualToAnchor:v65 constant:12.0];
    v84[0] = v32;
    v71 = [(HUEditableCheckmarkTextCell *)self checkmarkView];
    v66 = [v71 widthAnchor];
    v67 = [(HUEditableCheckmarkTextCell *)self checkmarkView];
    v64 = [v67 heightAnchor];
    v63 = [v66 constraintEqualToAnchor:v64];
    v84[1] = v63;
    v62 = [(HUEditableCheckmarkTextCell *)self checkmarkView];
    v61 = [v62 leadingAnchor];
    [v4 leadingAnchor];
    v33 = v73 = v31;
    v34 = [v61 constraintEqualToAnchor:v33];
    v84[2] = v34;
    v35 = [(HUEditableCheckmarkTextCell *)self checkmarkView];
    [v35 centerYAnchor];
    v36 = v75 = v30;
    v37 = [v4 centerYAnchor];
    v38 = [v36 constraintEqualToAnchor:v37];
    v84[3] = v38;
    v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v84 count:4];
    [v25 addObjectsFromArray:v39];

    BOOL v4 = v79;
    v30 = v75;

    v40 = (void *)v65;
    v41 = v69;

    v31 = v73;
  }
  else
  {
    v41 = [v4 leadingAnchor];
    v40 = [v31 constraintEqualToAnchor:v41];
    v83 = v40;
    v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v83 count:1];
    [v25 addObjectsFromArray:v32];
  }

  v42 = [(HUEditableCheckmarkTextCell *)self accessoryView];

  v43 = [(HUEditableCheckmarkTextCell *)self textField];
  v44 = [v43 trailingAnchor];
  if (v42)
  {
    v76 = [(HUEditableCheckmarkTextCell *)self accessoryView];
    v74 = [v76 leadingAnchor];
    v72 = [v44 constraintEqualToAnchor:v74];
    v82[0] = v72;
    v70 = [(HUEditableCheckmarkTextCell *)self accessoryView];
    v68 = [v70 centerYAnchor];
    v45 = [v4 centerYAnchor];
    v46 = [v68 constraintEqualToAnchor:v45];
    v82[1] = v46;
    v47 = [(HUEditableCheckmarkTextCell *)self accessoryView];
    v48 = [v47 trailingAnchor];
    v49 = [v4 trailingAnchor];
    v50 = [v48 constraintEqualToAnchor:v49];
    v82[2] = v50;
    v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v82 count:3];
    [v78 addObjectsFromArray:v51];

    BOOL v4 = v79;
    v52 = v78;

    v43 = [(HUEditableCheckmarkTextCell *)self accessoryView];
    LODWORD(v53) = 1144766464;
    [v43 setContentCompressionResistancePriority:0 forAxis:v53];
  }
  else
  {
    v54 = [v4 trailingAnchor];
    v55 = [v44 constraintEqualToAnchor:v54];
    v81 = v55;
    v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v81 count:1];
    v52 = v25;
    [v25 addObjectsFromArray:v56];
  }
  v57 = (void *)MEMORY[0x1E4F28DC8];
  v58 = [(HUEditableCheckmarkTextCell *)self dynamicConstraints];
  [v57 deactivateConstraints:v58];

  [(HUEditableCheckmarkTextCell *)self setDynamicConstraints:v52];
  v59 = (void *)MEMORY[0x1E4F28DC8];
  v60 = [(HUEditableCheckmarkTextCell *)self dynamicConstraints];
  [v59 activateConstraints:v60];

  v80.receiver = self;
  v80.super_class = (Class)HUEditableCheckmarkTextCell;
  [(HUEditableCheckmarkTextCell *)&v80 updateConstraints];
}

- (id)accessoryView
{
  return self->_accessoryView;
}

- (UITextField)textField
{
  return self->_textField;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (HFItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (BOOL)disableCheckmark
{
  return self->_disableCheckmark;
}

- (BOOL)removeCheckmark
{
  return self->_removeCheckmark;
}

- (BOOL)isChecked
{
  return self->_isChecked;
}

- (BOOL)allowCheckmarkSelectionWhileDisabled
{
  return self->_allowCheckmarkSelectionWhileDisabled;
}

- (void)setAllowCheckmarkSelectionWhileDisabled:(BOOL)a3
{
  self->_allowCheckmarkSelectionWhileDisabled = a3;
}

- (HUEditableCheckmarkDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUEditableCheckmarkDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HUCheckmarkAccessoryView)checkmarkView
{
  return self->_checkmarkView;
}

- (void)setCheckmarkView:(id)a3
{
}

- (NSArray)staticConstraints
{
  return self->_staticConstraints;
}

- (void)setStaticConstraints:(id)a3
{
}

- (NSArray)dynamicConstraints
{
  return self->_dynamicConstraints;
}

- (void)setDynamicConstraints:(id)a3
{
}

- (UITapGestureRecognizer)checkmarkTapRecognizer
{
  return self->_checkmarkTapRecognizer;
}

- (void)setCheckmarkTapRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkmarkTapRecognizer, 0);
  objc_storeStrong((id *)&self->_dynamicConstraints, 0);
  objc_storeStrong((id *)&self->_staticConstraints, 0);
  objc_storeStrong((id *)&self->_checkmarkView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_textField, 0);

  objc_storeStrong((id *)&self->_accessoryView, 0);
}

@end