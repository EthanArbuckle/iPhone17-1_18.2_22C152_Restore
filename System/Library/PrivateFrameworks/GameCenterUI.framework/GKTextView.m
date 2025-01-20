@interface GKTextView
+ (void)initialize;
- (GKLabel)placeholderLabel;
- (GKTextStyle)_baseStyle;
- (GKTextStyle)appliedStyle;
- (GKTextView)initWithFrame:(CGRect)a3;
- (NSAttributedString)attributedPlaceholderText;
- (NSString)placeholderText;
- (id)insertDictationResultPlaceholder;
- (void)applyTextStyle:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)removeDictationResultPlaceholder:(id)a3 willInsertResult:(BOOL)a4;
- (void)replayAndApplyStyle;
- (void)setAppliedStyle:(id)a3;
- (void)setAttributedPlaceholderText:(id)a3;
- (void)setAttributedText:(id)a3;
- (void)setPlaceholderLabel:(id)a3;
- (void)setPlaceholderText:(id)a3;
- (void)setText:(id)a3;
- (void)set_baseStyle:(id)a3;
- (void)updatePlaceholderVisibility;
@end

@implementation GKTextView

+ (void)initialize
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_class();
  v6[0] = objc_opt_class();
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  v4 = [v2 appearanceWhenContainedInInstancesOfClasses:v3];

  id v5 = objc_alloc_init(MEMORY[0x1E4F63A08]);
  objc_msgSend(v4, "set_baseStyle:", v5);
}

- (GKTextView)initWithFrame:(CGRect)a3
{
  v10.receiver = self;
  v10.super_class = (Class)GKTextView;
  v3 = -[GKTextView initWithFrame:](&v10, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x1E4FB16C8] currentDevice];
    uint64_t v5 = [v4 userInterfaceIdiom];

    if (v5 != 1 || (*MEMORY[0x1E4F63830] ? (BOOL v6 = *MEMORY[0x1E4F63A38] == 0) : (BOOL v6 = 0), v6)) {
      v7 = (Class *)0x1E4F63A08;
    }
    else {
      v7 = (Class *)0x1E4F63A00;
    }
    id v8 = objc_alloc_init(*v7);
    objc_storeStrong((id *)&v3->__baseStyle, v8);
  }
  return v3;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)GKTextView;
  [(GKTextView *)&v4 dealloc];
}

- (void)updatePlaceholderVisibility
{
  id v5 = [(GKTextView *)self text];
  BOOL v3 = [v5 length] != 0;
  objc_super v4 = [(GKTextView *)self placeholderLabel];
  [v4 setHidden:v3];
}

- (void)setText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GKTextView;
  [(GKTextView *)&v4 setText:a3];
  [(GKTextView *)self replayAndApplyStyle];
}

- (void)setAttributedText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)GKTextView;
  [(GKTextView *)&v4 setAttributedText:a3];
  [(GKTextView *)self replayAndApplyStyle];
}

- (void)setPlaceholderText:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x1E4F639F8];
  id v5 = a3;
  BOOL v6 = [v4 textStyle];
  id v8 = [v6 composeMessage];

  v7 = [v5 _gkAttributedStringByApplyingStyle:v8];

  [(GKTextView *)self setAttributedPlaceholderText:v7];
}

- (void)setAttributedPlaceholderText:(id)a3
{
  id v8 = a3;
  objc_super v4 = [(GKTextView *)self placeholderLabel];
  if (v8 && !v4)
  {
    objc_super v4 = objc_alloc_init(GKLabel);
    [(GKTextView *)self addSubview:v4];
    [(GKTextView *)self setPlaceholderLabel:v4];
    [(GKTextView *)self updatePlaceholderVisibility];
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v6 = *MEMORY[0x1E4FB07F0];
    v7 = [(GKTextView *)self textStorage];
    [v5 addObserver:self selector:sel_textStorageDidChangeNotification_ name:v6 object:v7];
  }
  [(GKLabel *)v4 setAttributedText:v8];
  [(GKTextView *)self setNeedsLayout];
}

