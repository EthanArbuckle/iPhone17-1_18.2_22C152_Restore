@interface FBKQuestionAnswerCell
+ (id)reuseIdentifier;
- (BOOL)hasKeyboardFocus;
- (BOOL)hasPlaceholder;
- (BOOL)shouldAllowEditing;
- (BOOL)showError;
- (FBKAnswer)answer;
- (FBKBugFormEditorDelegate)bugFormEditorDelegate;
- (FBKQuestion)question;
- (FBKQuestionAnswerCell)initWithCoder:(id)a3;
- (FBKQuestionAnswerCell)initWithFrame:(CGRect)a3;
- (FBKQuestionAnswerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (FBKQuestionCellTextView)answerTextView;
- (NSLayoutConstraint)answerHeightConstraint;
- (NSLayoutConstraint)answerTextViewLeadingConstraint;
- (NSLayoutConstraint)answerTextViewTopConstraint;
- (NSLayoutConstraint)answerTextViewTrailingConstraint;
- (NSLayoutConstraint)answerTopAnchorConstraint;
- (NSString)diffableIdentifier;
- (NSString)itemIdentifier;
- (UIImageView)answerTextViewAccessoryImageView;
- (UIImageView)errorArrow;
- (UILabel)questionLabel;
- (id)accessibilityHint;
- (id)accessibilityIdentifier;
- (id)accessibilityLabel;
- (unint64_t)accessibilityTraits;
- (void)awakeFromNib;
- (void)beginEditingQuestion;
- (void)commonInit;
- (void)endEditingQuestion;
- (void)hideAccessoryView;
- (void)hideErrorArrow;
- (void)sanitizeAnswer:(id)a3;
- (void)saveAnswer;
- (void)setAnswer:(id)a3;
- (void)setAnswerHeightConstraint:(id)a3;
- (void)setAnswerTextView:(id)a3;
- (void)setAnswerTextViewAccessoryImageView:(id)a3;
- (void)setAnswerTextViewLeadingConstraint:(id)a3;
- (void)setAnswerTextViewTopConstraint:(id)a3;
- (void)setAnswerTextViewTrailingConstraint:(id)a3;
- (void)setAnswerTopAnchorConstraint:(id)a3;
- (void)setBugFormEditorDelegate:(id)a3;
- (void)setDiffableIdentifier:(id)a3;
- (void)setErrorArrow:(id)a3;
- (void)setHasKeyboardFocus:(BOOL)a3;
- (void)setHasPlaceholder:(BOOL)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setQuestion:(id)a3;
- (void)setQuestionLabel:(id)a3;
- (void)setShowError:(BOOL)a3;
- (void)showAccessoryView;
- (void)showErrorArrow;
- (void)updateErrorArrow;
@end

@implementation FBKQuestionAnswerCell

+ (id)reuseIdentifier
{
  return @"FBKQuestionAnswerCell";
}

- (FBKQuestionAnswerCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)FBKQuestionAnswerCell;
  v4 = [(FBKQuestionAnswerCell *)&v7 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4) {
    [(FBKQuestionAnswerCell *)v4 commonInit];
  }
  return v5;
}

- (FBKQuestionAnswerCell)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FBKQuestionAnswerCell;
  v3 = [(FBKQuestionAnswerCell *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(FBKQuestionAnswerCell *)v3 commonInit];
  }
  return v4;
}

- (FBKQuestionAnswerCell)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)FBKQuestionAnswerCell;
  v3 = -[FBKQuestionAnswerCell initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(FBKQuestionAnswerCell *)v3 commonInit];
  }
  return v4;
}

