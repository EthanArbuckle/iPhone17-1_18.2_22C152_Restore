@interface NotesAssistantSingleNoteViewCell
+ (BOOL)requiresConstraintBasedLayout;
+ (id)reuseIdentifier;
+ (void)initialize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NotesAssistantSingleNoteViewCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
- (void)setNote:(id)a3;
@end

@implementation NotesAssistantSingleNoteViewCell

+ (void)initialize
{
}

- (NotesAssistantSingleNoteViewCell)initWithFrame:(CGRect)a3
{
  v36.receiver = self;
  v36.super_class = (Class)NotesAssistantSingleNoteViewCell;
  v3 = -[NotesAssistantSingleNoteViewCell initWithFrame:](&v36, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor clearColor];
    [(NotesAssistantSingleNoteViewCell *)v3 setBackgroundColor:v4];

    v5 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    note = v3->_note;
    v3->_note = v5;

    [(UILabel *)v3->_note setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v3->_note setNumberOfLines:0];
    [(UILabel *)v3->_note setLineBreakMode:0];
    v7 = +[UIFont siriui_lightWeightBodySizeFont];
    [(UILabel *)v3->_note setFont:v7];

    v8 = +[UIColor siriui_textColor];
    [(UILabel *)v3->_note setTextColor:v8];

    v9 = +[UIColor clearColor];
    [(UILabel *)v3->_note setBackgroundColor:v9];

    v10 = [(NotesAssistantSingleNoteViewCell *)v3 contentView];
    [v10 addSubview:v3->_note];

    v11 = +[NSMutableArray array];
    v12 = _NSDictionaryOfVariableBindings(@"_note", v3->_note, 0);
    v13 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-(leftMargin)-[_note]-(rightMargin)-|", 0, &off_18DA0, v12);
    [v11 addObjectsFromArray:v13];

    v14 = v3->_note;
    v15 = [(NotesAssistantSingleNoteViewCell *)v3 contentView];
    v16 = +[UIScreen mainScreen];
    [v16 scale];
    double v18 = v17;
    v19 = [(UILabel *)v3->_note font];
    [v19 ascender];
    double v21 = 25.0 - v20;
    double v22 = ceil(v21);
    if (v18 >= 2.0) {
      double v22 = v21;
    }
    v23 = +[NSLayoutConstraint constraintWithItem:v14 attribute:3 relatedBy:0 toItem:v15 attribute:3 multiplier:1.0 constant:v22];
    [v11 addObject:v23];

    v24 = v3->_note;
    v25 = [(NotesAssistantSingleNoteViewCell *)v3 contentView];
    v26 = +[UIScreen mainScreen];
    [v26 scale];
    double v28 = v27;
    v29 = [(UILabel *)v3->_note font];
    [v29 descender];
    double v31 = v30 + 50.0;
    double v32 = ceil(v31);
    if (v28 < 2.0) {
      double v31 = v32;
    }
    v33 = +[NSLayoutConstraint constraintWithItem:v24 attribute:4 relatedBy:0 toItem:v25 attribute:4 multiplier:1.0 constant:-v31];
    [v11 addObject:v33];

    v34 = [(NotesAssistantSingleNoteViewCell *)v3 contentView];
    [v34 addConstraints:v11];
  }
  return v3;
}

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  v5 = +[UIScreen mainScreen];
  [v5 scale];
  double v6 = ceil(width + -15.0 + -15.0);
  if (v7 >= 2.0) {
    double v8 = width + -15.0 + -15.0;
  }
  else {
    double v8 = v6;
  }
  [(UILabel *)self->_note setPreferredMaxLayoutWidth:v8];

  -[UILabel systemLayoutSizeFittingSize:](self->_note, "systemLayoutSizeFittingSize:", UILayoutFittingCompressedSize.width, UILayoutFittingCompressedSize.height);
  double v10 = v9;
  v11 = +[UIScreen mainScreen];
  [v11 scale];
  double v13 = v12;
  v14 = [(UILabel *)self->_note font];
  [v14 ascender];
  double v16 = v10 + 25.0 - v15 + 50.0;
  double v17 = [(UILabel *)self->_note font];
  [v17 descender];
  double v19 = v16 + v18;
  double v20 = ceil(v19);
  if (v13 < 2.0) {
    double v21 = v20;
  }
  else {
    double v21 = v19;
  }

  double v22 = width;
  double v23 = v21;
  result.height = v23;
  result.double width = v22;
  return result;
}

- (void)setNote:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  ICDynamicCast();
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = ICDynamicCast();

  if (v15)
  {
    if ([v15 isPasswordProtected])
    {
      double v6 = [v15 title];
      double v7 = +[NSBundle bundleForClass:objc_opt_class()];
      double v8 = [v7 localizedStringForKey:@"This note is password protected." value:&stru_186B0 table:@"NotesAssistant"];
      double v9 = [v6 stringByAppendingFormat:@"\n\n%@", v8];
      [(UILabel *)self->_note setText:v9];
    }
    else
    {
      double v6 = [v15 noteAsPlainText];
      [(UILabel *)self->_note setText:v6];
    }

    v14 = [(UILabel *)self->_note attributedText];
    id v13 = [v14 mutableCopy];

    objc_msgSend(v13, "ic_setParagraphStyleForWritingDirection:andAlignment:", objc_msgSend(v15, "primaryWritingDirection"), 1);
    [(UILabel *)self->_note setAttributedText:v13];
    goto LABEL_9;
  }
  if (v5)
  {
    double v10 = [v5 contentAsPlainTextPreservingNewlines];
    [(UILabel *)self->_note setText:v10];

    v11 = [(UILabel *)self->_note text];
    id v12 = [v11 length];

    if (!v12)
    {
      id v13 = [v5 content];
      [(UILabel *)self->_note setText:v13];
LABEL_9:
    }
  }
}

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  v3 = NSStringFromClass(v2);
  id v4 = [v3 stringByAppendingString:@"ReuseIdentifier"];

  return v4;
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)NotesAssistantSingleNoteViewCell;
  [(NotesAssistantSingleNoteViewCell *)&v3 prepareForReuse];
  [(UILabel *)self->_note setText:0];
}

- (void).cxx_destruct
{
}

@end