@interface NTKSeltzerTimeView
- (BOOL)shouldUseCustomDialBackground;
- (CGAffineTransform)_moonViewTransformForStyle:(SEL)a3;
- (CGSize)_cardinalSecondTickSize;
- (CGSize)_hourTickSize;
- (CGSize)_minuteTickSize;
- (CGSize)_secondTickSize;
- (NTKSeltzerColorPalette)palette;
- (NTKSeltzerTimeView)initWithFrame:(CGRect)a3 style:(unint64_t)a4 andDevice:(id)a5;
- (double)_cardinalSecondTickInset;
- (double)_hourTickInset;
- (double)_minuteTickInset;
- (double)_secondTickInset;
- (id)_customDialBackgroundView;
- (id)_digitalLabelFont;
- (id)_digitalTimeLabelColorForColorPalette:(id)a3;
- (id)_hourTickColorForColorPalette:(id)a3;
- (id)_minuteTickColorForColorPalette:(id)a3;
- (id)_secondHandColorForColorPalette:(id)a3;
- (id)_secondTickActiveColorForColorPalette:(id)a3;
- (id)_secondTickInactiveColorForColorPalette:(id)a3;
- (id)snapshotImage;
- (void)_setupAnalogHandsView;
- (void)applyDataMode:(int64_t)a3;
- (void)applyInteractiveModeProgress:(double)a3;
- (void)applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5;
- (void)layoutSubviews;
- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
- (void)setPalette:(id)a3;
- (void)setStyle:(unint64_t)a3;
- (void)updateCrownDate:(id)a3 animated:(BOOL)a4;
- (void)updateSunLocation;
@end

@implementation NTKSeltzerTimeView

- (NTKSeltzerTimeView)initWithFrame:(CGRect)a3 style:(unint64_t)a4 andDevice:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a5;
  v35.receiver = self;
  v35.super_class = (Class)NTKSeltzerTimeView;
  v12 = -[NTKSeltzerTimeView initWithFrame:style:andDevice:](&v35, "initWithFrame:style:andDevice:", a4, v11, x, y, width, height);
  if (v12)
  {
    sub_28D0(v11, &v33);
    double v13 = v34;
    id v14 = objc_alloc((Class)NUNIAstronomyVistaView);
    v15 = +[NUNIAstronomyVistaConfiguration defaultConfigurationWithDevice:v11];
    v16 = (NUNIAstronomyVistaView *)objc_msgSend(v14, "initWithFrame:configuration:", v15, 0.0, 0.0, v13, v13);
    astronomyVistaView = v12->_astronomyVistaView;
    v12->_astronomyVistaView = v16;

    [(NUNIAstronomyVistaView *)v12->_astronomyVistaView setOpaque:0];
    objc_initWeak(&location, v12);
    v27 = _NSConcreteStackBlock;
    uint64_t v28 = 3221225472;
    v29 = sub_29F8;
    v30 = &unk_103F8;
    objc_copyWeak(&v31, &location);
    v18 = objc_retainBlock(&v27);
    id v19 = objc_alloc((Class)NUNIScene);
    id v20 = objc_msgSend(v19, "initWithSphereoids:currentDateBlock:", 24, v18, v27, v28, v29, v30);
    [(NUNIAstronomyVistaView *)v12->_astronomyVistaView setScene:v20];
    [(NUNIAstronomyVistaView *)v12->_astronomyVistaView applyVista:1 transitionStyle:0];
    [(NUNIAstronomyVistaView *)v12->_astronomyVistaView setFrameInterval:3];
    [(NUNIAstronomyVistaView *)v12->_astronomyVistaView updateSunLocationAnimated:0];
    v21 = [(NTKSeltzerTimeView *)v12 dialBackgroundView];
    [v21 addSubview:v12->_astronomyVistaView];

    v22 = [(NTKSeltzerTimeView *)v12 dialBackgroundView];
    [v22 sendSubviewToBack:v12->_astronomyVistaView];

    v23 = +[UIColor blackColor];
    v24 = [(NTKSeltzerTimeView *)v12 analogHandsView];
    v25 = [v24 secondHandView];
    [v25 setHandDotColor:v23];

    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }

  return v12;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)NTKSeltzerTimeView;
  [(NTKSeltzerTimeView *)&v4 layoutSubviews];
  v3 = [(NTKSeltzerTimeView *)self dialBackgroundView];
  [v3 bounds];
  CLKRectGetCenter();
  -[NUNIAstronomyVistaView setCenter:](self->_astronomyVistaView, "setCenter:");
}