- (void)commonInit
{
  self->_showError = 0;
  id v3 = objc_alloc(MEMORY[0x263F82828]);
  v4 = (void *)MEMORY[0x263F827E8];
  v5 = [MEMORY[0x263F82818] configurationWithWeight:7];
  objc_super v6 = [v4 systemImageNamed:@"arrow.forward.circle.fill" withConfiguration:v5];
  objc_super v7 = (UIImageView *)[v3 initWithImage:v6];
  errorArrow = self->_errorArrow;
  self->_errorArrow = v7;

  [(UIImageView *)self->_errorArrow setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)self->_errorArrow setContentMode:1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_answerTextView);
  v10 = [WeakRetained textContainer];
  [v10 setLineBreakMode:0];

  self->_hasPlaceholder = 1;
  self->_hasKeyboardFocus = 0;
  v11 = [(FBKQuestionAnswerCell *)self questionLabel];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  v12 = [(FBKQuestionAnswerCell *)self answerTextView];
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];

  v13 = [(FBKQuestionAnswerCell *)self answerTextView];
  [v13 setEditable:0];

  v14 = [(FBKQuestionAnswerCell *)self answerTextView];
  [v14 setSelectable:0];

  id v15 = [(FBKQuestionAnswerCell *)self answerTextView];
  [v15 setUserInteractionEnabled:0];
}

- (void)awakeFromNib
{
  v19.receiver = self;
  v19.super_class = (Class)FBKQuestionAnswerCell;
  [(FBKQuestionAnswerCell *)&v19 awakeFromNib];
  [(FBKQuestionAnswerCell *)self updateErrorArrow];
  id v3 = [MEMORY[0x263F825C8] labelColor];
  v4 = [(FBKQuestionAnswerCell *)self questionLabel];
  [v4 setTextColor:v3];

  v5 = [(FBKQuestionAnswerCell *)self questionLabel];
  [v5 setIsAccessibilityElement:0];

  objc_super v6 = [(FBKQuestionAnswerCell *)self answerTextView];
  [v6 setIsAccessibilityElement:0];

  objc_super v7 = [MEMORY[0x263F825C8] systemRedColor];
  v8 = [(FBKQuestionAnswerCell *)self errorArrow];
  [v8 setTintColor:v7];

  v9 = [(FBKQuestionAnswerCell *)self questionLabel];
  [v9 setAdjustsFontForContentSizeCategory:1];

  v10 = [(FBKQuestionAnswerCell *)self answerTextView];
  [v10 setAdjustsFontForContentSizeCategory:1];

  [(FBKQuestionAnswerCell *)self setIsAccessibilityElement:1];
  v11 = [(FBKQuestionAnswerCell *)self answerTextView];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  v12 = [(FBKQuestionAnswerCell *)self answerTextView];
  v13 = [v12 heightAnchor];
  v14 = [v13 constraintGreaterThanOrEqualToConstant:75.0];
  [(FBKQuestionAnswerCell *)self setAnswerHeightConstraint:v14];

  id v15 = [(FBKQuestionAnswerCell *)self answerTextView];
  v16 = [v15 topAnchor];
  v17 = [(FBKQuestionAnswerCell *)self topAnchor];
  v18 = [v16 constraintEqualToAnchor:v17];
  [(FBKQuestionAnswerCell *)self setAnswerTopAnchorConstraint:v18];
}

- (void)setShowError:(BOOL)a3
{
  self->_showError = a3;
  [(FBKQuestionAnswerCell *)self updateErrorArrow];
}

- (void)updateErrorArrow
{
  if (self->_showError) {
    [(FBKQuestionAnswerCell *)self showErrorArrow];
  }
  else {
    [(FBKQuestionAnswerCell *)self hideErrorArrow];
  }
}

