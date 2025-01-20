@interface DSSafetyCheckWelcomeTableCell
- (DSSafetyCheckWelcomeCellDelegate)delegate;
- (DSSafetyCheckWelcomeTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 title:(id)a5 systemImageNamed:(id)a6;
- (UIImageView)symbolImageView;
- (UIStackView)stackView;
- (void)didTapLearnMoreLink;
- (void)refreshCellContentsWithSpecifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDetailText:(id)a3 linkText:(id)a4;
- (void)setStackView:(id)a3;
- (void)setSymbolImageView:(id)a3;
- (void)setSymbolTintColor:(id)a3;
@end

@implementation DSSafetyCheckWelcomeTableCell

- (DSSafetyCheckWelcomeTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 title:(id)a5 systemImageNamed:(id)a6
{
  id v52 = a5;
  id v10 = a6;
  v53.receiver = self;
  v53.super_class = (Class)DSSafetyCheckWelcomeTableCell;
  v11 = [(DSSafetyCheckWelcomeTableCell *)&v53 initWithStyle:a3 reuseIdentifier:a4];
  v12 = v11;
  if (v11)
  {
    [(DSSafetyCheckWelcomeTableCell *)v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = [(DSSafetyCheckWelcomeTableCell *)v12 titleLabel];
    [v13 setHidden:1];

    v14 = [(DSSafetyCheckWelcomeTableCell *)v12 detailTextLabel];
    [v14 setHidden:1];

    uint64_t v15 = objc_opt_new();
    stackView = v12->_stackView;
    v12->_stackView = (UIStackView *)v15;

    [(UIStackView *)v12->_stackView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIStackView *)v12->_stackView setAxis:1];
    v17 = [(DSSafetyCheckWelcomeTableCell *)v12 contentView];
    [v17 addSubview:v12->_stackView];

    v18 = [(UIStackView *)v12->_stackView topAnchor];
    v19 = [(DSSafetyCheckWelcomeTableCell *)v12 contentView];
    v20 = [v19 topAnchor];
    v21 = [v18 constraintEqualToAnchor:v20 constant:16.0];
    [v21 setActive:1];

    v22 = [(UIStackView *)v12->_stackView bottomAnchor];
    v23 = [(DSSafetyCheckWelcomeTableCell *)v12 contentView];
    v24 = [v23 bottomAnchor];
    v25 = [v22 constraintEqualToAnchor:v24 constant:-16.0];
    [v25 setActive:1];

    v26 = [(UIStackView *)v12->_stackView leadingAnchor];
    v27 = [(DSSafetyCheckWelcomeTableCell *)v12 contentView];
    v28 = [v27 leadingAnchor];
    v29 = [v26 constraintEqualToAnchor:v28 constant:16.0];
    [v29 setActive:1];

    v30 = [(UIStackView *)v12->_stackView trailingAnchor];
    v31 = [(DSSafetyCheckWelcomeTableCell *)v12 contentView];
    v32 = [v31 trailingAnchor];
    v33 = [v30 constraintEqualToAnchor:v32 constant:-16.0];
    [v33 setActive:1];

    v34 = +[UIColor systemBlueColor];
    v35 = +[UIImageSymbolConfiguration configurationWithHierarchicalColor:v34];

    v36 = +[UIImage systemImageNamed:v10 withConfiguration:v35];
    v37 = [v36 imageWithRenderingMode:2];

    uint64_t v38 = objc_opt_new();
    symbolImageView = v12->_symbolImageView;
    v12->_symbolImageView = (UIImageView *)v38;

    [(UIImageView *)v12->_symbolImageView setImage:v37];
    [(UIImageView *)v12->_symbolImageView setContentMode:1];
    [(UIImageView *)v12->_symbolImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    v40 = [(UIImageView *)v12->_symbolImageView heightAnchor];
    v41 = [v40 constraintEqualToConstant:48.0];
    [v41 setActive:1];

    v42 = [(UIImageView *)v12->_symbolImageView widthAnchor];
    v43 = [v42 constraintEqualToConstant:48.0];
    [v43 setActive:1];

    [(UIStackView *)v12->_stackView addArrangedSubview:v12->_symbolImageView];
    [(UIStackView *)v12->_stackView setCustomSpacing:v12->_symbolImageView afterView:12.0];
    v44 = +[UIFont preferredFontForTextStyle:UIFontTextStyleTitle2];
    v45 = [v44 fontDescriptor];
    v46 = [v45 fontDescriptorWithSymbolicTraits:2];

    v47 = objc_opt_new();
    [v47 setText:v52];
    [v47 setNumberOfLines:0];
    v48 = +[UIColor labelColor];
    [v47 setTextColor:v48];

    [v47 setTextAlignment:1];
    [v47 setTranslatesAutoresizingMaskIntoConstraints:0];
    v49 = +[UIFont fontWithDescriptor:v46 size:0.0];
    [v47 setFont:v49];

    [(UIStackView *)v12->_stackView addArrangedSubview:v47];
    -[DSSafetyCheckWelcomeTableCell setSeparatorInset:](v12, "setSeparatorInset:", 0.0, 0.0, 0.0, 0.0);
    v50 = +[UIColor systemBlueColor];
    [(DSSafetyCheckWelcomeTableCell *)v12 setSymbolTintColor:v50];
  }
  return v12;
}

- (void)setDetailText:(id)a3 linkText:(id)a4
{
  id v17 = a4;
  id v6 = a3;
  id v7 = objc_alloc((Class)NSMutableAttributedString);
  if (v17)
  {
    uint64_t v8 = +[NSString stringWithFormat:@"%@ %@", v6, v17];

    id v6 = (id)v8;
  }
  id v9 = [v7 initWithString:v6];

  id v10 = objc_alloc_init((Class)UITextView);
  v11 = objc_opt_new();
  [v11 setAlignment:1];
  id v12 = [v9 length];
  objc_msgSend(v9, "addAttribute:value:range:", NSParagraphStyleAttributeName, v11, 0, v12);
  v13 = +[UIColor labelColor];
  objc_msgSend(v9, "addAttribute:value:range:", NSForegroundColorAttributeName, v13, 0, v12);

  v14 = +[UIFont preferredFontForTextStyle:UIFontTextStyleSubheadline];
  objc_msgSend(v9, "addAttribute:value:range:", NSFontAttributeName, v14, 0, v12);

  [v10 setEditable:0];
  [v10 setDelegate:self];
  [v10 setSelectable:1];
  [v10 setScrollEnabled:0];
  [v10 setAttributedText:v9];
  [v10 setShowsVerticalScrollIndicator:0];
  [v10 setShowsHorizontalScrollIndicator:0];
  uint64_t v15 = [v10 textContainer];
  [v15 setLineFragmentPadding:0.0];

  [v10 _setInteractiveTextSelectionDisabled:1];
  v16 = +[UIColor clearColor];
  [v10 setBackgroundColor:v16];

  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_stackView addArrangedSubview:v10];
}

- (void)setSymbolTintColor:(id)a3
{
}

- (void)refreshCellContentsWithSpecifier:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)DSSafetyCheckWelcomeTableCell;
  id v4 = a3;
  [(DSSafetyCheckWelcomeTableCell *)&v7 refreshCellContentsWithSpecifier:v4];
  -[DSSafetyCheckWelcomeTableCell setUserInteractionEnabled:](self, "setUserInteractionEnabled:", 1, v7.receiver, v7.super_class);
  v5 = [v4 objectForKeyedSubscript:@"DSSafetyCheckWelcomeCellDelegateKey"];

  id v6 = [v5 nonretainedObjectValue];
  [(DSSafetyCheckWelcomeTableCell *)self setDelegate:v6];
}

- (void)didTapLearnMoreLink
{
  id v3 = [(DSSafetyCheckWelcomeTableCell *)self delegate];
  [v3 didTapLearnMoreLink:self];
}

- (DSSafetyCheckWelcomeCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (DSSafetyCheckWelcomeCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
}

- (UIImageView)symbolImageView
{
  return self->_symbolImageView;
}

- (void)setSymbolImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symbolImageView, 0);
  objc_storeStrong((id *)&self->_stackView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end