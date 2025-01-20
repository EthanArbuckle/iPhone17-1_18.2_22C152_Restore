@interface NTKVictoryDigitalTimeView
- (BOOL)invertedColors;
- (BOOL)isFrozen;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NTKVictoryDigitalColorPalette)colorPalette;
- (NTKVictoryDigitalTimeViewDelegate)delegate;
- (id)initForDevice:(id)a3;
- (int64_t)_lowerDigitAppearanceForStyle:(unint64_t)a3;
- (int64_t)_upperDigitAppearanceForStyle:(unint64_t)a3;
- (int64_t)defaultAppearance;
- (unint64_t)style;
- (void)_resetDigitAppearanceForStyle:(unint64_t)a3;
- (void)_setFlipViewIsLower:(BOOL)a3;
- (void)_setupFlipDigitsView;
- (void)applyPopAnimationTransitionFraction:(double)a3;
- (void)applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5;
- (void)clearEditingTransitions;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setBackgroundColor:(id)a3;
- (void)setColorPalette:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFrozen:(BOOL)a3;
- (void)setInvertedColors:(BOOL)a3;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setStyle:(unint64_t)a3;
- (void)setTimeOffset:(double)a3;
- (void)timeFormatterTextDidChange:(id)a3;
- (void)willBeginEditing;
@end

@implementation NTKVictoryDigitalTimeView

- (id)initForDevice:(id)a3
{
  id v5 = a3;
  v22.receiver = self;
  v22.super_class = (Class)NTKVictoryDigitalTimeView;
  v6 = [(NTKVictoryDigitalTimeView *)&v22 init];
  p_isa = (id *)&v6->super.super.super.isa;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    id v8 = [[NTKVictoryDigitsView alloc] initForDevice:v5];
    id v9 = p_isa[2];
    p_isa[2] = v8;

    id v10 = [[NTKVictoryDigitsView alloc] initForDevice:v5];
    id v11 = p_isa[3];
    p_isa[3] = v10;

    [p_isa addSubview:p_isa[2]];
    [p_isa addSubview:p_isa[3]];
    v12 = +[NSNull null];
    v23[0] = @"anchorPoint";
    v23[1] = @"transform";
    v24[0] = v12;
    v24[1] = v12;
    v23[2] = @"position";
    v23[3] = @"bounds";
    v24[2] = v12;
    v24[3] = v12;
    v13 = +[NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
    v14 = [p_isa[2] layer];
    [v14 setActions:v13];

    v15 = [p_isa[3] layer];
    [v15 setActions:v13];

    v16 = [p_isa[2] layer];
    objc_msgSend(v16, "setAnchorPoint:", 0.5, 1.0);

    v17 = [p_isa[3] layer];
    objc_msgSend(v17, "setAnchorPoint:", 0.5, 0.0);

    v18 = +[UIColor blackColor];
    [p_isa setBackgroundColor:v18];

    [p_isa setOpaque:1];
    objc_msgSend(p_isa[2], "setAppearance:", objc_msgSend(p_isa, "defaultAppearance"));
    objc_msgSend(p_isa[3], "setAppearance:", objc_msgSend(p_isa, "defaultAppearance"));
    id v19 = [objc_alloc((Class)CLKTimeFormatter) initWithForcesLatinNumbers:1];
    id v20 = p_isa[6];
    p_isa[6] = v19;

    [p_isa[6] addObserver:p_isa];
  }

  return p_isa;
}

- (void)dealloc
{
  [(CLKTimeFormatter *)self->_timeFormatter removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)NTKVictoryDigitalTimeView;
  [(NTKVictoryDigitalTimeView *)&v3 dealloc];
}

- (void)willBeginEditing
{
}

- (void)clearEditingTransitions
{
  [(NTKVictoryDigitalTimeView *)self setStyle:self->_style];
  colorPalette = self->_colorPalette;

  [(NTKVictoryDigitalTimeView *)self setColorPalette:colorPalette];
}