- (void)showErrorArrow
{
  v42[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [(FBKQuestionAnswerCell *)self errorArrow];
  if (v3)
  {
    id v36 = (id)v3;
    v4 = [(FBKQuestionAnswerCell *)self errorArrow];
    v5 = [v4 superview];
    if (v5)
    {
    }
    else
    {
      objc_super v6 = [(FBKQuestionAnswerCell *)self questionLabel];

      if (v6)
      {
        objc_super v7 = [(FBKQuestionAnswerCell *)self contentView];
        v8 = [(FBKQuestionAnswerCell *)self errorArrow];
        [v7 addSubview:v8];

        v9 = [MEMORY[0x263EFF980] array];
        v10 = (void *)MEMORY[0x263F08938];
        v41 = @"margin";
        v11 = NSNumber;
        [(FBKQuestionAnswerCell *)self separatorInset];
        double v13 = v12;
        [(FBKQuestionAnswerCell *)self safeAreaInsets];
        id v15 = [v11 numberWithDouble:v13 - v14];
        v42[0] = v15;
        v16 = [NSDictionary dictionaryWithObjects:v42 forKeys:&v41 count:1];
        v39[0] = @"arrow";
        v17 = [(FBKQuestionAnswerCell *)self errorArrow];
        v39[1] = @"q";
        v40[0] = v17;
        v18 = [(FBKQuestionAnswerCell *)self questionLabel];
        v40[1] = v18;
        objc_super v19 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
        v20 = [v10 constraintsWithVisualFormat:@"|-margin-[arrow(18)]-8-[q]" options:0 metrics:v16 views:v19];

        [v9 addObjectsFromArray:v20];
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          v21 = (void *)MEMORY[0x263F08938];
          v37[0] = @"arrow";
          v22 = [(FBKQuestionAnswerCell *)self errorArrow];
          v37[1] = @"a";
          v38[0] = v22;
          v23 = [(FBKQuestionAnswerCell *)self answerTextView];
          v38[1] = v23;
          v24 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
          v25 = [v21 constraintsWithVisualFormat:@"[arrow]-8-[a]" options:0 metrics:0 views:v24];

          v26 = [v25 firstObject];
          LODWORD(v27) = 1148829696;
          [v26 setPriority:v27];

          [v9 addObjectsFromArray:v25];
        }
        v28 = (void *)MEMORY[0x263F08938];
        v29 = [(FBKQuestionAnswerCell *)self errorArrow];
        v30 = [v28 constraintWithItem:v29 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:17.0];
        [v9 addObject:v30];

        v31 = [(FBKQuestionAnswerCell *)self contentView];
        v32 = (void *)MEMORY[0x263F08938];
        v33 = [(FBKQuestionAnswerCell *)self errorArrow];
        v34 = [v32 constraintWithItem:v33 attribute:10 relatedBy:0 toItem:v31 attribute:10 multiplier:1.0 constant:0.0];
        [v9 addObject:v34];

        v35 = [(FBKQuestionAnswerCell *)self contentView];
        [v35 addConstraints:v9];
      }
    }
  }
}

- (void)hideErrorArrow
{
  uint64_t v3 = [(FBKQuestionAnswerCell *)self errorArrow];
  if (v3)
  {
    v4 = (void *)v3;
    v5 = [(FBKQuestionAnswerCell *)self errorArrow];
    objc_super v6 = [v5 superview];

    if (v6)
    {
      id v7 = [(FBKQuestionAnswerCell *)self errorArrow];
      [v7 removeFromSuperview];
    }
  }
}

- (void)hideAccessoryView
{
}

- (void)showAccessoryView
{
}

- (void)setQuestion:(id)a3
{
  id v17 = a3;
  p_question = &self->_question;
  objc_storeStrong((id *)&self->_question, a3);
  objc_super v6 = [(FBKQuestionAnswerCell *)self answerTextView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    if ([(FBKQuestion *)*p_question answerType])
    {
      if ([(FBKQuestion *)*p_question answerType] == 1)
      {
        v8 = [(FBKQuestionAnswerCell *)self answerTextView];
        [v8 setCharacterLimit:4096];

        v9 = [(FBKQuestionAnswerCell *)self answerHeightConstraint];
        [v9 setActive:1];

        v10 = [v17 text];
        int v11 = [v10 isEqualToString:&stru_26DDF6A30];

        double v12 = [(FBKQuestionAnswerCell *)self answerTopAnchorConstraint];
        double v13 = v12;
        if (v11)
        {
          uint64_t v14 = 1;
LABEL_9:
          [v12 setActive:v14];

          goto LABEL_10;
        }
LABEL_8:
        uint64_t v14 = 0;
        goto LABEL_9;
      }
    }
    else
    {
      id v15 = [(FBKQuestionAnswerCell *)self answerTextView];
      [v15 setCharacterLimit:255];
    }
    v16 = [(FBKQuestionAnswerCell *)self answerHeightConstraint];
    [v16 setActive:0];

    double v12 = [(FBKQuestionAnswerCell *)self answerTopAnchorConstraint];
    double v13 = v12;
    goto LABEL_8;
  }
LABEL_10:
  [(FBKQuestionAnswerCell *)self setNeedsLayout];
}

