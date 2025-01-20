@interface HKTitledBuddyHeaderView
- (HKTitledBuddyHeaderView)initWithTopInset:(double)a3 linkButtonTitle:(id)a4;
- (HKTitledBuddyHeaderViewDelegate)delegate;
- (NSString)bodyText;
- (NSString)titleText;
- (UILabel)titleLabel;
- (double)bottomPadding;
- (id)_attributedBodyTextWithString:(id)a3 alignment:(int64_t)a4;
- (id)bodyTextView;
- (int64_t)bodyTextAlignment;
- (void)_linkButtonTapped:(id)a3;
- (void)_updateBodyTextViewConstraints;
- (void)_updateForCurrentSizeCategory;
- (void)deactivateDefaultTitleLabelBaselineConstraint;
- (void)setBodyText:(id)a3;
- (void)setBodyText:(id)a3 alignment:(int64_t)a4;
- (void)setBodyTextAlignment:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setTitleText:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation HKTitledBuddyHeaderView

- (HKTitledBuddyHeaderView)initWithTopInset:(double)a3 linkButtonTitle:(id)a4
{
  id v6 = a4;
  v73.receiver = self;
  v73.super_class = (Class)HKTitledBuddyHeaderView;
  v7 = -[HKTitledBuddyHeaderView initWithFrame:](&v73, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v8 = v7;
  if (v7)
  {
    [(HKTitledBuddyHeaderView *)v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    LODWORD(v9) = 1148846080;
    [(HKTitledBuddyHeaderView *)v8 setContentCompressionResistancePriority:1 forAxis:v9];
    bodyText = v8->_bodyText;
    v8->_bodyText = 0;

    v8->_bodyTextAlignment = 1;
    v11 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    [(UILabel *)v11 setAllowsDefaultTighteningForTruncation:1];
    [(UILabel *)v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v11 setNumberOfLines:0];
    [(UILabel *)v11 setTextAlignment:1];
    LODWORD(v12) = 1057803469;
    [(UILabel *)v11 _setHyphenationFactor:v12];
    [(HKTitledBuddyHeaderView *)v8 addSubview:v11];
    v13 = (UITextView *)objc_alloc_init(MEMORY[0x1E4FB1DD8]);
    v14 = [MEMORY[0x1E4FB1618] clearColor];
    [(UITextView *)v13 setBackgroundColor:v14];

    v15 = [MEMORY[0x1E4FB1618] labelColor];
    [(UITextView *)v13 setTextColor:v15];

    [(UITextView *)v13 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UITextView *)v13 setScrollEnabled:0];
    [(UITextView *)v13 setEditable:0];
    [(UITextView *)v13 _setInteractiveTextSelectionDisabled:1];
    [(UITextView *)v13 setDataDetectorTypes:2];
    [(HKTitledBuddyHeaderView *)v8 addSubview:v13];
    if (v6)
    {
      v16 = (void *)MEMORY[0x1E4FB14D0];
      v17 = HKHealthKeyColor();
      objc_msgSend(v16, "hk_buttonTintedWithColor:title:target:action:", v17, v6, v8, sel__linkButtonTapped_);
      v18 = (UIButton *)objc_claimAutoreleasedReturnValue();

      [(HKTitledBuddyHeaderView *)v8 addSubview:v18];
    }
    else
    {
      v18 = 0;
    }
    v19 = [(UILabel *)v11 firstBaselineAnchor];
    v20 = [(HKTitledBuddyHeaderView *)v8 topAnchor];
    uint64_t v21 = [v19 constraintGreaterThanOrEqualToAnchor:v20 constant:a3];
    titleLabelBaselineConstraint = v8->_titleLabelBaselineConstraint;
    v8->_titleLabelBaselineConstraint = (NSLayoutConstraint *)v21;

    [(NSLayoutConstraint *)v8->_titleLabelBaselineConstraint setActive:1];
    v23 = [(UITextView *)v13 firstBaselineAnchor];
    v24 = [(UILabel *)v11 lastBaselineAnchor];
    uint64_t v25 = [v23 constraintEqualToAnchor:v24 constant:0.0];
    bodyFirstBaselineConstraint = v8->_bodyFirstBaselineConstraint;
    v8->_bodyFirstBaselineConstraint = (NSLayoutConstraint *)v25;

    [(NSLayoutConstraint *)v8->_bodyFirstBaselineConstraint setActive:1];
    if (v18)
    {
      v27 = [(UIButton *)v18 widthAnchor];
      v28 = [v27 constraintEqualToConstant:288.0];
      [v28 setActive:1];

      v29 = [(UIButton *)v18 centerXAnchor];
      v30 = [(HKTitledBuddyHeaderView *)v8 centerXAnchor];
      v31 = [v29 constraintEqualToAnchor:v30];
      [v31 setActive:1];

      v32 = [(UITextView *)v13 lastBaselineAnchor];
      v33 = [(UIButton *)v18 firstBaselineAnchor];
      uint64_t v34 = [v32 constraintEqualToAnchor:v33 constant:0.0];
      bodyLastBaselineToLinkConstraint = v8->_bodyLastBaselineToLinkConstraint;
      v8->_bodyLastBaselineToLinkConstraint = (NSLayoutConstraint *)v34;

      [(NSLayoutConstraint *)v8->_bodyLastBaselineToLinkConstraint setActive:1];
      v36 = [(UIButton *)v18 lastBaselineAnchor];
      v37 = [(HKTitledBuddyHeaderView *)v8 bottomAnchor];
      uint64_t v38 = [v36 constraintEqualToAnchor:v37 constant:0.0];
      uint64_t v39 = 488;
    }
    else
    {
      v40 = [(UITextView *)v13 lastBaselineAnchor];
      v41 = [(HKTitledBuddyHeaderView *)v8 bottomAnchor];
      uint64_t v42 = [v40 constraintEqualToAnchor:v41 constant:0.0];
      bodyBottomConstraint = v8->_bodyBottomConstraint;
      v8->_bodyBottomConstraint = (NSLayoutConstraint *)v42;

      v36 = [(UILabel *)v11 lastBaselineAnchor];
      v37 = [(HKTitledBuddyHeaderView *)v8 bottomAnchor];
      uint64_t v38 = [v36 constraintEqualToAnchor:v37 constant:0.0];
      uint64_t v39 = 464;
    }
    v44 = (id *)((char *)&v8->super.super.super.isa + v39);
    v45 = *(Class *)((char *)&v8->super.super.super.isa + v39);
    id *v44 = (id)v38;

    [*v44 setActive:1];
    double v46 = HKHealthUIBuddyDirectionalEdgeInsets();
    double v48 = v47;
    double v50 = v49;
    v51 = [(UILabel *)v11 leadingAnchor];
    v52 = [(HKTitledBuddyHeaderView *)v8 leadingAnchor];
    v53 = [v51 constraintEqualToAnchor:v52 constant:v48];
    [v53 setActive:1];

    v54 = [(UILabel *)v11 trailingAnchor];
    v55 = [(HKTitledBuddyHeaderView *)v8 trailingAnchor];
    double v56 = -v50;
    v57 = [v54 constraintEqualToAnchor:v55 constant:v56];
    [v57 setActive:1];

    v58 = [(UITextView *)v13 leadingAnchor];
    v59 = [(HKTitledBuddyHeaderView *)v8 leadingAnchor];
    v60 = [v58 constraintEqualToAnchor:v59 constant:v48];
    [v60 setActive:1];

    v61 = [(UITextView *)v13 trailingAnchor];
    v62 = [(HKTitledBuddyHeaderView *)v8 trailingAnchor];
    v63 = [v61 constraintEqualToAnchor:v62 constant:v56];
    [v63 setActive:1];

    v64 = [(UITextView *)v13 heightAnchor];
    uint64_t v65 = [v64 constraintEqualToConstant:0.0];
    bodyZeroHeightConstraint = v8->_bodyZeroHeightConstraint;
    v8->_bodyZeroHeightConstraint = (NSLayoutConstraint *)v65;

    [(NSLayoutConstraint *)v8->_bodyZeroHeightConstraint setActive:1];
    titleLabel = v8->_titleLabel;
    v8->_titleLabel = v11;
    v68 = v11;

    bodyTextView = v8->_bodyTextView;
    v8->_bodyTextView = v13;
    v70 = v13;

    optionalLinkButton = v8->_optionalLinkButton;
    v8->_optionalLinkButton = v18;

    [(HKTitledBuddyHeaderView *)v8 _updateForCurrentSizeCategory];
  }

  return v8;
}

- (void)_updateForCurrentSizeCategory
{
  id v15 = (id)*MEMORY[0x1E4FB2988];
  if (objc_msgSend(MEMORY[0x1E4FB1BA8], "hk_currentDeviceHas4InchScreen"))
  {
    id v3 = (id)*MEMORY[0x1E4FB2990];

    id v4 = v3;
  }
  else
  {
    id v4 = v15;
  }
  v5 = (void *)MEMORY[0x1E4FB08E0];
  id v16 = v4;
  id v6 = objc_msgSend(MEMORY[0x1E4FB08E8], "defaultFontDescriptorWithTextStyle:addingSymbolicTraits:options:");
  v7 = [v5 fontWithDescriptor:v6 size:0.0];
  v8 = [(HKTitledBuddyHeaderView *)self titleLabel];
  [v8 setFont:v7];

  double v9 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", *MEMORY[0x1E4FB28C8]);
  v10 = [(UIButton *)self->_optionalLinkButton titleLabel];
  [v10 setFont:v9];

  [v9 _scaledValueForValue:32.0];
  -[NSLayoutConstraint setConstant:](self->_bodyFirstBaselineConstraint, "setConstant:");
  if (self->_optionalLinkButton)
  {
    [v9 _scaledValueForValue:30.0];
    [(NSLayoutConstraint *)self->_bodyLastBaselineToLinkConstraint setConstant:-v11];
  }
  [(HKTitledBuddyHeaderView *)self bottomPadding];
  double v13 = -v12;
  [(NSLayoutConstraint *)self->_linkButtonLastBaselineToBottomConstraint setConstant:-v12];
  [(NSLayoutConstraint *)self->_bodyBottomConstraint setConstant:v13];
  [(NSLayoutConstraint *)self->_titleBottomConstraint setConstant:v13];
  v14 = [(HKTitledBuddyHeaderView *)self bodyText];
  [(HKTitledBuddyHeaderView *)self setBodyText:v14];
}

- (void)_updateBodyTextViewConstraints
{
  NSUInteger v3 = [(NSString *)self->_bodyText length];
  if (v3)
  {
    bodyZeroHeightConstraint = self->_bodyZeroHeightConstraint;
    uint64_t v5 = 0;
  }
  else
  {
    [(UITextView *)self->_bodyTextView setText:0];
    [(UITextView *)self->_bodyTextView setAttributedText:0];
    bodyZeroHeightConstraint = self->_bodyZeroHeightConstraint;
    uint64_t v5 = 1;
  }
  [(NSLayoutConstraint *)bodyZeroHeightConstraint setActive:v5];
  if (self->_titleBottomConstraint)
  {
    BOOL v6 = v3 == 0;
    BOOL v7 = v3 == 0;
    uint64_t v8 = !v6;
    [(NSLayoutConstraint *)self->_bodyBottomConstraint setActive:v8];
    titleBottomConstraint = self->_titleBottomConstraint;
    [(NSLayoutConstraint *)titleBottomConstraint setActive:v7];
  }
}

- (double)bottomPadding
{
  v2 = objc_msgSend(MEMORY[0x1E4FB08E0], "hk_preferredFontForTextStyle:", *MEMORY[0x1E4FB28C8]);
  [v2 _scaledValueForValue:32.0];
  double v4 = v3;

  return v4;
}

- (void)setTitleText:(id)a3
{
}

- (NSString)titleText
{
  return [(UILabel *)self->_titleLabel text];
}

- (void)setBodyText:(id)a3
{
  id v6 = a3;
  if (!-[NSString isEqualToString:](self->_bodyText, "isEqualToString:"))
  {
    objc_storeStrong((id *)&self->_bodyText, a3);
    if ([v6 length])
    {
      uint64_t v5 = [(HKTitledBuddyHeaderView *)self _attributedBodyTextWithString:v6 alignment:self->_bodyTextAlignment];
      [(UITextView *)self->_bodyTextView setAttributedText:v5];
    }
    [(HKTitledBuddyHeaderView *)self _updateBodyTextViewConstraints];
  }
}

- (NSString)bodyText
{
  return self->_bodyText;
}

- (void)setBodyTextAlignment:(int64_t)a3
{
  if (self->_bodyTextAlignment != a3)
  {
    self->_bodyTextAlignment = a3;
    if ([(NSString *)self->_bodyText length])
    {
      id v5 = [(HKTitledBuddyHeaderView *)self _attributedBodyTextWithString:self->_bodyText alignment:a3];
      [(UITextView *)self->_bodyTextView setAttributedText:v5];
    }
  }
}

- (int64_t)bodyTextAlignment
{
  return self->_bodyTextAlignment;
}

- (id)bodyTextView
{
  return self->_bodyTextView;
}

- (void)setBodyText:(id)a3 alignment:(int64_t)a4
{
  id v8 = a3;
  objc_storeStrong((id *)&self->_bodyText, a3);
  self->_bodyTextAlignment = a4;
  if ([(NSString *)self->_bodyText length])
  {
    BOOL v7 = [(HKTitledBuddyHeaderView *)self _attributedBodyTextWithString:v8 alignment:a4];
    [(UITextView *)self->_bodyTextView setAttributedText:v7];
  }
  [(HKTitledBuddyHeaderView *)self _updateBodyTextViewConstraints];
}

- (void)_linkButtonTapped:(id)a3
{
  id v4 = [(HKTitledBuddyHeaderView *)self delegate];
  [v4 titledBuddyHeaderViewDidTapLinkButton:self];
}

- (void)deactivateDefaultTitleLabelBaselineConstraint
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28DC8];
  v4[0] = self->_titleLabelBaselineConstraint;
  double v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  [v2 deactivateConstraints:v3];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKTitledBuddyHeaderView;
  [(HKTitledBuddyHeaderView *)&v9 traitCollectionDidChange:v4];
  if (v4)
  {
    id v5 = [(HKTitledBuddyHeaderView *)self traitCollection];
    id v6 = [v5 preferredContentSizeCategory];
    BOOL v7 = [v4 preferredContentSizeCategory];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0) {
      [(HKTitledBuddyHeaderView *)self _updateForCurrentSizeCategory];
    }
  }
}

