@interface CNAddressComponentTextFieldCell
+ (Class)containerViewClass;
+ (id)cellIdentifier;
- (BOOL)showsChevron;
- (CNAddressComponentTextFieldCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSArray)textFields;
- (NSDictionary)textAttributes;
- (UIImageView)chevron;
- (UITextField)textField;
- (id)newTextField;
- (void)prepareForReuse;
- (void)setChevron:(id)a3;
- (void)setShowsChevron:(BOOL)a3;
- (void)setTextAttributes:(id)a3;
- (void)setTextField:(id)a3;
- (void)setupTextFields;
- (void)updateMargins;
@end

@implementation CNAddressComponentTextFieldCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chevron, 0);

  objc_storeStrong((id *)&self->_textField, 0);
}

- (void)setChevron:(id)a3
{
}

- (void)setTextField:(id)a3
{
}

- (UITextField)textField
{
  return self->_textField;
}

- (BOOL)showsChevron
{
  return self->_showsChevron;
}

- (NSDictionary)textAttributes
{
  v2 = [(CNAddressComponentTextFieldCell *)self textField];
  v3 = objc_msgSend(v2, "ab_textAttributes");

  return (NSDictionary *)v3;
}

- (void)setTextAttributes:(id)a3
{
  id v7 = a3;
  v4 = [(CNAddressComponentTextFieldCell *)self textField];
  objc_msgSend(v4, "ab_textAttributes");
  id v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v7)
  {
    v6 = [(CNAddressComponentTextFieldCell *)self textField];
    objc_msgSend(v6, "setAb_textAttributes:", v7);
  }
}

- (NSArray)textFields
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(CNAddressComponentTextFieldCell *)self textField];
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return (NSArray *)v3;
}

- (void)setShowsChevron:(BOOL)a3
{
  BOOL v3 = a3;
  v12[2] = *MEMORY[0x1E4F143B8];
  self->_showsChevron = a3;
  id v5 = [(CNAddressComponentTextFieldCell *)self textField];

  if (v5)
  {
    if (v3)
    {
      LODWORD(v6) = 1148846080;
      -[UIImageView setLayoutSize:withContentPriority:](self->_chevron, "setLayoutSize:withContentPriority:", *MEMORY[0x1E4F4BED8], *(double *)(MEMORY[0x1E4F4BED8] + 8), v6);
      [(UIImageView *)self->_chevron setHidden:0];
      id v7 = [(CNAddressComponentTextFieldCell *)self textField];
      v12[0] = v7;
      v8 = [(CNAddressComponentTextFieldCell *)self chevron];
      v12[1] = v8;
      v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:2];
      v10 = [(NUITableViewContainerCell *)self containerView];
      [v10 setArrangedSubviews:v9];
    }
    else
    {
      id v7 = [(CNAddressComponentTextFieldCell *)self textField];
      v11 = v7;
      v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v11 count:1];
      v9 = [(NUITableViewContainerCell *)self containerView];
      [v9 setArrangedSubviews:v8];
    }
  }
}

- (UIImageView)chevron
{
  chevron = self->_chevron;
  if (!chevron)
  {
    v4 = objc_msgSend(MEMORY[0x1E4FB1818], "cnui_symbolImageForContactCardChevron");
    id v5 = (UIImageView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:v4];
    double v6 = self->_chevron;
    self->_chevron = v5;

    [(UIImageView *)self->_chevron setContentMode:1];
    LODWORD(v7) = 1148846080;
    -[UIImageView setLayoutSize:withContentPriority:](self->_chevron, "setLayoutSize:withContentPriority:", *MEMORY[0x1E4F4BED8], *(double *)(MEMORY[0x1E4F4BED8] + 8), v7);
    -[UIImageView setDirectionalLayoutMargins:](self->_chevron, "setDirectionalLayoutMargins:", *MEMORY[0x1E4FB12A8], 8.0, *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));

    chevron = self->_chevron;
  }

  return chevron;
}

- (void)updateMargins
{
  double v3 = *MEMORY[0x1E4FB12A8];
  double v4 = *(double *)(MEMORY[0x1E4FB12A8] + 8);
  double v5 = *(double *)(MEMORY[0x1E4FB12A8] + 16);
  double v6 = *(double *)(MEMORY[0x1E4FB12A8] + 24);
  if (!objc_msgSend(MEMORY[0x1E4FB08E0], "ab_preferredContentSizeCategoryIsAccessibilityCategory")) {
    double v4 = 16.0;
  }
  id v7 = [(NUITableViewContainerCell *)self containerView];
  objc_msgSend(v7, "setDirectionalLayoutMargins:", v3, v4, v5, v6);
}

- (id)newTextField
{
  v2 = [CNTextField alloc];
  double v3 = -[CNTextField initWithFrame:](v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(CNTextField *)v3 setClearButtonMode:0];
  double v4 = [(CNTextField *)v3 textInputTraits];
  [v4 setReturnKeyGoesToNextResponder:1];

  [(UITextField *)v3 _cnui_applyContactStyle];
  return v3;
}

- (void)prepareForReuse
{
  self->_showsChevron = 0;
  LODWORD(v2) = 1148846080;
  -[UIImageView setLayoutSize:withContentPriority:](self->_chevron, "setLayoutSize:withContentPriority:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8), v2);
  [(UIImageView *)self->_chevron setHidden:1];
  [(CNAddressComponentTextFieldCell *)self setSelectionStyle:0];
  double v4 = [(CNAddressComponentTextFieldCell *)self textField];
  [v4 setDelegate:0];

  v5.receiver = self;
  v5.super_class = (Class)CNAddressComponentTextFieldCell;
  [(CNAddressComponentTextFieldCell *)&v5 prepareForReuse];
}

- (void)setupTextFields
{
  id v3 = [(CNAddressComponentTextFieldCell *)self newTextField];
  [(CNAddressComponentTextFieldCell *)self setTextField:v3];

  id v5 = [(NUITableViewContainerCell *)self containerView];
  double v4 = [(CNAddressComponentTextFieldCell *)self textField];
  [v5 addArrangedSubview:v4];
}

- (CNAddressComponentTextFieldCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CNAddressComponentTextFieldCell;
  double v4 = [(NUITableViewContainerCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  id v5 = v4;
  if (v4)
  {
    [(CNAddressComponentTextFieldCell *)v4 setSelectionStyle:0];
    [(CNAddressComponentTextFieldCell *)v5 setupTextFields];
    [(CNAddressComponentTextFieldCell *)v5 contentSizeCategoryDidChange:0];
    double v6 = [(NUITableViewContainerCell *)v5 containerView];
    [v6 setAxis:0];
  }
  id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 addObserver:v5 selector:sel_contentSizeCategoryDidChange_ name:*MEMORY[0x1E4FB27A8] object:0];

  return v5;
}

+ (id)cellIdentifier
{
  return @"CNAddressComponentTextFieldCell";
}

+ (Class)containerViewClass
{
  return (Class)objc_opt_class();
}

@end