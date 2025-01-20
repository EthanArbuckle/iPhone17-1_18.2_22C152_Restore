@interface CREditTextTableCell
- (CREditTextTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (UITextView)textView;
- (void)layoutSubviews;
- (void)setTextView:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation CREditTextTableCell

- (CREditTextTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  id v8 = a5;
  v21.receiver = self;
  v21.super_class = (Class)CREditTextTableCell;
  v9 = [(CREditTextTableCell *)&v21 initWithStyle:a3 reuseIdentifier:a4 specifier:v8];
  v10 = v9;
  if (v9)
  {
    [(CREditTextTableCell *)v9 setSelectionStyle:0];
    [(CREditTextTableCell *)v10 setAccessoryType:0];
    id v11 = objc_msgSend(objc_alloc((Class)UITextView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v12 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleBody];
    UIFontDescriptorTraitKey v24 = UIFontWeightTrait;
    v13 = +[NSNumber numberWithDouble:UIFontWeightRegular];
    v25 = v13;
    v14 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];

    UIFontDescriptorAttributeName v22 = UIFontDescriptorTraitsAttribute;
    v23 = v14;
    v15 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    v16 = [v12 fontDescriptorByAddingAttributes:v15];

    v17 = +[UIFont fontWithDescriptor:v16 size:0.0];
    [v11 setFont:v17];

    [v11 setEditable:1];
    [v11 setAllowsEditingTextAttributes:0];
    [v11 setScrollEnabled:0];
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(CREditTextTableCell *)v10 setTextView:v11];
    v18 = [(CREditTextTableCell *)v10 contentView];
    [v18 addSubview:v11];

    v19 = [v8 target];
    [v11 setDelegate:v19];
  }
  return v10;
}

- (void)setValue:(id)a3
{
  id v4 = a3;
  v5 = [(CREditTextTableCell *)self textView];
  [v5 setText:v4];

  [(CREditTextTableCell *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)CREditTextTableCell;
  [(CREditTextTableCell *)&v12 layoutSubviews];
  PSTextViewInsets();
  [(CREditTextTableCell *)self bounds];
  UIRectInset();
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(CREditTextTableCell *)self textView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (UITextView)textView
{
  return self->_textView;
}

- (void)setTextView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end