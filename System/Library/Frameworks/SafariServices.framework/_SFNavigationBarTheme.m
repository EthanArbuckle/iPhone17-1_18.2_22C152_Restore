@interface _SFNavigationBarTheme
- (BOOL)backdropIsExtreme;
- (BOOL)backdropIsGreen;
- (BOOL)backdropIsRed;
- (BOOL)platterBackdropIsDark;
- (UIColor)annotationTextColor;
- (UIColor)platterAnnotationTextColor;
- (UIColor)platterPlaceholderTextColor;
- (UIColor)platterSecureTextColor;
- (UIColor)platterSelectionColor;
- (UIColor)platterTextColor;
- (UIColor)platterWarningTextColor;
- (UIColor)progressBarTintColor;
- (UIColor)secureTextColor;
- (UIColor)textColor;
- (UIColor)warningTextColor;
- (_SFNavigationBarTheme)initWithBarTintStyle:(int64_t)a3 preferredBarTintColor:(id)a4 controlsTintColor:(id)a5;
- (id)URLAccessoryButtonTintColorForInputMode:(unint64_t)a3;
- (id)_colorForPlatterTextColor:(id)a3 regularColor:(id)a4 withPlatterAlpha:(double)a5;
- (id)annotationTextColorForPlatterAlpha:(double)a3;
- (id)platterSecureTextColorForPlatterAlpha:(double)a3;
- (id)platterTextColorForPlatterAlpha:(double)a3;
- (id)platterWarningTextColorForPlatterAlpha:(double)a3;
- (int64_t)platterKeyboardOverrideAppearance;
- (int64_t)platterOverrideUserInterfaceStyle;
- (int64_t)platterTextFieldOverrideUserInterfaceStyle;
@end

@implementation _SFNavigationBarTheme

