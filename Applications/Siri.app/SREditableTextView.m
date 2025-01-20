@interface SREditableTextView
+ (double)insertionAnimatedZPosition;
- (BOOL)canResignFirstResponder;
- (BOOL)didCorrect;
- (BOOL)editable;
- (BOOL)isFirstResponder;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)resignFirstResponder;
- (BOOL)textViewShouldBeginEditing:(id)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)text;
- (SREditableTextView)initWithFrame:(CGRect)a3 presentationStyle:(int64_t)a4;
- (SREditableTextViewDelegate)delegate;
- (double)_indentWidth;
- (double)baselineOffsetFromBottom;
- (double)firstLineBaselineOffsetFromTop;
- (id)_createVisualEffectBackgroundViewForTextView:(id)a3 topOffset:(double *)a4;
- (int64_t)textAlignment;
- (void)_adjustLineSpacing;
- (void)_handleTap:(id)a3;
- (void)_requestKeyboardFocusAndBecomeFirstResponder;
- (void)beginEditing;
- (void)endEditingAndCorrect:(BOOL)a3;
- (void)layoutSubviews;
- (void)setDelegate:(id)a3;
- (void)setDictationResult:(id)a3 withCorrectionIdentifier:(id)a4;
- (void)setDidCorrect:(BOOL)a3;
- (void)setEditable:(BOOL)a3;
- (void)setText:(id)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidEndEditing:(id)a3;
- (void)utteranceTextDidReceiveReturnKey:(id)a3;
- (void)utteranceTextDidResignFirstResponder:(id)a3;
@end

@implementation SREditableTextView

- (SREditableTextView)initWithFrame:(CGRect)a3 presentationStyle:(int64_t)a4
{
  v30.receiver = self;
  v30.super_class = (Class)SREditableTextView;
  v5 = -[SREditableTextView initWithFrame:](&v30, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    v5->_presentationStyle = a4;
    int IsRTL = SiriLanguageIsRTL();
    uint64_t v8 = 2;
    if (!IsRTL) {
      uint64_t v8 = 0;
    }
    v6->_textAlignment = v8;
    v9 = [SRSpeechRecognizedCorrectionTextView alloc];
    double y = CGRectZero.origin.y;
    double width = CGRectZero.size.width;
    double height = CGRectZero.size.height;
    v13 = -[SRSpeechRecognizedCorrectionTextView initWithFrame:](v9, "initWithFrame:", CGRectZero.origin.x, y, width, height);
    textView = v6->_textView;
    v6->_textView = v13;

    [(SRSpeechRecognizedCorrectionTextView *)v6->_textView setDelegate:v6];
    v15 = +[UIFont _preferredFontForTextStyle:UIFontTextStyleBody variant:256];
    [(SRSpeechRecognizedCorrectionTextView *)v6->_textView setFont:v15];
    v16 = v6->_textView;
    v17 = +[UIColor clearColor];
    [(SRSpeechRecognizedCorrectionTextView *)v16 setBackgroundColor:v17];

    [(SRSpeechRecognizedCorrectionTextView *)v6->_textView setTextAlignment:v6->_textAlignment];
    [(SRSpeechRecognizedCorrectionTextView *)v6->_textView setBounces:0];
    [(SRSpeechRecognizedCorrectionTextView *)v6->_textView setClipsToBounds:0];
    [(SRSpeechRecognizedCorrectionTextView *)v6->_textView setScrollEnabled:0];
    [(SRSpeechRecognizedCorrectionTextView *)v6->_textView setReturnKeyType:9];
    -[SRSpeechRecognizedCorrectionTextView setTextContainerInset:](v6->_textView, "setTextContainerInset:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    if (v6->_presentationStyle == 1)
    {
      v6->_topOffsetForTextView = 8.0;
      v18 = v6->_textView;
      v19 = +[UIColor labelColor];
      [(SRSpeechRecognizedCorrectionTextView *)v18 setTextColor:v19];

      [(SRSpeechRecognizedCorrectionTextView *)v6->_textView setKeyboardAppearance:0];
      v20 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, y, width, height];
      backgroundView = v6->_backgroundView;
      v6->_backgroundView = v20;

      v22 = v6->_backgroundView;
      v23 = +[UIColor systemFillColor];
      [(UIView *)v22 setBackgroundColor:v23];
    }
    else
    {
      uint64_t v24 = [(SREditableTextView *)v6 _createVisualEffectBackgroundViewForTextView:v6->_textView topOffset:&v6->_topOffsetForTextView];
      v23 = v6->_backgroundView;
      v6->_backgroundView = (UIView *)v24;
    }

    [(UIView *)v6->_backgroundView _setContinuousCornerRadius:10.0];
    [(UIView *)v6->_backgroundView setUserInteractionEnabled:0];
    [(SREditableTextView *)v6 insertSubview:v6->_backgroundView below:v6->_textView];
    v25 = [(SRSpeechRecognizedCorrectionTextView *)v6->_textView font];
    [v25 _scaledValueForValue:8.0];
    v6->_heightOffsetForTextView = v26 + v6->_topOffsetForTextView;

    [(SREditableTextView *)v6 addSubview:v6->_textView];
    CGFloat v27 = SiriUIDefaultEdgePadding;
    v6->_edgeInsets.top = 0.0;
    v6->_edgeInsets.leading = v27;
    v6->_edgeInsets.bottom = 0.0;
    v6->_edgeInsets.trailing = v27;
    id v28 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v6 action:"_handleTap:"];
    [(SREditableTextView *)v6 addGestureRecognizer:v28];
  }
  return v6;
}

