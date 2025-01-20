@interface NTKDolomitePicayuneView
- (NTKDolomitePicayuneView)initWithDevice:(id)a3 clockTimer:(id)a4;
- (void)_startTimer;
- (void)_stopTimer;
- (void)_updateDate;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setConfiguration:(id)a3;
- (void)setOverrideDate:(id)a3;
- (void)traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4;
@end

@implementation NTKDolomitePicayuneView

- (NTKDolomitePicayuneView)initWithDevice:(id)a3 clockTimer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v42.receiver = self;
  v42.super_class = (Class)NTKDolomitePicayuneView;
  v8 = [(NTKDolomitePicayuneView *)&v42 initWithDevice:v6 clockTimer:v7];
  if (v8)
  {
    [v6 screenBounds];
    CGFloat x = v43.origin.x;
    CGFloat y = v43.origin.y;
    CGFloat width = v43.size.width;
    CGFloat height = v43.size.height;
    double v13 = CGRectGetHeight(v43);
    v44.origin.CGFloat x = x;
    v44.origin.CGFloat y = y;
    v44.size.CGFloat width = width;
    v44.size.CGFloat height = height;
    double v14 = CGRectGetWidth(v44);
    id v15 = v6;
    os_unfair_lock_lock((os_unfair_lock_t)&unk_D5E7B8);
    id WeakRetained = objc_loadWeakRetained(&qword_D5E7C0);
    if (WeakRetained)
    {
      v17 = WeakRetained;
      id v18 = objc_loadWeakRetained(&qword_D5E7C0);
      if (v18 == v15)
      {
        id v19 = [v15 version];
        uint64_t v20 = qword_D5E7C8;

        if (v19 == (id)v20)
        {
LABEL_7:
          os_unfair_lock_unlock((os_unfair_lock_t)&unk_D5E7B8);
          double v23 = *(double *)&qword_D5E7B0;

          objc_initWeak(&location, v8);
          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472;
          v39[2] = sub_3314;
          v39[3] = &unk_D58420;
          objc_copyWeak(&v40, &location);
          v24 = objc_retainBlock(v39);
          v25 = [NTKDolomiteContentView alloc];
          v26 = +[NTKDolomiteColorPalette defaultColorPalette];
          v27 = +[NSLocale currentLocale];
          double v28 = v14 * (v23 / v13);
          LOWORD(v37) = CLKLocaleIs24HourMode();
          v29 = -[NTKDolomiteContentView initWithFrame:role:numeral:style:palette:backgroundStyle:digitStyle:dateProvider:is24HourMode:forceDynamicIndexZero:contentOption:device:](v25, "initWithFrame:role:numeral:style:palette:backgroundStyle:digitStyle:dateProvider:is24HourMode:forceDynamicIndexZero:contentOption:device:", 0, 0, 0, v26, 3, 0, 0.0, 0.0, v28, v23, v24, v37, 9, v15);
          contentView = v8->_contentView;
          v8->_contentView = v29;

          v31 = [NTKDolomiteContentView alloc];
          v32 = +[NTKDolomiteColorPalette defaultColorPalette];
          v33 = +[NSLocale currentLocale];
          LOWORD(v38) = CLKLocaleIs24HourMode();
          v34 = -[NTKDolomiteContentView initWithFrame:role:numeral:style:palette:backgroundStyle:digitStyle:dateProvider:is24HourMode:forceDynamicIndexZero:contentOption:device:](v31, "initWithFrame:role:numeral:style:palette:backgroundStyle:digitStyle:dateProvider:is24HourMode:forceDynamicIndexZero:contentOption:device:", 1, 0, 0, v32, 3, 1, 0.0, 0.0, v28, v23, v24, v38, 9, v15);
          inactiveContentView = v8->_inactiveContentView;
          v8->_inactiveContentView = v34;

          [(NTKDolomiteContentView *)v8->_inactiveContentView setAlpha:0.0];
          [(NTKDolomiteContentView *)v8->_inactiveContentView setPaused:1];
          [(NTKDolomitePicayuneView *)v8 _startTimer];
          [(NTKDolomitePicayuneView *)v8 addSubview:v8->_contentView];
          [(NTKDolomitePicayuneView *)v8 addSubview:v8->_inactiveContentView];

          objc_destroyWeak(&v40);
          objc_destroyWeak(&location);
          goto LABEL_8;
        }
      }
      else
      {
      }
    }
    id v21 = objc_storeWeak(&qword_D5E7C0, v15);
    qword_D5E7C8 = (uint64_t)[v15 version];

    sub_3968(v22, (uint64_t)v15);
    goto LABEL_7;
  }
