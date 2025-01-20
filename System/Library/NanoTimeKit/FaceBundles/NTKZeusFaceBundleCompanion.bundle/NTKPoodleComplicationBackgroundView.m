@interface NTKPoodleComplicationBackgroundView
- (NTKPoodleComplicationBackgroundView)init;
- (void)applyStyleChange;
- (void)applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5;
- (void)layoutSubviews;
@end

@implementation NTKPoodleComplicationBackgroundView

- (NTKPoodleComplicationBackgroundView)init
{
  v7.receiver = self;
  v7.super_class = (Class)NTKPoodleComplicationBackgroundView;
  v2 = [(NTKPoodleComplicationBackgroundView *)&v7 init];
  if (v2)
  {
    uint64_t v3 = +[CALayer layer];
    backgroundLayer = v2->_backgroundLayer;
    v2->_backgroundLayer = (CALayer *)v3;

    v5 = [(NTKPoodleComplicationBackgroundView *)v2 layer];
    [v5 addSublayer:v2->_backgroundLayer];
  }
  return v2;
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)NTKPoodleComplicationBackgroundView;
  [(NTKPoodleComplicationBackgroundView *)&v14 layoutSubviews];
  id v3 = [(NTKZeudleComplicationBackgroundView *)self device];
  os_unfair_lock_lock((os_unfair_lock_t)&unk_4CBD8);
  id WeakRetained = objc_loadWeakRetained(&qword_4CBE0);
  if (WeakRetained)
  {
    v5 = WeakRetained;
    id v6 = objc_loadWeakRetained(&qword_4CBE0);
    if (v6 == v3)
    {
      id v7 = [v3 version];
      uint64_t v8 = qword_4CBE8;

      if (v7 == (id)v8) {
        goto LABEL_6;
      }
    }
    else
    {
    }
  }
  id v9 = objc_storeWeak(&qword_4CBE0, v3);
  qword_4CBE8 = (uint64_t)[v3 version];

  sub_E9C0(v10, (uint64_t)v3);
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_4CBD8);
  double v11 = *(double *)&qword_4CBD0;

  [(NTKZeudleComplicationBackgroundView *)self contentFrame];
  -[CALayer setFrame:](self->_backgroundLayer, "setFrame:");
  [(CALayer *)self->_backgroundLayer setCornerCurve:kCACornerCurveCircular];
  [(CALayer *)self->_backgroundLayer setCornerRadius:v11];
  [(CALayer *)self->_backgroundLayer setMasksToBounds:1];
  backgroundLayer = self->_backgroundLayer;
  if (qword_4CBF8 != -1) {
    dispatch_once(&qword_4CBF8, &stru_3CE20);
  }
  [(CALayer *)backgroundLayer setActions:qword_4CBF0];
  v13 = [(NTKPoodleComplicationBackgroundView *)self layer];
  [v13 addSublayer:self->_backgroundLayer];
}

- (void)applyStyleChange
{
  v6.receiver = self;
  v6.super_class = (Class)NTKPoodleComplicationBackgroundView;
  [(NTKZeudleComplicationBackgroundView *)&v6 applyStyleChange];
  backgroundLayer = self->_backgroundLayer;
  v4 = [(NTKZeudleComplicationBackgroundView *)self palette];
  id v5 = [v4 bottomComplicationBackground];
  -[CALayer setBackgroundColor:](backgroundLayer, "setBackgroundColor:", [v5 CGColor]);
}

- (void)applyTransitionFraction:(double)a3 fromPalette:(id)a4 toPalette:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)NTKPoodleComplicationBackgroundView;
  [(NTKZeudleComplicationBackgroundView *)&v16 applyTransitionFraction:v8 fromPalette:v9 toPalette:a3];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
      double v11 = [v8 bottomComplicationBackground];
      v12 = [v10 bottomComplicationBackground];

      v13 = NTKInterpolateBetweenColors();

      backgroundLayer = self->_backgroundLayer;
      id v15 = v13;
      -[CALayer setBackgroundColor:](backgroundLayer, "setBackgroundColor:", [v15 CGColor]);
    }
  }
}

- (void).cxx_destruct
{
}

@end