@interface HUServiceDetailsHeaderCell
+ (BOOL)requiresConstraintBasedLayout;
- (HFItem)item;
- (HUResizableCellDelegate)resizingDelegate;
- (HUServiceDetailsHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (NSArray)hiddenMessageTextViewConstraints;
- (NSArray)visibleMessageTextViewConstraints;
- (NSLayoutConstraint)actionBottomConstraint;
- (NSLayoutConstraint)messageBottomConstraint;
- (NSLayoutConstraint)spinnerBottomConstraint;
- (UIActivityIndicatorView)checkingForUpdateSpinner;
- (UIButton)actionButton;
- (UILabel)titleLabel;
- (UIStackView)titleSpinnerStackView;
- (UITextView)messageTextView;
- (id)_hiddenMessageTextViewConstraints;
- (id)_visibleMessageTextViewConstraints;
- (void)_configureConstraints;
- (void)_setContinuousCornerRadius:(double)a3;
- (void)_setCornerRadius:(double)a3;
- (void)_updateErrorLabelConstraints;
- (void)setActionBottomConstraint:(id)a3;
- (void)setActionButton:(id)a3;
- (void)setCheckingForUpdateSpinner:(id)a3;
- (void)setHiddenMessageTextViewConstraints:(id)a3;
- (void)setItem:(id)a3;
- (void)setMessageBottomConstraint:(id)a3;
- (void)setMessageTextView:(id)a3;
- (void)setResizingDelegate:(id)a3;
- (void)setSpinnerBottomConstraint:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleSpinnerStackView:(id)a3;
- (void)setVisibleMessageTextViewConstraints:(id)a3;
- (void)updateUIWithAnimation:(BOOL)a3;
@end

@implementation HUServiceDetailsHeaderCell

- (HUServiceDetailsHeaderCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v44[1] = *MEMORY[0x1E4F143B8];
  v43.receiver = self;
  v43.super_class = (Class)HUServiceDetailsHeaderCell;
  v4 = [(HUServiceDetailsHeaderCell *)&v43 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    v5 = [MEMORY[0x1E4F428B8] clearColor];
    [(HUServiceDetailsHeaderCell *)v4 setBackgroundColor:v5];

    uint64_t v6 = objc_opt_new();
    messageTextView = v4->_messageTextView;
    v4->_messageTextView = (UITextView *)v6;

    [(UITextView *)v4->_messageTextView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextView *)v4->_messageTextView setEditable:0];
    [(UITextView *)v4->_messageTextView _setInteractiveTextSelectionDisabled:1];
    [(UITextView *)v4->_messageTextView setScrollEnabled:0];
    v8 = [(UITextView *)v4->_messageTextView textContainer];
    [v8 setLineFragmentPadding:0.0];

    v9 = [MEMORY[0x1E4F428B8] clearColor];
    [(UITextView *)v4->_messageTextView setBackgroundColor:v9];

    [(UITextView *)v4->_messageTextView setHidden:1];
    v10 = [(HUServiceDetailsHeaderCell *)v4 contentView];
    v11 = [(HUServiceDetailsHeaderCell *)v4 messageTextView];
    [v10 addSubview:v11];

    v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = v12;

    [(UILabel *)v4->_titleLabel setTextAlignment:2* ([(HUServiceDetailsHeaderCell *)v4 effectiveUserInterfaceLayoutDirection] == 0)];
    v14 = v4->_titleLabel;
    v15 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
    [(UILabel *)v14 setFont:v15];

    v16 = v4->_titleLabel;
    v17 = [MEMORY[0x1E4F428B8] clearColor];
    [(UILabel *)v16 setBackgroundColor:v17];

    v18 = v4->_titleLabel;
    v19 = [MEMORY[0x1E4F428B8] systemGrayColor];
    [(UILabel *)v18 setTextColor:v19];

    [(UILabel *)v4->_titleLabel setLineBreakMode:0];
    v20 = HFLocalizedString();
    [(UILabel *)v4->_titleLabel setText:v20];

    [(UILabel *)v4->_titleLabel sizeToFit];
    id v21 = objc_alloc(MEMORY[0x1E4F42E20]);
    v44[0] = v4->_titleLabel;
    v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:1];
    uint64_t v23 = [v21 initWithArrangedSubviews:v22];
    titleSpinnerStackView = v4->_titleSpinnerStackView;
    v4->_titleSpinnerStackView = (UIStackView *)v23;

    [(UIStackView *)v4->_titleSpinnerStackView setAxis:0];
    [(UIStackView *)v4->_titleSpinnerStackView setAlignment:3];
    [(UIStackView *)v4->_titleSpinnerStackView setSpacing:8.0];
    [(UIStackView *)v4->_titleSpinnerStackView setTranslatesAutoresizingMaskIntoConstraints:0];
    v25 = [(HUServiceDetailsHeaderCell *)v4 contentView];
    [v25 addSubview:v4->_titleSpinnerStackView];

    uint64_t v26 = [MEMORY[0x1E4F427E0] buttonWithType:0];
    actionButton = v4->_actionButton;
    v4->_actionButton = (UIButton *)v26;

    [(UIButton *)v4->_actionButton titleEdgeInsets];
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    v34 = [(HUServiceDetailsHeaderCell *)v4 defaultContentConfiguration];
    [v34 directionalLayoutMargins];
    double v36 = v35;

    -[UIButton setTitleEdgeInsets:](v4->_actionButton, "setTitleEdgeInsets:", v29, v36, v31, v33);
    v37 = [MEMORY[0x1E4F428B8] secondarySystemGroupedBackgroundColor];
    [(UIButton *)v4->_actionButton setBackgroundColor:v37];

    [(UIButton *)v4->_actionButton setContentHorizontalAlignment:1];
    [(UIButton *)v4->_actionButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v38 = [MEMORY[0x1E4F428B8] systemOrangeColor];
    [(UIButton *)v4->_actionButton setTitleColor:v38 forState:0];
    v39 = [(HUServiceDetailsHeaderCell *)v4 contentView];
    [v39 addSubview:v4->_actionButton];

    uint64_t v40 = [objc_alloc(MEMORY[0x1E4F42708]) initWithActivityIndicatorStyle:100];
    checkingForUpdateSpinner = v4->_checkingForUpdateSpinner;
    v4->_checkingForUpdateSpinner = (UIActivityIndicatorView *)v40;

    [(UIActivityIndicatorView *)v4->_checkingForUpdateSpinner startAnimating];
    [(UIStackView *)v4->_titleSpinnerStackView addArrangedSubview:v4->_titleLabel];
  }
  return v4;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HUServiceDetailsHeaderCell;
  -[HUServiceDetailsHeaderCell _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  [(UIButton *)self->_actionButton _setContinuousCornerRadius:a3];
}

- (void)_setCornerRadius:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HUServiceDetailsHeaderCell;
  -[HUServiceDetailsHeaderCell _setCornerRadius:](&v5, sel__setCornerRadius_);
  [(UIButton *)self->_actionButton _setCornerRadius:a3];
}

