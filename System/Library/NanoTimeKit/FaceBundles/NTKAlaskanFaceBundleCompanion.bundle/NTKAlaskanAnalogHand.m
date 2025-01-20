@interface NTKAlaskanAnalogHand
- (CALayer)tailLayer;
- (CALayer)tipLayer;
- (NTKAlaskanAnalogHand)initWithFrame:(CGRect)a3;
- (NTKAlaskanAnalogHand)initWithFrame:(CGRect)a3 defaultTipLayer:(BOOL)a4 defaultTailLayer:(BOOL)a5;
- (void)layoutSubviews;
- (void)setTailLayer:(id)a3;
- (void)setTipLayer:(id)a3;
@end

@implementation NTKAlaskanAnalogHand

- (NTKAlaskanAnalogHand)initWithFrame:(CGRect)a3
{
  return -[NTKAlaskanAnalogHand initWithFrame:defaultTipLayer:defaultTailLayer:](self, "initWithFrame:defaultTipLayer:defaultTailLayer:", 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (NTKAlaskanAnalogHand)initWithFrame:(CGRect)a3 defaultTipLayer:(BOOL)a4 defaultTailLayer:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  v29.receiver = self;
  v29.super_class = (Class)NTKAlaskanAnalogHand;
  v7 = -[NTKAlaskanAnalogHand initWithFrame:](&v29, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (!v7) {
    return v7;
  }
  v8 = +[NTKFaceViewRenderingContext sharedRenderingContext];
  v9 = [v8 device];

  id v10 = v9;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_47CD8);
  id WeakRetained = objc_loadWeakRetained(&qword_47CE0);
  if (!WeakRetained) {
    goto LABEL_6;
  }
  v12 = WeakRetained;
  id v13 = objc_loadWeakRetained(&qword_47CE0);
  if (v13 != v10)
  {

LABEL_6:
    id v16 = objc_storeWeak(&qword_47CE0, v10);
    qword_47CE8 = (uint64_t)[v10 version];

    sub_18BDC(v17, (uint64_t)v10);
    goto LABEL_7;
  }
  id v14 = [v10 version];
  uint64_t v15 = qword_47CE8;

  if (v14 != (id)v15) {
    goto LABEL_6;
  }
LABEL_7:
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_47CD8);
  double v18 = *(double *)&qword_47CC8;
  double v19 = *(double *)&qword_47CD0;

  if (v6)
  {
    v20 = (CALayer *)objc_alloc_init((Class)CALayer);
    tipLayer = v7->_tipLayer;
    v7->_tipLayer = v20;

    -[CALayer setFrame:](v7->_tipLayer, "setFrame:", 0.0, 0.0, v18, v18);
    [(CALayer *)v7->_tipLayer frame];
    CLKRoundForDevice();
    -[CALayer setCornerRadius:](v7->_tipLayer, "setCornerRadius:");
    id v22 = +[UIColor whiteColor];
    -[CALayer setBackgroundColor:](v7->_tipLayer, "setBackgroundColor:", [v22 CGColor]);

    v23 = [(NTKAlaskanAnalogHand *)v7 layer];
    [v23 addSublayer:v7->_tipLayer];
  }
  if (v5)
  {
    v24 = (CALayer *)objc_alloc_init((Class)CALayer);
    tailLayer = v7->_tailLayer;
    v7->_tailLayer = v24;

    -[CALayer setFrame:](v7->_tailLayer, "setFrame:", 0.0, 0.0, v19, v19);
    [(CALayer *)v7->_tailLayer frame];
    CLKRoundForDevice();
    -[CALayer setCornerRadius:](v7->_tailLayer, "setCornerRadius:");
    id v26 = +[UIColor whiteColor];
    -[CALayer setBackgroundColor:](v7->_tailLayer, "setBackgroundColor:", [v26 CGColor]);

    v27 = [(NTKAlaskanAnalogHand *)v7 layer];
    [v27 addSublayer:v7->_tailLayer];
  }
  return v7;
}

- (void)setTipLayer:(id)a3
{
  BOOL v5 = (CALayer *)a3;
  tipLayer = self->_tipLayer;
  if (tipLayer != v5)
  {
    [(CALayer *)tipLayer removeFromSuperlayer];
    objc_storeStrong((id *)&self->_tipLayer, a3);
    v7 = [(NTKAlaskanAnalogHand *)self layer];
    [v7 addSublayer:self->_tipLayer];

    tipLayer = (CALayer *)[(NTKAlaskanAnalogHand *)self setNeedsLayout];
  }

  _objc_release_x1(tipLayer);
}

- (void)setTailLayer:(id)a3
{
  BOOL v5 = (CALayer *)a3;
  tailLayer = self->_tailLayer;
  if (tailLayer != v5)
  {
    [(CALayer *)tailLayer removeFromSuperlayer];
    objc_storeStrong((id *)&self->_tailLayer, a3);
    v7 = [(NTKAlaskanAnalogHand *)self layer];
    [v7 addSublayer:self->_tailLayer];

    tailLayer = (CALayer *)[(NTKAlaskanAnalogHand *)self setNeedsLayout];
  }

  _objc_release_x1(tailLayer);
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)NTKAlaskanAnalogHand;
  [(NTKAlaskanAnalogHand *)&v21 layoutSubviews];
  v3 = +[NTKFaceViewRenderingContext sharedRenderingContext];
  v4 = [v3 device];

  [(CALayer *)self->_tipLayer frame];
  double v6 = v5;
  double v8 = v7;
  [(NTKAlaskanAnalogHand *)self bounds];
  [(CALayer *)self->_tipLayer bounds];
  CLKRoundForDevice();
  double v10 = v9;
  [(NTKAlaskanAnalogHand *)self bounds];
  [(CALayer *)self->_tipLayer bounds];
  CLKRoundForDevice();
  -[CALayer setFrame:](self->_tipLayer, "setFrame:", v10, v11, v6, v8);
  [(CALayer *)self->_tailLayer frame];
  double v13 = v12;
  double v15 = v14;
  [(NTKAlaskanAnalogHand *)self bounds];
  double v17 = v16 * 0.5;
  [(CALayer *)self->_tailLayer bounds];
  double v19 = v17 - v18 * 0.5;
  [(NTKAlaskanAnalogHand *)self bounds];
  [(CALayer *)self->_tailLayer bounds];
  CLKRoundForDevice();
  -[CALayer setFrame:](self->_tailLayer, "setFrame:", v19, v20, v13, v15);
}

- (CALayer)tailLayer
{
  return self->_tailLayer;
}

- (CALayer)tipLayer
{
  return self->_tipLayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tipLayer, 0);

  objc_storeStrong((id *)&self->_tailLayer, 0);
}

@end