- (void)setAnswer:(id)a3
{
  id v12 = a3;
  objc_storeStrong((id *)&self->_answer, a3);
  self->_hasPlaceholder = 1;
  uint64_t v5 = [v12 value];
  if (v5)
  {
    objc_super v6 = (void *)v5;
    id v7 = [v12 value];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v9 = [v12 value];
      self->_hasPlaceholder = [v9 length] == 0;
    }
  }
  if (self->_hasPlaceholder) {
    [MEMORY[0x263F825C8] secondaryLabelColor];
  }
  else {
  v10 = [MEMORY[0x263F825C8] labelColor];
  }
  int v11 = [(FBKQuestionAnswerCell *)self answerTextView];
  [v11 setTextColor:v10];
}

- (BOOL)shouldAllowEditing
{
  uint64_t v3 = [(FBKQuestionAnswerCell *)self question];
  if ([v3 answerType])
  {
    v4 = [(FBKQuestionAnswerCell *)self question];
    if ([v4 answerType] == 1) {
      BOOL v5 = ![(FBKQuestionAnswerCell *)self hasKeyboardFocus];
    }
    else {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    BOOL v5 = ![(FBKQuestionAnswerCell *)self hasKeyboardFocus];
  }

  return v5;
}

- (void)beginEditingQuestion
{
  if ([(FBKQuestionAnswerCell *)self shouldAllowEditing])
  {
    uint64_t v3 = [(FBKQuestionAnswerCell *)self question];
    char v4 = [v3 canDisplayChoicesInline];

    if ((v4 & 1) == 0)
    {
      BOOL v5 = [(FBKQuestionAnswerCell *)self answerTextView];
      [v5 setEditable:1];

      objc_super v6 = [(FBKQuestionAnswerCell *)self answerTextView];
      [v6 setUserInteractionEnabled:1];

      id v7 = [(FBKQuestionAnswerCell *)self answerTextView];
      [v7 setIsAccessibilityElement:1];

      [(FBKQuestionAnswerCell *)self setIsAccessibilityElement:0];
      if ([(FBKQuestionAnswerCell *)self hasPlaceholder])
      {
        v8 = [(FBKQuestionAnswerCell *)self answerTextView];
        [v8 setText:&stru_26DDF6A30];

        v9 = [MEMORY[0x263F825C8] labelColor];
        v10 = [(FBKQuestionAnswerCell *)self answerTextView];
        [v10 setTextColor:v9];

        [(FBKQuestionAnswerCell *)self setHasPlaceholder:0];
      }
      [MEMORY[0x263F82E00] setAnimationsEnabled:0];
      int v11 = [(FBKQuestionAnswerCell *)self answerTextView];
      [v11 becomeFirstResponder];

      [MEMORY[0x263F82E00] setAnimationsEnabled:1];
      [(FBKQuestionAnswerCell *)self setHasKeyboardFocus:1];
      [(FBKQuestionAnswerCell *)self setNeedsLayout];
    }
  }
}

- (void)saveAnswer
{
  uint64_t v3 = [(FBKQuestionAnswerCell *)self answerTextView];
  char v4 = [v3 text];
  BOOL v5 = [(FBKQuestionAnswerCell *)self answerTextView];
  objc_msgSend(v4, "truncate:", objc_msgSend(v5, "characterLimit"));
  id v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_super v6 = [(FBKQuestionAnswerCell *)self answer];
  [v6 setValue:v10];

  id v7 = [(FBKQuestionAnswerCell *)self answer];
  [(FBKQuestionAnswerCell *)self sanitizeAnswer:v7];

  v8 = [(FBKQuestionAnswerCell *)self bugFormEditorDelegate];
  v9 = [(FBKQuestionAnswerCell *)self question];
  [v8 answerDidChangeForQuestion:v9];
}

- (void)endEditingQuestion
{
  [(FBKQuestionAnswerCell *)self saveAnswer];
  uint64_t v3 = [(FBKQuestionAnswerCell *)self answer];
  uint64_t v4 = [v3 value];
  if (v4)
  {
    BOOL v5 = (void *)v4;
    objc_super v6 = [(FBKQuestionAnswerCell *)self answer];
    id v7 = [v6 value];
    uint64_t v8 = [v7 length];

    if (v8)
    {
      v9 = [MEMORY[0x263F825C8] labelColor];
      id v10 = [(FBKQuestionAnswerCell *)self answerTextView];
      [v10 setTextColor:v9];
      goto LABEL_11;
    }
  }
  else
  {
  }
  [(FBKQuestionAnswerCell *)self setHasPlaceholder:1];
  int v11 = [(FBKQuestionAnswerCell *)self question];
  uint64_t v12 = [v11 placeholder];
  if (!v12)
  {

    goto LABEL_9;
  }
  double v13 = (void *)v12;
  uint64_t v14 = [(FBKQuestionAnswerCell *)self question];
  id v15 = [v14 placeholder];
  uint64_t v16 = [v15 length];

  if (!v16)
  {
LABEL_9:
    id v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v18 = [v17 localizedStringForKey:@"TEXT_ANSWER_PLACEHOLDER" value:&stru_26DDF6A30 table:0];
    goto LABEL_10;
  }
  id v17 = [(FBKQuestionAnswerCell *)self question];
  uint64_t v18 = [v17 placeholder];
LABEL_10:
  objc_super v19 = (void *)v18;
  v20 = [(FBKQuestionAnswerCell *)self answerTextView];
  [v20 setText:v19];

  v21 = [MEMORY[0x263F825C8] tertiaryLabelColor];
  v22 = [(FBKQuestionAnswerCell *)self answerTextView];
  [v22 setTextColor:v21];

  v9 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83570]];
  id v10 = [(FBKQuestionAnswerCell *)self answerTextView];
  [v10 setFont:v9];