- (void)setItem:(id)a3
{
  objc_super v5 = (HFItem *)a3;
  if (self->_item != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_item, a3);
    [(HUServiceDetailsHeaderCell *)self _configureConstraints];
    objc_super v5 = v6;
  }
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (void)updateUIWithAnimation:(BOOL)a3
{
  v4 = [(HUServiceDetailsHeaderCell *)self item];
  objc_super v5 = [v4 latestResults];

  uint64_t v6 = [(HUServiceDetailsHeaderCell *)self item];
  v7 = [v6 latestResults];
  uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F689A0]];

  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __52__HUServiceDetailsHeaderCell_updateUIWithAnimation___block_invoke;
  v50[3] = &unk_1E63868D8;
  v50[4] = self;
  v9 = __52__HUServiceDetailsHeaderCell_updateUIWithAnimation___block_invoke((uint64_t)v50);
  v10 = [(HUServiceDetailsHeaderCell *)self item];
  v11 = [v10 latestResults];
  uint64_t v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F689B8]];

  v13 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F689D0]];
  v14 = [(HUServiceDetailsHeaderCell *)self item];
  v15 = [v14 latestResults];
  v16 = [v15 objectForKeyedSubscript:*MEMORY[0x1E4F68C50]];
  v17 = v16;
  if (v16)
  {
    id v18 = v16;
  }
  else
  {
    id v18 = [(UILabel *)self->_titleLabel text];
  }
  id v19 = v18;

  v45 = (void *)v8;
  if (v8) {
    v20 = (void *)v8;
  }
  else {
    v20 = (void *)v12;
  }
  id v21 = v20;
  uint64_t v22 = *MEMORY[0x1E4F689D8];
  uint64_t v23 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F689D8]];

  v46 = (void *)v12;
  v24 = v19;
  if (v23)
  {
    uint64_t v25 = [v5 objectForKeyedSubscript:v22];

    id v21 = (id)v25;
  }
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __52__HUServiceDetailsHeaderCell_updateUIWithAnimation___block_invoke_2;
  v47[3] = &unk_1E6388108;
  id v26 = v9;
  id v48 = v26;
  id v27 = v21;
  id v49 = v27;
  double v28 = __52__HUServiceDetailsHeaderCell_updateUIWithAnimation___block_invoke_2((uint64_t)v47);
  double v29 = [(HUServiceDetailsHeaderCell *)self messageTextView];
  [v29 setAttributedText:v28];

  double v30 = [MEMORY[0x1E4F428B8] labelColor];
  double v31 = [(HUServiceDetailsHeaderCell *)self messageTextView];
  [v31 setTextColor:v30];

  double v32 = [(HUServiceDetailsHeaderCell *)self actionButton];
  [v32 setTitle:v13 forState:0];

  double v33 = [(HUServiceDetailsHeaderCell *)self messageTextView];
  [v33 setHidden:v28 == 0];

  v34 = [(HUServiceDetailsHeaderCell *)self actionButton];
  [v34 setHidden:v13 == 0];

  double v35 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F68C48]];
  int v36 = [v35 BOOLValue];

  v37 = [(HUServiceDetailsHeaderCell *)self titleLabel];
  v38 = v37;
  if (v36)
  {
    [v37 setHidden:0];

    v39 = [(HUServiceDetailsHeaderCell *)self titleLabel];
    uint64_t v40 = v24;
    [v39 setText:v24];

    v41 = [(HUServiceDetailsHeaderCell *)self checkingForUpdateSpinner];
    [v41 setHidden:0];

    v42 = [(HUServiceDetailsHeaderCell *)self actionButton];
  }
  else
  {
    [v37 setHidden:1];

    v42 = [(HUServiceDetailsHeaderCell *)self checkingForUpdateSpinner];
    uint64_t v40 = v24;
  }
  [v42 setHidden:1];

  objc_super v43 = [(HUServiceDetailsHeaderCell *)self messageTextView];
  [v43 sizeToFit];

  v44 = [(HUServiceDetailsHeaderCell *)self titleLabel];
  [v44 sizeToFit];

  [(HUServiceDetailsHeaderCell *)self _updateErrorLabelConstraints];
}