- (void)_setupFlipDigitsView
{
  long long v3 = *(_OWORD *)&CATransform3DIdentity.m23;
  long long v25 = *(_OWORD *)&CATransform3DIdentity.m21;
  long long v26 = v3;
  long long v27 = *(_OWORD *)&CATransform3DIdentity.m31;
  CGFloat m33 = CATransform3DIdentity.m33;
  long long v4 = *(_OWORD *)&CATransform3DIdentity.m13;
  long long v23 = *(_OWORD *)&CATransform3DIdentity.m11;
  long long v24 = v4;
  long long v5 = *(_OWORD *)&CATransform3DIdentity.m43;
  long long v30 = *(_OWORD *)&CATransform3DIdentity.m41;
  long long v31 = v5;
  v6 = [(NTKVictoryDigitalTimeView *)self layer];
  unint64_t v29 = 0xBF6B4E81B4E81B4FLL;
  [v6 setSublayerTransform:&v23];

  if (!self->_flipDigitsView)
  {
    v7 = [[NTKVictoryDigitsView alloc] initForDevice:self->_device];
    flipDigitsView = self->_flipDigitsView;
    self->_flipDigitsView = v7;

    id v9 = [(NTKVictoryDigitsView *)self->_upperDigitsView layer];
    id v10 = [v9 actions];
    id v11 = [(NTKVictoryDigitsView *)self->_flipDigitsView layer];
    [v11 setActions:v10];

    v12 = [(NTKVictoryDigitsView *)self->_upperDigitsView layer];
    [v12 bounds];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    v21 = [(NTKVictoryDigitsView *)self->_flipDigitsView layer];
    objc_msgSend(v21, "setBounds:", v14, v16, v18, v20);

    [(NTKVictoryDigitsView *)self->_flipDigitsView setAppearance:[(NTKVictoryDigitsView *)self->_upperDigitsView appearance]];
    [(NTKVictoryDigitsView *)self->_flipDigitsView setHidden:1];
    [(NTKVictoryDigitsView *)self->_flipDigitsView setClipsToBounds:1];
    [(NTKVictoryDigitalTimeView *)self _setFlipViewIsLower:0];
    [(NTKVictoryDigitalTimeView *)self addSubview:self->_flipDigitsView];
  }
  objc_super v22 = [(NTKVictoryDigitsView *)self->_upperDigitsView color];
  [(NTKVictoryDigitsView *)self->_flipDigitsView setColor:v22];

  [(NTKVictoryDigitsView *)self->_flipDigitsView prepareAppearance:1];
  [(NTKVictoryDigitsView *)self->_flipDigitsView prepareAppearance:3];
}

- (void)setInvertedColors:(BOOL)a3
{
  BOOL invertedColors = self->_invertedColors;
  self->_BOOL invertedColors = a3;
  if (invertedColors != a3) {
    [(NTKVictoryDigitalTimeView *)self setColorPalette:self->_colorPalette];
  }
}

- (void)setStyle:(unint64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    -[NTKVictoryDigitalTimeView _resetDigitAppearanceForStyle:](self, "_resetDigitAppearanceForStyle:");
  }
}

- (int64_t)defaultAppearance
{
  return 1;
}

- (void)_resetDigitAppearanceForStyle:(unint64_t)a3
{
  -[NTKVictoryDigitsView setAppearance:](self->_upperDigitsView, "setAppearance:", -[NTKVictoryDigitalTimeView _upperDigitAppearanceForStyle:](self, "_upperDigitAppearanceForStyle:"));
  [(NTKVictoryDigitsView *)self->_lowerDigitsView setAppearance:[(NTKVictoryDigitalTimeView *)self _lowerDigitAppearanceForStyle:a3]];
  flipDigitsView = self->_flipDigitsView;

  [(NTKVictoryDigitsView *)flipDigitsView setHidden:1];
}