LABEL_11:

  v23 = [(FBKQuestionAnswerCell *)self answerTextView];
  [v23 resignFirstResponder];

  [(FBKQuestionAnswerCell *)self setHasKeyboardFocus:0];
  v24 = [(FBKQuestionAnswerCell *)self answerTextView];
  [v24 setEditable:0];

  v25 = [(FBKQuestionAnswerCell *)self answerTextView];
  [v25 setUserInteractionEnabled:0];

  v26 = [(FBKQuestionAnswerCell *)self answerTextView];
  [v26 setIsAccessibilityElement:0];

  [(FBKQuestionAnswerCell *)self setIsAccessibilityElement:1];

  [(FBKQuestionAnswerCell *)self setNeedsLayout];
}

- (void)sanitizeAnswer:(id)a3
{
  id v10 = a3;
  uint64_t v3 = [v10 value];
  if (v3)
  {
    uint64_t v4 = (void *)v3;
    BOOL v5 = [v10 value];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v7 = [v10 value];
      uint64_t v8 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
      v9 = [v7 stringByTrimmingCharactersInSet:v8];
      [v10 setValue:v9];
    }
  }
}

- (id)accessibilityLabel
{
  uint64_t v3 = NSString;
  uint64_t v4 = [(FBKQuestionAnswerCell *)self questionLabel];
  BOOL v5 = [v4 text];
  objc_super v6 = [(FBKQuestionAnswerCell *)self answerTextView];
  id v7 = [v6 text];
  uint64_t v8 = [v3 stringWithFormat:@"%@, %@", v5, v7];

  return v8;
}

- (id)accessibilityIdentifier
{
  v2 = NSString;
  uint64_t v3 = [(FBKQuestionAnswerCell *)self questionLabel];
  uint64_t v4 = [v3 text];
  BOOL v5 = [v2 stringWithFormat:@"FBKEditor@%@", v4];

  return v5;
}

- (unint64_t)accessibilityTraits
{
  v3.receiver = self;
  v3.super_class = (Class)FBKQuestionAnswerCell;
  return *MEMORY[0x263F83260] | [(FBKQuestionAnswerCell *)&v3 accessibilityTraits];
}