- (NSString)placeholderText
{
  v2 = [(GKTextView *)self placeholderLabel];
  BOOL v3 = [v2 text];

  return (NSString *)v3;
}

- (NSAttributedString)attributedPlaceholderText
{
  v2 = [(GKTextView *)self placeholderLabel];
  BOOL v3 = [v2 attributedText];

  return (NSAttributedString *)v3;
}

- (void)layoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)GKTextView;
  [(GKTextView *)&v17 layoutSubviews];
  BOOL v3 = [(GKTextView *)self placeholderLabel];
  if (v3)
  {
    [(GKTextView *)self bounds];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    v12 = [v3 text];
    if ([v12 _gkIsNaturallyRTL]) {
      uint64_t v13 = 2;
    }
    else {
      uint64_t v13 = 0;
    }
    [v3 setTextAlignment:v13];

    [v3 setNumberOfLines:0];
    [v3 setOpaque:0];
    [v3 setBackgroundColor:0];
    [(GKTextView *)self textContainerInset];
    double v15 = v7 + v14;
    objc_msgSend(v3, "sizeThatFits:", v9, v11);
    objc_msgSend(v3, "setFrame:", v5 + 5.0, v15, v9 + -12.0, v16);
  }
}

- (void)set_baseStyle:(id)a3
{
  double v5 = (GKTextStyle *)a3;
  p_baseStyle = &self->__baseStyle;
  if (self->__baseStyle != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_baseStyle, a3);
    p_baseStyle = (GKTextStyle **)[(GKTextView *)self replayAndApplyStyle];
    double v5 = v7;
  }

  MEMORY[0x1F41817F8](p_baseStyle, v5);
}

- (void)applyTextStyle:(id)a3
{
  p_appliedStyle = &self->_appliedStyle;
  double v6 = (GKTextStyle *)a3;
  double v7 = v6;
  if (*p_appliedStyle != v6)
  {
    objc_storeStrong((id *)&self->_appliedStyle, a3);
    double v6 = *p_appliedStyle;
  }
  if (v6) {
    [(GKTextView *)self replayAndApplyStyle];
  }
}

- (void)replayAndApplyStyle
{
  BOOL v3 = self->__baseStyle;
  appliedStyle = self->_appliedStyle;
  if (appliedStyle)
  {
    double v7 = v3;
    uint64_t v5 = [(GKTextStyle *)appliedStyle replayOnBaseStyle:self->__baseStyle systemContentSizeDidChange:0];

    BOOL v3 = (GKTextStyle *)v5;
  }
  if (v3)
  {
    double v8 = v3;
    double v6 = [(GKTextStyle *)v3 attributes];
    [(GKTextView *)self setTypingAttributes:v6];

    BOOL v3 = v8;
  }

  MEMORY[0x1F41817F8](appliedStyle, v3);
}

- (id)insertDictationResultPlaceholder
{
  BOOL v3 = [(GKTextView *)self placeholderLabel];
  [v3 setAlpha:0.0];

  v6.receiver = self;
  v6.super_class = (Class)GKTextView;
  double v4 = [(GKTextView *)&v6 insertDictationResultPlaceholder];

  return v4;
}

- (void)removeDictationResultPlaceholder:(id)a3 willInsertResult:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [(GKTextView *)self placeholderLabel];
  [v7 setAlpha:1.0];

  v8.receiver = self;
  v8.super_class = (Class)GKTextView;
  [(GKTextView *)&v8 removeDictationResultPlaceholder:v6 willInsertResult:v4];
}

- (GKTextStyle)_baseStyle
{
  return self->__baseStyle;
}

- (GKTextStyle)appliedStyle
{
  return self->_appliedStyle;
}

- (void)setAppliedStyle:(id)a3
{
}

- (GKLabel)placeholderLabel
{
  return self->_placeholderLabel;
}

- (void)setPlaceholderLabel:(id)a3
{
  self->_placeholderLabel = (GKLabel *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appliedStyle, 0);

  objc_storeStrong((id *)&self->__baseStyle, 0);
}

@end