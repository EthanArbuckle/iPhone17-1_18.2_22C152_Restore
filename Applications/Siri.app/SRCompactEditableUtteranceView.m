@interface SRCompactEditableUtteranceView
- (BOOL)editableTextViewTextShouldPreventCorrection:(id)a3;
- (SRCompactEditableUtteranceView)initWithFrame:(CGRect)a3 userUtterance:(id)a4 delegate:(id)a5;
- (SRCompactEditableUtteranceViewDelegate)_delegate;
- (SREditableTextView)_textView;
- (void)_setDelegate:(id)a3;
- (void)_setTextView:(id)a3;
- (void)_setupConstraints;
- (void)_setupTextView;
- (void)beginEditing;
- (void)editableTextViewRequestKeyboardForTapToEditWithCompletion:(id)a3;
- (void)editableTextViewTextDidFinishCorrecting:(id)a3;
- (void)editableTextViewTextDidResignFirstResponder:(id)a3;
- (void)editableTextViewTextWillBeginCorrecting:(id)a3;
- (void)layoutSubviews;
- (void)safeAreaInsetsDidChange;
- (void)setAuxiliaryView:(id)a3;
@end

@implementation SRCompactEditableUtteranceView

- (SRCompactEditableUtteranceView)initWithFrame:(CGRect)a3 userUtterance:(id)a4 delegate:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  id v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)SRCompactEditableUtteranceView;
  v14 = -[SRCompactEditableUtteranceView initWithFrame:](&v17, "initWithFrame:", x, y, width, height);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_userUtterance, a4);
    [(SRCompactEditableUtteranceView *)v15 _setupTextView];
    [(SRCompactEditableUtteranceView *)v15 _setupConstraints];
    [(SRCompactEditableUtteranceView *)v15 _setDelegate:v13];
  }

  return v15;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)SRCompactEditableUtteranceView;
  [(SRCompactEditableUtteranceView *)&v12 layoutSubviews];
  [(SRCompactEditableUtteranceView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  v7 = [(SRCompactEditableUtteranceView *)self _textView];
  [v7 sizeThatFits:v4, v6];
  double v9 = v8;

  [(NSLayoutConstraint *)self->_textViewHeightAnchor setConstant:v9];
  textViewTopAnchor = self->_textViewTopAnchor;
  [(SRCompactEditableUtteranceView *)self safeAreaInsets];
  [(NSLayoutConstraint *)textViewTopAnchor setConstant:v11 + 24.0];
}

- (void)safeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)SRCompactEditableUtteranceView;
  [(SRCompactEditableUtteranceView *)&v3 safeAreaInsetsDidChange];
  [(SRCompactEditableUtteranceView *)self setNeedsLayout];
}

- (void)beginEditing
{
}

- (void)setAuxiliaryView:(id)a3
{
  id v4 = a3;
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(SRCompactEditableUtteranceView *)self addSubview:v4];
  double v5 = [v4 leadingAnchor];
  double v6 = [(SRCompactEditableUtteranceView *)self leadingAnchor];
  [(SRCompactEditableUtteranceView *)self safeAreaInsets];
  double v8 = [v5 constraintEqualToAnchor:v6 constant:v7];
  [v8 setActive:1];

  double v9 = [v4 trailingAnchor];
  v10 = [(SRCompactEditableUtteranceView *)self trailingAnchor];
  [(SRCompactEditableUtteranceView *)self safeAreaInsets];
  objc_super v12 = [v9 constraintEqualToAnchor:v10 constant:v11];
  [v12 setActive:1];

  id v13 = [v4 topAnchor];
  v14 = [(SRCompactEditableUtteranceView *)self _textView];
  v15 = [v14 bottomAnchor];
  v16 = [v13 constraintEqualToAnchor:v15 constant:0.0];
  [v16 setActive:1];

  id v20 = [v4 bottomAnchor];

  objc_super v17 = [(SRCompactEditableUtteranceView *)self bottomAnchor];
  [(SRCompactEditableUtteranceView *)self safeAreaInsets];
  v19 = [v20 constraintEqualToAnchor:v17 constant:v18];
  [v19 setActive:1];
}