+ (double)insertionAnimatedZPosition
{
  return 500.0;
}

- (double)firstLineBaselineOffsetFromTop
{
  v2 = +[UIFont siriui_userUtteranceFont];
  [v2 ascender];
  double v4 = v3;

  return v4;
}

- (double)baselineOffsetFromBottom
{
  v2 = +[UIFont siriui_userUtteranceFont];
  [v2 descender];
  double v4 = -v3;

  return v4;
}

- (void)setText:(id)a3
{
  CFStringRef v4 = (const __CFString *)a3;
  if (v4) {
    CFStringRef v5 = v4;
  }
  else {
    CFStringRef v5 = &stru_1001463E0;
  }
  v6 = (__CFString *)v5;
  -[SRSpeechRecognizedCorrectionTextView setText:](self->_textView, "setText:");
  [(SREditableTextView *)self _adjustLineSpacing];
  [(SREditableTextView *)self setNeedsLayout];
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
  -[SRSpeechRecognizedCorrectionTextView setTextAlignment:](self->_textView, "setTextAlignment:");

  [(SREditableTextView *)self setNeedsLayout];
}

- (NSString)text
{
  return (NSString *)[(SRSpeechRecognizedCorrectionTextView *)self->_textView text];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double width = a3.width;
  double v5 = -88.0;
  if (self->_presentationStyle == 1) {
    double v5 = -52.0;
  }
  -[SRSpeechRecognizedCorrectionTextView sizeThatFits:](self->_textView, "sizeThatFits:", width + v5, 1.79769313e308);
  double v7 = v6 + self->_heightOffsetForTextView;
  double v8 = width;
  result.double height = v7;
  result.double width = v8;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(SREditableTextView *)self bounds];
  CGFloat v10 = x;
  CGFloat v11 = y;

  return CGRectContainsPoint(*(CGRect *)&v6, *(CGPoint *)&v10);
}

- (void)layoutSubviews
{
  [(SREditableTextView *)self recursive_setSemanticContentAttribute:SiriLanguageSemanticContentAttribute()];
  v16.receiver = self;
  v16.super_class = (Class)SREditableTextView;
  [(SREditableTextView *)&v16 layoutSubviews];
  [(SREditableTextView *)self bounds];
  CGFloat x = v17.origin.x;
  double y = v17.origin.y;
  double width = v17.size.width;
  double height = v17.size.height;
  int64_t presentationStyle = self->_presentationStyle;
  double v8 = CGRectGetWidth(v17);
  double v9 = -88.0;
  if (presentationStyle == 1) {
    double v9 = -52.0;
  }
  double v10 = v8 + v9;
  v18.origin.CGFloat x = x;
  v18.origin.double y = y;
  v18.size.double width = width;
  v18.size.double height = height;
  -[SRSpeechRecognizedCorrectionTextView sizeThatFits:](self->_textView, "sizeThatFits:", v10, CGRectGetHeight(v18));
  double v12 = 44.0;
  if (self->_presentationStyle == 1) {
    double v12 = 26.0;
  }
  -[SRSpeechRecognizedCorrectionTextView setFrame:](self->_textView, "setFrame:", v12, self->_topOffsetForTextView, v10, v11);
  int64_t v13 = self->_presentationStyle;
  double v14 = 30.0;
  if (v13 == 1) {
    double v14 = 14.0;
  }
  double v15 = -60.0;
  if (v13 == 1) {
    double v15 = -28.0;
  }
  -[UIView setFrame:](self->_backgroundView, "setFrame:", v14, y, width + v15, height);
}

- (BOOL)canResignFirstResponder
{
  return [(SRSpeechRecognizedCorrectionTextView *)self->_textView canResignFirstResponder];
}

- (BOOL)resignFirstResponder
{
  v4.receiver = self;
  v4.super_class = (Class)SREditableTextView;
  [(SREditableTextView *)&v4 resignFirstResponder];
  return [(SRSpeechRecognizedCorrectionTextView *)self->_textView resignFirstResponder];
}

- (BOOL)isFirstResponder
{
  return [(SRSpeechRecognizedCorrectionTextView *)self->_textView isFirstResponder];
}

- (void)_handleTap:(id)a3
{
  if ([a3 state] == (id)3)
  {
    [(SREditableTextView *)self _requestKeyboardFocusAndBecomeFirstResponder];
  }
}