id __52__HUServiceDetailsHeaderCell_updateUIWithAnimation___block_invoke(uint64_t a1)
{
  objc_opt_class();
  v2 = [*(id *)(a1 + 32) item];
  v3 = [v2 latestResults];
  v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F689A8]];
  if (objc_opt_isKindOfClass()) {
    objc_super v5 = v4;
  }
  else {
    objc_super v5 = 0;
  }
  id v6 = v5;

  objc_opt_class();
  v7 = [*(id *)(a1 + 32) item];
  uint64_t v8 = [v7 latestResults];
  v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F689B0]];
  if (objc_opt_isKindOfClass()) {
    v10 = v9;
  }
  else {
    v10 = 0;
  }
  id v11 = v10;

  objc_opt_class();
  uint64_t v12 = [*(id *)(a1 + 32) item];
  v13 = [v12 latestResults];
  v14 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F689A0]];
  if (objc_opt_isKindOfClass()) {
    v15 = v14;
  }
  else {
    v15 = 0;
  }
  id v16 = v15;

  v17 = 0;
  if (v6 && v11 && v16)
  {
    v17 = objc_msgSend(MEMORY[0x1E4F28B18], "hf_attributedStringForString:withAppendedString:asURL:withAttributes:", v16, v11, v6, 0);
  }

  return v17;
}

id __52__HUServiceDetailsHeaderCell_updateUIWithAnimation___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:*(void *)(a1 + 32)];
    v3 = HUPriorityMessageDefaultAttributedStringAttributes();
    objc_msgSend(v2, "addAttributes:range:", v3, 0, objc_msgSend(v2, "length"));
