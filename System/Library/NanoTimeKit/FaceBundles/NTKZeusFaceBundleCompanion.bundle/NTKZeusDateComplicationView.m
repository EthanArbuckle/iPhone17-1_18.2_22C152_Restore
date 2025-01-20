@interface NTKZeusDateComplicationView
- (CGRect)_visualBoundsForLabel:(id)a3;
- (CGRect)contentFrame;
- (NTKZeusDateComplicationView)initWithBackgroundView:(id)a3;
- (unint64_t)desiredDateComplicationDateStyle;
- (void)_updateText;
- (void)applyPalette:(id)a3;
- (void)applyTransitionFraction:(double)a3 fromMode:(int64_t)a4 toMode:(int64_t)a5;
- (void)applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5;
- (void)blancEditModeApplyPalette:(id)a3;
- (void)layoutSubviews;
- (void)setDateComplicationText:(id)a3 withDayRange:(_NSRange)a4 forDateStyle:(unint64_t)a5;
- (void)setStyle:(unint64_t)a3;
@end

@implementation NTKZeusDateComplicationView

- (void)setDateComplicationText:(id)a3 withDayRange:(_NSRange)a4 forDateStyle:(unint64_t)a5
{
  int v6 = [a3 intValue];
  if (v6 != self->_currentDayNumber)
  {
    self->_currentDayNumber = v6;
    [(NTKZeusDateComplicationView *)self _updateText];
  }
}

- (unint64_t)desiredDateComplicationDateStyle
{
  return 4;
}

- (NTKZeusDateComplicationView)initWithBackgroundView:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)NTKZeusDateComplicationView;
  v3 = [(NTKZeusComplicationView *)&v10 initWithBackgroundView:a3];
  if (v3)
  {
    v4 = objc_alloc_init(NTKZeusColorPalette);
    uint64_t v5 = objc_opt_new();
    label = v3->_label;
    v3->_label = (UILabel *)v5;

    [(UILabel *)v3->_label setTextAlignment:1];
    v7 = v3->_label;
    v8 = [(NTKZeusColorPalette *)v4 silver];
    [(UILabel *)v7 setTextColor:v8];

    [(NTKZeusDateComplicationView *)v3 addSubview:v3->_label];
  }
  return v3;
}

- (void)setStyle:(unint64_t)a3
{
  if ([(NTKZeusComplicationView *)self style] != a3)
  {
    v6.receiver = self;
    v6.super_class = (Class)NTKZeusDateComplicationView;
    [(NTKZeusComplicationView *)&v6 setStyle:a3];
    uint64_t v5 = [(NTKZeusComplicationView *)self backgroundView];
    [v5 setStyle:a3];

    [(NTKZeusDateComplicationView *)self _updateText];
  }
}

- (void)_updateText
{
  v3 = +[NSParagraphStyle defaultParagraphStyle];
  id v4 = [v3 mutableCopy];

  [v4 setAlignment:1];
  id v5 = objc_alloc((Class)NSMutableAttributedString);
  objc_super v6 = +[NSString stringWithFormat:@"%i", self->_currentDayNumber];
  NSAttributedStringKey v34 = NSParagraphStyleAttributeName;
  id v35 = v4;
  v7 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
  id v8 = [v5 initWithString:v6 attributes:v7];

  v9 = [(NTKZeusComplicationView *)self device];
  objc_super v10 = +[CLKDeviceMetrics metricsWithDevice:v9 identitySizeClass:2];

  switch([(NTKZeusComplicationView *)self style])
  {
    case 0uLL:
      if (self->_currentDayNumber == 1)
      {
        [v10 scaledValue:2.0];
        v11 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        objc_msgSend(v8, "addAttribute:value:range:", NSKernAttributeName, v11, 0, objc_msgSend(v8, "length"));
      }
      v12 = +[NTKZeusFontLoader clipperFontDescriptor];
      v13 = [(NTKZeusComplicationView *)self device];
      sub_9058(v13, v32);
      v14 = (double *)&v33;
      break;
    case 1uLL:
      if (self->_currentDayNumber == 1)
      {
        [v10 scaledValue:3.5];
        v18 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        objc_msgSend(v8, "addAttribute:value:range:", NSKernAttributeName, v18, 0, objc_msgSend(v8, "length"));
      }
      v12 = +[NTKZeusFontLoader capeCodFontDescriptor];
      v13 = [(NTKZeusComplicationView *)self device];
      sub_9058(v13, v30);
      v14 = (double *)&v31;
      break;
    case 2uLL:
      v12 = +[NTKZeusFontLoader espaceFontDescriptor];
      v13 = [(NTKZeusComplicationView *)self device];
      sub_9058(v13, v28);
      v14 = (double *)&v29;
      break;
    case 3uLL:
      if (self->_currentDayNumber == 21)
      {
        [v10 scaledValue:-2.0];
        v19 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
        objc_msgSend(v8, "addAttribute:value:range:", NSKernAttributeName, v19, 0, objc_msgSend(v8, "length"));
      }
      v12 = +[NTKZeusFontLoader carrickFontDescriptor];
      v15 = [(NTKZeusComplicationView *)self device];
      v13 = v15;
      v16 = v27;
      v17 = v27;
      goto LABEL_13;
    default:
      v12 = +[NTKZeusFontLoader carrickFontDescriptor];
      v15 = [(NTKZeusComplicationView *)self device];
      v13 = v15;
      v16 = v26;
      v17 = v26;
LABEL_13:
      sub_9058(v15, v17);
      v14 = (double *)(v16 + 72);
      break;
  }
  double v20 = *v14;

  v21 = +[UIFont fontWithDescriptor:v12 size:v20];
  objc_msgSend(v8, "addAttribute:value:range:", NSFontAttributeName, v21, 0, objc_msgSend(v8, "length"));

  [(UILabel *)self->_label setAttributedText:v8];
  [(UILabel *)self->_label sizeToFit];
  [(NTKZeusDateComplicationView *)self _visualBoundsForLabel:self->_label];
  self->_labelVisualBounds.origin.x = v22;
  self->_labelVisualBounds.origin.y = v23;
  self->_labelVisualBounds.size.width = v24;
  self->_labelVisualBounds.size.height = v25;
  [(NTKZeusDateComplicationView *)self setNeedsLayout];
}

