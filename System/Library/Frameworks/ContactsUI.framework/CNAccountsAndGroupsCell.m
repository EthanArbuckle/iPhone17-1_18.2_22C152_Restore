@interface CNAccountsAndGroupsCell
- (BOOL)isCellEditing;
- (BOOL)isValidTitle:(id)a3;
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (BOOL)textViewShouldBeginEditing:(id)a3;
- (CNAccountsAndGroupsCellDelegate)delegate;
- (CNAccountsAndGroupsCellTextView)titleTextView;
- (CNAccountsAndGroupsItem)item;
- (double)requiredHeightForTextView:(id)a3 fittingWidth:(double)a4;
- (double)titleTextViewHeight;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)applyAccessoryTintColor:(id)a3;
- (void)applyTextColor:(id)a3;
- (void)applyTextViewPlaceholderIfNeeded;
- (void)applyTextViewTintColor:(id)a3;
- (void)beginEditingName;
- (void)endEditingName;
- (void)prepareForDisplay;
- (void)prepareForReuse;
- (void)resetTextFieldEnabled;
- (void)setDelegate:(id)a3;
- (void)setItem:(id)a3;
- (void)setTextViewEnabled:(BOOL)a3;
- (void)setTitleTextView:(id)a3;
- (void)setTitleTextViewHeight:(double)a3;
- (void)setupTextViewConstraints;
- (void)textViewDidBeginEditing:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
@end

@implementation CNAccountsAndGroupsCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleTextView, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_item, 0);
}

- (void)setTitleTextViewHeight:(double)a3
{
  self->_titleTextViewHeight = a3;
}

- (double)titleTextViewHeight
{
  return self->_titleTextViewHeight;
}

- (void)setTitleTextView:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (CNAccountsAndGroupsCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNAccountsAndGroupsCellDelegate *)WeakRetained;
}

- (CNAccountsAndGroupsItem)item
{
  return self->_item;
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)CNAccountsAndGroupsCell;
  [(CNAccountsAndGroupsCell *)&v4 prepareForReuse];
  v3 = [(CNAccountsAndGroupsCell *)self titleTextView];
  [v3 removeFromSuperview];

  [(CNAccountsAndGroupsCell *)self setTitleTextView:0];
  [(CNAccountsAndGroupsCell *)self setNeedsLayout];
}

- (BOOL)isValidTitle:(id)a3
{
  id v3 = a3;
  objc_super v4 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  if ((*(unsigned int (**)(void))(*MEMORY[0x1E4F5A2A0] + 16))())
  {
    v5 = [v3 stringByTrimmingCharactersInSet:v4];
    BOOL v6 = [v5 length] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)textViewDidEndEditing:(id)a3
{
  id v15 = [a3 text];
  if ((unint64_t)[v15 length] < 0x12D)
  {
    id v5 = v15;
  }
  else
  {
    uint64_t v4 = [v15 substringToIndex:300];

    id v5 = (id)v4;
  }
  id v16 = v5;
  if (![(CNAccountsAndGroupsCell *)self isValidTitle:v5])
  {
    BOOL v6 = [(CNAccountsAndGroupsCell *)self item];
    uint64_t v7 = [v6 name];

    v8 = [(CNAccountsAndGroupsCell *)self item];
    v9 = [v8 name];
    v10 = [(CNAccountsAndGroupsCell *)self titleTextView];
    [v10 setText:v9];

    id v16 = (id)v7;
  }
  v11 = [(CNAccountsAndGroupsCell *)self delegate];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    v13 = [(CNAccountsAndGroupsCell *)self delegate];
    v14 = [(CNAccountsAndGroupsCell *)self item];
    [v13 item:v14 didEndEditingWithName:v16];
  }
  [(CNAccountsAndGroupsCell *)self resetTextFieldEnabled];
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  [v4 frame];
  [(CNAccountsAndGroupsCell *)self requiredHeightForTextView:v4 fittingWidth:v5];
  double v7 = v6;

  [(CNAccountsAndGroupsCell *)self titleTextViewHeight];
  if (v8 != v7)
  {
    [(CNAccountsAndGroupsCell *)self setTitleTextViewHeight:v7];
    id v9 = [(CNAccountsAndGroupsCell *)self delegate];
    [v9 cellTextViewDidChangeHeight];
  }
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  id v7 = a5;
  id v8 = a3;
  if ([v7 isEqualToString:@"\n"])
  {
    [v8 resignFirstResponder];

    BOOL v9 = 0;
  }
  else
  {
    v10 = [v8 text];

    uint64_t v11 = [v10 length];
    uint64_t v12 = v11 - length + [v7 length];

    BOOL v9 = v12 < 300;
  }

  return v9;
}