- (void)applyDataMode:(int64_t)a3
{
  if (a3 == 4 || a3 == 2)
  {
    [(NUNIAstronomyVistaView *)self->_astronomyVistaView stopAnimation];
  }
  else if (a3 == 1)
  {
    [(NUNIAstronomyVistaView *)self->_astronomyVistaView startAnimation];
  }
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  v7 = (NSDate *)a3;
  v8.receiver = self;
  v8.super_class = (Class)NTKSeltzerTimeView;
  [(NTKSeltzerTimeView *)&v8 setOverrideDate:v7 duration:a4];
  if (self->_overrideDate != v7 && !-[NSDate isEqualToDate:](v7, "isEqualToDate:"))
  {
    objc_storeStrong((id *)&self->_overrideDate, a3);
    [(NUNIAstronomyVistaView *)self->_astronomyVistaView updateSunLocationAnimated:a4 > 0.0];
  }
}

- (void)setPalette:(id)a3
{
  objc_storeStrong((id *)&self->_palette, a3);
  [(NTKSeltzerTimeView *)self _applyColorToAnalogHands];

  [(NTKSeltzerTimeView *)self _applyColorToDigitalLabelAndTicks];
}

- (void)setStyle:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NTKSeltzerTimeView;
  -[NTKSeltzerTimeView setStyle:](&v7, "setStyle:");
  [(NTKSeltzerTimeView *)self _moonViewTransformForStyle:a3];
  astronomyVistaView = self->_astronomyVistaView;
  v6[0] = v6[3];
  v6[1] = v6[4];
  v6[2] = v6[5];
  [(NUNIAstronomyVistaView *)astronomyVistaView setTransform:v6];
}

- (BOOL)shouldUseCustomDialBackground
{
  return 1;
}

- (id)_customDialBackgroundView
{
  id v2 = objc_alloc_init((Class)UIView);

  return v2;
}

- (void)renderSynchronouslyWithImageQueueDiscard:(BOOL)a3 inGroup:(id)a4
{
}

- (void)updateSunLocation
{
}

- (id)snapshotImage
{
  return [(NUNIAstronomyVistaView *)self->_astronomyVistaView snapshotImage];
}

- (CGAffineTransform)_moonViewTransformForStyle:(SEL)a3
{
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = [(NTKSeltzerTimeView *)self device];
  sub_28D0(v6, &v10);

  objc_super v7 = (double *)&v10 + 1;
  if (!a4) {
    objc_super v7 = (double *)&v10;
  }
  double v8 = *v7 / *(double *)&v11;

  return CGAffineTransformMakeScale(retstr, v8, v8);
}

- (void)applyInteractiveModeProgress:(double)a3
{
  [(NTKSeltzerTimeView *)self _moonViewTransformForStyle:[(NTKSeltzerTimeView *)self style]];
  long long v5 = *(_OWORD *)&CGAffineTransformIdentity.c;
  v16[3] = *(_OWORD *)&CGAffineTransformIdentity.a;
  v16[4] = v5;
  v16[5] = *(_OWORD *)&CGAffineTransformIdentity.tx;
  CLKInterpolateBetweenTransform();
  astronomyVistaView = self->_astronomyVistaView;
  v16[0] = v16[9];
  v16[1] = v16[10];
  v16[2] = v16[11];
  [(NUNIAstronomyVistaView *)astronomyVistaView setTransform:v16];
  CLKInterpolateBetweenFloatsClipped();
  double v8 = v7;
  if ([(NTKSeltzerTimeView *)self style])
  {
    v9 = [(NTKSeltzerTimeView *)self digitalTicksContainerView];
    [v9 setAlpha:v8];

    CLKInterpolateBetweenFloatsClipped();
    double v11 = v10;
    [(NTKSeltzerTimeView *)self digitalTimeLabel];
  }
  else
  {
    long long v12 = [(NTKSeltzerTimeView *)self analogContainerView];
    [v12 setAlpha:v8];

    CLKInterpolateBetweenFloatsClipped();
    double v11 = v13;
    [(NTKSeltzerTimeView *)self analogHandsView];
  long long v14 = };
  [v14 setAlpha:v11];

  if (a3 <= 0.0)
  {
    uint64_t v15 = 3;
  }
  else
  {
    if (a3 < 1.0) {
      return;
    }
    uint64_t v15 = 0;
  }
  [(NUNIAstronomyVistaView *)self->_astronomyVistaView setFrameInterval:v15];
}

