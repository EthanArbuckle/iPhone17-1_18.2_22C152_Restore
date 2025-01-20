@interface NTKAkitaFaceView
+ (int64_t)uiSensitivity;
- (BOOL)_wantsStatusBarIconShadow;
- (NTKAkitaFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5;
- (id)dateProvider;
- (void)_applyFrozen;
- (void)_loadActiveViews;
- (void)_loadMorphConfig;
- (void)_loadSnapshotContentViews;
- (void)_pauseContentViewIfNecessary;
- (void)_prepareForStatusChange:(BOOL)a3;
- (void)_timerFired;
- (void)_unloadActiveViews;
- (void)_unloadSnapshotContentViews;
- (void)dealloc;
- (void)setOverrideDate:(id)a3 duration:(double)a4;
@end

@implementation NTKAkitaFaceView

- (NTKAkitaFaceView)initWithFaceStyle:(int64_t)a3 forDevice:(id)a4 clientIdentifier:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)NTKAkitaFaceView;
  return [(NTKAkitaFaceView *)&v6 initWithFaceStyle:a3 forDevice:a4 clientIdentifier:a5];
}

- (void)dealloc
{
  [(NTKAkitaFaceView *)self _stopTimer];
  v3.receiver = self;
  v3.super_class = (Class)NTKAkitaFaceView;
  [(NTKAkitaFaceView *)&v3 dealloc];
}

+ (int64_t)uiSensitivity
{
  return 0;
}

- (void)_loadSnapshotContentViews
{
  [(NTKAkitaFaceView *)self _loadMorphConfig];

  [(NTKAkitaFaceView *)self _loadActiveViews];
}

- (void)_unloadSnapshotContentViews
{
}

- (void)_applyFrozen
{
  v4.receiver = self;
  v4.super_class = (Class)NTKAkitaFaceView;
  [(NTKAkitaFaceView *)&v4 _applyFrozen];
  unsigned int v3 = [(NTKAkitaFaceView *)self isFrozen];
  if (v3) {
    [(NTKAkitaFaceView *)self _stopTimer];
  }
  else {
    [(NTKAkitaFaceView *)self _startTimer];
  }
  [(UITapGestureRecognizer *)self->_tapGesture setEnabled:v3 ^ 1];
  [(NTKAkitaFaceView *)self _pauseContentViewIfNecessary];
}

- (void)setOverrideDate:(id)a3 duration:(double)a4
{
  objc_super v6 = (NSDate *)a3;
  p_overrideDate = &self->_overrideDate;
  if (self->_overrideDate != v6)
  {
    v8 = v6;
    objc_storeStrong((id *)p_overrideDate, a3);
    p_overrideDate = (NSDate **)[(NTKAkitaContentView *)self->_contentActiveView updateDate];
    objc_super v6 = v8;
  }

  _objc_release_x1(p_overrideDate, v6);
}

- (void)_prepareForStatusChange:(BOOL)a3
{
  BOOL v3 = a3;
  contentActiveView = self->_contentActiveView;
  BOOL v5 = [(NTKAkitaFaceView *)self dataMode] == (char *)&dword_0 + 1;

  [(NTKAkitaContentView *)contentActiveView setAdjustsForStatusBarIcon:v3 animated:v5];
}

- (BOOL)_wantsStatusBarIconShadow
{
  return 1;
}

- (void)_timerFired
{
}

- (void)_pauseContentViewIfNecessary
{
  id v3 = [(NTKAkitaFaceView *)self isFrozen];
  contentActiveView = self->_contentActiveView;

  [(NTKAkitaContentView *)contentActiveView setPaused:v3];
}

- (id)dateProvider
{
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_6004;
  v5[3] = &unk_10760;
  objc_copyWeak(&v6, &location);
  v2 = objc_retainBlock(v5);
  id v3 = objc_retainBlock(v2);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

  return v3;
}

- (void)_loadMorphConfig
{
  id v3 = [(NTKAkitaFaceView *)self delegate];
  id v6 = [v3 faceViewDidRequestCustomDataForKey:NTKAkitaFaceKeyMorphConfig];

  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)) {
    objc_super v4 = [[NTKAkitaMorph alloc] initFromConfigurationString:v6];
  }
  else {
    objc_super v4 = [[NTKAkitaMorph alloc] initStandardWithBackgroundColor:3];
  }
  morph = self->_morph;
  self->_morph = v4;
}

- (void)_loadActiveViews
{
  [(NTKAkitaFaceView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v19 = [(NTKAkitaFaceView *)self device];
  v11 = [(NTKAkitaFaceView *)self contentView];
  v12 = [NTKAkitaContentView alloc];
  morph = self->_morph;
  v14 = [(NTKAkitaFaceView *)self dateProvider];
  v15 = -[NTKAkitaContentView initWithFrame:role:morph:dateProvider:is24HourMode:device:](v12, "initWithFrame:role:morph:dateProvider:is24HourMode:device:", 0, morph, v14, self->_is24HourMode, v19, v4, v6, v8, v10);
  contentActiveView = self->_contentActiveView;
  self->_contentActiveView = v15;

  [v11 addSubview:self->_contentActiveView];
  [v11 bringSubviewToFront:self->_contentActiveView];
  v17 = (NTKRoundedCornerOverlayView *)objc_msgSend(objc_alloc((Class)NTKRoundedCornerOverlayView), "initWithFrame:forDeviceCornerRadius:", v19, v4, v6, v8, v10);
  cornerView = self->_cornerView;
  self->_cornerView = v17;

  [v11 insertSubview:self->_cornerView aboveSubview:self->_contentActiveView];
}

- (void)_unloadActiveViews
{
  [(NTKAkitaContentView *)self->_contentActiveView removeFromSuperview];
  contentActiveView = self->_contentActiveView;
  self->_contentActiveView = 0;

  [(NTKRoundedCornerOverlayView *)self->_cornerView removeFromSuperview];
  cornerView = self->_cornerView;
  self->_cornerView = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specifierDate, 0);
  objc_storeStrong((id *)&self->_overrideDate, 0);
  objc_storeStrong((id *)&self->_morph, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_contentActiveView, 0);

  objc_storeStrong((id *)&self->_cornerView, 0);
}

@end