- (CGRect)_visualBoundsForLabel:(id)a3
{
  id v4 = a3;
  [v4 bounds];
  double v6 = v5;
  v7 = [(NTKZeusComplicationView *)self device];
  [v7 screenScale];
  size_t v9 = (unint64_t)(v6 * v8);

  [v4 bounds];
  double v11 = v10;
  v12 = [(NTKZeusComplicationView *)self device];
  [v12 screenScale];
  size_t v14 = (unint64_t)(v11 * v13);

  v15 = malloc_type_calloc(v14 * v9, 1uLL, 0x100004077774924uLL);
  DeviceGray = CGColorSpaceCreateDeviceGray();
  v17 = CGBitmapContextCreate(v15, v9, v14, 8uLL, v9, DeviceGray, 7u);
  v18 = [(NTKZeusComplicationView *)self device];
  [v18 screenScale];
  CGFloat v20 = v19;
  v21 = [(NTKZeusComplicationView *)self device];
  [v21 screenScale];
  CGAffineTransformMakeScale(&v51, v20, v22);
  CGContextSetCTM();

  CGFloat v23 = [v4 layer];
  [v23 renderInContext:v17];

  CGContextRelease(v17);
  CGColorSpaceRelease(DeviceGray);
  if (v14)
  {
    unint64_t v24 = 0;
    unint64_t v25 = 0;
    unint64_t v26 = 0;
    unint64_t v27 = -1;
    v28 = v15;
    unint64_t v29 = -1;
    do
    {
      if (v9)
      {
        for (unint64_t i = 0; i != v9; ++i)
        {
          if (i >= v29) {
            unint64_t v31 = v29;
          }
          else {
            unint64_t v31 = i;
          }
          if (i <= v26) {
            unint64_t v32 = v26;
          }
          else {
            unint64_t v32 = i;
          }
          if (v24 >= v27) {
            unint64_t v33 = v27;
          }
          else {
            unint64_t v33 = v24;
          }
          if (v24 <= v25) {
            unint64_t v34 = v25;
          }
          else {
            unint64_t v34 = v24;
          }
          if (v28[i])
          {
            unint64_t v29 = v31;
            unint64_t v26 = v32;
            unint64_t v27 = v33;
            unint64_t v25 = v34;
          }
        }
      }
      ++v24;
      v28 += v9;
    }
    while (v24 != v14);
  }
  else
  {
    unint64_t v26 = 0;
    unint64_t v25 = 0;
    unint64_t v29 = -1;
    unint64_t v27 = -1;
  }
  free(v15);
  id v35 = [(NTKZeusComplicationView *)self device];
  [v35 screenScale];
  double v37 = (double)v29 / v36;
  v38 = [(NTKZeusComplicationView *)self device];
  [v38 screenScale];
  double v40 = (double)v27 / v39;

  v41 = [(NTKZeusComplicationView *)self device];
  [v41 screenScale];
  double v43 = (double)(v26 - v29 + 1) / v42;
  v44 = [(NTKZeusComplicationView *)self device];
  [v44 screenScale];
  double v46 = (double)(v25 - v27 + 1) / v45;

  double v47 = v37;
  double v48 = v40;
  double v49 = v43;
  double v50 = v46;
  result.size.height = v50;
  result.size.width = v49;
  result.origin.y = v48;
  result.origin.x = v47;
  return result;
}

