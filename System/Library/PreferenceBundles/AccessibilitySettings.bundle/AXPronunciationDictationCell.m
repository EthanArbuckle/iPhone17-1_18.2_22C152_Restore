@interface AXPronunciationDictationCell
- (AXPronunciationDictationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (BOOL)dictationButtonEnabled;
- (BOOL)showsDictationButton;
- (BOOL)showsListeningState;
- (BOOL)showsPhonemes;
- (BOOL)showsSpinner;
- (UIActivityIndicatorView)indicatorView;
- (UIButton)dictateButton;
- (double)listeningDuration;
- (id)dictateView;
- (void)layoutSubviews;
- (void)setDictateButton:(id)a3;
- (void)setDictateView:(id)a3;
- (void)setDictationButtonEnabled:(BOOL)a3;
- (void)setIndicatorView:(id)a3;
- (void)setListeningDuration:(double)a3;
- (void)setShowsDictationButton:(BOOL)a3;
- (void)setShowsListeningState:(BOOL)a3;
- (void)setShowsPhonemes:(BOOL)a3;
- (void)setShowsSpinner:(BOOL)a3;
@end

@implementation AXPronunciationDictationCell

- (AXPronunciationDictationCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v34.receiver = self;
  v34.super_class = (Class)AXPronunciationDictationCell;
  v5 = [(AXPronunciationDictationCell *)&v34 initWithStyle:a3 reuseIdentifier:a4 specifier:a5];
  if (v5)
  {
    v6 = +[UIButton buttonWithType:0];
    [(AXPronunciationDictationCell *)v5 setDictateButton:v6];

    v7 = [(AXPronunciationDictationCell *)v5 dictateButton];
    [v7 setTitle:0 forState:0];

    v8 = [(AXPronunciationDictationCell *)v5 dictateButton];
    v9 = settingsLocString(@"DICTATE_BUTTON_TITLE", @"VoiceOverSettings");
    [v8 setAccessibilityLabel:v9];

    UIAccessibilityTraits v10 = UIAccessibilityTraitStartsMediaSession | UIAccessibilityTraitButton;
    v11 = [(AXPronunciationDictationCell *)v5 dictateButton];
    [v11 setAccessibilityTraits:v10];

    v12 = settingsLocString(@"DICTATE_HINT", @"VoiceOverSettings");
    v13 = [(AXPronunciationDictationCell *)v5 dictateButton];
    [v13 setAccessibilityHint:v12];

    v14 = +[NSBundle bundleForClass:objc_opt_class()];
    v15 = +[UIImage imageNamed:@"dictate" inBundle:v14];

    v16 = [(AXPronunciationDictationCell *)v5 tintColor];
    v17 = [v15 imageWithTintColor:v16 renderingMode:1];

    v18 = [(AXPronunciationDictationCell *)v5 dictateButton];
    [v18 setImage:v17 forState:0];

    v19 = [(AXPronunciationDictationCell *)v5 dictateButton];
    [(AXPronunciationDictationCell *)v5 setDictateView:v19];

    id v20 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    [(AXPronunciationDictationCell *)v5 setIndicatorView:v20];
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    v21 = [(AXPronunciationDictationCell *)v5 dictateButton];
    v35[0] = v21;
    v22 = [(AXPronunciationDictationCell *)v5 indicatorView];
    v35[1] = v22;
    v23 = +[NSArray arrayWithObjects:v35 count:2];

    id v24 = [v23 countByEnumeratingWithState:&v30 objects:v36 count:16];
    if (v24)
    {
      id v25 = v24;
      uint64_t v26 = *(void *)v31;
      do
      {
        v27 = 0;
        do
        {
          if (*(void *)v31 != v26) {
            objc_enumerationMutation(v23);
          }
          [*(id *)(*((void *)&v30 + 1) + 8 * (void)v27) setTranslatesAutoresizingMaskIntoConstraints:0];
          v27 = (char *)v27 + 1;
        }
        while (v25 != v27);
        id v25 = [v23 countByEnumeratingWithState:&v30 objects:v36 count:16];
      }
      while (v25);
    }

    v28 = [(AXPronunciationDictationCell *)v5 textField];
    [v28 setAccessibilityIdentifier:@"UIAccessibilityPronunciationEditorDictationCell"];
  }
  return v5;
}

- (void)layoutSubviews
{
  v34.receiver = self;
  v34.super_class = (Class)AXPronunciationDictationCell;
  [(AXPronunciationDictationCell *)&v34 layoutSubviews];
  listeningCircle = self->_listeningCircle;
  if (listeningCircle) {
    goto LABEL_7;
  }
  v4 = [(AXPronunciationDictationCell *)self dictateButton];
  [v4 frame];
  if (v5 <= 0.0)
  {
  }
  else
  {
    v6 = [(AXPronunciationDictationCell *)self dictateButton];
    unsigned __int8 v7 = [v6 isHidden];

    if ((v7 & 1) == 0)
    {
      v8 = [(AXPronunciationDictationCell *)self dictateButton];
      [v8 frame];
      double v10 = v9 * 0.5;

      v11 = +[CAShapeLayer layer];
      +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v10 * -0.5, 0.0, v10 + v10, v10 + v10, v10);
      id v12 = objc_claimAutoreleasedReturnValue();
      -[CAShapeLayer setPath:](v11, "setPath:", [v12 CGPath]);

      id v13 = +[UIColor clearColor];
      -[CAShapeLayer setFillColor:](v11, "setFillColor:", [v13 CGColor]);

      id v14 = [(AXPronunciationDictationCell *)self tintColor];
      -[CAShapeLayer setStrokeColor:](v11, "setStrokeColor:", [v14 CGColor]);

      [(CAShapeLayer *)v11 setLineWidth:1.0];
      v15 = [(AXPronunciationDictationCell *)self dictateButton];
      v16 = [v15 layer];
      [v16 addSublayer:v11];

      v17 = self->_listeningCircle;
      self->_listeningCircle = v11;
LABEL_9:

      goto LABEL_10;
    }
  }
  listeningCircle = self->_listeningCircle;
  if (listeningCircle)
  {
LABEL_7:
    [(CAShapeLayer *)listeningCircle removeFromSuperlayer];
    v18 = [(AXPronunciationDictationCell *)self dictateButton];
    unsigned __int8 v19 = [v18 isHidden];

    if ((v19 & 1) == 0)
    {
      v17 = [(AXPronunciationDictationCell *)self dictateButton];
      id v20 = [v17 layer];
      v21 = self->_listeningCircle;
      v22 = [(AXPronunciationDictationCell *)self layer];
      v23 = [v22 sublayers];
      objc_msgSend(v20, "insertSublayer:atIndex:", v21, objc_msgSend(v23, "count"));

      goto LABEL_9;
    }
  }
LABEL_10:
  [(AXPronunciationDictationCell *)self bounds];
  double v25 = v24;
  uint64_t v26 = [(AXPronunciationDictationCell *)self textField];
  [v26 frame];
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;

  long long v33 = [(AXPronunciationDictationCell *)self textField];
  objc_msgSend(v33, "setFrame:", v28, v30, (v25 - v28) * 0.75, v32);
}

