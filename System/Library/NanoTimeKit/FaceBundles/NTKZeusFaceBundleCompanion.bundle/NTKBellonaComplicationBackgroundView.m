@interface NTKBellonaComplicationBackgroundView
- (NTKBellonaComplicationBackgroundView)init;
- (id)borderColorForCurrentHour:(unint64_t)a3;
- (void)alphaBasedOnSpecificFadeInProgress:(double)a3 fadeOutProgress:(double)a4 forCurrentHour:(unint64_t)a5;
- (void)applyStyleChange;
- (void)applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5;
- (void)hourChangeAnimationFromCurrentHour:(unint64_t)a3 withFraction:(double)a4 timeChanged:(BOOL)a5;
- (void)layoutSubviews;
- (void)tritiumOnTransitionWithFraction:(double)a3 forCurrentHour:(unint64_t)a4;
@end

@implementation NTKBellonaComplicationBackgroundView

- (NTKBellonaComplicationBackgroundView)init
{
  v6.receiver = self;
  v6.super_class = (Class)NTKBellonaComplicationBackgroundView;
  v2 = [(NTKBellonaComplicationBackgroundView *)&v6 init];
  if (v2)
  {
    v3 = (UIView *)objc_alloc_init((Class)UIView);
    backgroundView = v2->_backgroundView;
    v2->_backgroundView = v3;

    [(NTKBellonaComplicationBackgroundView *)v2 addSubview:v2->_backgroundView];
  }
  return v2;
}

- (void)layoutSubviews
{
  v24.receiver = self;
  v24.super_class = (Class)NTKBellonaComplicationBackgroundView;
  [(NTKBellonaComplicationBackgroundView *)&v24 layoutSubviews];
  id v3 = [(NTKZeudleComplicationBackgroundView *)self device];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_4CB68);
  id WeakRetained = objc_loadWeakRetained(&qword_4CB70);
  if (!WeakRetained) {
    goto LABEL_5;
  }
  v5 = WeakRetained;
  id v6 = objc_loadWeakRetained(&qword_4CB70);
  if (v6 != v3)
  {

LABEL_5:
    id v9 = objc_storeWeak(&qword_4CB70, v3);
    qword_4CB78 = (uint64_t)[v3 version];

    sub_D188(v10, (uint64_t)v3);
    goto LABEL_6;
  }
  id v7 = [v3 version];
  uint64_t v8 = qword_4CB78;

  if (v7 != (id)v8) {
    goto LABEL_5;
  }
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_4CB68);
  double v11 = *(double *)&qword_4CB58;

  [(NTKZeudleComplicationBackgroundView *)self contentFrame];
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  CLKRectGetCenter();
  -[UIView setCenter:](self->_backgroundView, "setCenter:");
  v12 = [(UIView *)self->_backgroundView layer];
  [v12 setCornerRadius:v11];

  v13 = [(UIView *)self->_backgroundView layer];
  [v13 setCornerCurve:kCACornerCurveContinuous];

  v14 = [(UIView *)self->_backgroundView layer];
  [v14 setMasksToBounds:1];

  v15 = [(UIView *)self->_backgroundView layer];
  [v15 setBorderWidth:1.0];

  v16 = [(NTKZeudleComplicationBackgroundView *)self palette];
  v17 = [v16 dateComplicationBackgroundStroke];
  id v18 = [v17 colorWithAlphaComponent:1.0];
  id v19 = [v18 CGColor];
  v20 = [(UIView *)self->_backgroundView layer];
  [v20 setBorderColor:v19];

  v21 = [(NTKZeudleComplicationBackgroundView *)self palette];
  v22 = [v21 dateComplicationBackground];
  v23 = [v22 colorWithAlphaComponent:0.0];
  [(UIView *)self->_backgroundView setBackgroundColor:v23];
}

- (id)borderColorForCurrentHour:(unint64_t)a3
{
  if (a3 <= 0xB) {
    unint64_t v3 = a3;
  }
  else {
    unint64_t v3 = a3 - 12;
  }
  v4 = [(NTKZeudleComplicationBackgroundView *)self palette];
  v5 = v4;
  if (v3 == 3) {
    [v4 beige];
  }
  else {
  id v6 = [v4 dateComplicationBackgroundStroke];
  }

  return v6;
}

