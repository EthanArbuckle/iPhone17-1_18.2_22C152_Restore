@interface HUEditableTextCollectionListCell
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)isDisabled;
- (HUEditableTextCollectionListCell)initWithFrame:(CGRect)a3;
- (NSArray)listContentViewConstraints;
- (NSArray)textFieldConstraints;
- (UIListContentView)listContentView;
- (UITextField)textField;
- (void)prepareForReuse;
- (void)setContentConfiguration:(id)a3;
- (void)setDisabled:(BOOL)a3;
- (void)setListContentView:(id)a3;
- (void)setListContentViewConstraints:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setTextFieldConstraints:(id)a3;
- (void)updateConstraints;
@end

@implementation HUEditableTextCollectionListCell

- (HUEditableTextCollectionListCell)initWithFrame:(CGRect)a3
{
  v20.receiver = self;
  v20.super_class = (Class)HUEditableTextCollectionListCell;
  v3 = -[HUEditableTextCollectionListCell initWithFrame:](&v20, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (UITextField *)objc_alloc_init(MEMORY[0x1E4F42F10]);
    textField = v3->_textField;
    v3->_textField = v4;

    v6 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    v7 = [(HUEditableTextCollectionListCell *)v3 textField];
    [v7 setFont:v6];

    v8 = [(HUEditableTextCollectionListCell *)v3 textField];
    [v8 setAdjustsFontForContentSizeCategory:1];

    v9 = [(HUEditableTextCollectionListCell *)v3 textField];
    [v9 setReturnKeyType:9];

    v10 = [(HUEditableTextCollectionListCell *)v3 textField];
    [v10 setClearButtonMode:3];

    v11 = [(HUEditableTextCollectionListCell *)v3 contentView];
    v12 = [(HUEditableTextCollectionListCell *)v3 textField];
    [v11 addSubview:v12];

    id v13 = objc_alloc(MEMORY[0x1E4F42B60]);
    v14 = [(HUEditableTextCollectionListCell *)v3 defaultContentConfiguration];
    v15 = (void *)[v13 initWithConfiguration:v14];
    [(HUEditableTextCollectionListCell *)v3 setListContentView:v15];

    v16 = [(HUEditableTextCollectionListCell *)v3 listContentView];
    [v16 setHidden:1];

    v17 = [(HUEditableTextCollectionListCell *)v3 contentView];
    v18 = [(HUEditableTextCollectionListCell *)v3 listContentView];
    [v17 addSubview:v18];
  }
  return v3;
}