- (void)applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5
{
  if (a4 == a5)
  {
    [(NTKVictoryDigitalTimeView *)self _resetDigitAppearanceForStyle:a3];
  }
  else
  {
    [(NTKVictoryDigitsView *)self->_flipDigitsView setHidden:0];
    BOOL flipViewIsLower = self->_flipViewIsLower;
    if (flipViewIsLower != a3 < 0.5)
    {
      [(NTKVictoryDigitalTimeView *)self _setFlipViewIsLower:!flipViewIsLower];
      if (a3 >= 0.5) {
        int64_t v10 = [(NTKVictoryDigitalTimeView *)self _upperDigitAppearanceForStyle:a5];
      }
      else {
        int64_t v10 = [(NTKVictoryDigitalTimeView *)self _lowerDigitAppearanceForStyle:a4];
      }
      [(NTKVictoryDigitsView *)self->_flipDigitsView setAppearance:v10];
    }
    double v11 = (1.0 - a3) * -2.0;
    if (a3 < 0.5) {
      double v11 = 1.0 - (0.5 - a3 + 0.5 - a3);
    }
    float v12 = v11;
    float v13 = a3;
    double v14 = fabs(v13 + -0.5);
    [(NTKVictoryDigitsView *)self->_flipDigitsView setDimmingFactor:a3 >= 0.5 isUpper:1.0 - (v14 + v14)];
    CATransform3DMakeRotation(&v17, v12 * 1.57079633, 1.0, 0.0, 0.0);
    double v15 = [(NTKVictoryDigitsView *)self->_flipDigitsView layer];
    CATransform3D v16 = v17;
    [v15 setTransform:&v16];

    [(NTKVictoryDigitsView *)self->_upperDigitsView setAppearance:[(NTKVictoryDigitalTimeView *)self _upperDigitAppearanceForStyle:a4]];
    [(NTKVictoryDigitsView *)self->_lowerDigitsView setAppearance:[(NTKVictoryDigitalTimeView *)self _lowerDigitAppearanceForStyle:a5]];
  }
}

- (void)_setFlipViewIsLower:(BOOL)a3
{
  self->_BOOL flipViewIsLower = a3;
  long long v4 = &OBJC_IVAR___NTKVictoryDigitalTimeView__upperDigitsView;
  if (a3) {
    long long v4 = &OBJC_IVAR___NTKVictoryDigitalTimeView__lowerDigitsView;
  }
  id v5 = *(id *)((char *)&self->super.super.super.isa + *v4);
  v6 = [v5 layer];
  [v6 anchorPoint];
  double v8 = v7;
  double v10 = v9;
  double v11 = [(NTKVictoryDigitsView *)self->_flipDigitsView layer];
  objc_msgSend(v11, "setAnchorPoint:", v8, v10);

  float v12 = [v5 layer];
  [v12 position];
  double v14 = v13;
  double v16 = v15;
  CATransform3D v17 = [(NTKVictoryDigitsView *)self->_flipDigitsView layer];
  objc_msgSend(v17, "setPosition:", v14, v16);

  id v18 = [v5 digitText];
  [(NTKVictoryDigitsView *)self->_flipDigitsView setDigitText:v18];
}

- (int64_t)_upperDigitAppearanceForStyle:(unint64_t)a3
{
  if (a3 - 2 > 3) {
    return 0;
  }
  else {
    return qword_FD20[a3 - 2];
  }
}

- (int64_t)_lowerDigitAppearanceForStyle:(unint64_t)a3
{
  if (a3 - 1 > 4) {
    return 0;
  }
  else {
    return qword_FD40[a3 - 1];
  }
}

- (void)setColorPalette:(id)a3
{
  id v7 = a3;
  objc_storeStrong((id *)&self->_colorPalette, a3);
  id v5 = [v7 digits];
  if (self->_invertedColors)
  {
    uint64_t v6 = [v7 background];

    id v5 = (void *)v6;
  }
  [(NTKVictoryDigitsView *)self->_upperDigitsView setColor:v5];
  [(NTKVictoryDigitsView *)self->_lowerDigitsView setColor:v5];
  [(NTKVictoryDigitsView *)self->_flipDigitsView setColor:v5];
  [(NTKVictoryDigitsView *)self->_upperDigitsView setScale:1.0];
  [(NTKVictoryDigitsView *)self->_lowerDigitsView setScale:1.0];
}

