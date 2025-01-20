@interface CheckmarkTrainingView
- (BOOL)isAccessibilityElement;
- (CGSize)intrinsicContentSize;
- (CheckmarkTrainingView)init;
- (UIActivityIndicatorView)spinner;
- (UIImageView)symbolView;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (int64_t)checkmarkState;
- (void)_constrainSymbolView;
- (void)_removeSpinner;
- (void)_setUpSymbolView;
- (void)_updateViewWithSpinner;
- (void)_updateViewWithSymbolNamed:(id)a3;
- (void)layoutSubviews;
- (void)setCheckmarkState:(int64_t)a3;
- (void)setSpinner:(id)a3;
- (void)setSymbolView:(id)a3;
@end

@implementation CheckmarkTrainingView

- (CheckmarkTrainingView)init
{
  v5.receiver = self;
  v5.super_class = (Class)CheckmarkTrainingView;
  v2 = [(CheckmarkTrainingView *)&v5 init];
  if (v2)
  {
    id v3 = objc_alloc_init((Class)UIImageView);
    [(CheckmarkTrainingView *)v2 setSymbolView:v3];

    [(CheckmarkTrainingView *)v2 setCheckmarkState:0];
  }
  return v2;
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CheckmarkTrainingView;
  [(CheckmarkTrainingView *)&v3 layoutSubviews];
  [(CheckmarkTrainingView *)self _setUpSymbolView];
  [(CheckmarkTrainingView *)self _constrainSymbolView];
}

- (CGSize)intrinsicContentSize
{
  double v2 = 35.0;
  double v3 = 35.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)setCheckmarkState:(int64_t)a3
{
  self->_checkmarkState = a3;
  switch(a3)
  {
    case 0:
      v4 = +[UIColor tertiarySystemFillColor];
      objc_super v5 = [(CheckmarkTrainingView *)self symbolView];
      [v5 setTintColor:v4];

      CFStringRef v6 = @"circle.fill";
      goto LABEL_15;
    case 1:
      v7 = +[UIColor systemBlueColor];
      v8 = [v7 colorWithAlphaComponent:0.6];
      v9 = [(CheckmarkTrainingView *)self symbolView];
      [v9 setTintColor:v8];

      CFStringRef v6 = @"waveform.circle.fill";
      goto LABEL_15;
    case 2:
      v10 = +[UIColor systemGreenColor];
      v11 = [(CheckmarkTrainingView *)self symbolView];
      [v11 setTintColor:v10];
      goto LABEL_9;
    case 3:
      v10 = +[UIColor systemBlueColor];
      v11 = [v10 colorWithAlphaComponent:0.6];
      v12 = [(CheckmarkTrainingView *)self symbolView];
      [v12 setTintColor:v11];

LABEL_9:
      CFStringRef v6 = @"checkmark.circle.fill";
      goto LABEL_15;
    case 4:
      v13 = +[UIColor clearColor];
      v14 = [(CheckmarkTrainingView *)self symbolView];
      [v14 setTintColor:v13];

      [(CheckmarkTrainingView *)self _updateViewWithSpinner];
      return;
    case 5:
      v15 = +[UIColor systemOrangeColor];
      v16 = [(CheckmarkTrainingView *)self symbolView];
      [v16 setTintColor:v15];

      CFStringRef v6 = @"questionmark.circle.fill";
      goto LABEL_15;
    case 6:
      v17 = +[UIColor systemRedColor];
      v18 = [(CheckmarkTrainingView *)self symbolView];
      [v18 setTintColor:v17];

      CFStringRef v6 = @"exclamationmark.circle.fill";
LABEL_15:
      [(CheckmarkTrainingView *)self _updateViewWithSymbolNamed:v6];
      break;
    default:
      id v19 = +[UIColor tertiarySystemFillColor];
      [(CheckmarkTrainingView *)self setBackgroundColor:v19];

      break;
  }
}

- (void)_updateViewWithSpinner
{
  id v3 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithFrame:", 0.0, 0.0, 35.0, 35.0);
  [(CheckmarkTrainingView *)self setSpinner:v3];

  v4 = [(CheckmarkTrainingView *)self spinner];
  [(CheckmarkTrainingView *)self addSubview:v4];

  id v5 = [(CheckmarkTrainingView *)self spinner];
  [v5 startAnimating];
}

- (void)_removeSpinner
{
  id v3 = [(CheckmarkTrainingView *)self spinner];

  if (v3)
  {
    v4 = [(CheckmarkTrainingView *)self spinner];
    [v4 stopAnimating];

    id v5 = [(CheckmarkTrainingView *)self spinner];
    [v5 removeFromSuperview];
  }
}

- (void)_updateViewWithSymbolNamed:(id)a3
{
  id v4 = a3;
  [(CheckmarkTrainingView *)self _removeSpinner];
  id v5 = +[UIImage systemImageNamed:v4];

  CFStringRef v6 = +[UIImageSymbolConfiguration configurationWithPointSize:35.0];
  id v9 = [v5 imageWithConfiguration:v6];

  v7 = [(CheckmarkTrainingView *)self symbolView];
  [v7 setImage:v9];

  v8 = [(CheckmarkTrainingView *)self symbolView];
  [v8 setNeedsDisplay];
}

- (void)_setUpSymbolView
{
  id v3 = [(CheckmarkTrainingView *)self symbolView];
  [v3 setContentMode:2];

  id v4 = [(CheckmarkTrainingView *)self symbolView];
  [(CheckmarkTrainingView *)self addSubview:v4];
}

- (void)_constrainSymbolView
{
  id v3 = [(CheckmarkTrainingView *)self symbolView];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v4 = [(CheckmarkTrainingView *)self symbolView];
  id v5 = [v4 widthAnchor];
  CFStringRef v6 = [v5 constraintEqualToConstant:35.0];
  [v6 setActive:1];

  v7 = [(CheckmarkTrainingView *)self symbolView];
  v8 = [v7 heightAnchor];
  id v9 = [v8 constraintEqualToConstant:35.0];
  [v9 setActive:1];

  v10 = [(CheckmarkTrainingView *)self symbolView];
  v11 = [v10 centerXAnchor];
  v12 = [(CheckmarkTrainingView *)self centerXAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  [v13 setActive:1];

  id v17 = [(CheckmarkTrainingView *)self symbolView];
  v14 = [v17 centerYAnchor];
  v15 = [(CheckmarkTrainingView *)self centerYAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  [v16 setActive:1];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return settingsLocString(@"SOUND", @"SoundDetection");
}

- (id)accessibilityValue
{
  unint64_t v2 = (unint64_t)[(CheckmarkTrainingView *)self checkmarkState] - 1;
  if (v2 > 5) {
    id v3 = @"INCOMPLETE";
  }
  else {
    id v3 = off_20C328[v2];
  }
  id v4 = settingsLocString(v3, @"SoundDetection");

  return v4;
}

- (int64_t)checkmarkState
{
  return self->_checkmarkState;
}

- (UIImageView)symbolView
{
  return self->_symbolView;
}

- (void)setSymbolView:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);

  objc_storeStrong((id *)&self->_symbolView, 0);
}

@end