- (void)prepareForReuse
{
  v10.receiver = self;
  v10.super_class = (Class)HUEditableTextCollectionListCell;
  [(HUEditableTextCollectionListCell *)&v10 prepareForReuse];
  v3 = [(HUEditableTextCollectionListCell *)self textField];
  [v3 setText:0];

  v4 = [(HUEditableTextCollectionListCell *)self textField];
  [v4 setPlaceholder:0];

  v5 = [(HUEditableTextCollectionListCell *)self textField];
  [v5 setDelegate:0];

  v6 = [(HUEditableTextCollectionListCell *)self textField];
  [v6 setEnabled:1];

  v7 = [(HUEditableTextCollectionListCell *)self textField];
  [v7 endEditing:1];

  v8 = [(HUEditableTextCollectionListCell *)self textField];
  [v8 setHidden:0];

  v9 = [(HUEditableTextCollectionListCell *)self listContentView];
  [v9 setHidden:1];
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (void)setContentConfiguration:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v15 = v4;
  if (objc_opt_isKindOfClass()) {
    v5 = v15;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  v7 = [(HUEditableTextCollectionListCell *)self listContentView];
  [v7 setConfiguration:v6];

  v8 = [v6 text];
  uint64_t v9 = [v8 length];

  objc_super v10 = [(HUEditableTextCollectionListCell *)self textField];
  v11 = v10;
  if (v9)
  {
    [v10 setHidden:1];

    v12 = [(HUEditableTextCollectionListCell *)self listContentView];
    id v13 = v12;
    uint64_t v14 = 0;
  }
  else
  {
    [v10 setHidden:0];

    v12 = [(HUEditableTextCollectionListCell *)self listContentView];
    id v13 = v12;
    uint64_t v14 = 1;
  }
  [v12 setHidden:v14];

  [(HUEditableTextCollectionListCell *)self setNeedsUpdateConstraints];
}

- (void)setDisabled:(BOOL)a3
{
  BOOL v4 = !a3;
  v5 = [(HUEditableTextCollectionListCell *)self textField];
  [v5 setEnabled:v4];

  if (v4) {
    [MEMORY[0x1E4F428B8] labelColor];
  }
  else {
  id v6 = [MEMORY[0x1E4F428B8] systemGrayColor];
  }
  v7 = [(HUEditableTextCollectionListCell *)self textField];
  [v7 setTextColor:v6];

  id v8 = [(HUEditableTextCollectionListCell *)self textField];
  [v8 setClearButtonMode:v4];
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HUEditableTextCollectionListCell;
  -[HUEditableTextCollectionListCell setSelected:](&v8, sel_setSelected_);
  if (v3)
  {
    v5 = [(HUEditableTextCollectionListCell *)self textField];
    [v5 becomeFirstResponder];
  }
  id v6 = [(HUEditableTextCollectionListCell *)self textField];
  [v6 setHidden:v3];

  v7 = [(HUEditableTextCollectionListCell *)self listContentView];
  [v7 setHidden:v3 ^ 1];
}

- (void)updateConstraints
{
  v59.receiver = self;
  v59.super_class = (Class)HUEditableTextCollectionListCell;
  [(HUEditableTextCollectionListCell *)&v59 updateConstraints];
  BOOL v3 = [(HUEditableTextCollectionListCell *)self textFieldConstraints];

  if (!v3)
  {
    BOOL v4 = [MEMORY[0x1E4F1CA48] array];
    v5 = [(HUEditableTextCollectionListCell *)self textField];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v6 = [(HUEditableTextCollectionListCell *)self textField];
    v7 = [v6 topAnchor];
    objc_super v8 = [(HUEditableTextCollectionListCell *)self contentView];
    uint64_t v9 = [v8 layoutMarginsGuide];
    objc_super v10 = [v9 topAnchor];
    v11 = [v7 constraintEqualToAnchor:v10];
    [v4 addObject:v11];

    v12 = [(HUEditableTextCollectionListCell *)self textField];
    id v13 = [v12 bottomAnchor];
    uint64_t v14 = [(HUEditableTextCollectionListCell *)self contentView];
    id v15 = [v14 layoutMarginsGuide];
    v16 = [v15 bottomAnchor];
    v17 = [v13 constraintEqualToAnchor:v16];
    [v4 addObject:v17];

    v18 = [(HUEditableTextCollectionListCell *)self textField];
    v19 = [v18 leadingAnchor];
    objc_super v20 = [(HUEditableTextCollectionListCell *)self contentView];
    v21 = [v20 layoutMarginsGuide];
    v22 = [v21 leadingAnchor];
    v23 = [v19 constraintEqualToAnchor:v22];
    [v4 addObject:v23];

    v24 = [(HUEditableTextCollectionListCell *)self textField];
    v25 = [v24 trailingAnchor];
    v26 = [(HUEditableTextCollectionListCell *)self contentView];
    v27 = [v26 layoutMarginsGuide];
    v28 = [v27 trailingAnchor];
    v29 = [v25 constraintEqualToAnchor:v28];
    [v4 addObject:v29];

    [(HUEditableTextCollectionListCell *)self setTextFieldConstraints:v4];
  }
  v30 = [(HUEditableTextCollectionListCell *)self listContentViewConstraints];

  if (!v30)
  {
    v31 = [MEMORY[0x1E4F1CA48] array];
    v32 = [(HUEditableTextCollectionListCell *)self listContentView];
    [v32 setTranslatesAutoresizingMaskIntoConstraints:0];

    v33 = [(HUEditableTextCollectionListCell *)self listContentView];
    v34 = [v33 leadingAnchor];
    v35 = [(HUEditableTextCollectionListCell *)self leadingAnchor];
    v36 = [v34 constraintEqualToAnchor:v35];
    [v31 addObject:v36];

    v37 = [(HUEditableTextCollectionListCell *)self listContentView];
    v38 = [v37 trailingAnchor];
    v39 = [(HUEditableTextCollectionListCell *)self layoutMarginsGuide];
    v40 = [v39 trailingAnchor];
    v41 = [v38 constraintEqualToAnchor:v40];
    [v31 addObject:v41];

    v42 = [(HUEditableTextCollectionListCell *)self listContentView];
    v43 = [v42 topAnchor];
    v44 = [(HUEditableTextCollectionListCell *)self layoutMarginsGuide];
    v45 = [v44 topAnchor];
    v46 = [v43 constraintEqualToAnchor:v45];
    [v31 addObject:v46];

    v47 = [(HUEditableTextCollectionListCell *)self listContentView];
    v48 = [v47 bottomAnchor];
    v49 = [(HUEditableTextCollectionListCell *)self layoutMarginsGuide];
    v50 = [v49 bottomAnchor];
    v51 = [v48 constraintEqualToAnchor:v50];
    [v31 addObject:v51];

    [(HUEditableTextCollectionListCell *)self setListContentViewConstraints:v31];
  }
  v52 = [(HUEditableTextCollectionListCell *)self textField];
  int v53 = [v52 isHidden];

  v54 = (void *)MEMORY[0x1E4F28DC8];
  v55 = [(HUEditableTextCollectionListCell *)self textFieldConstraints];
  if (v53)
  {
    [v54 deactivateConstraints:v55];

    v56 = (void *)MEMORY[0x1E4F28DC8];
    v57 = [(HUEditableTextCollectionListCell *)self listContentViewConstraints];
    [v56 activateConstraints:v57];
  }
  else
  {
    [v54 activateConstraints:v55];

    v58 = (void *)MEMORY[0x1E4F28DC8];
    v57 = [(HUEditableTextCollectionListCell *)self listContentViewConstraints];
    [v58 deactivateConstraints:v57];
  }
}

- (UITextField)textField
{
  return self->_textField;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (UIListContentView)listContentView
{
  return self->_listContentView;
}

- (void)setListContentView:(id)a3
{
}

- (NSArray)textFieldConstraints
{
  return self->_textFieldConstraints;
}

- (void)setTextFieldConstraints:(id)a3
{
}

- (NSArray)listContentViewConstraints
{
  return self->_listContentViewConstraints;
}

- (void)setListContentViewConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listContentViewConstraints, 0);
  objc_storeStrong((id *)&self->_textFieldConstraints, 0);
  objc_storeStrong((id *)&self->_listContentView, 0);

  objc_storeStrong((id *)&self->_textField, 0);
}

@end