- (_SFNavigationBarTheme)initWithBarTintStyle:(int64_t)a3 preferredBarTintColor:(id)a4 controlsTintColor:(id)a5
{
  id v8 = a4;
  v53.receiver = self;
  v53.super_class = (Class)_SFNavigationBarTheme;
  v9 = [(_SFBarTheme *)&v53 initWithBarTintStyle:a3 preferredBarTintColor:v8 controlsTintColor:a5];
  v10 = v9;
  if (v9)
  {
    v11 = [(_SFBarTheme *)v9 preferredBarTintColor];

    int v12 = [(_SFBarTheme *)v10 backdropIsDark];
    unsigned int v13 = _SFIsPrivateTintStyle();
    int v14 = v12 | v13;
    v10->_platterOverrideUserInterfaceStyle = v13;
    uint64_t v15 = 2;
    if (!v13) {
      uint64_t v15 = 0;
    }
    v10->_platterTextFieldOverrideUserInterfaceStyle = v15;
    v10->_platterKeyboardOverrideAppearance = 2 * (a3 == 3);
    v10->_platterBackdropIsDark = v14;
    redTextColorForDarkBackground(v12);
    v16 = (UIColor *)objc_claimAutoreleasedReturnValue();
    greenTextColorForDarkBackground(v12);
    v17 = (UIColor *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v10->_BOOL backdropIsRed = colorIsSimilarToColor(v11, v16);
      v10->_BOOL backdropIsGreen = colorIsSimilarToColor(v11, v17);
      id v18 = v11;
      double v57 = 0.0;
      double v58 = 0.0;
      double v55 = 0.0;
      double v56 = 0.0;
      double v54 = 0.0;
      if ([v18 getRed:&v58 green:&v57 blue:&v56 alpha:0]
        && [v18 getHue:0 saturation:&v55 brightness:&v54 alpha:0])
      {
        v19 = v16;
        if (v54 < 0.17) {
          goto LABEL_19;
        }
        double v21 = v57;
        double v20 = v58;
        if (v57 >= v56) {
          double v22 = v56;
        }
        else {
          double v22 = v57;
        }
        if (v57 <= v56) {
          double v21 = v56;
        }
        if (v58 >= v22) {
          double v23 = v22;
        }
        else {
          double v23 = v58;
        }
        if (v58 <= v21) {
          double v20 = v21;
        }
        double v24 = (v23 + v20) * 0.5;
        if (v24 <= 0.95) {
          BOOL v25 = v55 < 0.15 && v24 > 0.9;
        }
        else {
LABEL_19:
        }
          BOOL v25 = 1;
      }
      else
      {
        v19 = v16;
        BOOL v25 = 0;
      }

      v10->_backdropIsExtreme = v25;
      v16 = v19;
    }
    uint64_t v26 = textColorForDarkBackground(v12);
    textColor = v10->_textColor;
    v10->_textColor = (UIColor *)v26;

    v28 = v16;
    if (v10->_backdropIsRed) {
      v28 = v10->_textColor;
    }
    objc_storeStrong((id *)&v10->_warningTextColor, v28);
    v29 = v17;
    if (v10->_backdropIsGreen) {
      v29 = v10->_textColor;
    }
    objc_storeStrong((id *)&v10->_secureTextColor, v29);
    uint64_t v30 = annotationTextColorForDarkBackground(v12);
    annotationTextColor = v10->_annotationTextColor;
    v10->_annotationTextColor = (UIColor *)v30;

    id v32 = [(_SFBarTheme *)v10 controlsTintColor];
    v33 = v32;
    if (a3 == 4)
    {
      v34 = [MEMORY[0x1E4FB1618] whiteColor];
    }
    else
    {
      v34 = (UIColor *)v32;
    }
    v35 = v34;

    progressBarTintColor = v10->_progressBarTintColor;
    v10->_progressBarTintColor = v35;

    uint64_t v37 = textColorForDarkBackground(v14);
    platterTextColor = v10->_platterTextColor;
    v10->_platterTextColor = (UIColor *)v37;

    BOOL backdropIsRed = v10->_backdropIsRed;
    if (v10->_backdropIsRed)
    {
      v40 = v10->_platterTextColor;
    }
    else
    {
      v40 = redTextColorForDarkBackground(v14);
    }
    objc_storeStrong((id *)&v10->_platterWarningTextColor, v40);
    if (!backdropIsRed) {

    }
    BOOL backdropIsGreen = v10->_backdropIsGreen;
    if (v10->_backdropIsGreen)
    {
      v42 = v10->_platterTextColor;
    }
    else
    {
      v42 = greenTextColorForDarkBackground(v14);
    }
    objc_storeStrong((id *)&v10->_platterSecureTextColor, v42);
    if (!backdropIsGreen) {

    }
    uint64_t v43 = annotationTextColorForDarkBackground(v14);
    platterAnnotationTextColor = v10->_platterAnnotationTextColor;
    v10->_platterAnnotationTextColor = (UIColor *)v43;

    if (v14) {
      [MEMORY[0x1E4FB1618] colorWithRed:0.0 green:0.501960784 blue:0.988235294 alpha:1.0];
    }
    else {
    uint64_t v45 = [MEMORY[0x1E4FB1618] blackColor];
    }
    platterSelectionColor = v10->_platterSelectionColor;
    v10->_platterSelectionColor = (UIColor *)v45;

    if (v14)
    {
      double v47 = 0.7;
      double v48 = 1.0;
    }
    else
    {
      double v47 = 0.38;
      double v48 = 0.0;
    }
    uint64_t v49 = [MEMORY[0x1E4FB1618] colorWithWhite:v48 alpha:v47];
    platterPlaceholderTextColor = v10->_platterPlaceholderTextColor;
    v10->_platterPlaceholderTextColor = (UIColor *)v49;

    v51 = v10;
  }
  else
  {
    v11 = v8;
  }

  return v10;
}

- (id)URLAccessoryButtonTintColorForInputMode:(unint64_t)a3
{
  if (a3)
  {
    if (a3 != 1) {
      goto LABEL_6;
    }
    v3 = [(_SFBarTheme *)self controlsTintColor];
  }
  else
  {
    v3 = self->_platterTextColor;
  }
  a2 = (SEL)v3;
LABEL_6:

  return (id)(id)a2;
}

