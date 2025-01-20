@interface ENUILoggingInfoHeaderView
- (ENUILoggingInfoHeaderView)initWithSpecifier:(id)a3;
- (NSLayoutConstraint)textViewLeadingConstraint;
- (NSLayoutConstraint)textViewTrailingConstraint;
- (UITextView)textView;
- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4;
- (void)setTableView:(id)a3;
- (void)setTextView:(id)a3;
- (void)setTextViewLeadingConstraint:(id)a3;
- (void)setTextViewTrailingConstraint:(id)a3;
- (void)setupSubviewsAndContstraints;
- (void)setupText;
- (void)updateConstraints;
@end

@implementation ENUILoggingInfoHeaderView

- (ENUILoggingInfoHeaderView)initWithSpecifier:(id)a3
{
  v3 = -[ENUILoggingInfoHeaderView initWithFrame:](self, "initWithFrame:", a3, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v4 = v3;
  if (v3)
  {
    [(ENUILoggingInfoHeaderView *)v3 setupSubviewsAndContstraints];
    [(ENUILoggingInfoHeaderView *)v4 setupText];
  }
  return v4;
}

- (void)setupText
{
  id v18 = +[UITableViewHeaderFooterView _defaultTextColorForTableViewStyle:[(ENUILoggingInfoHeaderView *)self tableViewStyle] isSectionHeader:0];
  v3 = ENUILocalizedString();
  id v4 = [v3 length];
  id v5 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v3];
  v6 = [UIApp preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v6);

  if (IsAccessibilityCategory)
  {
    v8 = objc_opt_new();
    LODWORD(v9) = 1055286886;
    [v8 setHyphenationFactor:v9];
    objc_msgSend(v5, "addAttribute:value:range:", NSParagraphStyleAttributeName, v8, 0, v4);
  }
  v10 = +[UITableViewHeaderFooterView _defaultFontForTableViewStyle:[(ENUILoggingInfoHeaderView *)self tableViewStyle] isSectionHeader:0];
  objc_msgSend(v5, "addAttribute:value:range:", NSFontAttributeName, v10, 0, v4);
  v11 = +[UIImageSymbolConfiguration configurationWithFont:v10 scale:1];
  id v12 = objc_alloc_init((Class)NSTextAttachment);
  v13 = +[UIImage systemImageNamed:@"exclamationmark.circle.fill" withConfiguration:v11];
  v14 = [v13 imageWithRenderingMode:2];
  [v12 setImage:v14];

  v15 = +[NSAttributedString attributedStringWithAttachment:v12];
  [v5 insertAttributedString:v15 atIndex:0];
  v16 = [(ENUILoggingInfoHeaderView *)self _accessibilityHigherContrastTintColorForColor:v18];
  objc_msgSend(v5, "addAttribute:value:range:", NSForegroundColorAttributeName, v16, 0, objc_msgSend(v5, "length"));

  v17 = [(ENUILoggingInfoHeaderView *)self textView];
  [v17 setAttributedText:v5];
}

