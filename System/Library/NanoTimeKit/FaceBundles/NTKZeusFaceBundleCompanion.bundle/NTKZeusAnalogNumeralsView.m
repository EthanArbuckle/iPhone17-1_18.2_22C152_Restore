@interface NTKZeusAnalogNumeralsView
+ (BOOL)_outlinedForBleed:(unint64_t)a3 style:(unint64_t)a4;
+ (id)_digitImageNameForNumber:(unint64_t)a3 style:(unint64_t)a4 outlined:(BOOL)a5;
+ (id)_digitImageWithName:(id)a3;
- (CGPoint)_labelPositionForIndex:(unint64_t)a3 status:(BOOL)a4;
- (NTKZeusAnalogColorPalette)palette;
- (NTKZeusAnalogNumeralsView)initWithDevice:(id)a3 palette:(id)a4 style:(unint64_t)a5 density:(unint64_t)a6;
- (unint64_t)density;
- (unint64_t)style;
- (void)_updateImages;
- (void)layoutSubviews;
- (void)setDensity:(unint64_t)a3;
- (void)setPalette:(id)a3;
- (void)setStatusIndicatorVisible:(BOOL)a3;
- (void)setStatusIndicatorVisibleFraction:(double)a3;
- (void)setStyle:(unint64_t)a3;
- (void)setTintColor:(id)a3;
@end

@implementation NTKZeusAnalogNumeralsView

- (NTKZeusAnalogNumeralsView)initWithDevice:(id)a3 palette:(id)a4 style:(unint64_t)a5 density:(unint64_t)a6
{
  id v11 = a3;
  id v12 = a4;
  [v11 screenBounds];
  v16.receiver = self;
  v16.super_class = (Class)NTKZeusAnalogNumeralsView;
  v13 = -[NTKZeusAnalogNumeralsView initWithFrame:](&v16, "initWithFrame:");
  v14 = v13;
  if (v13)
  {
    v13->_style = a5;
    v13->_density = a6;
    v13->_bleed = (unint64_t)[v12 bleed];
    objc_storeStrong((id *)&v14->_device, a3);
    v14->_outlined = +[NTKZeusAnalogNumeralsView _outlinedForBleed:v14->_bleed style:v14->_style];
    [(NTKZeusAnalogNumeralsView *)v14 _updateImages];
  }

  return v14;
}

- (void)setPalette:(id)a3
{
  id v9 = a3;
  unsigned int v5 = +[NTKZeusAnalogNumeralsView _outlinedForBleed:style:](NTKZeusAnalogNumeralsView, "_outlinedForBleed:style:", [v9 bleed], self->_style);
  int outlined = self->_outlined;
  objc_storeStrong((id *)&self->_palette, a3);
  self->_bleed = (unint64_t)[v9 bleed];
  self->_int outlined = v5;
  if (outlined == v5)
  {
    for (uint64_t i = 0; i != 12; ++i)
    {
      v8 = [(NTKZeusAnalogColorPalette *)self->_palette dial];
      [(UIImageView *)self->_digitViews[i] setTintColor:v8];
    }
  }
  else
  {
    [(NTKZeusAnalogNumeralsView *)self _updateImages];
  }
}

- (void)setDensity:(unint64_t)a3
{
  if (self->_density != a3)
  {
    self->_density = a3;
    [(NTKZeusAnalogNumeralsView *)self _updateImages];
  }
}

- (void)setStyle:(unint64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    self->_int outlined = +[NTKZeusAnalogNumeralsView _outlinedForBleed:self->_bleed style:a3];
    [(NTKZeusAnalogNumeralsView *)self _updateImages];
  }
}

- (void)setStatusIndicatorVisible:(BOOL)a3
{
  self->_status = a3;
  [(NTKZeusAnalogNumeralsView *)self setNeedsLayout];
}

