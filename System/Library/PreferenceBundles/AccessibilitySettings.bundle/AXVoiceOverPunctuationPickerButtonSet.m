@interface AXVoiceOverPunctuationPickerButtonSet
- (AXVoiceOverPunctuationPickerButtonSet)initWithFrame:(CGRect)a3;
- (BOOL)isAccessibilityElement;
- (id)accessibilityLabel;
- (id)accessibilityPath;
- (id)circle;
- (id)label;
- (unint64_t)accessibilityTraits;
- (void)layoutSubviews;
@end

@implementation AXVoiceOverPunctuationPickerButtonSet

- (AXVoiceOverPunctuationPickerButtonSet)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v26.receiver = self;
  v26.super_class = (Class)AXVoiceOverPunctuationPickerButtonSet;
  v7 = -[AXVoiceOverPunctuationPickerButtonSet initWithFrame:](&v26, "initWithFrame:");
  v8 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", 0.0, 0.0, width, height);
  label = v7->_label;
  v7->_label = v8;
  v10 = v8;

  v11 = +[UIFontDescriptor preferredFontDescriptorWithTextStyle:UIFontTextStyleHeadline addingSymbolicTraits:0x8000 options:0];
  UIFontDescriptorTraitKey v27 = UIFontWeightTrait;
  v12 = +[NSNumber numberWithDouble:UIFontWeightBold];
  v28 = v12;
  v13 = +[NSDictionary dictionaryWithObjects:&v28 forKeys:&v27 count:1];
  v14 = [v11 fontDescriptorByAddingAttributes:v13];

  [v14 pointSize];
  v15 = +[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v14);
  [(UILabel *)v10 setFont:v15];
  v16 = settingsLocString(@"VOICEOVER_PUNCTUATION_PICKER_LABEL_SYMBOL", @"VoiceOverSettings");
  [(UILabel *)v10 setText:v16];

  [(UILabel *)v10 setTextAlignment:1];
  v17 = [(AXVoiceOverPunctuationPickerButtonSet *)v7 tintColor];
  [(UILabel *)v10 setTextColor:v17];

  [(UILabel *)v10 sizeToFit];
  uint64_t v18 = +[CAShapeLayer layer];
  circle = v7->_circle;
  v7->_circle = (CAShapeLayer *)v18;

  id v20 = +[UIColor clearColor];
  -[CAShapeLayer setFillColor:](v7->_circle, "setFillColor:", [v20 CGColor]);

  id v21 = [(AXVoiceOverPunctuationPickerButtonSet *)v7 tintColor];
  -[CAShapeLayer setStrokeColor:](v7->_circle, "setStrokeColor:", [v21 CGColor]);

  v22 = [(AXVoiceOverPunctuationPickerButtonSet *)v7 layer];
  [v22 addSublayer:v7->_circle];

  [(AXVoiceOverPunctuationPickerButtonSet *)v7 addSubview:v10];
  [(UILabel *)v10 frame];
  double v24 = v23;

  -[AXVoiceOverPunctuationPickerButtonSet setFrame:](v7, "setFrame:", x, y, width, v24);
  return v7;
}

- (void)layoutSubviews
{
  [(AXVoiceOverPunctuationPickerButtonSet *)self frame];
  double v4 = v3;
  [(UILabel *)self->_label frame];
  double v6 = v4 - (v5 + 5.0);
  [(UILabel *)self->_label frame];
  double v8 = v7;
  [(UILabel *)self->_label frame];
  -[UILabel setFrame:](self->_label, "setFrame:", v6, 0.0, v8);
  [(UILabel *)self->_label frame];
  double v10 = v9 * 0.5;
  [(CAShapeLayer *)self->_circle setLineWidth:2.0];
  +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:", v6 + 1.0 - (v10 * 0.5 + 2.0), 0.0, v10 + v10, v10 + v10, v10);
  id v11 = objc_claimAutoreleasedReturnValue();
  -[CAShapeLayer setPath:](self->_circle, "setPath:", [v11 CGPath]);
}

- (id)accessibilityLabel
{
  return settingsLocString(@"VOICEOVER_PUNCTUATION_PICKER_SPOKEN_LABEL", @"VoiceOverSettings");
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return UIAccessibilityTraitButton;
}

- (id)accessibilityPath
{
  double v3 = +[UIBezierPath bezierPathWithCGPath:[(CAShapeLayer *)self->_circle path]];
  double v4 = UIAccessibilityConvertPathToScreenCoordinates(v3, &self->super.super);

  return v4;
}

- (id)circle
{
  return self->_circle;
}

- (id)label
{
  return self->_label;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circle, 0);

  objc_storeStrong((id *)&self->_label, 0);
}

@end