- (void)updateCrownDate:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  objc_storeStrong((id *)&self->_crownDate, a3);
  id v7 = a3;
  [(NUNIAstronomyVistaView *)self->_astronomyVistaView updateSunLocationAnimated:v4];
}

- (void)_setupAnalogHandsView
{
  v3 = [NTKSeltzerAnalogHandsView alloc];
  BOOL v4 = [(NTKSeltzerTimeView *)self device];
  id v5 = [(NTKSeltzerAnalogHandsView *)v3 initForDevice:v4];
  [(NTKSeltzerTimeView *)self setAnalogHandsView:v5];

  id v6 = [(NTKSeltzerTimeView *)self analogHandsView];
  [(NTKSeltzerTimeView *)self addSubview:v6];
}

- (double)_minuteTickInset
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  v3 = [(NTKSeltzerTimeView *)self device];
  sub_28D0(v3, &v6);

  [(NTKSeltzerTimeView *)self _hourTickInset];
  return v4 + *(double *)&v8 * 2.0 - *(double *)&v7 * 2.0;
}

- (double)_hourTickInset
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v6 = 0u;
  v3 = [(NTKSeltzerTimeView *)self device];
  sub_28D0(v3, &v6);

  [(NTKSeltzerTimeView *)self bounds];
  CGFloat MidY = CGRectGetMidY(v13);
  return MidY
       + *(double *)&v6 * -0.5
       - *((double *)&v7 + 1)
       - *(double *)&v10
       + MidY
       + *(double *)&v6 * -0.5
       - *((double *)&v7 + 1)
       - *(double *)&v10;
}

