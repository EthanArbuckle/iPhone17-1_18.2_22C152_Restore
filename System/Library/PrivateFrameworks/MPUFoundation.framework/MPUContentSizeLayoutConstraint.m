@interface MPUContentSizeLayoutConstraint
+ (id)constraintWithAutoupdatingBaselineOfView:(id)a3 relation:(int64_t)a4 toView:(id)a5 attribute:(int64_t)a6 withTextStyle:(id)a7 multiplier:(double)a8 nonStandardLeading:(double)a9;
+ (id)constraintWithAutoupdatingBaselineOfView:(id)a3 relation:(int64_t)a4 toView:(id)a5 attribute:(int64_t)a6 withTextStyle:(id)a7 nonStandardLeading:(double)a8;
+ (id)constraintWithAutoupdatingBaselineOfView:(id)a3 toView:(id)a4 attribute:(int64_t)a5 withTextStyle:(id)a6 nonStandardLeading:(double)a7;
+ (id)constraintWithItem:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toItem:(id)a6 attribute:(int64_t)a7 multiplier:(double)a8 autoupdatingConstantFromLabel:(id)a9 textStyle:(id)a10 numberOfLines:(unint64_t)a11;
+ (id)contentSizeAutoupdatingConstraintWithItem:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toItem:(id)a6 attribute:(int64_t)a7 multiplier:(double)a8 textStyle:(id)a9 defaultSizeConstant:(double)a10;
- (NSString)textStyle;
- (double)defaultSizeConstant;
- (double)fontSizeMultiplier;
- (void)_updatePreferredContentSize;
- (void)setDefaultSizeConstant:(double)a3;
- (void)setFontSizeMultiplier:(double)a3;
- (void)setTextStyle:(id)a3;
@end

@implementation MPUContentSizeLayoutConstraint

+ (id)contentSizeAutoupdatingConstraintWithItem:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toItem:(id)a6 attribute:(int64_t)a7 multiplier:(double)a8 textStyle:(id)a9 defaultSizeConstant:(double)a10
{
  id v18 = a9;
  uint64_t v19 = [a1 constraintWithItem:a3 attribute:a4 relatedBy:a5 toItem:a6 attribute:a7 multiplier:a8 constant:0.0];
  *(double *)(v19 + 128) = a10;
  *(unsigned char *)(v19 + 96) = 1;
  [(id)v19 setTextStyle:v18];

  return (id)v19;
}

+ (id)constraintWithAutoupdatingBaselineOfView:(id)a3 toView:(id)a4 attribute:(int64_t)a5 withTextStyle:(id)a6 nonStandardLeading:(double)a7
{
  return (id)[a1 constraintWithAutoupdatingBaselineOfView:a3 relation:0 toView:a4 attribute:a5 withTextStyle:a6 nonStandardLeading:a7];
}

+ (id)constraintWithAutoupdatingBaselineOfView:(id)a3 relation:(int64_t)a4 toView:(id)a5 attribute:(int64_t)a6 withTextStyle:(id)a7 nonStandardLeading:(double)a8
{
  return (id)[a1 constraintWithAutoupdatingBaselineOfView:a3 relation:a4 toView:a5 attribute:a6 withTextStyle:a7 multiplier:1.0 nonStandardLeading:a8];
}

+ (id)constraintWithAutoupdatingBaselineOfView:(id)a3 relation:(int64_t)a4 toView:(id)a5 attribute:(int64_t)a6 withTextStyle:(id)a7 multiplier:(double)a8 nonStandardLeading:(double)a9
{
  return (id)[a1 contentSizeAutoupdatingConstraintWithItem:a3 attribute:12 relatedBy:a4 toItem:a5 attribute:a6 multiplier:a7 textStyle:a8 defaultSizeConstant:a9];
}

+ (id)constraintWithItem:(id)a3 attribute:(int64_t)a4 relatedBy:(int64_t)a5 toItem:(id)a6 attribute:(int64_t)a7 multiplier:(double)a8 autoupdatingConstantFromLabel:(id)a9 textStyle:(id)a10 numberOfLines:(unint64_t)a11
{
  id v18 = a9;
  id v19 = a10;
  uint64_t v20 = [a1 constraintWithItem:a3 attribute:a4 relatedBy:a5 toItem:a6 attribute:a7 multiplier:a8 constant:0.0];
  *(void *)(v20 + 120) = 0x3FF0000000000000;
  *(void *)(v20 + 104) = a11;
  v21 = *(void **)(v20 + 112);
  *(void *)(v20 + 112) = v18;

  *(unsigned char *)(v20 + 97) = 1;
  [(id)v20 setTextStyle:v19];

  return (id)v20;
}

- (void)setFontSizeMultiplier:(double)a3
{
  if (self->_fontSizeMultiplier != a3)
  {
    self->_fontSizeMultiplier = a3;
    [(MPUContentSizeLayoutConstraint *)self _updatePreferredContentSize];
  }
}