- (void)setStatusIndicatorVisibleFraction:(double)a3
{
  double v5 = fabs(a3);
  double v6 = fabs(a3 + -1.0);
  if (v5 < 0.00000011920929 || v6 < 0.00000011920929)
  {
    [(NTKZeusAnalogNumeralsView *)self setStatusIndicatorVisible:v5 >= 0.00000011920929];
  }
  else
  {
    for (uint64_t i = 0; i != 12; ++i)
    {
      id v9 = self->_digitViews[i];
      if (v9)
      {
        v10 = v9;
        [(NTKZeusAnalogNumeralsView *)self _labelPositionForIndex:i status:1];
        [(NTKZeusAnalogNumeralsView *)self _labelPositionForIndex:i status:0];
        CLKInterpolateBetweenPoints();
        double v12 = v11;
        double v14 = v13;
        [(NTKZeusAnalogNumeralsView *)self bounds];
        double v16 = v12 + v15 * 0.5;
        [(NTKZeusAnalogNumeralsView *)self bounds];
        -[UIImageView setCenter:](v10, "setCenter:", v16, v14 + v17 * 0.5);
      }
    }
  }
}

- (void)_updateImages
{
  unint64_t v3 = self->_density - 1;
  if (v3 > 2) {
    unint64_t v4 = 1;
  }
  else {
    unint64_t v4 = qword_34880[v3];
  }
  uint64_t v5 = 0;
  digitViews = self->_digitViews;
  do
  {
    uint64_t v7 = v5 + 1;
    v8 = digitViews[v5];
    if ((v5 + 1) % v4)
    {
      [(UIImageView *)v8 removeFromSuperview];
      id v9 = digitViews[v5];
      digitViews[v5] = 0;
    }
    else
    {
      if (!v8)
      {
        v10 = (UIImageView *)objc_alloc_init((Class)UIImageView);
        double v11 = digitViews[v5];
        digitViews[v5] = v10;

        [(NTKZeusAnalogNumeralsView *)self addSubview:digitViews[v5]];
      }
      id v9 = +[NTKZeusAnalogNumeralsView _digitImageNameForNumber:v5 + 1 style:self->_style outlined:self->_outlined];
      double v12 = +[NTKZeusAnalogNumeralsView _digitImageWithName:v9];
      double v13 = [(UIImageView *)digitViews[v5] image];

      if (v13 != v12) {
        [(UIImageView *)digitViews[v5] setImage:v12];
      }
      [(UIImageView *)digitViews[v5] sizeToFit];
      double v14 = digitViews[v5];
      double v15 = [(NTKZeusAnalogColorPalette *)self->_palette dial];
      [(UIImageView *)v14 setTintColor:v15];
    }
    uint64_t v5 = v7;
  }
  while (v7 != 12);

  [(NTKZeusAnalogNumeralsView *)self setNeedsLayout];
}

- (void)setTintColor:(id)a3
{
  uint64_t v4 = 0;
  digitViews = self->_digitViews;
  do
    [(UIImageView *)digitViews[v4++] setTintColor:a3];
  while (v4 != 12);
}

+ (id)_digitImageNameForNumber:(unint64_t)a3 style:(unint64_t)a4 outlined:(BOOL)a5
{
  switch(a4)
  {
    case 0uLL:
      CFStringRef v7 = @"clipper";
      break;
    case 1uLL:
      CFStringRef v7 = @"capecod-filled";
      if (a5) {
        CFStringRef v7 = @"capecod-outlined";
      }
      break;
    case 2uLL:
      CFStringRef v7 = @"espace";
      break;
    case 3uLL:
      CFStringRef v7 = @"carrick";
      break;
    default:
      CFStringRef v7 = 0;
      break;
  }
  return +[NSString stringWithFormat:@"ZeusAnalog-digits-%@-%i", v7, a3, v5, v6];
}

+ (BOOL)_outlinedForBleed:(unint64_t)a3 style:(unint64_t)a4
{
  return a3 > 1 && a4 == 1;
}

