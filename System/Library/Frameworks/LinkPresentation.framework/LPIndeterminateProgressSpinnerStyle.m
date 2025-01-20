@interface LPIndeterminateProgressSpinnerStyle
- (BOOL)useLargeIndicatorStyle;
- (LPIndeterminateProgressSpinnerStyle)initWithPlatform:(int64_t)a3 sizeClass:(unint64_t)a4 fontScalingFactor:(double)a5;
- (LPPadding)padding;
- (LPPointUnit)spacing;
- (LPPointUnit)verticalOffset;
- (LPTextViewStyle)label;
- (UIColor)indicatorColor;
- (void)setIndicatorColor:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPadding:(id)a3;
- (void)setSpacing:(id)a3;
- (void)setUseLargeIndicatorStyle:(BOOL)a3;
- (void)setVerticalOffset:(id)a3;
@end

@implementation LPIndeterminateProgressSpinnerStyle

- (LPIndeterminateProgressSpinnerStyle)initWithPlatform:(int64_t)a3 sizeClass:(unint64_t)a4 fontScalingFactor:(double)a5
{
  v26.receiver = self;
  v26.super_class = (Class)LPIndeterminateProgressSpinnerStyle;
  v8 = [(LPIndeterminateProgressSpinnerStyle *)&v26 init];
  if (v8)
  {
    if (a3 == 5) {
      [MEMORY[0x1E4FB1618] quaternaryLabelColor];
    }
    else {
    uint64_t v9 = [MEMORY[0x1E4FB1618] systemGrayColor];
    }
    indicatorColor = v8->_indicatorColor;
    v8->_indicatorColor = (UIColor *)v9;

    v8->_useLargeIndicatorStyle = 1;
    v11 = [[LPTextViewStyle alloc] initWithPlatform:a3 fontScalingFactor:a5];
    [(LPTextViewStyle *)v11 setTextAlignment:2];
    if (a3 == 5) {
      [MEMORY[0x1E4FB1618] quaternaryLabelColor];
    }
    else {
    v12 = [MEMORY[0x1E4FB1618] systemGrayColor];
    }
    [(LPTextViewStyle *)v11 setColor:v12];

    if (+[LPTestingOverrides forceMonospaceFonts]) {
      [MEMORY[0x1E4FB1798] monospacedSystemFontOfSize:12.0 weight:*MEMORY[0x1E4FB29C0]];
    }
    else {
    v13 = fontWithTraits((void *)*MEMORY[0x1E4FB28F0], 0x8000, a4);
    }
    [(LPTextViewStyle *)v11 setFont:v13];

    objc_storeStrong((id *)&v8->_label, v11);
    v14 = objc_alloc_init(LPPadding);
    padding = v8->_padding;
    v8->_padding = v14;

    v16 = [[LPPointUnit alloc] initWithValue:25.0];
    [(LPPadding *)v8->_padding setTop:v16];

    v17 = [[LPPointUnit alloc] initWithValue:25.0];
    [(LPPadding *)v8->_padding setBottom:v17];

    v18 = [[LPPointUnit alloc] initWithValue:25.0];
    [(LPPadding *)v8->_padding setLeading:v18];

    v19 = [[LPPointUnit alloc] initWithValue:25.0];
    [(LPPadding *)v8->_padding setTrailing:v19];

    v20 = [[LPPointUnit alloc] initWithValue:8.0];
    spacing = v8->_spacing;
    v8->_spacing = v20;

    v22 = [[LPPointUnit alloc] initWithValue:2.0];
    verticalOffset = v8->_verticalOffset;
    v8->_verticalOffset = v22;

    v24 = v8;
  }

  return v8;
}

- (LPPadding)padding
{
  return self->_padding;
}

- (void)setPadding:(id)a3
{
}

- (LPPointUnit)spacing
{
  return self->_spacing;
}

- (void)setSpacing:(id)a3
{
}

- (LPPointUnit)verticalOffset
{
  return self->_verticalOffset;
}

- (void)setVerticalOffset:(id)a3
{
}

- (UIColor)indicatorColor
{
  return self->_indicatorColor;
}

- (void)setIndicatorColor:(id)a3
{
}

- (BOOL)useLargeIndicatorStyle
{
  return self->_useLargeIndicatorStyle;
}

- (void)setUseLargeIndicatorStyle:(BOOL)a3
{
  self->_useLargeIndicatorStyle = a3;
}

- (LPTextViewStyle)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_indicatorColor, 0);
  objc_storeStrong((id *)&self->_verticalOffset, 0);
  objc_storeStrong((id *)&self->_spacing, 0);

  objc_storeStrong((id *)&self->_padding, 0);
}

@end