- (void)textViewDidBeginEditing:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__CNAccountsAndGroupsCell_textViewDidBeginEditing___block_invoke;
  block[3] = &unk_1E549B488;
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __51__CNAccountsAndGroupsCell_textViewDidBeginEditing___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) selectAll:0];
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  id v4 = a3;
  double v5 = [(CNAccountsAndGroupsCell *)self item];
  int v6 = [v5 canRename];

  if (v6)
  {
    [v4 frame];
    [(CNAccountsAndGroupsCell *)self requiredHeightForTextView:v4 fittingWidth:v7];
    -[CNAccountsAndGroupsCell setTitleTextViewHeight:](self, "setTitleTextViewHeight:");
  }

  return v6;
}

- (BOOL)isCellEditing
{
  v2 = [(CNAccountsAndGroupsCell *)self titleTextView];
  char v3 = [v2 isFirstResponder];

  return v3;
}

- (void)endEditingName
{
  char v3 = [(CNAccountsAndGroupsCell *)self titleTextView];
  int v4 = [v3 isFirstResponder];

  if (v4)
  {
    id v5 = [(CNAccountsAndGroupsCell *)self titleTextView];
    [v5 resignFirstResponder];
  }
}

- (void)beginEditingName
{
  [(CNAccountsAndGroupsCell *)self setTextViewEnabled:1];
  id v3 = [(CNAccountsAndGroupsCell *)self titleTextView];
  [v3 becomeFirstResponder];
}

- (void)applyAccessoryTintColor:(id)a3
{
  id v4 = a3;
  id v5 = [(CNAccountsAndGroupsCell *)self accessories];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__CNAccountsAndGroupsCell_applyAccessoryTintColor___block_invoke;
  v8[3] = &unk_1E549AE20;
  id v9 = v4;
  id v6 = v4;
  double v7 = objc_msgSend(v5, "_cn_map:", v8);

  [(CNAccountsAndGroupsCell *)self setAccessories:v7];
}

id __51__CNAccountsAndGroupsCell_applyAccessoryTintColor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    objc_opt_class();
    id v5 = v3;
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;

    uint64_t v8 = *(void *)(a1 + 32);
    if (v7)
    {
      id v9 = [v7 customView];
      [v9 setTintColor:v8];

      id v5 = v7;
    }
    else
    {
      [v5 setTintColor:v8];
    }
    id v10 = v5;
  }

  return v3;
}

- (void)applyTextViewTintColor:(id)a3
{
}

- (void)applyTextColor:(id)a3
{
}

- (void)applyTextViewPlaceholderIfNeeded
{
  id v3 = [(CNAccountsAndGroupsCell *)self item];
  id v4 = [v3 identifier];
  int v5 = [v4 isEqualToString:@"groupPlaceholderIdentifier"];

  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x1E4F28B18]);
    CNContactsUIBundle();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    id v7 = [v10 localizedStringForKey:@"NEW_GROUP_NAME_PLACEHOLDER" value:&stru_1ED8AC728 table:@"Localized"];
    uint64_t v8 = (void *)[v6 initWithString:v7];
    id v9 = [(CNAccountsAndGroupsCell *)self titleTextView];
    [v9 setAttributedPlaceholder:v8];
  }
}