- (void)setBackgroundColor:(id)a3
{
  long long v4 = +[UIColor clearColor];
  [(NTKVictoryDigitsView *)self->_upperDigitsView setBackgroundColor:v4];

  id v5 = +[UIColor clearColor];
  [(NTKVictoryDigitsView *)self->_lowerDigitsView setBackgroundColor:v5];

  id v6 = +[UIColor clearColor];
  [(NTKVictoryDigitsView *)self->_flipDigitsView setBackgroundColor:v6];
}

- (void)applyPopAnimationTransitionFraction:(double)a3
{
  id v5 = NTKVictoryTransitionTimingFunction();
  id v12 = v5;
  float v6 = a3;
  *(float *)&double v7 = fabsf((float)(v6 + -0.4) / 0.4);
  if (*(float *)&v7 > 1.0) {
    *(float *)&double v7 = 1.0;
  }
  [v5 _solveForInput:v7];
  float v8 = *(float *)&v9;
  *(float *)&double v9 = fabsf((float)(v6 + -0.5333) / 0.4);
  if (*(float *)&v9 > 1.0) {
    *(float *)&double v9 = 1.0;
  }
  [v12 _solveForInput:v9];
  float v11 = v10;
  [(NTKVictoryDigitsView *)self->_upperDigitsView setScale:v8 * 0.075 + 0.925];
  [(NTKVictoryDigitsView *)self->_lowerDigitsView setScale:v11 * 0.075 + 0.925];
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
}

- (void)setTimeOffset:(double)a3
{
}

- (void)layoutSubviews
{
  [(NTKVictoryDigitalTimeView *)self bounds];
  double v4 = v3;
  -[NTKVictoryDigitsView sizeThatFits:](self->_upperDigitsView, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  double v6 = v5;
  double v7 = sub_98E8(self->_device);
  double v9 = v8;
  double v11 = -v10;
  -[NTKVictoryDigitsView ntk_setBoundsAndPositionFromFrame:](self->_upperDigitsView, "ntk_setBoundsAndPositionFromFrame:", -v10, v7, v4, v6);
  lowerDigitsView = self->_lowerDigitsView;

  -[NTKVictoryDigitsView ntk_setBoundsAndPositionFromFrame:](lowerDigitsView, "ntk_setBoundsAndPositionFromFrame:", v11, v9, v4, v6);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  sub_98E8(self->_device);
  double v5 = v4;
  -[NTKVictoryDigitsView sizeThatFits:](self->_upperDigitsView, "sizeThatFits:", CGSizeZero.width, CGSizeZero.height);
  double v7 = v5;
  result.height = v7;
  result.width = v6;
  return result;
}

- (void)timeFormatterTextDidChange:(id)a3
{
  id v9 = [(CLKTimeFormatter *)self->_timeFormatter timeText];
  double v4 = (char *)[(CLKTimeFormatter *)self->_timeFormatter separatorRangeInTimeText];
  double v6 = [v9 substringFromIndex:&v4[v5]];
  [(NTKVictoryDigitsView *)self->_lowerDigitsView setDigitText:v6];

  double v7 = [v9 substringToIndex:v4];
  [(NTKVictoryDigitsView *)self->_upperDigitsView setDigitText:v7];

  double v8 = [(NTKVictoryDigitalTimeView *)self delegate];
  [v8 victoryDigitalTimeViewDidChangeTime:self];
}

- (BOOL)isFrozen
{
  return self->_frozen;
}

- (void)setFrozen:(BOOL)a3
{
  self->_frozen = a3;
}

- (BOOL)invertedColors
{
  return self->_invertedColors;
}

- (unint64_t)style
{
  return self->_style;
}

- (NTKVictoryDigitalColorPalette)colorPalette
{
  return self->_colorPalette;
}

- (NTKVictoryDigitalTimeViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTKVictoryDigitalTimeViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_colorPalette, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_flipDigitsView, 0);
  objc_storeStrong((id *)&self->_lowerDigitsView, 0);
  objc_storeStrong((id *)&self->_upperDigitsView, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end