LABEL_5:

    goto LABEL_6;
  }
  if (*(void *)(a1 + 40))
  {
    id v4 = objc_alloc(MEMORY[0x1E4F28B18]);
    uint64_t v5 = *(void *)(a1 + 40);
    v3 = HUPriorityMessageDefaultAttributedStringAttributes();
    v2 = (void *)[v4 initWithString:v5 attributes:v3];
    goto LABEL_5;
  }
  v2 = 0;
LABEL_6:

  return v2;
}

- (void)_configureConstraints
{
  v3 = (void *)MEMORY[0x1E4F28DC8];
  id v4 = [(HUServiceDetailsHeaderCell *)self constraints];
  [v3 deactivateConstraints:v4];

  uint64_t v5 = [(HUServiceDetailsHeaderCell *)self _hiddenMessageTextViewConstraints];
  [(HUServiceDetailsHeaderCell *)self setHiddenMessageTextViewConstraints:v5];

  id v6 = [(HUServiceDetailsHeaderCell *)self _visibleMessageTextViewConstraints];
  [(HUServiceDetailsHeaderCell *)self setVisibleMessageTextViewConstraints:v6];

  [(HUServiceDetailsHeaderCell *)self _updateErrorLabelConstraints];
}

- (void)_updateErrorLabelConstraints
{
  v3 = [(HUServiceDetailsHeaderCell *)self messageTextView];
  int v4 = [v3 isHidden];

  uint64_t v5 = (void *)MEMORY[0x1E4F28DC8];
  if (v4)
  {
    id v6 = [(HUServiceDetailsHeaderCell *)self visibleMessageTextViewConstraints];
    [v5 deactivateConstraints:v6];

    v7 = (void *)MEMORY[0x1E4F28DC8];
    uint64_t v8 = [(HUServiceDetailsHeaderCell *)self hiddenMessageTextViewConstraints];
    [v7 activateConstraints:v8];

    v9 = [(HUServiceDetailsHeaderCell *)self messageBottomConstraint];
    [v9 setActive:1];

    id v31 = [(HUServiceDetailsHeaderCell *)self spinnerBottomConstraint];
    [v31 setActive:0];
  }
  else
  {
    v10 = [(HUServiceDetailsHeaderCell *)self hiddenMessageTextViewConstraints];
    [v5 deactivateConstraints:v10];

    id v11 = (void *)MEMORY[0x1E4F28DC8];
    uint64_t v12 = [(HUServiceDetailsHeaderCell *)self visibleMessageTextViewConstraints];
    [v11 activateConstraints:v12];

    v13 = [(HUServiceDetailsHeaderCell *)self item];
    v14 = [v13 latestResults];
    v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F68C48]];
    int v16 = [v15 BOOLValue];

    if (v16)
    {
      v17 = [(HUServiceDetailsHeaderCell *)self messageBottomConstraint];
      [v17 setActive:0];

      id v18 = [(HUServiceDetailsHeaderCell *)self spinnerBottomConstraint];
      [v18 setActive:1];

      titleSpinnerStackView = self->_titleSpinnerStackView;
      checkingForUpdateSpinner = self->_checkingForUpdateSpinner;
      [(UIStackView *)titleSpinnerStackView addArrangedSubview:checkingForUpdateSpinner];
    }
    else
    {
      id v21 = [(HUServiceDetailsHeaderCell *)self actionButton];
      int v22 = [v21 isHidden];

      uint64_t v23 = [(HUServiceDetailsHeaderCell *)self messageBottomConstraint];
      v24 = v23;
      if (v22)
      {
        [v23 setActive:1];

        uint64_t v25 = [(HUServiceDetailsHeaderCell *)self actionBottomConstraint];
        id v26 = v25;
        uint64_t v27 = 0;
      }
      else
      {
        [v23 setActive:0];

        uint64_t v25 = [(HUServiceDetailsHeaderCell *)self actionBottomConstraint];
        id v26 = v25;
        uint64_t v27 = 1;
      }
      [v25 setActive:v27];

      double v28 = [(HUServiceDetailsHeaderCell *)self spinnerBottomConstraint];
      [v28 setActive:0];

      double v29 = self->_titleSpinnerStackView;
      double v30 = self->_checkingForUpdateSpinner;
      [(UIStackView *)v29 removeArrangedSubview:v30];
    }
  }
}