- (void)setShowsSpinner:(BOOL)a3
{
  if (self->_showsSpinner != a3)
  {
    self->_showsSpinner = a3;
    if (a3)
    {
      v4 = [(AXPronunciationDictationCell *)self dictateButton];
      [v4 removeFromSuperview];

      double v5 = [(AXPronunciationDictationCell *)self indicatorView];
      [(AXPronunciationDictationCell *)self setDictateView:v5];

      v6 = [(AXPronunciationDictationCell *)self indicatorView];
      [v6 startAnimating];
    }
    else
    {
      unsigned __int8 v7 = [(AXPronunciationDictationCell *)self indicatorView];
      [v7 stopAnimating];

      v8 = [(AXPronunciationDictationCell *)self indicatorView];
      [v8 removeFromSuperview];

      v6 = [(AXPronunciationDictationCell *)self dictateButton];
      [(AXPronunciationDictationCell *)self setDictateView:v6];
    }

    [(AXPronunciationDictationCell *)self layoutSubviews];
  }
}

- (void)setShowsListeningState:(BOOL)a3
{
  self->_showsListeningState = a3;
  [(AXPronunciationDictationCell *)self layoutSubviews];
}

- (void)setDictationButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_dictationButtonEnabled = a3;
  double v5 = [(AXPronunciationDictationCell *)self dictateButton];
  [v5 setEnabled:v3];

  [(AXPronunciationDictationCell *)self layoutSubviews];
}

- (void)setShowsDictationButton:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(AXPronunciationDictationCell *)self dictateButton];
  [v5 setHidden:!v3];

  [(AXPronunciationDictationCell *)self layoutSubviews];
}

- (void)setDictateView:(id)a3
{
  id v4 = a3;
  id v15 = [(AXPronunciationDictationCell *)self contentView];
  double v5 = [(AXPronunciationDictationCell *)self contentView];
  [v5 addSubview:v4];

  v6 = +[NSLayoutConstraint constraintWithItem:v4 attribute:6 relatedBy:0 toItem:v15 attribute:6 multiplier:1.0 constant:-15.0];
  [v15 addConstraint:v6];

  unsigned __int8 v7 = +[NSLayoutConstraint constraintWithItem:v4 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:30.0];
  [v15 addConstraint:v7];

  v8 = [(AXPronunciationDictationCell *)self dictateButton];
  double v9 = [v8 imageForState:0];

  [v9 size];
  double v11 = v10 * 30.0;
  [v9 size];
  id v13 = +[NSLayoutConstraint constraintWithItem:v4 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v11 / v12];
  [v15 addConstraint:v13];

  id v14 = +[NSLayoutConstraint constraintWithItem:v4 attribute:10 relatedBy:0 toItem:v15 attribute:10 multiplier:1.0 constant:0.0];

  [v15 addConstraint:v14];
}

- (id)dictateView
{
  if ([(AXPronunciationDictationCell *)self showsSpinner]) {
    [(AXPronunciationDictationCell *)self indicatorView];
  }
  else {
  BOOL v3 = [(AXPronunciationDictationCell *)self dictateButton];
  }

  return v3;
}

- (UIButton)dictateButton
{
  return self->_dictateButton;
}

- (void)setDictateButton:(id)a3
{
}

- (BOOL)showsSpinner
{
  return self->_showsSpinner;
}

- (BOOL)showsDictationButton
{
  return self->_showsDictationButton;
}

- (BOOL)dictationButtonEnabled
{
  return self->_dictationButtonEnabled;
}

- (BOOL)showsListeningState
{
  return self->_showsListeningState;
}

- (BOOL)showsPhonemes
{
  return self->_showsPhonemes;
}

- (void)setShowsPhonemes:(BOOL)a3
{
  self->_showsPhonemes = a3;
}

- (double)listeningDuration
{
  return self->_listeningDuration;
}

- (void)setListeningDuration:(double)a3
{
  self->_listeningDuration = a3;
}

- (UIActivityIndicatorView)indicatorView
{
  return self->_indicatorView;
}

- (void)setIndicatorView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indicatorView, 0);
  objc_storeStrong((id *)&self->_dictateButton, 0);

  objc_storeStrong((id *)&self->_listeningCircle, 0);
}

@end