- (double)requiredHeightForTextView:(id)a3 fittingWidth:(double)a4
{
  objc_msgSend(a3, "sizeThatFits:", a4, 1.79769313e308);
  float v5 = v4;
  return ceilf(v5);
}

- (CNAccountsAndGroupsCellTextView)titleTextView
{
  titleTextView = self->_titleTextView;
  if (!titleTextView)
  {
    double v4 = [CNAccountsAndGroupsCellTextView alloc];
    float v5 = -[CNAccountsAndGroupsCellTextView initWithFrame:](v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    id v6 = self->_titleTextView;
    self->_titleTextView = v5;

    [(CNAccountsAndGroupsCellTextView *)self->_titleTextView setDelegate:self];
    id v7 = [(CNAccountsAndGroupsCell *)self contentView];
    uint64_t v8 = [v7 backgroundColor];
    [(CNAccountsAndGroupsCellTextView *)self->_titleTextView setBackgroundColor:v8];

    id v9 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
    [(CNAccountsAndGroupsCellTextView *)self->_titleTextView setFont:v9];

    [(CNAccountsAndGroupsCellTextView *)self->_titleTextView setTextAlignment:4];
    [(CNAccountsAndGroupsCellTextView *)self->_titleTextView setBounces:0];
    [(CNAccountsAndGroupsCellTextView *)self->_titleTextView setAutocorrectionType:1];
    [(CNAccountsAndGroupsCellTextView *)self->_titleTextView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CNAccountsAndGroupsCellTextView *)self->_titleTextView setScrollEnabled:0];
    [(CNAccountsAndGroupsCellTextView *)self->_titleTextView setReturnKeyType:9];
    id v10 = [(CNAccountsAndGroupsCell *)self contentView];
    uint64_t v11 = [v10 effectiveUserInterfaceLayoutDirection];

    if (v11 == 1) {
      double v12 = 0.0;
    }
    else {
      double v12 = 1.0;
    }
    if (v11 == 1) {
      double v13 = 1.0;
    }
    else {
      double v13 = 0.0;
    }
    -[CNAccountsAndGroupsCellTextView setTextContainerInset:](self->_titleTextView, "setTextContainerInset:", 11.0, v12, 11.0, v13);
    [(CNAccountsAndGroupsCell *)self setupTextViewConstraints];
    titleTextView = self->_titleTextView;
  }

  return titleTextView;
}

- (void)setTextViewEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v7 = [(CNAccountsAndGroupsCell *)self item];
  uint64_t v5 = [v7 canRename] & v3;
  id v6 = [(CNAccountsAndGroupsCell *)self titleTextView];
  [v6 setUserInteractionEnabled:v5];
}

- (void)resetTextFieldEnabled
{
  id v3 = [(CNAccountsAndGroupsCell *)self delegate];
  -[CNAccountsAndGroupsCell setTextViewEnabled:](self, "setTextViewEnabled:", [v3 isCollectionViewEditing]);
}

- (void)setItem:(id)a3
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_item, a3);
  if (v8)
  {
    uint64_t v5 = [v8 name];
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v6 = [(CNAccountsAndGroupsCell *)self titleTextView];
  [v6 setText:v5];

  id v7 = v8;
  if (v8)
  {

    id v7 = v8;
  }
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  [(CNAccountsAndGroupsCell *)self setNeedsLayout];
  [(CNAccountsAndGroupsCell *)self layoutIfNeeded];
  v18.receiver = self;
  v18.super_class = (Class)CNAccountsAndGroupsCell;
  uint64_t v5 = [(CNAccountsAndGroupsCell *)&v18 preferredLayoutAttributesFittingAttributes:v4];

  id v6 = [(CNAccountsAndGroupsCell *)self contentView];
  [v6 bounds];
  double v8 = v7;
  id v9 = [(CNAccountsAndGroupsCell *)self contentView];
  [v9 layoutMargins];
  double v11 = v8 - v10;
  double v12 = [(CNAccountsAndGroupsCell *)self contentView];
  [v12 layoutMargins];
  float v14 = v11 - v13 + -1.0;
  double v15 = floorf(v14);

  id v16 = [(CNAccountsAndGroupsCell *)self titleTextView];
  [(CNAccountsAndGroupsCell *)self requiredHeightForTextView:v16 fittingWidth:v15];

  [v5 size];
  objc_msgSend(v5, "setSize:");

  return v5;
}