- (id)platterTextColorForPlatterAlpha:(double)a3
{
  return [(_SFNavigationBarTheme *)self _colorForPlatterTextColor:self->_platterTextColor regularColor:self->_textColor withPlatterAlpha:a3];
}

- (id)platterSecureTextColorForPlatterAlpha:(double)a3
{
  return [(_SFNavigationBarTheme *)self _colorForPlatterTextColor:self->_platterSecureTextColor regularColor:self->_secureTextColor withPlatterAlpha:a3];
}

- (id)platterWarningTextColorForPlatterAlpha:(double)a3
{
  return [(_SFNavigationBarTheme *)self _colorForPlatterTextColor:self->_platterWarningTextColor regularColor:self->_warningTextColor withPlatterAlpha:a3];
}

- (id)annotationTextColorForPlatterAlpha:(double)a3
{
  return [(_SFNavigationBarTheme *)self _colorForPlatterTextColor:self->_platterAnnotationTextColor regularColor:self->_annotationTextColor withPlatterAlpha:a3];
}

- (id)_colorForPlatterTextColor:(id)a3 regularColor:(id)a4 withPlatterAlpha:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  if (a5 == 1.0 || [v7 isEqual:v8])
  {
    id v9 = v7;
LABEL_4:
    v10 = v9;
    goto LABEL_5;
  }
  if (a5 == 0.0)
  {
    id v9 = v8;
    goto LABEL_4;
  }
  int v12 = [v7 colorWithAlphaComponent:a5];
  v10 = [v8 _colorBlendedWithColor:v12];

LABEL_5:

  return v10;
}

- (int64_t)platterOverrideUserInterfaceStyle
{
  return self->_platterOverrideUserInterfaceStyle;
}

- (int64_t)platterTextFieldOverrideUserInterfaceStyle
{
  return self->_platterTextFieldOverrideUserInterfaceStyle;
}

- (int64_t)platterKeyboardOverrideAppearance
{
  return self->_platterKeyboardOverrideAppearance;
}

- (BOOL)backdropIsExtreme
{
  return self->_backdropIsExtreme;
}

- (BOOL)backdropIsRed
{
  return self->_backdropIsRed;
}

- (BOOL)backdropIsGreen
{
  return self->_backdropIsGreen;
}

- (UIColor)textColor
{
  return self->_textColor;
}

- (UIColor)secureTextColor
{
  return self->_secureTextColor;
}

- (UIColor)warningTextColor
{
  return self->_warningTextColor;
}

- (UIColor)annotationTextColor
{
  return self->_annotationTextColor;
}

- (UIColor)progressBarTintColor
{
  return self->_progressBarTintColor;
}

- (BOOL)platterBackdropIsDark
{
  return self->_platterBackdropIsDark;
}

- (UIColor)platterTextColor
{
  return self->_platterTextColor;
}

- (UIColor)platterSecureTextColor
{
  return self->_platterSecureTextColor;
}

- (UIColor)platterWarningTextColor
{
  return self->_platterWarningTextColor;
}

- (UIColor)platterAnnotationTextColor
{
  return self->_platterAnnotationTextColor;
}

- (UIColor)platterPlaceholderTextColor
{
  return self->_platterPlaceholderTextColor;
}

- (UIColor)platterSelectionColor
{
  return self->_platterSelectionColor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_platterSelectionColor, 0);
  objc_storeStrong((id *)&self->_platterPlaceholderTextColor, 0);
  objc_storeStrong((id *)&self->_platterAnnotationTextColor, 0);
  objc_storeStrong((id *)&self->_platterWarningTextColor, 0);
  objc_storeStrong((id *)&self->_platterSecureTextColor, 0);
  objc_storeStrong((id *)&self->_platterTextColor, 0);
  objc_storeStrong((id *)&self->_progressBarTintColor, 0);
  objc_storeStrong((id *)&self->_annotationTextColor, 0);
  objc_storeStrong((id *)&self->_warningTextColor, 0);
  objc_storeStrong((id *)&self->_secureTextColor, 0);

  objc_storeStrong((id *)&self->_textColor, 0);
}

@end