- (void)_requestKeyboardFocusAndBecomeFirstResponder
{
  objc_initWeak(&location, self);
  double v3 = [(SREditableTextView *)self delegate];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001D6F0;
  v4[3] = &unk_100143548;
  objc_copyWeak(&v5, &location);
  [v3 editableTextViewRequestKeyboardForTapToEditWithCompletion:v4];

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)beginEditing
{
}

- (void)endEditingAndCorrect:(BOOL)a3
{
  BOOL v3 = a3;
  [(SRSpeechRecognizedCorrectionTextView *)self->_textView resignFirstResponder];
  if (v3)
  {
    id v5 = [(SREditableTextView *)self delegate];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(SREditableTextView *)self delegate];
      [v7 editableTextViewTextDidFinishCorrecting:self];
    }
  }
}

- (void)_adjustLineSpacing
{
  id v6 = objc_alloc_init((Class)NSMutableParagraphStyle);
  BOOL v3 = [(SRSpeechRecognizedCorrectionTextView *)self->_textView font];
  [v3 _scaledValueForValue:1.0];
  [v6 setLineSpacing:];

  objc_super v4 = [(SRSpeechRecognizedCorrectionTextView *)self->_textView attributedText];
  id v5 = [v4 mutableCopy];

  [v5 addAttribute:NSParagraphStyleAttributeName value:v6 range:0, [v5 length]];
  [(SRSpeechRecognizedCorrectionTextView *)self->_textView setAttributedText:v5];
}

- (void)setDictationResult:(id)a3 withCorrectionIdentifier:(id)a4
{
  [(SRSpeechRecognizedCorrectionTextView *)self->_textView _setDictationResult:a3 withCorrectionIdentifier:a4];
  [(SREditableTextView *)self _adjustLineSpacing];
  textView = self->_textView;

  [(SRSpeechRecognizedCorrectionTextView *)textView setNeedsLayout];
}

- (BOOL)textViewShouldBeginEditing:(id)a3
{
  objc_super v4 = [(SREditableTextView *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v4 editableTextViewTextShouldPreventCorrection:self] & 1) != 0)
  {
    BOOL v5 = 0;
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      [v4 editableTextViewTextWillBeginCorrecting:self];
    }
    BOOL v5 = 1;
  }

  return v5;
}

- (void)textViewDidEndEditing:(id)a3
{
  if (self->_didCorrect) {
    self->_didCorrect = 0;
  }
  else {
    [(SREditableTextView *)self endEditingAndCorrect:0];
  }
}

- (void)textViewDidChange:(id)a3
{
  objc_super v4 = [a3 window];

  if (v4)
  {
    id v5 = [(SREditableTextView *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v5 editableTextViewTextDidChange:self];
    }
  }
}

- (double)_indentWidth
{
  double v2 = 28.0;
  if ((SiriUIIsCompactWidth() & 1) == 0)
  {
    if (SiriUIIsCompactHeight()) {
      return 28.0;
    }
    else {
      return 31.0;
    }
  }
  return v2;
}

- (void)utteranceTextDidResignFirstResponder:(id)a3
{
  objc_super v4 = [(SREditableTextView *)self delegate];
  [v4 editableTextViewTextDidResignFirstResponder:self];

  [(SREditableTextView *)self setNeedsLayout];
}

- (void)utteranceTextDidReceiveReturnKey:(id)a3
{
  self->_didCorrect = 1;
  [(SREditableTextView *)self endEditingAndCorrect:1];
  objc_super v4 = [(SREditableTextView *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(SREditableTextView *)self delegate];
    [v6 editableTextViewTextDidReceiveReturnKey:self];
  }
}

- (id)_createVisualEffectBackgroundViewForTextView:(id)a3 topOffset:(double *)a4
{
  id v5 = a3;
  id v6 = [v5 font];
  id v7 = [v5 font];
  [v7 ascender];
  [v6 _scaledValueForValue:29.0 - v8];
  *(void *)a4 = v9;

  double v10 = +[UIColor whiteColor];
  [v5 setTextColor:v10];

  id v11 = objc_alloc((Class)UIVisualEffectView);
  double v12 = +[UIVibrancyEffect siriui_userUtteranceEditModeVibrancyEffect];
  id v13 = [v11 initWithEffect:v12];

  double v14 = [v13 contentView];
  [v14 _setContinuousCornerRadius:10.0];

  double v15 = [v13 contentView];
  objc_super v16 = +[UIColor whiteColor];
  [v15 setBackgroundColor:v16];

  return v13;
}

- (SREditableTextViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SREditableTextViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)textAlignment
{
  return self->_textAlignment;
}

- (BOOL)editable
{
  return self->_editable;
}

- (void)setEditable:(BOOL)a3
{
  self->_editable = a3;
}

- (BOOL)didCorrect
{
  return self->_didCorrect;
}

- (void)setDidCorrect:(BOOL)a3
{
  self->_didCorrect = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_storeStrong((id *)&self->_textView, 0);
}

@end