- (void)setupTextViewConstraints
{
  v46[6] = *MEMORY[0x1E4F143B8];
  id v3 = [(CNAccountsAndGroupsCell *)self titleTextView];
  id v4 = [v3 superview];

  if (!v4)
  {
    uint64_t v5 = [(CNAccountsAndGroupsCell *)self contentView];
    id v6 = [(CNAccountsAndGroupsCell *)self titleTextView];
    [v5 addSubview:v6];

    v45 = [(CNAccountsAndGroupsCell *)self titleTextView];
    v43 = [v45 leadingAnchor];
    v44 = [(CNAccountsAndGroupsCell *)self contentView];
    v42 = [v44 layoutMarginsGuide];
    v41 = [v42 leadingAnchor];
    v40 = [v43 constraintEqualToAnchor:v41];
    v46[0] = v40;
    v39 = [(CNAccountsAndGroupsCell *)self titleTextView];
    v37 = [v39 trailingAnchor];
    v38 = [(CNAccountsAndGroupsCell *)self contentView];
    v36 = [v38 layoutMarginsGuide];
    v35 = [v36 trailingAnchor];
    v34 = [v37 constraintEqualToAnchor:v35];
    v46[1] = v34;
    v33 = [(CNAccountsAndGroupsCell *)self titleTextView];
    v31 = [v33 centerYAnchor];
    v32 = [(CNAccountsAndGroupsCell *)self contentView];
    v30 = [v32 safeAreaLayoutGuide];
    v29 = [v30 centerYAnchor];
    v28 = [v31 constraintEqualToAnchor:v29];
    v46[2] = v28;
    v27 = [(CNAccountsAndGroupsCell *)self titleTextView];
    v25 = [v27 topAnchor];
    v26 = [(CNAccountsAndGroupsCell *)self contentView];
    v24 = [v26 safeAreaLayoutGuide];
    v22 = [v24 topAnchor];
    v21 = [v25 constraintGreaterThanOrEqualToAnchor:v22];
    v46[3] = v21;
    v20 = [(CNAccountsAndGroupsCell *)self titleTextView];
    objc_super v18 = [v20 bottomAnchor];
    v19 = [(CNAccountsAndGroupsCell *)self contentView];
    double v7 = [v19 safeAreaLayoutGuide];
    double v8 = [v7 bottomAnchor];
    id v9 = [v18 constraintLessThanOrEqualToAnchor:v8];
    v46[4] = v9;
    double v10 = [(CNAccountsAndGroupsCell *)self separatorLayoutGuide];
    double v11 = [v10 leadingAnchor];
    double v12 = [(CNAccountsAndGroupsCell *)self titleTextView];
    double v13 = [v12 leadingAnchor];
    float v14 = [(CNAccountsAndGroupsCell *)self titleTextView];
    double v15 = [v14 textContainer];
    [v15 lineFragmentPadding];
    v17 = [v11 constraintEqualToAnchor:v13 constant:v16 + 1.0];
    v46[5] = v17;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:6];

    [MEMORY[0x1E4F28DC8] activateConstraints:v23];
  }
}

- (void)prepareForDisplay
{
  [(CNAccountsAndGroupsCell *)self resetTextFieldEnabled];

  [(CNAccountsAndGroupsCell *)self applyTextViewPlaceholderIfNeeded];
}

@end