- (id)_hiddenMessageTextViewConstraints
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = [(HUServiceDetailsHeaderCell *)self heightAnchor];
  v3 = [v2 constraintEqualToConstant:0.0];
  v6[0] = v3;
  int v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (id)_visibleMessageTextViewConstraints
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v4 = [(HUServiceDetailsHeaderCell *)self messageTextView];
  uint64_t v5 = [v4 leadingAnchor];
  id v6 = [(HUServiceDetailsHeaderCell *)self contentView];
  v7 = [v6 readableContentGuide];
  uint64_t v8 = [v7 leadingAnchor];
  v9 = [v5 constraintEqualToAnchor:v8];
  [v3 addObject:v9];

  v10 = [(HUServiceDetailsHeaderCell *)self messageTextView];
  id v11 = [v10 trailingAnchor];
  uint64_t v12 = [(HUServiceDetailsHeaderCell *)self contentView];
  v13 = [v12 readableContentGuide];
  v14 = [v13 trailingAnchor];
  v15 = [v11 constraintEqualToAnchor:v14];
  [v3 addObject:v15];

  int v16 = [(HUServiceDetailsHeaderCell *)self actionButton];
  v17 = [v16 leadingAnchor];
  id v18 = [(HUServiceDetailsHeaderCell *)self contentView];
  id v19 = [v18 leadingAnchor];
  v20 = [v17 constraintEqualToAnchor:v19];
  [v3 addObject:v20];

  id v21 = [(HUServiceDetailsHeaderCell *)self actionButton];
  int v22 = [v21 trailingAnchor];
  uint64_t v23 = [(HUServiceDetailsHeaderCell *)self contentView];
  v24 = [v23 trailingAnchor];
  uint64_t v25 = [v22 constraintEqualToAnchor:v24];
  [v3 addObject:v25];

  id v26 = [(HUServiceDetailsHeaderCell *)self actionButton];
  uint64_t v27 = [v26 topAnchor];
  double v28 = [(HUServiceDetailsHeaderCell *)self messageTextView];
  double v29 = [v28 lastBaselineAnchor];
  double v30 = [v27 constraintEqualToAnchor:v29 constant:35.0];
  [v3 addObject:v30];

  id v31 = [(HUServiceDetailsHeaderCell *)self actionButton];
  double v32 = [v31 centerXAnchor];
  double v33 = [(HUServiceDetailsHeaderCell *)self messageTextView];
  v34 = [v33 centerXAnchor];
  double v35 = [v32 constraintEqualToAnchor:v34];
  [v3 addObject:v35];

  int v36 = [(HUServiceDetailsHeaderCell *)self actionButton];
  v37 = [v36 heightAnchor];
  v38 = [v37 constraintGreaterThanOrEqualToConstant:44.0];
  [v3 addObject:v38];

  v39 = [(HUServiceDetailsHeaderCell *)self messageTextView];
  uint64_t v40 = [v39 topAnchor];
  v41 = [(HUServiceDetailsHeaderCell *)self contentView];
  v42 = [v41 topAnchor];
  objc_super v43 = [v40 constraintEqualToAnchor:v42];
  [v3 addObject:v43];

  v44 = [(HUServiceDetailsHeaderCell *)self titleSpinnerStackView];
  v45 = [v44 topAnchor];
  v46 = [(HUServiceDetailsHeaderCell *)self messageTextView];
  v47 = [v46 lastBaselineAnchor];
  id v48 = [v45 constraintEqualToAnchor:v47 constant:35.0];
  [v3 addObject:v48];

  id v49 = [(HUServiceDetailsHeaderCell *)self titleSpinnerStackView];
  v50 = [v49 centerXAnchor];
  v51 = [(HUServiceDetailsHeaderCell *)self messageTextView];
  v52 = [v51 centerXAnchor];
  v53 = [v50 constraintEqualToAnchor:v52];
  [v3 addObject:v53];

  v54 = [(HUServiceDetailsHeaderCell *)self messageTextView];
  v55 = [v54 bottomAnchor];
  v56 = [(HUServiceDetailsHeaderCell *)self contentView];
  v57 = [v56 bottomAnchor];
  v58 = [v55 constraintEqualToAnchor:v57 constant:-35.0];
  [(HUServiceDetailsHeaderCell *)self setMessageBottomConstraint:v58];

  v59 = [(HUServiceDetailsHeaderCell *)self contentView];
  v60 = [(HUServiceDetailsHeaderCell *)self messageBottomConstraint];
  [v59 addConstraint:v60];

  v61 = [(HUServiceDetailsHeaderCell *)self messageBottomConstraint];
  [v61 setActive:1];

  v62 = [(HUServiceDetailsHeaderCell *)self actionButton];
  v63 = [v62 bottomAnchor];
  v64 = [(HUServiceDetailsHeaderCell *)self contentView];
  v65 = [v64 bottomAnchor];
  v66 = [v63 constraintEqualToAnchor:v65 constant:-35.0];
  [(HUServiceDetailsHeaderCell *)self setActionBottomConstraint:v66];

  v67 = [(HUServiceDetailsHeaderCell *)self contentView];
  v68 = [(HUServiceDetailsHeaderCell *)self actionBottomConstraint];
  [v67 addConstraint:v68];

  v69 = [(HUServiceDetailsHeaderCell *)self actionBottomConstraint];
  [v69 setActive:0];

  v70 = [(HUServiceDetailsHeaderCell *)self titleSpinnerStackView];
  v71 = [v70 bottomAnchor];
  v72 = [(HUServiceDetailsHeaderCell *)self contentView];
  v73 = [v72 bottomAnchor];
  v74 = [v71 constraintEqualToAnchor:v73 constant:-35.0];
  [(HUServiceDetailsHeaderCell *)self setSpinnerBottomConstraint:v74];

  v75 = [(HUServiceDetailsHeaderCell *)self contentView];
  v76 = [(HUServiceDetailsHeaderCell *)self spinnerBottomConstraint];
  [v75 addConstraint:v76];

  v77 = [(HUServiceDetailsHeaderCell *)self spinnerBottomConstraint];
  [v77 setActive:0];

  return v3;
}