- (void)setupSubviewsAndContstraints
{
  id v3 = objc_alloc_init((Class)UITextView);
  [(ENUILoggingInfoHeaderView *)self setTextView:v3];

  id v4 = [(ENUILoggingInfoHeaderView *)self textView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v5 = +[UIColor clearColor];
  v6 = [(ENUILoggingInfoHeaderView *)self textView];
  [v6 setBackgroundColor:v5];

  v7 = [(ENUILoggingInfoHeaderView *)self textView];
  [v7 setShowsVerticalScrollIndicator:0];

  v8 = [(ENUILoggingInfoHeaderView *)self textView];
  [v8 setEditable:0];

  double v9 = [(ENUILoggingInfoHeaderView *)self textView];
  [v9 setSelectable:1];

  v10 = [(ENUILoggingInfoHeaderView *)self textView];
  [v10 setScrollEnabled:0];

  v11 = [(ENUILoggingInfoHeaderView *)self textView];
  id v12 = [v11 textContainer];
  [v12 setLineFragmentPadding:0.0];

  v13 = [(ENUILoggingInfoHeaderView *)self textView];
  [v13 _setInteractiveTextSelectionDisabled:1];

  v14 = [(ENUILoggingInfoHeaderView *)self contentView];
  v15 = [(ENUILoggingInfoHeaderView *)self textView];
  [v14 addSubview:v15];

  id v42 = +[NSMutableArray array];
  v16 = [(ENUILoggingInfoHeaderView *)self textView];
  v17 = [v16 leadingAnchor];
  id v18 = [(ENUILoggingInfoHeaderView *)self contentView];
  v19 = [v18 safeAreaLayoutGuide];
  v20 = [v19 leadingAnchor];
  v21 = [(ENUILoggingInfoHeaderView *)self tableView];
  [v21 _marginWidth];
  v22 = objc_msgSend(v17, "constraintEqualToAnchor:constant:", v20);
  [(ENUILoggingInfoHeaderView *)self setTextViewLeadingConstraint:v22];

  v23 = [(ENUILoggingInfoHeaderView *)self textViewLeadingConstraint];
  [v42 addObject:v23];

  v24 = [(ENUILoggingInfoHeaderView *)self contentView];
  v25 = [v24 safeAreaLayoutGuide];
  v26 = [v25 trailingAnchor];
  v27 = [(ENUILoggingInfoHeaderView *)self textView];
  v28 = [v27 trailingAnchor];
  v29 = [(ENUILoggingInfoHeaderView *)self tableView];
  [v29 _marginWidth];
  v30 = objc_msgSend(v26, "constraintEqualToAnchor:constant:", v28);
  [(ENUILoggingInfoHeaderView *)self setTextViewTrailingConstraint:v30];

  v31 = [(ENUILoggingInfoHeaderView *)self textViewTrailingConstraint];
  [v42 addObject:v31];

  v32 = [(ENUILoggingInfoHeaderView *)self textView];
  v33 = [v32 topAnchor];
  v34 = [(ENUILoggingInfoHeaderView *)self contentView];
  v35 = [v34 topAnchor];
  v36 = [v33 constraintEqualToAnchor:v35];
  [v42 addObject:v36];

  v37 = [(ENUILoggingInfoHeaderView *)self textView];
  v38 = [v37 bottomAnchor];
  v39 = [(ENUILoggingInfoHeaderView *)self contentView];
  v40 = [v39 bottomAnchor];
  v41 = [v38 constraintEqualToAnchor:v40];
  [v42 addObject:v41];

  +[NSLayoutConstraint activateConstraints:v42];
}

- (void)setTableView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ENUILoggingInfoHeaderView;
  [(ENUILoggingInfoHeaderView *)&v4 setTableView:a3];
  [(ENUILoggingInfoHeaderView *)self setNeedsUpdateConstraints];
}

- (void)updateConstraints
{
  id v3 = [(ENUILoggingInfoHeaderView *)self textViewTrailingConstraint];
  [v3 constant];
  double v5 = v4;
  v6 = [(ENUILoggingInfoHeaderView *)self tableView];
  [v6 _marginWidth];
  double v8 = v7;

  if (v5 != v8)
  {
    double v9 = [(ENUILoggingInfoHeaderView *)self tableView];
    [v9 _marginWidth];
    double v11 = v10;
    id v12 = [(ENUILoggingInfoHeaderView *)self textViewTrailingConstraint];
    [v12 setConstant:v11];
  }
  v13 = [(ENUILoggingInfoHeaderView *)self textViewLeadingConstraint];
  [v13 constant];
  double v15 = v14;
  v16 = [(ENUILoggingInfoHeaderView *)self tableView];
  [v16 _marginWidth];
  double v18 = v17;

  if (v15 != v18)
  {
    v19 = [(ENUILoggingInfoHeaderView *)self tableView];
    [v19 _marginWidth];
    double v21 = v20;
    v22 = [(ENUILoggingInfoHeaderView *)self textViewLeadingConstraint];
    [v22 setConstant:v21];
  }
  v23.receiver = self;
  v23.super_class = (Class)ENUILoggingInfoHeaderView;
  [(ENUILoggingInfoHeaderView *)&v23 updateConstraints];
}

- (double)preferredHeightForWidth:(double)a3 inTableView:(id)a4
{
  [(ENUILoggingInfoHeaderView *)self setTableView:a4];
  LODWORD(v6) = 1148846080;
  LODWORD(v7) = 1112014848;
  -[ENUILoggingInfoHeaderView systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](self, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", a3, UILayoutFittingCompressedSize.height, v6, v7);
  return v8;
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (NSLayoutConstraint)textViewLeadingConstraint
{
  return self->_textViewLeadingConstraint;
}

- (void)setTextViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)textViewTrailingConstraint
{
  return self->_textViewTrailingConstraint;
}

- (void)setTextViewTrailingConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_textViewLeadingConstraint, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end