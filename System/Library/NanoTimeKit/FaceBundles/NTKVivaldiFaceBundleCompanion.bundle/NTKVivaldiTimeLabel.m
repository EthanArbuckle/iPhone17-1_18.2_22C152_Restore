@interface NTKVivaldiTimeLabel
- (CGSize)sizeThatFits:(CGSize)a3;
- (CLKFont)font;
- (NSDate)date;
- (NTKVivaldiTimeLabel)initWithTimeComponent:(unint64_t)a3 color:(id)a4 font:(id)a5 fontSize:(double)a6 outline:(BOOL)a7;
- (UIColor)color;
- (double)_lastLineBaseline;
- (double)fontSize;
- (id)_attributedString;
- (int64_t)textAlignment;
- (void)_updateLabelText;
- (void)_updateLocale;
- (void)applyPalette:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setColor:(id)a3;
- (void)setDate:(id)a3;
- (void)setFont:(id)a3;
- (void)setFontSize:(double)a3;
- (void)setTextAlignment:(int64_t)a3;
- (void)updateColorsForComplicationsEditingFraction:(double)a3 withColorPalette:(id)a4;
@end

@implementation NTKVivaldiTimeLabel

- (NTKVivaldiTimeLabel)initWithTimeComponent:(unint64_t)a3 color:(id)a4 font:(id)a5 fontSize:(double)a6 outline:(BOOL)a7
{
  id v13 = a4;
  id v14 = a5;
  v27.receiver = self;
  v27.super_class = (Class)NTKVivaldiTimeLabel;
  v15 = [(NTKVivaldiTimeLabel *)&v27 init];
  v16 = v15;
  if (v15)
  {
    v15->_outline = a7;
    v15->_timeComponent = a3;
    objc_storeStrong((id *)&v15->_color, a4);
    v16->_fontSize = a6;
    uint64_t v17 = [v14 fontWithSize:a6];
    font = v16->_font;
    v16->_font = (CLKFont *)v17;

    uint64_t v19 = [MEMORY[0x263F57928] labelWithOptions:0];
    label = v16->_label;
    v16->_label = (CLKUIColoringLabel *)v19;

    [(CLKUIColoringLabel *)v16->_label setFont:v16->_font];
    [(CLKUIColoringLabel *)v16->_label setTextColor:v16->_color];
    [(CLKUIColoringLabel *)v16->_label setLineBreakMode:2];
    [(NTKVivaldiTimeLabel *)v16 addSubview:v16->_label];
    v21 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x263F08790]);
    formatter = v16->_formatter;
    v16->_formatter = v21;

    v23 = v16->_formatter;
    v24 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"en"];
    [(NSDateFormatter *)v23 setLocale:v24];

    v25 = [MEMORY[0x263F08A00] defaultCenter];
    [v25 addObserver:v16 selector:sel__updateLocale name:*MEMORY[0x263EFF458] object:0];

    [(NTKVivaldiTimeLabel *)v16 _updateLocale];
  }

  return v16;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self name:*MEMORY[0x263EFF458] object:0];

  v4.receiver = self;
  v4.super_class = (Class)NTKVivaldiTimeLabel;
  [(NTKVivaldiTimeLabel *)&v4 dealloc];
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)NTKVivaldiTimeLabel;
  [(NTKVivaldiTimeLabel *)&v4 layoutSubviews];
  label = self->_label;
  [(NTKVivaldiTimeLabel *)self bounds];
  -[CLKUIColoringLabel setFrame:](label, "setFrame:");
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  MEMORY[0x270F9A6D0](self->_label, sel_sizeThatFits_);
  result.height = v4;
  result.width = v3;
  return result;
}

- (CLKFont)font
{
  return self->_font;
}

- (double)fontSize
{
  return self->_fontSize;
}

- (void)setFontSize:(double)a3
{
  self->_fontSize = a3;
}

- (void)setTextAlignment:(int64_t)a3
{
  self->_textAlignment = a3;
  -[CLKUIColoringLabel setTextAlignment:](self->_label, "setTextAlignment:");
}

- (int64_t)textAlignment
{
  return MEMORY[0x270F9A6D0](self->_label, sel_textAlignment);
}

- (double)_lastLineBaseline
{
  [(CLKUIColoringLabel *)self->_label _lastLineBaseline];
  return result;
}

- (void)setDate:(id)a3
{
  objc_storeStrong((id *)&self->_date, a3);

  [(NTKVivaldiTimeLabel *)self _updateLabelText];
}

- (void)_updateLocale
{
  id v7 = [MEMORY[0x263EFF960] currentLocale];
  int v3 = CLKLocaleIs24HourMode();
  unint64_t timeComponent = self->_timeComponent;
  if (timeComponent == 1)
  {
    formatter = self->_formatter;
    v5 = @"mm";
  }
  else
  {
    if (timeComponent) {
      goto LABEL_9;
    }
    if (v3) {
      v5 = @"HH";
    }
    else {
      v5 = @"hh";
    }
    formatter = self->_formatter;
  }
  [(NSDateFormatter *)formatter setDateFormat:v5];
LABEL_9:
  [(NTKVivaldiTimeLabel *)self _updateLabelText];
}

- (id)_attributedString
{
  uint64_t v2 = [(NSDateFormatter *)self->_formatter stringFromDate:self->_date];
  int v3 = (void *)v2;
  double v4 = &stru_26FB3BC90;
  if (v2) {
    double v4 = (__CFString *)v2;
  }
  v5 = v4;

  v6 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v5];

  return v6;
}

- (void)_updateLabelText
{
  id v3 = [(NTKVivaldiTimeLabel *)self _attributedString];
  [(CLKUIColoringLabel *)self->_label setAttributedText:v3];
  [(NTKVivaldiTimeLabel *)self setNeedsLayout];
}

- (void)applyPalette:(id)a3
{
}

- (void)updateColorsForComplicationsEditingFraction:(double)a3 withColorPalette:(id)a4
{
  if (self->_outline) {
    objc_msgSend(a4, "numeralsOutline", a3);
  }
  else {
    objc_msgSend(a4, "numerals", a3);
  }
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = [MEMORY[0x263F1C550] blackColor];
  v6 = CLKInterpolateBetweenColors();

  id v7 = CLKInterpolateBetweenColors();
  [(CLKUIColoringLabel *)self->_label setTextColor:v7];
}

- (NSDate)date
{
  return self->_date;
}

- (void)setFont:(id)a3
{
}

- (UIColor)color
{
  return self->_color;
}

- (void)setColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_color, 0);
  objc_storeStrong((id *)&self->_font, 0);
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_label, 0);

  objc_storeStrong((id *)&self->_formatter, 0);
}

@end