- (HFItem)item
{
  return self->_item;
}

- (HUResizableCellDelegate)resizingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resizingDelegate);

  return (HUResizableCellDelegate *)WeakRetained;
}

- (void)setResizingDelegate:(id)a3
{
}

- (UIButton)actionButton
{
  return self->_actionButton;
}

- (void)setActionButton:(id)a3
{
}

- (UITextView)messageTextView
{
  return self->_messageTextView;
}

- (void)setMessageTextView:(id)a3
{
}

- (NSArray)hiddenMessageTextViewConstraints
{
  return self->_hiddenMessageTextViewConstraints;
}

- (void)setHiddenMessageTextViewConstraints:(id)a3
{
}

- (NSArray)visibleMessageTextViewConstraints
{
  return self->_visibleMessageTextViewConstraints;
}

- (void)setVisibleMessageTextViewConstraints:(id)a3
{
}

- (UIStackView)titleSpinnerStackView
{
  return self->_titleSpinnerStackView;
}

- (void)setTitleSpinnerStackView:(id)a3
{
}

- (UIActivityIndicatorView)checkingForUpdateSpinner
{
  return self->_checkingForUpdateSpinner;
}

- (void)setCheckingForUpdateSpinner:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (NSLayoutConstraint)spinnerBottomConstraint
{
  return self->_spinnerBottomConstraint;
}

- (void)setSpinnerBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)messageBottomConstraint
{
  return self->_messageBottomConstraint;
}

- (void)setMessageBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)actionBottomConstraint
{
  return self->_actionBottomConstraint;
}

- (void)setActionBottomConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_actionBottomConstraint, 0);
  objc_storeStrong((id *)&self->_messageBottomConstraint, 0);
  objc_storeStrong((id *)&self->_spinnerBottomConstraint, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_checkingForUpdateSpinner, 0);
  objc_storeStrong((id *)&self->_titleSpinnerStackView, 0);
  objc_storeStrong((id *)&self->_visibleMessageTextViewConstraints, 0);
  objc_storeStrong((id *)&self->_hiddenMessageTextViewConstraints, 0);
  objc_storeStrong((id *)&self->_messageTextView, 0);
  objc_storeStrong((id *)&self->_actionButton, 0);
  objc_destroyWeak((id *)&self->_resizingDelegate);

  objc_storeStrong((id *)&self->_item, 0);
}

@end