- (void)layoutSubviews
{
  p_labelVisualBounds = &self->_labelVisualBounds;
  double MidX = CGRectGetMidX(self->_labelVisualBounds);
  [(UILabel *)self->_label bounds];
  double v5 = MidX - CGRectGetMidX(v13);
  double MidY = CGRectGetMidY(*p_labelVisualBounds);
  [(UILabel *)self->_label bounds];
  double v7 = MidY - CGRectGetMidY(v14);
  label = self->_label;
  [(NTKZeusDateComplicationView *)self bounds];
  double v10 = v9 * 0.5 - v5;
  [(NTKZeusDateComplicationView *)self bounds];
  -[UILabel setCenter:](label, "setCenter:", v10, v7 + v11 * 0.5);
  v12.receiver = self;
  v12.super_class = (Class)NTKZeusDateComplicationView;
  [(NTKZeusComplicationView *)&v12 layoutSubviews];
}

- (CGRect)contentFrame
{
  memset(&v17[9], 0, 64);
  -[NTKZeusComplicationView device](self, "device", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
  v3 = 0);
  sub_9058(v3, v17);

  [(NTKZeusComplicationView *)self style];
  id v4 = [(NTKZeusComplicationView *)self device];
  CLKCeilForDevice();
  double v6 = v5 + v5;

  double v7 = [(NTKZeusComplicationView *)self device];
  CLKCeilForDevice();
  double v9 = v8 + v8;

  [(NTKZeusDateComplicationView *)self bounds];
  double v11 = v10 * 0.5 - v6 * 0.5;
  [(NTKZeusDateComplicationView *)self bounds];
  double v13 = v12 * 0.5 - v9 * 0.5;
  double v14 = v11;
  double v15 = v6;
  double v16 = v9;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v13;
  result.origin.x = v14;
  return result;
}

- (void)applyPalette:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NTKZeusDateComplicationView;
  id v4 = a3;
  [(NTKZeusComplicationView *)&v7 applyPalette:v4];
  label = self->_label;
  double v6 = objc_msgSend(v4, "bottomComplication", v7.receiver, v7.super_class);

  [(UILabel *)label setTextColor:v6];
}

- (void)blancEditModeApplyPalette:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NTKZeusDateComplicationView;
  id v4 = a3;
  [(NTKZeusComplicationView *)&v7 blancEditModeApplyPalette:v4];
  label = self->_label;
  double v6 = objc_msgSend(v4, "editMode", v7.receiver, v7.super_class);

  [(UILabel *)label setTextColor:v6];
}

- (void)applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)NTKZeusDateComplicationView;
  id v8 = a5;
  id v9 = a4;
  [(NTKZeusComplicationView *)&v13 applyTransitionFraction:v9 fromPalette:v8 toPalette:a3];
  double v10 = objc_msgSend(v9, "bottomComplication", v13.receiver, v13.super_class);

  double v11 = [v8 bottomComplication];

  double v12 = NTKInterpolateBetweenColors();

  [(UILabel *)self->_label setTextColor:v12];
}

- (void)applyTransitionFraction:(double)a3 fromMode:(int64_t)a4 toMode:(int64_t)a5
{
  v13.receiver = self;
  v13.super_class = (Class)NTKZeusDateComplicationView;
  -[NTKZeusComplicationView applyTransitionFraction:fromMode:toMode:](&v13, "applyTransitionFraction:fromMode:toMode:");
  v12.receiver = self;
  v12.super_class = (Class)NTKZeusDateComplicationView;
  id v8 = [(NTKZeusComplicationView *)&v12 complicationColorForBlancEditMode:a4];
  v11.receiver = self;
  v11.super_class = (Class)NTKZeusDateComplicationView;
  id v9 = [(NTKZeusComplicationView *)&v11 complicationColorForBlancEditMode:a5];
  double v10 = NTKInterpolateBetweenColors();

  [(UILabel *)self->_label setTextColor:v10];
}

- (void).cxx_destruct
{
}

@end