- (void)_setupTextView
{
  objc_super v3 = -[SREditableTextView initWithFrame:presentationStyle:]([SREditableTextView alloc], "initWithFrame:presentationStyle:", 1, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  [(SRCompactEditableUtteranceView *)self _setTextView:v3];

  id v4 = [(SRCompactEditableUtteranceView *)self _textView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v5 = [(SRCompactEditableUtteranceView *)self _textView];
  [v5 setDelegate:self];

  id v13 = [(AFUserUtterance *)self->_userUtterance bestTextInterpretation];
  double v6 = [(SRCompactEditableUtteranceView *)self _textView];
  [v6 setText:v13];

  double v7 = [(AFUserUtterance *)self->_userUtterance allPhrases];
  uint64_t v8 = [(AFUserUtterance *)self->_userUtterance correctionIdentifier];
  double v9 = (void *)v8;
  if (v7) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    double v11 = [(SRCompactEditableUtteranceView *)self _textView];
    [v11 setDictationResult:v7 withCorrectionIdentifier:v9];
  }
  objc_super v12 = [(SRCompactEditableUtteranceView *)self _textView];
  [(SRCompactEditableUtteranceView *)self addSubview:v12];
}

- (void)_setupConstraints
{
  objc_super v3 = [(SRCompactEditableUtteranceView *)self _textView];
  id v4 = [v3 leadingAnchor];
  double v5 = [(SRCompactEditableUtteranceView *)self leadingAnchor];
  [(SRCompactEditableUtteranceView *)self safeAreaInsets];
  double v7 = [v4 constraintEqualToAnchor:v5 constant:v6];
  [v7 setActive:1];

  uint64_t v8 = [(SRCompactEditableUtteranceView *)self _textView];
  double v9 = [v8 trailingAnchor];
  BOOL v10 = [(SRCompactEditableUtteranceView *)self trailingAnchor];
  [(SRCompactEditableUtteranceView *)self safeAreaInsets];
  objc_super v12 = [v9 constraintEqualToAnchor:v10 constant:v11];
  [v12 setActive:1];

  id v13 = [(SRCompactEditableUtteranceView *)self _textView];
  v14 = [v13 topAnchor];
  v15 = [(SRCompactEditableUtteranceView *)self topAnchor];
  [(SRCompactEditableUtteranceView *)self safeAreaInsets];
  [v14 constraintEqualToAnchor:v15];
  v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  textViewTopAnchor = self->_textViewTopAnchor;
  self->_textViewTopAnchor = v16;

  [(NSLayoutConstraint *)self->_textViewTopAnchor setActive:1];
  double v18 = [(SRCompactEditableUtteranceView *)self _textView];
  v19 = [v18 heightAnchor];
  id v20 = [v19 constraintEqualToConstant:0.0];
  textViewHeightAnchor = self->_textViewHeightAnchor;
  self->_textViewHeightAnchor = v20;

  v22 = self->_textViewHeightAnchor;

  [(NSLayoutConstraint *)v22 setActive:1];
}

- (void)editableTextViewRequestKeyboardForTapToEditWithCompletion:(id)a3
{
  id v4 = a3;
  double v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[SRCompactEditableUtteranceView editableTextViewRequestKeyboardForTapToEditWithCompletion:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #compact: requesting keyboard for tap to edit", (uint8_t *)&v7, 0xCu);
  }
  double v6 = [(SRCompactEditableUtteranceView *)self _delegate];
  [v6 editableUtteranceView:self requestsKeyboardWithCompletion:v4];
}

- (void)editableTextViewTextDidFinishCorrecting:(id)a3
{
  id v4 = [a3 text];
  double v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[SRCompactEditableUtteranceView editableTextViewTextDidFinishCorrecting:]";
    __int16 v9 = 2112;
    BOOL v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s #compact: #tap2edit: correction finished with editedText: %@", (uint8_t *)&v7, 0x16u);
  }
  double v6 = [(SRCompactEditableUtteranceView *)self _delegate];
  [v6 editableUtteranceView:self didFinishEditingWithText:v4];
}

- (void)editableTextViewTextDidResignFirstResponder:(id)a3
{
  id v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[SRCompactEditableUtteranceView editableTextViewTextDidResignFirstResponder:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s #compact: did resign first responder", (uint8_t *)&v6, 0xCu);
  }
  double v5 = [(SRCompactEditableUtteranceView *)self _delegate];
  [v5 didResignFirstResponderFromUtteranceView:self];
}

- (BOOL)editableTextViewTextShouldPreventCorrection:(id)a3
{
  return 0;
}

- (void)editableTextViewTextWillBeginCorrecting:(id)a3
{
  id v4 = [(SRCompactEditableUtteranceView *)self _delegate];
  [v4 willBeginEditingFromUtteranceView:self];

  id v5 = +[AFAnalytics sharedAnalytics];
  [v5 logEventWithType:1424 context:0];
}

- (SREditableTextView)_textView
{
  return self->_textView;
}

- (void)_setTextView:(id)a3
{
}

- (SRCompactEditableUtteranceViewDelegate)_delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SRCompactEditableUtteranceViewDelegate *)WeakRetained;
}

- (void)_setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_userUtterance, 0);
  objc_storeStrong((id *)&self->_textViewTopAnchor, 0);

  objc_storeStrong((id *)&self->_textViewHeightAnchor, 0);
}

@end