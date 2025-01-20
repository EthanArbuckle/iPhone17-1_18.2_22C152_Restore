@interface HUCollectionTextViewCell
- (HUCollectionTextViewCell)initWithFrame:(CGRect)a3;
- (HUTappableTextView)messageTextView;
- (void)prepareForReuse;
- (void)setContentConfiguration:(id)a3;
- (void)setMessageTextView:(id)a3;
@end

@implementation HUCollectionTextViewCell

- (HUCollectionTextViewCell)initWithFrame:(CGRect)a3
{
  v47.receiver = self;
  v47.super_class = (Class)HUCollectionTextViewCell;
  v3 = -[HUCollectionTextViewCell initWithFrame:](&v47, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(HUTappableTextView);
    [(HUCollectionTextViewCell *)v3 setMessageTextView:v4];

    v5 = [(HUCollectionTextViewCell *)v3 messageTextView];
    [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

    v6 = [(HUCollectionTextViewCell *)v3 messageTextView];
    [v6 setEditable:0];

    v7 = [(HUCollectionTextViewCell *)v3 messageTextView];
    [v7 _setInteractiveTextSelectionDisabled:1];

    v8 = [(HUCollectionTextViewCell *)v3 messageTextView];
    [v8 setScrollEnabled:0];

    v9 = [(HUCollectionTextViewCell *)v3 messageTextView];
    v10 = [v9 textContainer];
    [v10 setLineFragmentPadding:0.0];

    v11 = [MEMORY[0x1E4F428B8] clearColor];
    v12 = [(HUCollectionTextViewCell *)v3 messageTextView];
    [v12 setBackgroundColor:v11];

    double v13 = *MEMORY[0x1E4F437F8];
    double v14 = *(double *)(MEMORY[0x1E4F437F8] + 8);
    double v15 = *(double *)(MEMORY[0x1E4F437F8] + 16);
    double v16 = *(double *)(MEMORY[0x1E4F437F8] + 24);
    v17 = [(HUCollectionTextViewCell *)v3 messageTextView];
    objc_msgSend(v17, "setTextContainerInset:", v13, v14, v15, v16);

    v18 = [(HUCollectionTextViewCell *)v3 contentView];
    v19 = [(HUCollectionTextViewCell *)v3 messageTextView];
    [v18 addSubview:v19];

    [(HUCollectionTextViewCell *)v3 setPreservesSuperviewLayoutMargins:1];
    v20 = [MEMORY[0x1E4F1CA48] array];
    v21 = [(HUCollectionTextViewCell *)v3 messageTextView];
    [v21 setTranslatesAutoresizingMaskIntoConstraints:0];

    v22 = [(HUCollectionTextViewCell *)v3 messageTextView];
    v23 = [v22 leadingAnchor];
    v24 = [(HUCollectionTextViewCell *)v3 contentView];
    v25 = [v24 layoutMarginsGuide];
    v26 = [v25 leadingAnchor];
    v27 = [v23 constraintEqualToAnchor:v26];
    [v20 addObject:v27];

    v28 = [(HUCollectionTextViewCell *)v3 messageTextView];
    v29 = [v28 trailingAnchor];
    v30 = [(HUCollectionTextViewCell *)v3 contentView];
    v31 = [v30 layoutMarginsGuide];
    v32 = [v31 trailingAnchor];
    v33 = [v29 constraintEqualToAnchor:v32];
    [v20 addObject:v33];

    v34 = [(HUCollectionTextViewCell *)v3 messageTextView];
    v35 = [v34 topAnchor];
    v36 = [(HUCollectionTextViewCell *)v3 contentView];
    v37 = [v36 layoutMarginsGuide];
    v38 = [v37 topAnchor];
    v39 = [v35 constraintEqualToAnchor:v38];
    [v20 addObject:v39];

    v40 = [(HUCollectionTextViewCell *)v3 messageTextView];
    v41 = [v40 bottomAnchor];
    v42 = [(HUCollectionTextViewCell *)v3 contentView];
    v43 = [v42 layoutMarginsGuide];
    v44 = [v43 bottomAnchor];
    v45 = [v41 constraintEqualToAnchor:v44];
    [v20 addObject:v45];

    [MEMORY[0x1E4F28DC8] activateConstraints:v20];
  }
  return v3;
}

- (void)prepareForReuse
{
  v8.receiver = self;
  v8.super_class = (Class)HUCollectionTextViewCell;
  [(HUCollectionTextViewCell *)&v8 prepareForReuse];
  v3 = [(HUCollectionTextViewCell *)self messageTextView];
  [v3 setText:0];

  v4 = [(HUCollectionTextViewCell *)self messageTextView];
  [v4 setAttributedText:0];

  v5 = [(HUCollectionTextViewCell *)self messageTextView];
  [v5 setTappableTextViewDelegate:0];

  v6 = [(HUCollectionTextViewCell *)self messageTextView];
  [v6 setDelegate:0];

  v7 = [(HUCollectionTextViewCell *)self messageTextView];
  [v7 sizeToFit];
}

- (void)setContentConfiguration:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v19 = v4;
  if (objc_opt_isKindOfClass()) {
    v5 = v19;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    v7 = [v6 attributedText];
    if (v7)
    {
      objc_super v8 = [(HUCollectionTextViewCell *)self messageTextView];
      [v8 setAttributedText:v7];
    }
    else
    {
      objc_super v8 = [v6 text];
      v9 = [(HUCollectionTextViewCell *)self messageTextView];
      [v9 setText:v8];
    }
    v10 = [v6 textProperties];
    v11 = [v10 font];
    v12 = [(HUCollectionTextViewCell *)self messageTextView];
    [v12 setFont:v11];

    double v13 = [v6 textProperties];
    double v14 = [v13 color];
    double v15 = [(HUCollectionTextViewCell *)self messageTextView];
    [v15 setTextColor:v14];

    double v16 = [v6 textProperties];
    uint64_t v17 = [v16 adjustsFontForContentSizeCategory];
    v18 = [(HUCollectionTextViewCell *)self messageTextView];
    [v18 setAdjustsFontForContentSizeCategory:v17];
  }
}

- (HUTappableTextView)messageTextView
{
  return self->_messageTextView;
}

- (void)setMessageTextView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end