- (void)setTextStyle:(id)a3
{
  id v4 = a3;
  if (![(NSString *)self->_textStyle isEqualToString:v4])
  {
    v5 = (NSString *)[v4 copy];
    textStyle = self->_textStyle;
    self->_textStyle = v5;

    v7 = [MEMORY[0x263F1C658] defaultFontForTextStyle:v4];
    [v7 _bodyLeading];
    self->_textStyleDefaultLeading = v8;

    [(MPUContentSizeLayoutConstraint *)self _updatePreferredContentSize];
  }
  if (!self->_preferredContentSizeDidChangeObserver)
  {
    objc_initWeak(&location, self);
    v9 = [MEMORY[0x263F08A48] mainQueue];
    uint64_t v10 = *MEMORY[0x263F1D158];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __47__MPUContentSizeLayoutConstraint_setTextStyle___block_invoke;
    v13[3] = &unk_2647D1068;
    objc_copyWeak(&v14, &location);
    v11 = +[MPUNotificationObserver observerWithName:v10 object:0 queue:v9 observationHandler:v13];
    preferredContentSizeDidChangeObserver = self->_preferredContentSizeDidChangeObserver;
    self->_preferredContentSizeDidChangeObserver = v11;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __47__MPUContentSizeLayoutConstraint_setTextStyle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&to, (id *)(a1 + 32));
  id v4 = objc_loadWeakRetained(&to);
  [v4 _updatePreferredContentSize];

  objc_destroyWeak(&to);
}

- (void)setDefaultSizeConstant:(double)a3
{
  if (self->_defaultSizeConstant != a3)
  {
    self->_defaultSizeConstant = a3;
    [(MPUContentSizeLayoutConstraint *)self _updatePreferredContentSize];
  }
}

- (void)_updatePreferredContentSize
{
  id v3 = (void *)MEMORY[0x263F1C658];
  id v4 = [(MPUContentSizeLayoutConstraint *)self textStyle];
  id v29 = [v3 preferredFontForTextStyle:v4];

  [(MPUContentSizeLayoutConstraint *)self fontSizeMultiplier];
  if (v5 > 0.00000011920929)
  {
    [(MPUContentSizeLayoutConstraint *)self fontSizeMultiplier];
    if (fabs(v6 + -1.0) > 0.00000011920929)
    {
      v7 = (void *)MEMORY[0x263F1C658];
      double v8 = (void *)MEMORY[0x263F1C660];
      v9 = [(MPUContentSizeLayoutConstraint *)self textStyle];
      uint64_t v10 = [v8 preferredFontDescriptorWithTextStyle:v9];
      [v29 pointSize];
      double v12 = v11;
      [(MPUContentSizeLayoutConstraint *)self fontSizeMultiplier];
      uint64_t v14 = [v7 fontWithDescriptor:v10 size:ceil(v12 * v13)];

      id v29 = (id)v14;
    }
  }
  v15 = [(MPUContentSizeLayoutConstraint *)self firstItem];
  if (objc_opt_respondsToSelector())
  {
    v16 = [v15 viewForLastBaselineLayout];
  }
  else
  {
    v16 = 0;
  }
  if ([v16 conformsToProtocol:&unk_26DAD4CE0]
    && (objc_msgSend(v16, "MPU_contentSizeUpdater"), (v17 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v18 = v17;
    [v17 ensureTextStyleFontsMatchPreferredTextStyleFonts];
    if (objc_opt_respondsToSelector())
    {
      id v19 = [v16 attributedText];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v20 = v19;
        if ([v20 length])
        {
          uint64_t v21 = objc_msgSend(v20, "MPU_tallestFontFromAttributes");

          id v29 = (id)v21;
        }
      }
      else
      {
        id v20 = 0;
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      [v16 setFont:v29];
    }
    id v18 = 0;
  }
  if (self->_isBaselineConstraint)
  {
    [(MPUContentSizeLayoutConstraint *)self defaultSizeConstant];
    double textStyleDefaultLeading = v22;
    if (MPUFloatEqualToFloat(v22, 0.0)) {
      double textStyleDefaultLeading = self->_textStyleDefaultLeading;
    }
    [v29 _scaledValueForValue:textStyleDefaultLeading];
    -[MPUContentSizeLayoutConstraint setConstant:](self, "setConstant:");
  }
  if (self->_isLineNumberConstraint)
  {
    v24 = self->_targetLabel;
    v25 = [(UILabel *)v24 text];
    v26 = [MEMORY[0x263F089D8] string];
    if (self->_numberOfLines)
    {
      unint64_t v27 = 0;
      do
      {
        [v26 appendString:@"x\n"];
        ++v27;
      }
      while (v27 < self->_numberOfLines);
    }
    [(UILabel *)v24 setFont:v29];
    [(UILabel *)v24 setNumberOfLines:self->_numberOfLines];
    [(UILabel *)v24 setText:v26];
    [(UILabel *)v24 intrinsicContentSize];
    [(MPUContentSizeLayoutConstraint *)self setConstant:v28];
    [(UILabel *)v24 setText:v25];
  }
}

- (double)fontSizeMultiplier
{
  return self->_fontSizeMultiplier;
}

- (double)defaultSizeConstant
{
  return self->_defaultSizeConstant;
}

- (NSString)textStyle
{
  return self->_textStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textStyle, 0);
  objc_storeStrong((id *)&self->_targetLabel, 0);

  objc_storeStrong((id *)&self->_preferredContentSizeDidChangeObserver, 0);
}

@end