- (id)_attributedBodyTextWithString:(id)a3 alignment:(int64_t)a4
{
  v25[3] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4FB08E0];
  uint64_t v7 = *MEMORY[0x1E4FB28C8];
  id v8 = a3;
  objc_super v9 = objc_msgSend(v6, "hk_preferredFontForTextStyle:", v7);
  [v9 _scaledValueForValue:22.0];
  double v11 = v10;
  [v9 _scaledValueForValue:32.0];
  double v13 = v12 - v11;
  v14 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  id v15 = (void *)[v14 mutableCopy];

  [v15 setMinimumLineHeight:v11];
  [v15 setParagraphSpacing:v13];
  [v15 setParagraphSpacingBefore:0.0];
  [v15 setAlignment:a4];
  uint64_t v16 = *MEMORY[0x1E4FB0738];
  v24[0] = *MEMORY[0x1E4FB06F8];
  v24[1] = v16;
  v25[0] = v9;
  v25[1] = v15;
  v24[2] = *MEMORY[0x1E4FB0700];
  v17 = [MEMORY[0x1E4FB1618] labelColor];
  v25[2] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:3];

  v19 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v8 attributes:v18];
  v20 = [(HKTitledBuddyHeaderView *)self delegate];
  char v21 = objc_opt_respondsToSelector();

  if (v21)
  {
    v22 = [(HKTitledBuddyHeaderView *)self delegate];
    [v22 updateBodyTextAttributesWithMutableString:v19];
  }
  return v19;
}

- (HKTitledBuddyHeaderViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HKTitledBuddyHeaderViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_titleLabelBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_linkButtonLastBaselineToBottomConstraint, 0);
  objc_storeStrong((id *)&self->_bodyLastBaselineToLinkConstraint, 0);
  objc_storeStrong((id *)&self->_bodyFirstBaselineConstraint, 0);
  objc_storeStrong((id *)&self->_titleBottomConstraint, 0);
  objc_storeStrong((id *)&self->_bodyBottomConstraint, 0);
  objc_storeStrong((id *)&self->_bodyZeroHeightConstraint, 0);
  objc_storeStrong((id *)&self->_logoTitleGapConstraint, 0);
  objc_storeStrong((id *)&self->_bodyText, 0);
  objc_storeStrong((id *)&self->_optionalLinkButton, 0);
  objc_storeStrong((id *)&self->_bodyTextView, 0);
}

@end