- (void)hourChangeAnimationFromCurrentHour:(unint64_t)a3 withFraction:(double)a4 timeChanged:(BOOL)a5
{
  BOOL v5 = a5;
  -[NTKBellonaComplicationBackgroundView borderColorForCurrentHour:](self, "borderColorForCurrentHour:");
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    id v8 = [v13 CGColor];
    id v9 = [(UIView *)self->_backgroundView layer];
    [v9 setBorderColor:v8];
  }
  else
  {
    id v9 = [(NTKBellonaComplicationBackgroundView *)self borderColorForCurrentHour:a3 + 1];
    CLKInterpolateBetweenColors();
    id v10 = objc_claimAutoreleasedReturnValue();
    id v11 = [v10 CGColor];
    v12 = [(UIView *)self->_backgroundView layer];
    [v12 setBorderColor:v11];
  }
}

- (void)tritiumOnTransitionWithFraction:(double)a3 forCurrentHour:(unint64_t)a4
{
  -[NTKBellonaComplicationBackgroundView borderColorForCurrentHour:](self, "borderColorForCurrentHour:", a4, a3);
  id v7 = objc_claimAutoreleasedReturnValue();
  id v5 = [v7 CGColor];
  id v6 = [(UIView *)self->_backgroundView layer];
  [v6 setBorderColor:v5];
}

- (void)alphaBasedOnSpecificFadeInProgress:(double)a3 fadeOutProgress:(double)a4 forCurrentHour:(unint64_t)a5
{
  id v6 = -[NTKBellonaComplicationBackgroundView borderColorForCurrentHour:](self, "borderColorForCurrentHour:", a5, 0, 0, 0, 0, 0, 0, 0, 0);
  [v6 getRed:&v29 green:&v28 blue:&v27 alpha:&v26];

  id v7 = [(NTKBellonaComplicationBackgroundView *)self borderColorForCurrentHour:3];
  [v7 getRed:&v25 green:&v24 blue:&v23 alpha:&v22];

  CLKInterpolateBetweenFloatsClipped();
  double v9 = v8;
  CLKInterpolateBetweenFloatsClipped();
  double v11 = v10;
  CLKInterpolateBetweenFloatsClipped();
  double v13 = v12;
  CLKInterpolateBetweenFloatsClipped();
  double v15 = v14;
  CLKInterpolateBetweenFloatsClipped();
  double v17 = v16;
  CLKInterpolateBetweenFloatsClipped();
  id v19 = +[UIColor colorWithRed:v9 * v15 green:v11 * v17 blue:v13 * v18 alpha:1.0];
  id v20 = [v19 CGColor];
  v21 = [(UIView *)self->_backgroundView layer];
  [v21 setBorderColor:v20];
}

- (void)applyStyleChange
{
  v9.receiver = self;
  v9.super_class = (Class)NTKBellonaComplicationBackgroundView;
  [(NTKZeudleComplicationBackgroundView *)&v9 applyStyleChange];
  unint64_t v3 = [(NTKZeudleComplicationBackgroundView *)self palette];
  v4 = [v3 dateComplicationBackground];
  [(UIView *)self->_backgroundView setBackgroundColor:v4];

  id v5 = [(NTKZeudleComplicationBackgroundView *)self palette];
  id v6 = [v5 dateComplicationBackgroundStroke];
  id v7 = [v6 CGColor];
  double v8 = [(UIView *)self->_backgroundView layer];
  [v8 setBorderColor:v7];
}

- (void)applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v21.receiver = self;
  v21.super_class = (Class)NTKBellonaComplicationBackgroundView;
  [(NTKZeudleComplicationBackgroundView *)&v21 applyTransitionFraction:v8 fromPalette:v9 toPalette:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
      id v11 = v8;
      double v12 = [v11 dateComplicationBackground];
      double v13 = [v10 dateComplicationBackground];
      double v14 = NTKInterpolateBetweenColors();

      double v15 = [v11 dateComplicationBackgroundStroke];

      double v16 = [v10 dateComplicationBackgroundStroke];

      double v17 = NTKInterpolateBetweenColors();

      [(UIView *)self->_backgroundView setBackgroundColor:v14];
      id v18 = v17;
      id v19 = [v18 CGColor];
      id v20 = [(UIView *)self->_backgroundView layer];
      [v20 setBorderColor:v19];
    }
  }
}

- (void).cxx_destruct
{
}

@end