- (id)accessibilityHint
{
  BOOL v2 = [(FBKQuestionAnswerCell *)self shouldAllowEditing];
  objc_super v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v4 = v3;
  if (v2) {
    BOOL v5 = @"ANSWER_CELL_HINT_EDIT";
  }
  else {
    BOOL v5 = @"ANSWER_CELL_HINT_CHOOSE";
  }
  objc_super v6 = [v3 localizedStringForKey:v5 value:&stru_26DDF6A30 table:0];

  return v6;
}

- (NSString)itemIdentifier
{
  return self->itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (UILabel)questionLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_questionLabel);

  return (UILabel *)WeakRetained;
}

- (void)setQuestionLabel:(id)a3
{
}

- (FBKQuestionCellTextView)answerTextView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_answerTextView);

  return (FBKQuestionCellTextView *)WeakRetained;
}

- (void)setAnswerTextView:(id)a3
{
}

- (UIImageView)answerTextViewAccessoryImageView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_answerTextViewAccessoryImageView);

  return (UIImageView *)WeakRetained;
}

- (void)setAnswerTextViewAccessoryImageView:(id)a3
{
}

- (NSLayoutConstraint)answerTextViewTopConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_answerTextViewTopConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setAnswerTextViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)answerTextViewLeadingConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_answerTextViewLeadingConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setAnswerTextViewLeadingConstraint:(id)a3
{
}

- (NSLayoutConstraint)answerTextViewTrailingConstraint
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_answerTextViewTrailingConstraint);

  return (NSLayoutConstraint *)WeakRetained;
}

- (void)setAnswerTextViewTrailingConstraint:(id)a3
{
}

- (FBKBugFormEditorDelegate)bugFormEditorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_bugFormEditorDelegate);

  return (FBKBugFormEditorDelegate *)WeakRetained;
}

- (void)setBugFormEditorDelegate:(id)a3
{
}

- (FBKQuestion)question
{
  return self->_question;
}

- (FBKAnswer)answer
{
  return self->_answer;
}

- (BOOL)showError
{
  return self->_showError;
}

- (BOOL)hasKeyboardFocus
{
  return self->_hasKeyboardFocus;
}

- (void)setHasKeyboardFocus:(BOOL)a3
{
  self->_hasKeyboardFocus = a3;
}

- (NSString)diffableIdentifier
{
  return self->_diffableIdentifier;
}

- (void)setDiffableIdentifier:(id)a3
{
}

- (UIImageView)errorArrow
{
  return self->_errorArrow;
}

- (void)setErrorArrow:(id)a3
{
}

- (BOOL)hasPlaceholder
{
  return self->_hasPlaceholder;
}

- (void)setHasPlaceholder:(BOOL)a3
{
  self->_hasPlaceholder = a3;
}

- (NSLayoutConstraint)answerHeightConstraint
{
  return self->_answerHeightConstraint;
}

- (void)setAnswerHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)answerTopAnchorConstraint
{
  return self->_answerTopAnchorConstraint;
}

- (void)setAnswerTopAnchorConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_answerTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_answerHeightConstraint, 0);
  objc_storeStrong((id *)&self->_errorArrow, 0);
  objc_storeStrong((id *)&self->_diffableIdentifier, 0);
  objc_storeStrong((id *)&self->_answer, 0);
  objc_storeStrong((id *)&self->_question, 0);
  objc_destroyWeak((id *)&self->_bugFormEditorDelegate);
  objc_destroyWeak((id *)&self->_answerTextViewTrailingConstraint);
  objc_destroyWeak((id *)&self->_answerTextViewLeadingConstraint);
  objc_destroyWeak((id *)&self->_answerTextViewTopConstraint);
  objc_destroyWeak((id *)&self->_answerTextViewAccessoryImageView);
  objc_destroyWeak((id *)&self->_answerTextView);
  objc_destroyWeak((id *)&self->_questionLabel);

  objc_storeStrong((id *)&self->itemIdentifier, 0);
}

@end