@interface HUTappableTextView
- (HUTappableTextView)initWithCoder:(id)a3;
- (HUTappableTextView)initWithFrame:(CGRect)a3;
- (HUTappableTextViewDelegate)tappableTextViewDelegate;
- (NSString)identifier;
- (UITapGestureRecognizer)tapRecognizer;
- (void)_handleTap:(id)a3;
- (void)configureTapRecognizer;
- (void)setIdentifier:(id)a3;
- (void)setTapRecognizer:(id)a3;
- (void)setTappableTextViewDelegate:(id)a3;
@end

@implementation HUTappableTextView

- (HUTappableTextView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUTappableTextView;
  v3 = -[HUTappableTextView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(HUTappableTextView *)v3 configureTapRecognizer];
  }
  return v4;
}

- (HUTappableTextView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HUTappableTextView;
  v3 = [(HUTappableTextView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(HUTappableTextView *)v3 configureTapRecognizer];
  }
  return v4;
}

- (void)setTappableTextViewDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tappableTextViewDelegate);
  char v5 = [WeakRetained isEqual:obj];

  if ((v5 & 1) == 0)
  {
    objc_storeWeak((id *)&self->_tappableTextViewDelegate, obj);
    [(HUTappableTextView *)self configureTapRecognizer];
  }
}

- (void)configureTapRecognizer
{
  v3 = [(HUTappableTextView *)self tapRecognizer];

  if (!v3)
  {
    v4 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__handleTap_];
    [(HUTappableTextView *)self setTapRecognizer:v4];

    char v5 = [(HUTappableTextView *)self tapRecognizer];
    [v5 setDelegate:self];

    objc_super v6 = [(HUTappableTextView *)self tapRecognizer];
    [(HUTappableTextView *)self addGestureRecognizer:v6];
  }
  id v8 = [(HUTappableTextView *)self tappableTextViewDelegate];
  v7 = [(HUTappableTextView *)self tapRecognizer];
  [v7 setEnabled:v8 != 0];
}

- (void)_handleTap:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  [a3 locationInView:self];
  double v6 = v5;
  double v8 = v7;
  [(HUTappableTextView *)self textContainerInset];
  double v10 = v6 - v9;
  [(HUTappableTextView *)self textContainerInset];
  double v12 = v8 - v11;
  v13 = [(HUTappableTextView *)self layoutManager];
  v14 = [(HUTappableTextView *)self textContainer];
  unint64_t v15 = objc_msgSend(v13, "characterIndexForPoint:inTextContainer:fractionOfDistanceBetweenInsertionPoints:", v14, 0, v10, v12);

  v16 = [(HUTappableTextView *)self textStorage];
  unint64_t v17 = [v16 length];

  if (v15 < v17)
  {
    v18 = [(HUTappableTextView *)self attributedText];
    uint64_t v19 = [v18 attributesAtIndex:v15 effectiveRange:0];
    v20 = (void *)v19;
    v21 = (void *)MEMORY[0x1E4F1CC08];
    if (v19) {
      v21 = (void *)v19;
    }
    id v22 = v21;

    v23 = HFLogForCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = NSStringFromSelector(a2);
      v25 = [(HUTappableTextView *)self attributedText];
      v26 = [v25 string];
      int v30 = 138413314;
      v31 = self;
      __int16 v32 = 2112;
      v33 = v24;
      __int16 v34 = 2112;
      v35 = v26;
      __int16 v36 = 2048;
      unint64_t v37 = v15;
      __int16 v38 = 2112;
      id v39 = v22;
      _os_log_impl(&dword_1BE345000, v23, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped string: \"%@\" at index: %lu with attributes: %@", (uint8_t *)&v30, 0x34u);
    }
    v27 = [(HUTappableTextView *)self tappableTextViewDelegate];
    char v28 = objc_opt_respondsToSelector();

    if (v28)
    {
      v29 = [(HUTappableTextView *)self tappableTextViewDelegate];
      [v29 tappableTextView:self tappedAtIndex:v15 withAttributes:v22];
    }
  }
}

- (HUTappableTextViewDelegate)tappableTextViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tappableTextViewDelegate);

  return (HUTappableTextViewDelegate *)WeakRetained;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (UITapGestureRecognizer)tapRecognizer
{
  return self->_tapRecognizer;
}

- (void)setTapRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapRecognizer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);

  objc_destroyWeak((id *)&self->_tappableTextViewDelegate);
}

@end