- (CGSize)_minuteTickSize
{
  id v2 = [(NTKSeltzerTimeView *)self device];
  sub_28D0(v2, &v7);
  double v3 = v8;
  double v4 = v9;

  double v5 = v3;
  double v6 = v4;
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (CGSize)_hourTickSize
{
  id v2 = [(NTKSeltzerTimeView *)self device];
  sub_28D0(v2, v7);
  double v3 = v8;
  double v4 = v9;

  double v5 = v3;
  double v6 = v4;
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (id)_hourTickColorForColorPalette:(id)a3
{
  return [(NTKSeltzerColorPalette *)self->_palette hourTick];
}

- (id)_minuteTickColorForColorPalette:(id)a3
{
  return [(NTKSeltzerColorPalette *)self->_palette minuteTick];
}

- (id)_secondHandColorForColorPalette:(id)a3
{
  return [(NTKSeltzerColorPalette *)self->_palette secondHand];
}

- (double)_secondTickInset
{
  long long v7 = 0u;
  double v3 = [(NTKSeltzerTimeView *)self device];
  sub_28D0(v3, &v6);

  [(NTKSeltzerTimeView *)self _cardinalSecondTickInset];
  return v4 + *(double *)&v7;
}

- (double)_cardinalSecondTickInset
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v7 = 0u;
  memset(v6, 0, sizeof(v6));
  double v3 = [(NTKSeltzerTimeView *)self device];
  sub_28D0(v3, v6);

  [(NTKSeltzerTimeView *)self bounds];
  CGFloat MidY = CGRectGetMidY(v12);
  return MidY
       + *((double *)v6 + 1) * -0.5
       - *(double *)&v7
       - *(double *)&v11
       + MidY
       + *((double *)v6 + 1) * -0.5
       - *(double *)&v7
       - *(double *)&v11;
}

- (CGSize)_secondTickSize
{
  id v2 = [(NTKSeltzerTimeView *)self device];
  sub_28D0(v2, v7);
  double v3 = v8;
  double v4 = v9;

  double v5 = v3;
  double v6 = v4;
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (CGSize)_cardinalSecondTickSize
{
  id v2 = [(NTKSeltzerTimeView *)self device];
  sub_28D0(v2, v7);
  double v3 = v8;
  double v4 = v9;

  double v5 = v3;
  double v6 = v4;
  result.double height = v6;
  result.double width = v5;
  return result;
}

- (id)_secondTickActiveColorForColorPalette:(id)a3
{
  return [(NTKSeltzerColorPalette *)self->_palette secondTickActive];
}

- (id)_secondTickInactiveColorForColorPalette:(id)a3
{
  return [(NTKSeltzerColorPalette *)self->_palette secondTickInactive];
}

- (id)_digitalLabelFont
{
  id v2 = [(NTKSeltzerTimeView *)self device];
  sub_28D0(v2, v5);
  double v3 = +[CLKFont compactSoftFontOfSize:v6 weight:UIFontWeightThin];

  return v3;
}

- (id)_digitalTimeLabelColorForColorPalette:(id)a3
{
  return [(NTKSeltzerColorPalette *)self->_palette digitalLabel];
}

- (void)applyTransitionFraction:(double)a3 fromStyle:(unint64_t)a4 toStyle:(unint64_t)a5
{
  if (a4 != a5)
  {
    uint64_t v51 = v14;
    uint64_t v52 = v13;
    uint64_t v53 = v12;
    uint64_t v54 = v11;
    uint64_t v55 = v10;
    uint64_t v56 = v9;
    uint64_t v57 = v8;
    uint64_t v58 = v7;
    uint64_t v59 = v5;
    uint64_t v60 = v6;
    unint64_t v16 = a4;
    CLKMapFractionIntoRange();
    double v20 = v19;
    CLKMapFractionIntoRange();
    double v22 = v21;
    CLKMapFractionIntoRange();
    CGFloat v24 = v23;
    CLKMapFractionIntoRange();
    CGFloat v26 = v25;
    memset(&v50, 0, sizeof(v50));
    CGAffineTransformMakeScale(&v50, v24, v24);
    memset(&v49, 0, sizeof(v49));
    CGAffineTransformMakeScale(&v49, v26, v26);
    v27 = [(NTKSeltzerTimeView *)self analogContainerView];
    [v27 setAlpha:v20];

    uint64_t v28 = [(NTKSeltzerTimeView *)self analogHandsView];
    [v28 setAlpha:v20];

    v29 = [(NTKSeltzerTimeView *)self digitalContainerView];
    [v29 setAlpha:v22];

    CGAffineTransform v48 = v50;
    v30 = [(NTKSeltzerTimeView *)self analogContainerView];
    CGAffineTransform v47 = v48;
    [v30 setTransform:&v47];

    CGAffineTransform v46 = v50;
    id v31 = [(NTKSeltzerTimeView *)self analogHandsView];
    CGAffineTransform v45 = v46;
    [v31 setTransform:&v45];

    CGAffineTransform v44 = v49;
    v32 = [(NTKSeltzerTimeView *)self digitalContainerView];
    CGAffineTransform v43 = v44;
    [v32 setTransform:&v43];

    CLKMapFractionIntoRange();
    if (a3 >= 0.5)
    {
      double v34 = v33;
      unint64_t v16 = a5;
    }
    else
    {
      double v34 = v33;
    }
    CLKMapFractionIntoRange();
    memset(&v42, 0, sizeof(v42));
    CGAffineTransformMakeScale(&v42, v35, v35);
    [(NTKSeltzerTimeView *)self _moonViewTransformForStyle:v16];
    astronomyVistaView = self->_astronomyVistaView;
    v41[0] = v41[3];
    v41[1] = v41[4];
    v41[2] = v41[5];
    [(NUNIAstronomyVistaView *)astronomyVistaView setTransform:v41];
    v37 = [(NTKSeltzerTimeView *)self dialBackgroundView];
    [v37 setAlpha:v34];

    CGAffineTransform v40 = v42;
    v38 = [(NTKSeltzerTimeView *)self dialBackgroundView];
    CGAffineTransform v39 = v40;
    [v38 setTransform:&v39];
  }
}

- (NTKSeltzerColorPalette)palette
{
  return self->_palette;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_palette, 0);
  objc_storeStrong((id *)&self->_crownDate, 0);
  objc_storeStrong((id *)&self->_overrideDate, 0);

  objc_storeStrong((id *)&self->_astronomyVistaView, 0);
}

@end