+ (id)_digitImageWithName:(id)a3
{
  id v3 = a3;
  if (qword_4CF70 != -1) {
    dispatch_once(&qword_4CF70, &stru_3D218);
  }
  uint64_t v4 = [(id)qword_4CF68 objectForKey:v3];
  if (!v4)
  {
    uint64_t v5 = +[NTKZeusAnalogFaceBundle imageWithName:v3];
    uint64_t v4 = [v5 imageWithRenderingMode:2];

    [(id)qword_4CF68 setObject:v4 forKey:v3];
  }

  return v4;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)NTKZeusAnalogNumeralsView;
  [(NTKZeusAnalogNumeralsView *)&v13 layoutSubviews];
  for (uint64_t i = 0; i != 12; ++i)
  {
    uint64_t v4 = self->_digitViews[i];
    if (v4)
    {
      uint64_t v5 = v4;
      [(UIImageView *)v5 sizeToFit];
      [(NTKZeusAnalogNumeralsView *)self _labelPositionForIndex:i status:self->_status];
      double v7 = v6;
      double v9 = v8;
      [(NTKZeusAnalogNumeralsView *)self bounds];
      double v11 = v7 + v10 * 0.5;
      [(NTKZeusAnalogNumeralsView *)self bounds];
      -[UIImageView setCenter:](v5, "setCenter:", v11, v9 + v12 * 0.5);
    }
  }
}

- (CGPoint)_labelPositionForIndex:(unint64_t)a3 status:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = self->_device;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_4DB78);
  id WeakRetained = objc_loadWeakRetained(&qword_4DB80);
  if (WeakRetained)
  {
    double v9 = WeakRetained;
    double v10 = (CLKDevice *)objc_loadWeakRetained(&qword_4DB80);
    if (v10 == v7)
    {
      id v11 = [(CLKDevice *)v7 version];
      uint64_t v12 = qword_4DB88;

      if (v11 == (id)v12) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v13 = objc_storeWeak(&qword_4DB80, v7);
  qword_4DB88 = (uint64_t)[(CLKDevice *)v7 version];

  sub_1DEE8();
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_4DB78);
  memcpy(v20, &qword_4CF78, sizeof(v20));

  unint64_t bleed = self->_bleed;
  unint64_t style = self->_style;
  if (bleed) {
    BOOL v18 = !v4;
  }
  else {
    BOOL v18 = 1;
  }
  if (v18)
  {
    if (bleed)
    {
      switch(style)
      {
        case 0uLL:
          v19 = (double *)&v20[a3 + 96];
          goto LABEL_33;
        case 1uLL:
          v19 = (double *)&v20[a3 + 108];
          goto LABEL_33;
        case 2uLL:
          v19 = (double *)&v20[a3 + 120];
          goto LABEL_33;
        case 3uLL:
          v19 = (double *)&v20[a3 + 132];
          goto LABEL_33;
        default:
          break;
      }
    }
    else if (v4)
    {
      switch(style)
      {
        case 0uLL:
          v19 = (double *)&v20[a3 + 48];
          goto LABEL_33;
        case 1uLL:
          v19 = (double *)&v20[a3 + 60];
          goto LABEL_33;
        case 2uLL:
          v19 = (double *)&v20[a3 + 72];
          goto LABEL_33;
        case 3uLL:
          v19 = (double *)&v20[a3 + 84];
          goto LABEL_33;
        default:
          break;
      }
    }
    else
    {
      switch(style)
      {
        case 0uLL:
          v19 = (double *)&v20[a3];
          goto LABEL_33;
        case 1uLL:
          v19 = (double *)&v20[a3 + 12];
          goto LABEL_33;
        case 2uLL:
          v19 = (double *)&v20[a3 + 24];
          goto LABEL_33;
        case 3uLL:
          v19 = (double *)&v20[a3 + 36];
LABEL_33:
          double v14 = *v19;
          double v15 = v19[1];
          break;
        default:
          break;
      }
    }
  }
  else
  {
    switch(style)
    {
      case 0uLL:
        v19 = (double *)&v20[a3 + 144];
        goto LABEL_33;
      case 1uLL:
        v19 = (double *)&v20[a3 + 156];
        goto LABEL_33;
      case 2uLL:
        v19 = (double *)&v20[a3 + 168];
        goto LABEL_33;
      case 3uLL:
        v19 = (double *)&v20[a3 + 180];
        goto LABEL_33;
      default:
        break;
    }
  }
  result.y = v15;
  result.x = v14;
  return result;
}

- (NTKZeusAnalogColorPalette)palette
{
  return self->_palette;
}

- (unint64_t)density
{
  return self->_density;
}

- (unint64_t)style
{
  return self->_style;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_device, 0);
  digitViews = self->_digitViews;
  for (uint64_t i = 11; i != -1; --i)
    objc_storeStrong((id *)&digitViews[i], 0);
}

@end