@interface HSSetupTroubleshootingTipCell
+ (BOOL)requiresConstraintBasedLayout;
- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6;
- (HSSetupTroubleshootingTipCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HSSetupTroubleshootingTipCellDelegate)delegate;
- (NAUILayoutConstraintSet)constraintSet;
- (NSAttributedString)attributedBodyString;
- (NSString)titleString;
- (UILabel)titleLabel;
- (UITextView)bodyTextView;
- (unint64_t)tip;
- (void)prepareForReuse;
- (void)setAttributedBodyString:(id)a3;
- (void)setBodyTextView:(id)a3;
- (void)setConstraintSet:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTip:(unint64_t)a3;
- (void)setTitleLabel:(id)a3;
- (void)setTitleString:(id)a3;
- (void)updateConstraints;
@end

@implementation HSSetupTroubleshootingTipCell

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HSSetupTroubleshootingTipCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v6 = a4;
  v44.receiver = self;
  v44.super_class = (Class)HSSetupTroubleshootingTipCell;
  v7 = [(HSSetupTroubleshootingTipCell *)&v44 initWithStyle:a3 reuseIdentifier:v6];
  v8 = v7;
  if (v7)
  {
    double left = UIEdgeInsetsZero.left;
    double bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
    -[HSSetupTroubleshootingTipCell setSeparatorInset:](v7, "setSeparatorInset:", UIEdgeInsetsZero.top, left, bottom, right);
    v12 = +[UIColor clearColor];
    [(HSSetupTroubleshootingTipCell *)v8 setBackgroundColor:v12];

    id v13 = objc_alloc((Class)UILabel);
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    id v17 = [v13 initWithFrame:CGRectZero.origin.x, y, width, height];
    [(HSSetupTroubleshootingTipCell *)v8 setTitleLabel:v17];

    v18 = [(HSSetupTroubleshootingTipCell *)v8 titleLabel];
    [v18 setNumberOfLines:0];

    v19 = [(HSSetupTroubleshootingTipCell *)v8 titleLabel];
    [v19 setTranslatesAutoresizingMaskIntoConstraints:0];

    v20 = +[HUFontUtilities preferredFontForTextStyle:UIFontTextStyleSubheadline traits:32770];
    v21 = [(HSSetupTroubleshootingTipCell *)v8 titleLabel];
    [v21 setFont:v20];

    v22 = [(HSSetupTroubleshootingTipCell *)v8 contentView];
    v23 = [(HSSetupTroubleshootingTipCell *)v8 titleLabel];
    [v22 addSubview:v23];

    id v24 = [objc_alloc((Class)UITextView) initWithFrame:CGRectZero.origin.x, y, width, height];
    [(HSSetupTroubleshootingTipCell *)v8 setBodyTextView:v24];

    v25 = +[UIColor clearColor];
    v26 = [(HSSetupTroubleshootingTipCell *)v8 bodyTextView];
    [v26 setBackgroundColor:v25];

    v27 = [(HSSetupTroubleshootingTipCell *)v8 bodyTextView];
    [v27 setContentInset:UIEdgeInsetsZero.top, left, bottom, right];

    v28 = [(HSSetupTroubleshootingTipCell *)v8 bodyTextView];
    v29 = [v28 textContainer];
    [v29 setLineFragmentPadding:0.0];

    v30 = [(HSSetupTroubleshootingTipCell *)v8 bodyTextView];
    [v30 setEditable:0];

    v31 = [(HSSetupTroubleshootingTipCell *)v8 bodyTextView];
    [v31 setScrollEnabled:0];

    v32 = [(HSSetupTroubleshootingTipCell *)v8 bodyTextView];
    [v32 setDelegate:v8];

    v33 = [(HSSetupTroubleshootingTipCell *)v8 bodyTextView];
    [v33 setTranslatesAutoresizingMaskIntoConstraints:0];

    v34 = [(HSSetupTroubleshootingTipCell *)v8 bodyTextView];
    [v34 _setInteractiveTextSelectionDisabled:1];

    v35 = [(HSSetupTroubleshootingTipCell *)v8 contentView];
    v36 = [(HSSetupTroubleshootingTipCell *)v8 bodyTextView];
    [v35 addSubview:v36];

    objc_initWeak(&location, v8);
    id v37 = objc_alloc((Class)NAUILayoutConstraintSet);
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100023610;
    v41[3] = &unk_1000A9BA0;
    objc_copyWeak(&v42, &location);
    v38 = (NAUILayoutConstraintSet *)[v37 initWithOwningView:v8 constraintBuilder:v41];
    constraintSet = v8->_constraintSet;
    v8->_constraintSet = v38;

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
  }

  return v8;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)HSSetupTroubleshootingTipCell;
  [(HSSetupTroubleshootingTipCell *)&v3 prepareForReuse];
  [(HSSetupTroubleshootingTipCell *)self setAttributedBodyString:0];
}

- (void)updateConstraints
{
  objc_super v3 = [(HSSetupTroubleshootingTipCell *)self constraintSet];
  [v3 activateIfNeeded];

  v4.receiver = self;
  v4.super_class = (Class)HSSetupTroubleshootingTipCell;
  [(HSSetupTroubleshootingTipCell *)&v4 updateConstraints];
}