LABEL_8:

  return v8;
}

- (void)dealloc
{
  [(NTKDolomitePicayuneView *)self _stopTimer];
  v3.receiver = self;
  v3.super_class = (Class)NTKDolomitePicayuneView;
  [(NTKDolomitePicayuneView *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)NTKDolomitePicayuneView;
  [(NTKDolomitePicayuneView *)&v7 layoutSubviews];
  [(NTKDolomitePicayuneView *)self bounds];
  CLKRectGetCenter();
  double v4 = v3;
  double v6 = v5;
  -[NTKDolomiteContentView setCenter:](self->_contentView, "setCenter:");
  -[NTKDolomiteContentView setCenter:](self->_inactiveContentView, "setCenter:", v4, v6);
}

- (void)setConfiguration:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NTKDolomitePicayuneView;
  id v4 = a3;
  [(NTKDolomitePicayuneView *)&v9 setConfiguration:v4];
  -[NTKDolomiteContentView setNumeral:](self->_contentView, "setNumeral:", objc_msgSend(v4, "numeral", v9.receiver, v9.super_class));
  -[NTKDolomiteContentView setNumeral:](self->_inactiveContentView, "setNumeral:", [v4 numeral]);
  contentView = self->_contentView;
  double v6 = [v4 palette];
  [(NTKDolomiteContentView *)contentView setPalette:v6];

  inactiveContentView = self->_inactiveContentView;
  v8 = [v4 palette];

  [(NTKDolomiteContentView *)inactiveContentView setPalette:v8];
  [(NTKDolomiteContentView *)self->_contentView updateDate];
  [(NTKDolomiteContentView *)self->_inactiveContentView updateDate];
}

- (void)setOverrideDate:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NTKDolomitePicayuneView;
  -[NTKDolomitePicayuneView setOverrideDate:](&v5, "setOverrideDate:");
  if (a3) {
    [(NTKDolomitePicayuneView *)self _stopTimer];
  }
  else {
    [(NTKDolomitePicayuneView *)self _startTimer];
  }
  [(NTKDolomitePicayuneView *)self _updateDate];
}

- (void)_startTimer
{
  if (!self->_clockTimerToken)
  {
    objc_initWeak(&location, self);
    double v3 = [(NTKDolomitePicayuneView *)self clockTimer];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_36D0;
    v6[3] = &unk_D58498;
    objc_copyWeak(&v7, &location);
    id v4 = [v3 startUpdatesWithUpdateFrequency:1 withHandler:v6 identificationLog:&stru_D584D8];
    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)_stopTimer
{
  if (self->_clockTimerToken)
  {
    double v3 = [(NTKDolomitePicayuneView *)self clockTimer];
    [v3 stopUpdatesForToken:self->_clockTimerToken];

    clockTimerToken = self->_clockTimerToken;
    self->_clockTimerToken = 0;
  }
}

- (void)_updateDate
{
  [(NTKDolomiteContentView *)self->_contentView updateDate];
  inactiveContentView = self->_inactiveContentView;

  [(NTKDolomiteContentView *)inactiveContentView updateDate];
}

- (void)traitCollectionDidChange:(id)a3 previousTraitCollection:(id)a4
{
  id v5 = a4;
  double v6 = [(NTKDolomitePicayuneView *)self traitCollection];
  id v7 = [v6 activeAppearance];
  id v8 = [v5 activeAppearance];

  if (v7 != v8)
  {
    objc_super v9 = [(NTKDolomitePicayuneView *)self traitCollection];
    if ([v9 activeAppearance]) {
      double v10 = 1.0;
    }
    else {
      double v10 = 0.0;
    }

    [(NTKDolomiteContentView *)self->_contentView setAlpha:v10];
    inactiveContentView = self->_inactiveContentView;
    [(NTKDolomiteContentView *)inactiveContentView setAlpha:1.0 - v10];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clockTimerToken, 0);
  objc_storeStrong((id *)&self->_inactiveContentView, 0);

  objc_storeStrong((id *)&self->_contentView, 0);
}

@end