- (NSString)titleString
{
  v2 = [(HSSetupTroubleshootingTipCell *)self titleLabel];
  objc_super v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setTitleString:(id)a3
{
  id v4 = a3;
  id v5 = [(HSSetupTroubleshootingTipCell *)self titleLabel];
  [v5 setText:v4];
}

- (NSAttributedString)attributedBodyString
{
  v2 = [(HSSetupTroubleshootingTipCell *)self bodyTextView];
  objc_super v3 = [v2 attributedText];

  return (NSAttributedString *)v3;
}

- (void)setAttributedBodyString:(id)a3
{
  id v9 = [a3 mutableCopy];
  id v4 = +[HUFontUtilities preferredFontForTextStyle:UIFontTextStyleSubheadline traits:0x8000];
  [v9 addAttribute:NSFontAttributeName value:v4 range:0, [v9 length]];
  id v5 = [(HSSetupTroubleshootingTipCell *)self bodyTextView];
  [v5 setAttributedText:v9];

  id v6 = +[UIColor secondaryLabelColor];
  v7 = [(HSSetupTroubleshootingTipCell *)self bodyTextView];
  [v7 setTextColor:v6];

  v8 = [(HSSetupTroubleshootingTipCell *)self bodyTextView];
  [v8 setNeedsLayout];
}

- (void)setTip:(unint64_t)a3
{
  self->_tip = a3;
  switch(a3)
  {
    case 0uLL:
      sub_100060C64(@"HSTroubleshootingTipManuallyEnterCodeLink");
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      v10 = sub_100060D80(@"HSTroubleshootingTipManuallyEnterCodeFormat", @"%@", v4, v5, v6, v7, v8, v9, (uint64_t)v24);
      v11 = +[NSURL URLWithString:@"home://HSSetupTroubleshootingTipEnterASetupCodePunchoutURLString"];
      v12 = +[NSAttributedString hf_attributedLinkStringForString:v10 linkString:v24 linkURL:v11];
      [(HSSetupTroubleshootingTipCell *)self setAttributedBodyString:v12];
      id v13 = sub_100060C64(@"HSTroubleshootingTipManuallyEnterCodeTitle");
      [(HSSetupTroubleshootingTipCell *)self setTitleString:v13];

      goto LABEL_7;
    case 1uLL:
      id v14 = objc_alloc((Class)NSAttributedString);
      v15 = sub_100060C64(@"HSSetupTroubleshootingTipMakeAccessoryDiscoverable");
      id v16 = [v14 initWithString:v15];
      [(HSSetupTroubleshootingTipCell *)self setAttributedBodyString:v16];

      id v17 = @"HSSetupTroubleshootingTipMakeAccessoryDiscoverableTitle";
      goto LABEL_6;
    case 2uLL:
      id v18 = objc_alloc((Class)NSAttributedString);
      v19 = sub_100060C64(@"HSSetupTroubleshootingTipUseManufacturersApp");
      id v20 = [v18 initWithString:v19];
      [(HSSetupTroubleshootingTipCell *)self setAttributedBodyString:v20];

      id v17 = @"HSSetupTroubleshootingTipUseManufacturersAppTitle";
      goto LABEL_6;
    case 3uLL:
      id v21 = objc_alloc((Class)NSAttributedString);
      v22 = sub_100060C64(@"HSTroubleshootingTipReset");
      id v23 = [v21 initWithString:v22];
      [(HSSetupTroubleshootingTipCell *)self setAttributedBodyString:v23];

      id v17 = @"HSTroubleshootingTipResetTitle";
LABEL_6:
      sub_100060C64(v17);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      -[HSSetupTroubleshootingTipCell setTitleString:](self, "setTitleString:");
LABEL_7:

      break;
    default:
      return;
  }
}

- (BOOL)textView:(id)a3 shouldInteractWithURL:(id)a4 inRange:(_NSRange)a5 interaction:(int64_t)a6
{
  id v7 = a4;
  uint64_t v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412546;
    id v14 = self;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%@: User tapped URL: %@", (uint8_t *)&v13, 0x16u);
  }

  uint64_t v9 = [v7 absoluteString];
  unsigned int v10 = [v9 isEqual:@"home://HSSetupTroubleshootingTipEnterASetupCodePunchoutURLString"];

  if (v10)
  {
    v11 = [(HSSetupTroubleshootingTipCell *)self delegate];
    [v11 actionInvokedForTip:0];
  }
  return v10 ^ 1;
}

- (HSSetupTroubleshootingTipCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HSSetupTroubleshootingTipCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)tip
{
  return self->_tip;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
}

- (UITextView)bodyTextView
{
  return self->_bodyTextView;
}

- (void)setBodyTextView:(id)a3
{
}

- (NAUILayoutConstraintSet)constraintSet
{
  return self->_constraintSet;
}

- (void)setConstraintSet:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_constraintSet, 0);
  objc_storeStrong((id *)&self->_bodyTextView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end